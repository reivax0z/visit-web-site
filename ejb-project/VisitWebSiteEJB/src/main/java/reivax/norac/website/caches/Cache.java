package reivax.norac.website.caches;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import reivax.norac.website.service.WebSiteEJB;

public abstract class Cache<T> {
	
	protected WebSiteEJB webSiteEJB;
	
	public Cache(){
		try {
			webSiteEJB = getWebSiteEJB();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private WebSiteEJB getWebSiteEJB() throws NamingException{
	  InitialContext ctx = new InitialContext();
	  return (WebSiteEJB)ctx.lookup("java:global/VisitWebSiteWAR-0.0.1-SNAPSHOT/WebSiteEJB!reivax.norac.website.service.WebSiteEJB");
	}
	
	protected List<T> elements;
	
	public List<T> getAll(){
		if(elements == null || elements.isEmpty()){
			refreshAll();
		}
		return elements;
	}

	public void add(T element){
		if(elements == null || elements.isEmpty()){
			refreshAll();
		}
		addAction(element);
		elements.add(element);
	}
	
	public synchronized void refreshAll(){
		elements = refreshAllAction();
	}
	
	protected abstract List<T> refreshAllAction();
	protected abstract void addAction(T element);
}
