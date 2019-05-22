Return-Path: <SRS0=PJHi=TW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AB9C18E7D
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 10:12:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF32C20868
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 10:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF32C20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTOEK-0001CN-3P; Wed, 22 May 2019 10:12:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTOEJ-0001CI-8n
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:12:15 +0000
X-Inumbo-ID: 119ec0df-7c7a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 119ec0df-7c7a-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 10:12:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 04:12:13 -0600
Message-Id: <5CE5207A0200007800231481@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 04:12:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
In-Reply-To: <20190522094549.28397-3-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190522101210.fwD6gORB-ZWT6bcoAEgJIlrOxgl10KGsjiXW76Q7Bds@z>

Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjQ1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MjYsOSArMjgsMTEgQEAgREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgX19wcmVlbXB0X2Nv
dW50KTsKPiAgICAgIHByZWVtcHRfY291bnQoKS0tOyAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICB9IHdoaWxlICgwKQo+ICAKPiAtI2lmbmRlZiBOREVCVUcKPiAgdm9pZCBBU1NFUlRfTk9U
X0lOX0FUT01JQyh2b2lkKTsKPiArCj4gICNlbHNlCj4gKyNkZWZpbmUgcHJlZW1wdF9kaXNhYmxl
KCkgICAgYmFycmllcigpOwo+ICsjZGVmaW5lIHByZWVtcHRfZW5hYmxlKCkgICAgIGJhcnJpZXIo
KTsKClN0cmF5IHNlbWljb2xvbnMgKGNvdWxkIGJlIGRyb3BwZWQgd2hpbGUgY29tbWl0dGluZyBp
ZiB3ZSByZWFsbHkKd2FudCB0byBnbyB0aGlzIHJvdXRlKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
