Return-Path: <SRS0=HT/L=UU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5E5C43613
	for <xen-devel@archiver.kernel.org>; Fri, 21 Jun 2019 09:05:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF6620673
	for <xen-devel@archiver.kernel.org>; Fri, 21 Jun 2019 09:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF6620673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFTr-0004Sc-8S; Fri, 21 Jun 2019 09:05:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heFTp-0004SX-V1
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:05:09 +0000
X-Inumbo-ID: aa6ce50e-9403-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aa6ce50e-9403-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:05:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 03:05:07 -0600
Message-Id: <5D0C9DBD0200007800239FD3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 03:05:01 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560975087-25632-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] xen/link: Cope with .rodata.cst*
 sections
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDIyOjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLnJvZGF0YS5jc3QqIHNlY3Rpb25zIGFyZSB1c2VkIGZvciBtZXJnYWJsZSBjb25zdGFu
dCBkYXRhLCBhbmQgdGhlIGNsYW5nL2xsdm0KPiA4IHRvb2xjaGFpbiBoYXMgYmVlbiBvYnNlcnZl
ZCB0byBjcmVhdGUgLnJvZGF0YS5jc3Q4IGluIGEgZGVmYXVsdCBYZW4gYnVpbGQuCgpOZWl0aGVy
IHRoaXMgbm9yIC4uLgoKPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIHNlY3Rpb24gKGFuZCBpdHMgLmlu
aXQgY291bnRlcnBhcnQpIGFyZW4ndCBjYXB0dXJlZCBieQo+IFhlbidzIGxpbmtlciBnbG9icywg
YW5kIGVuZCB1cCBhcyBvcnBoYW5lZCBzZWN0aW9ucy4KCi4uLiB0aGlzIGFyZSBwcm9ibGVtcyBv
biB0aGVpciBvd24uIFRoZSBpc3N1ZSBpcyBpZiB0aGVzZSBzZWN0aW9ucyBlbmQgdXAKZmlyc3Qg
aW4gdGhlIGJpbmFyeSAod2hpY2gsIGFzIHdlIGFsbCBhcHBlYXIgdG8gYWdyZWUsIHNob3VsZCBu
ZXZlciBoYXZlCmhhcHBlbmVkKS4KCj4gR2VuZXJhbGlzZSB0aGUgZGF0YSBnbG9iYmluZyB0byBw
aWNrIHVwIGNzdCBhbmQgZnV0dXJlIHNwZWNpYWwgc2VjdGlvbnMuCgpJJ20gYSBsaXR0bGUgd2Fy
eSBvZiB0aGlzLCBhbmQgaGFkIGluIHRoZSBwYXN0IHNwZWNpZmljYWxseSBhdm9pZGVkIGFkZGlu
ZwoidG9vIHdpZGUiIGEgZ2xvYiBwYXR0ZXJuOiBUaGVyZSdzIGEgc21hbGwgcmlzayBvZiBjb3Zl
cmluZyBhIHNlY3Rpb24KdGhhdCdzIG1lYW50IHRvIGJlIGNvdmVyZWQgZWxzZXdoZXJlLiBUaGUg
b2JzZXJ2YXRpb24gb2YgdGhlIGlzc3VlCndpdGggdGhlIEFybSBzaWRlIGNoYW5nZSBpcyBhbiBl
eGFtcGxlIG9mIHN1Y2guIFRoZXJlZm9yZSBJJ2QgcHJlZmVyCmlmIHdlIGNvdWxkIGdldCBhd2F5
IHdpdGgganVzdCBhZGRpbmcgLmluaXQucm9kYXRhLmNzdCogYW5kIC5yb2RhdGEuY3N0Ki4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
