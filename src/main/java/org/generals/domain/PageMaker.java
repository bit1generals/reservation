package org.generals.domain;

import lombok.Data;

@Data
public class PageMaker {

	private int start, end, total;
	private boolean prev, next;
	private Criteria cri;

	public PageMaker(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		setUp();
	}

	private void setUp() {
		end = ((cri.getPage() - 1) / 10) * 10 + 10;
		start = end - 9;
		if (total < end * 12) {
			end = ((total - 1) / 12) + 1;
		}
		prev = start != 1 ? true : false;
		next = end * 12 <= total ? true : false;
	}

}
