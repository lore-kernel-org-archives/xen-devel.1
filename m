Return-Path: <SRS0=bRyV=TX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35576C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 13:58:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5442133D
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 13:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5442133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hToEP-00064k-V9; Thu, 23 May 2019 13:58:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hToEO-00064f-M1
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 13:58:04 +0000
X-Inumbo-ID: c79a3dba-7d62-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c79a3dba-7d62-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 13:58:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 07:58:00 -0600
Message-Id: <5CE6A6E40200007800231BC0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 07:57:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <nmanthey@amazon.de>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-2-git-send-email-nmanthey@amazon.de>
In-Reply-To: <1558424746-24059-2-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 1/3] common/grant_table:
 harden helpers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190523135756.yW30vrcCZxrdoL_tTf3VQLyPscIHkpJy1-qO_cuFLmw@z>

Pj4+IE9uIDIxLjA1LjE5IGF0IDA5OjQ1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBH
dWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3Qg
Y29udHJvbGxlZAo+IGRhdGEgdG8gdGhlbS4gVGhpcyBkYXRhIGlzIHVzZWQgZm9yIG1lbW9yeSBs
b2FkcyBpbiBoZWxwZXIgZnVuY3Rpb25zCj4gYW5kIG1hY3Jvcy4gVG8gYXZvaWQgc3BlY3VsYXRp
dmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLCB3ZSB1c2UgdGhlCj4gYXJyYXlfaW5kZXhfbm9zcGVj
IG1hY3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBibG9ja19zcGVjdWxhdGlvbgo+IG1hY3Jv
Lgo+IAo+IFRoaXMgaXMgcGFydCBvZiB0aGUgc3BlY3VsYXRpdmUgaGFyZGVuaW5nIGVmZm9ydC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
