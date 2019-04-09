Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D98EC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:50:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1554120855
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1554120855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqCi-0003j2-75; Tue, 09 Apr 2019 12:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqCh-0003it-7q
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:50:19 +0000
X-Inumbo-ID: 060e2b78-5ac6-11e9-a0fc-5f154cdd23c5
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 060e2b78-5ac6-11e9-a0fc-5f154cdd23c5;
 Tue, 09 Apr 2019 12:50:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 06:50:16 -0600
Message-Id: <5CAC95010200007800225DA6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 06:50:09 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-8-wei.liu2@citrix.com>
 <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
 <20190409122235.GP1986@zion.uk.xensource.com>
In-Reply-To: <20190409122235.GP1986@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 07/55] x86/mm: add an end_of_loop label
 in map_pages_to_xen
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409125009.vIwF_jPDuk0gonpXgxxy6JWx5-oP-xkmaTkakd503d0@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjIyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6NDA6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wMi4xOSBhdCAxNzo0NCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IFdlIHdpbGwgc29vbiBuZWVkIHRvIGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVy
IHRoZSBvdXQgbW9zdCBsb29wIGlzCj4+ID4gZW5kZWQuIEFkZCBhIG5ldyBsYWJlbCBhbmQgdHVy
biByZWxldmFudCBjb250aW51ZSdzIGludG8gZ290bydzLgo+PiAKPj4gVG8gYmUgaG9uZXN0LCBJ
IHdhcyBvbiB0aGUgZWRnZSBvZiBhbHJlYWR5IHN1Z2dlc3RpbmcgbGVzcyB1c2UKPj4gb2YgZ290
byBpbiB0aGUgcHJldmlvdXMgcGF0Y2guIFRoaXMgb25lIGRlZmluaXRlbHkgZ29lcyB0b28gZmFy
Cj4+IGZvciBteSB0YXN0ZSAtIEkgY2FuIHNvbWVob3cgbGl2ZSB3aXRoIGdvdG8tcyB1c2VkIGZv
ciBlcnJvcgo+PiBoYW5kbGluZywgYnV0IHBsZWFzZSBub3QgbXVjaCBtb3JlLiBJcyB0aGVyZSBy
ZWFsbHkgbm8gYmV0dGVyCj4+IHdheT8KPj4gCj4gCj4gSXQgbWF5IGJlIHBvc3NpYmxlIHRvIGNh
bGwgVU5NQVAgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbG9vcCBpbnN0ZWFkLgo+IEhvdyBkb2Vz
IHRoYXQgc291bmQgdG8geW91PwoKSSB0aGluayB0aGF0J3MgZ29pbmcgdG8gYmUgYmV0dGVyLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
