package com.sharinghand.request;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharinghand.chat.ChatmapService;
import com.sharinghand.login.UsertableService;
import com.sharinghand.requestgroup.RequestgroupService;
import com.sharinghand.users.UsersSubtableService;

@Service
public class RequesttableService {
	@Autowired
	private RequesttableRepository requestRepository;

	@Autowired
	private UsertableService userService;
	
	@Autowired
	private RequestgroupService requestGroupService;
	
	@Autowired
	private UsersSubtableService subtableService;
	
	@Autowired 
	private ChatmapService chatmapService;
	
	public RequesttableService() {
	}

	public int createRequest(String request_msg) {
		Requesttable request = new Requesttable(request_msg);
		
		request.setRequestby(userService.findLoggedId());
		requestRepository.save(request);
		requestRepository.flush();
		
		return request.getRequestid();
	}
	
	public List<Requesttable> getGroupRequests(int groupid)	{
		// find all the requests associated with this group
		List<Requesttable> ret = requestRepository.findAllById(requestGroupService.getGroupRequestIds(groupid));
		
		// find all the request ids accepted by for this group
		List<Integer> myacceptedrequestids = chatmapService.getRequestsAcceptedByMe(groupid);
		
		Iterator<Requesttable> iter = ret.iterator();
		while(iter.hasNext())	{
			Requesttable temp = iter.next();
			
			// set requestby name
			temp.setRequestbyname(subtableService.getUserNameFromId(temp.getRequestby()));
			
			if (myacceptedrequestids.contains(new Integer(temp.getRequestid())))	{
				temp.setAcceptedbyme(true);
				// since this is the request accepted by me it should have just one chatmap entry
				// System.out.println(temp.getChatmaps().size());
			}
			else	{
				temp.setAcceptedbyme(false);
			}
		}
				
		return ret;
	}
	
	public List<Requesttable> getMyRequestIds(int loggedid)    {
        return requestRepository.findAllByRequestby(loggedid);
	}
	
	public List<Requesttable> getMyRaisedRequestObjects()    {
		return requestRepository.findAllByRequestby(userService.findLoggedId());
	}

	public List<Requesttable> getRequestsAcceptedByMeObjects(List<Integer> requestids)    {
		List<Requesttable> ret = requestRepository.findAllById(requestids);
		
		Iterator<Requesttable> iter = ret.iterator();
		while(iter.hasNext())	{
			Requesttable temp = iter.next();
			
			// set requestby name
			temp.setRequestbyname(subtableService.getUserNameFromId(temp.getRequestby()));
		}
		
		return ret;
	}

	public Optional<Requesttable> getRequestObject(int requestid)	{
		return requestRepository.findById(requestid);
	}
}