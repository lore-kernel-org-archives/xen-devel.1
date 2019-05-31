Return-Path: <SRS0=e+jd=T7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4332C04AB6
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 11:30:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBB42683E
	for <xen-devel@archiver.kernel.org>; Fri, 31 May 2019 11:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADBB42683E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWfjv-0007Vd-EC; Fri, 31 May 2019 11:30:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWfjt-0007VK-LV
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:30:25 +0000
X-Inumbo-ID: 7b198520-8397-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7b198520-8397-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 11:30:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 05:30:23 -0600
Message-Id: <5CF1104A0200007800233FB2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 05:30:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Baodong Chen" <chenbaodong@mxnavi.com>
References: <1559270815-19243-1-git-send-email-chenbaodong@mxnavi.com>
 <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
In-Reply-To: <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
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
Message-ID: <20190531113018.EDlQtJpyaMXrKgONC128FQK8muopm2fDqGHNurcvsX0@z>

Pj4+IE9uIDMxLjA1LjE5IGF0IDEyOjU1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMzEvMTkgMzo0NiBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vY3B1LmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2NwdS5oCj4+IEBAIC0xMCw4
ICsxMCw4IEBAIGJvb2xfdCBnZXRfY3B1X21hcHModm9pZCk7Cj4+ICAgdm9pZCBwdXRfY3B1X21h
cHModm9pZCk7Cj4+ICAgCj4+ICAgLyogU2FmZWx5IHBlcmZvcm0gQ1BVIGhvdHBsdWcgYW5kIHVw
ZGF0ZSBjcHVfb25saW5lX21hcCwgZXRjLiAqLwo+PiAtYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2lu
KHZvaWQpOwo+PiAtdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpOwo+PiArc3RhdGljIGlubGlu
ZSBib29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCkgeyByZXR1cm4gZ2V0X2NwdV9tYXBzKCk7
IH0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpIHsgcHV0X2Nw
dV9tYXBzKCk7IH0KClBsdXMgcGxlYXNlIHN3aXRjaCB0byBib29sIGF0IHRoZSBzYW1lIHRpbWUu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
