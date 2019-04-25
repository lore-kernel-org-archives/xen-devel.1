Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC179C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:04:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50F320652
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50F320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbEd-0005Tg-Kc; Thu, 25 Apr 2019 10:04:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dzn1=S3=citrix.com=prvs=011a8fd5f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hJbEc-0005TZ-9g
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:04:06 +0000
X-Inumbo-ID: 73bd1dfa-6741-11e9-b0fd-8b2ebfde282e
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73bd1dfa-6741-11e9-b0fd-8b2ebfde282e;
 Thu, 25 Apr 2019 10:04:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549929600"; d="scan'208";a="84374502"
Date: Thu, 25 Apr 2019 11:03:59 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190425100359.GJ30543@zion.uk.xensource.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
 <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
 <20190418114627.GC30543@zion.uk.xensource.com>
 <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
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
 oleksandr_tyshchenko@epam.com, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425100359.oJ1MOUM1wbUpQS_0DHevLJlIJaLxReEmUhRaitbznH4@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMDQ6MDk6MjFQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDE4LzA0LzIwMTkgMTI6NDYsIFdlaSBMaXUgd3JvdGU6Cj4gPiBP
biBXZWQsIEFwciAxNywgMjAxOSBhdCAwNjo0Mjo0N1BNICswMTAwLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gQFdlaSwgQElhbjogRG8geW91IGhhdmUgYW55IGlu
cHV0Pwo+ID4gCj4gPiBTb3JyeSBJIGhhdmVuJ3QgYmVlbiBmb2xsb3dpbmcgdGhpcyBjbG9zZWx5
LCBidXQgc2hvdWxkbid0IHdlIGZpeCB0aGUKPiA+IGludGVyZmFjZSB0byByZXR1cm4gZ2ZuIGlu
c3RlYWQ/IEFuZCB0aGVuIHRoZSBtYXBwaW5nIG9mIGl0IHNob3VsZAo+ID4gaW50ZXJwcmV0IHRo
ZSB2YWx1ZSBwcm9wZXJseSBwZXIgZ3Vlc3QgdHlwZS4KPiAKPiBXZSBhbHJlYWR5IHJldHVybiBh
IEdGTiB0b2RheS4gVGhlIHByb2JsZW0gaXMgd2Ugb25seSBob2xkIGFuIE1GTiBhdCB0aGF0IHRp
bWUuCj4gCj4gQXQgdGhlIG1vbWVudCwgd2UgcmVseSBvbiB0aGUgTTJQIHRvIGZpbmQgdGhlIGNv
cnJlc3BvbmRpbmcgR0ZOLiBBcyB3ZSBkb24ndAo+IGhhdmUgYW4gTTJQIG9uIEFybSwgd2Ugd291
bGQgaGF2ZSB0byBzdG9yZSB0aGUgYXNzb2NpYXRlZCBHRk4uCj4gCj4gQnV0IGFsbCB0aGlzIGxv
Z2ljIGlzIGEgYml0IGJyb2tlbi4gSXQgcmVsaWVzIG9uIHRoZSB0b29sc3RhY2sgKG9yIHRoZQo+
IGd1ZXN0KSB0byBoYXZlIG1hcHBlZCB0aGUgc2hhcmVkIGluZm8gZnJhbWUgaW4gdGhlIFAyTSB1
c2luZyB0aGUgcGh5c21hcAo+IGh5cGVydmlzb3Igd2l0aCBYRU5NQVBTUEFDRV9zaGFyZWRfaW5m
byBiZWZvcmVoYW5kLiBUaGlzIGlzIGFsc28gcmFjeSBhcyB5b3UKPiBtYXkgcmV0dXJuIGEgR0ZO
IHRoYXQgd2FzIHVubWFwcGVkL3JlbWFwcGVkIHRvIHNvbWV0aGluZyBlbHNlIGJlZm9yZSB0aGUK
PiB0b29sc3RhY2sgaGFzIGEgY2hhbmNlIHRvIG1hcCBpbiBpdHMgYWRkcmVzcyBzcGFjZSB0aGUg
cGFnZS4KPiAKPiBUaGUgY29ycmVjdCBzb2x1dGlvbiB3b3VsZCBiZSB0byBwaGFzZSBvdXQgdGhl
IGZpZWxkIHNoYXJlZF9pbmZvX2ZyYW1lIGFuZAo+IHVzZSBYRU5NRU1fYWNxdWlyZV9yZXNvdXJj
ZSBpbnN0ZWFkLiBIb3dldmVyLCB0aGlzIHJlcXVpcmVzIHRoZSBhc3NvY2lhdGVkCj4gaW9jdGwg
dG8gYmUgaW1wbGVtZW50ZWQgaW4gTGludXguCgpPSy4gVGhhdCBzZWVtcyB0byBiZSBhIHNlbnNp
YmxlIHdheSBmb3J3YXJkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
