Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4BCC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:43:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5BF2084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C5BF2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDp9J-0003wS-Pk; Tue, 09 Apr 2019 11:42:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDp9I-0003vZ-IS
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:42:44 +0000
X-Inumbo-ID: 95ed022e-5abc-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95ed022e-5abc-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:42:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 05:42:42 -0600
Message-Id: <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 05:42:40 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
In-Reply-To: <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Message-ID: <20190409114240.uLhDcAGkRIUfaWg_PC9rSZg9sC8lg7jkQJQHp-2nMdE@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDEzOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAzLzA0LzIwMTkgMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBbHNvIHBsZWFzZSBu
b3RlIHRoZSBxdW90YXRpb24gdXNlZCBieSB0aGUgbWVudGlvbmVkCj4+IGV4aXN0aW5nIGRvYyBj
b21tZW50cywgYXMgd2VsbCBhcyBhIGZldyBvdGhlciBmb3JtYWwgYXNwZWN0cwo+PiAobGlrZSB0
aGVtIGFsc28gbWFraW5nIGNsZWFyIHdoYXQgdGhlIHJldHVybiB0eXBlIGlzKS4gSSB0aGluawo+
PiB0aGF0J3MgYSBtb2RlbCB1c2VkIGVsc2V3aGVyZSBhcyB3ZWxsLCBzbyBJIHRoaW5rIHlvdSBz
aG91bGQKPj4gZm9sbG93IGl0IGhlcmUuCj4gCj4gSSBoYXZlbid0IHJlcGxpY2F0ZWQgdGhlIGAg
YmVjYXVzZSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLiBJIAo+IHdvdWxk
IGFwcHJlY2lhdGUgaWYgeW91IHByb3ZpZGUgcG9pbnRlciBob3cgdG8gdXNlIHRoZW0uCgpXZWxs
LCBJIGNhbiBvbmx5IHBvaW50IHlvdSBhdCB0aGUgaGlzdG9yeSBvZiB0aGluZ3MsIGUuZy4KMjYy
ZTExOGEzNyAiZG9jcy9odG1sLzogQW5ub3RhdGlvbnMgZm9yIHR3byBoeXBlcmNhbGxzIi4KCj4+
IFRoZSBvdGhlciB0aGluZyBpczogQXMgbWVudGlvbmVkIGVsc2V3aGVyZSwgSSBkb24ndCB0aGlu
ayB0aGUKPj4gZmlyc3QgdHdvIHBhcmFtZXRlcnMgc2hvdWxkIGJlIHBsYWluIGludC4gSSdtIG5v
dCBoYXBweSB0byBzZWUKPj4gdGhpcyBwcm9saWZlcmF0ZSBpbnRvIGRvY3VtZW50YXRpb24gYXMg
d2VsbCwgaS5lLiBJJ2QgcHJlZmVyIGlmCj4+IHRoaXMgd2FzIGNvcnJlY3RlZCBiZWZvcmUgYWRk
aW5nIGRvY3VtZW50YXRpb24uIFdvdWxkIHlvdQo+PiBiZSB3aWxsaW5nIHRvIGRvIHRoaXMsIG9y
IHNob3VsZCBJIGFkZCBpdCB0byBteSB0b2RvIGxpc3Q/Cj4gCj4gV2hpbGUgc3dpdGNoaW5nIGZy
b20gY21kIGZyb20gc2lnbmVkIHRvIHVuc2lnbmVkIHNob3VsZCBiZSBvay4gVGhpcyB3b3VsZCAK
PiBpbnRyb2R1Y2UgYSBkaWZmZXJlbnQgYmVoYXZpb3Igb2YgZm9yIGNvdW50LgoKU2luY2UgdGhp
cyByZW1vdmVzIGFuIGVycm9yIGNvbmRpdGlvbiwgSSB0aGluayB0aGlzIGlzIGFuIG9rYXkgY2hh
bmdlCnRvIGhhcHBlbiwgd2l0aG91dCAuLi4KCj4gQXJlIHdlIGhhcHB5IHdpdGggdGhhdCwgb3Ig
c2hhbGwgd2UgYWRkIGEgY2hlY2sgKChpbnQpY291bnQpID4gMD8KCi4uLiBhbnkgc3VjaCBleHRy
YSBjaGVjay4gVGhpcyBhbHNvIGlzbid0IGdvaW5nIHRvIGludHJvZHVjZSBhbnkgbmV3CnJlYWwg
cmlzayBvZiBhIGxvbmcgcnVubmluZyBvcGVyYXRpb24gb3Igc29tZSBzdWNoIC0gaWYgMkdiIG9m
IGlucHV0CmRhdGEgYXJlIGZpbmUsIEkgY2FuJ3Qgc2VlIHdoeSA0R2Igd291bGRuJ3QgYmUsIHRv
by4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
