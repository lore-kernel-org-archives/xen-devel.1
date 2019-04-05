Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6309C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:27:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FDA2186A
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89FDA2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCM3q-0004Aj-6K; Fri, 05 Apr 2019 10:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCM3o-0004Ad-NP
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:27:00 +0000
X-Inumbo-ID: 56db22d6-578d-11e9-9c6c-d72bdd429d67
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56db22d6-578d-11e9-9c6c-d72bdd429d67;
 Fri, 05 Apr 2019 10:26:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 04:26:56 -0600
Message-Id: <5CA72D710200007800224D5C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 04:26:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
 <5CA7273C0200007800224D26@prv1-mh.provo.novell.com>
 <cebb63a0-ec60-9862-3723-9a8e514c7582@arm.com>
In-Reply-To: <cebb63a0-ec60-9862-3723-9a8e514c7582@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405102657.KSql8yrSS7o3abC2XrbHcWz8KXY70cGZPIPCYpgiaWs@z>

Pj4+IE9uIDA1LjA0LjE5IGF0IDEyOjIxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA1LzA0LzIwMTkgMTE6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbiBhbnkgZXZlbnQs
IGlmIHlvdSBtZWFuIHRvIHRyZWF0IGh3ZG9tIGFuZCBEb21VIGRpZmZlcmVudGx5LAo+PiB0aGVu
IEkgdGhpbmsgdGl0bGUgYW5kL29yIGRlc2NyaXB0aW9uIHNob3VsZCBhY3R1YWxseSBzYXkgc28s
IGFuZCB3aHkuCj4gCj4gSSBkb24ndCBzZWUgaG93IHRoaXMgaXMgdHJlYXRlZCBkaWZmZXJlbnRs
eS4gVGhpcyBjb2RlIGRvZXMgZXhhY3RseSB3aGF0IGNvbW1pdCAKPiB0aXRsZSBzdGF0ZS4gSS5l
IHRoZSBOVUwgZG9lcyBub3QgaW5kaWNhdGUgdGhlIGVuZCBvZiB0aGUgYnVmZmVyIGFueW1vcmUu
Cj4gCj4gU28gSSBkb24ndCBzZWUgd2hhdCBlbHNlIGNhbiBiZSBzYWlkIGluIHRoZSBjb21taXQg
bWVzc2FnZS4gRmVlbCBmcmVlIHRvIAo+IHN1Z2dlc3QgaXQuCgpIbW0sIHRydWUuIFBsZWFzZSBz
Y3JhdGNoIHRoYXQgcmVtYXJrIHRoZW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
