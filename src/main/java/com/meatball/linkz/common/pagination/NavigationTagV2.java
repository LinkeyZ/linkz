package com.meatball.linkz.common.pagination;

import org.apache.taglibs.standard.tag.common.core.UrlSupport;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class NavigationTagV2 extends TagSupport {

	static final long serialVersionUID = 2372405317744358833L;

	/** request 中用于保存Page<E> 对象的变量名,默认为'page' **/
	private String bean = "page";

	/** 分页跳转的url地址,此属性必须 **/
	private String url = null;

	/** 是否显示跳转 **/
	private boolean showJump = true;

	/** 显示页码数量 **/
	private int number = 5;

	/** 是否优化分页,仅对主键为数值型的有效 **/
	private boolean optimize;

	/** 查询条件 **/
	private String theQuery = "";

	@SuppressWarnings("unused")
	@Override
	public int doStartTag() throws JspException {
		JspWriter writer = pageContext.getOut();
		Page<?> onePage = (Page<?>) pageContext.getRequest().getAttribute(bean);
		if (onePage == null)
			return SKIP_BODY;
		url = resolveUrl(url, pageContext);
		if (theQuery != "") {
			url = url + "?" + theQuery.substring(1, theQuery.length());
		}
		Object firstModel = null;
		Object lastModel = null;

		if (onePage.getItems() != null && onePage.getItems().size() > 0) {
			firstModel = onePage.getItems().get(0);
			lastModel = onePage.getItems().get(onePage.getItems().size() - 1);
		}
		try {
			// 样式用的两个参数
			String title, end;
			title = "<div class='page'>" 
				+ "<div class='left'>总记录：" + onePage.getContext().getTotal() + "条&nbsp;</div><div class='right page_in'>";
			writer.print(title);
			if (onePage.isHasPre()) {

				String firstUrl = append(url, "pn", 1);
				if (optimize && firstModel != null) {
					firstUrl = append(firstUrl, "pre", "true");
				}
				writer.print("<a class='page-start' href=\"" + firstUrl + "\">首页</a>&nbsp;");

				String preUrl = append(url, "pn", onePage.getIndex() - 1);
				if (optimize && firstModel != null) {
					// preUrl = append(preUrl, PageUtil.getIdName(firstModel),
					// PageUtil.getIdValue(firstModel));
					preUrl = append(preUrl, "pre", "true");
				}
				writer.print("<a class='page-start' href=\"" + preUrl + "\">上一页</a>&nbsp;");
				// if (onePage.getIndex() > 2 && onePage.isHasNext()) {
				// writer.print("<a href=\"" + append(url, "pn", 1) +
				// "\">1</a>&nbsp;");
				// }
			}
			// 显示当前页码的前2页码和后两页码
			// 若1 则 1 2 3 4 5, 若2 则 1 2 3 4 5, 若3 则1 2 3 4 5,
			// 若4 则 2 3 4 5 6 ,若10 则 8 9 10 11 12
			int currIndex = onePage.getIndex();
			int startIndex = (currIndex - 2 > 0) ? currIndex - 2 : 1;
			for (int i = 1; i <= number && startIndex <= onePage.getContext().getPageCount(); startIndex++, i++) {
				if (startIndex == currIndex) {
					writer.print("<a class='focus'>" + startIndex + "</a>&nbsp;");
					continue;
				}
				String pageUrl = append(url, "pn", startIndex);
				int offset = 0;
				long id = 0;
				if (optimize && firstModel != null && lastModel != null) {
					if (startIndex < currIndex) {
						// pre
						pageUrl = append(pageUrl, "pre", "true");
						offset = (startIndex - currIndex + 1) * onePage.getContext().getPageSize();
						// id = Long.valueOf(PageUtil.getIdValue(firstModel)) +
						// offset;
					} else {
						// next
						offset = (startIndex - currIndex - 1) * onePage.getContext().getPageSize();
						// id = (Long.valueOf(PageUtil.getIdValue(lastModel)) +
						// offset);
					}
					// pageUrl = append(pageUrl, PageUtil.getIdName(lastModel),
					// "" + id);
				}
				writer.print("<a href=\"" + pageUrl + "\">" + startIndex + "</a>&nbsp;");
			}
			if (onePage.isHasNext()) {
				String nextUrl = append(url, "pn", onePage.getIndex() + 1);
				writer.print("<a class='page-next' href=\"" + nextUrl + "\">下一页</a>");
				
				String endUrl = append(url, "pn", onePage.getContext().getPageCount());
				writer.print("<a class='page-next' href=\"" + endUrl + "\">末页</a>");

			}
			if (showJump) {
				writer.print(makeNext(onePage, url));
			}
			end = "</div></div>";
			writer.print(end);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	/**
	 * 为url 添加上下文环境.如果是登陆用户则还要添加uid参数
	 * 
	 * @param url
	 * @param pageContext
	 * @return
	 * @throws javax.servlet.jsp.JspException
	 */
	private String resolveUrl(String url, javax.servlet.jsp.PageContext pageContext) throws JspException {
		url = UrlSupport.resolveUrl(url, null, pageContext);

		url = url.replaceAll("&pn=\\d*", "").replaceAll("pn=\\d*", "").replaceAll("&pre=true", "")
				.replaceAll("&id=\\d*", "").replaceAll("id=\\d*", "");

		return url;
	}

	private String makeNext(Page<?> page, String url) {
		StringBuffer sb = new StringBuffer("");
		sb.append("<input type=\"text\" id=\"pn\" name=\"pn\" size=\"3\" value=\"1\" format=\"*N\"/>")
				.append(page.getIndex())
				.append("/")
				.append(page.getContext().getPageCount())
				.append("页<input type='button' value='跳转' onclick='(function(){var p =$(\"#pn\").val(); window.location.href=\"")
				.append(url).append("&pn=\"+p+\"").append("\" ;})()'/>");
		return sb.toString();
	}

	private String append(String url, String key, int value) {

		return append(url, key, String.valueOf(value));
	}

	/**
	 * <p>
	 * 为url 参加参数对儿
	 * </p>
	 * 
	 * @author Bruce.Zhao
	 * @date 2015-9-1 下午03:41:51
	 * @param url
	 * @param key
	 * @param value
	 * @return
	 */
	private String append(String url, String key, String value) {
		if (url == null || url.trim().length() == 0) {
			return "";
		}

		if (url.indexOf("?") == -1) {
			url = url + "?" + key + "=" + value;
		} else {
			if (url.endsWith("?")) {
				url = url + key + "=" + value;
			} else {
				url = url + "&amp;" + key + "=" + value;
			}
		}

		return url;
	}

	public String getBean() {
		return bean;
	}

	public void setBean(String bean) {
		this.bean = bean;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public void setOptimize(boolean optimize) {
		this.optimize = optimize;
	}

	public String getTheQuery() {
		return theQuery;
	}

	public void setTheQuery(String theQuery) {
		this.theQuery = theQuery;
	}

	public void setShowJump(boolean showJump) {
		this.showJump = showJump;
	}

}
