Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9859C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:26:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE1E2077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE1E2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJx7o-0004GA-QN; Fri, 26 Apr 2019 09:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJx7o-0004G5-0L
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:26:32 +0000
X-Inumbo-ID: 5e96a5e4-6805-11e9-9dbb-9f5dd301216b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e96a5e4-6805-11e9-9dbb-9f5dd301216b;
 Fri, 26 Apr 2019 09:26:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 03:26:27 -0600
Message-Id: <5CC2CEC002000078002295D3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 03:26:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
In-Reply-To: <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426092624.WkGqnDXFLpXN7a2F0TAHSFZZlIOn3eIHYorCBRPl2dk@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDIxOjU3LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMTI6NTggUE0gQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4KPj4gT24gMjUvMDQvMjAxOSAxNjozMiwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+PiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPj4gPiBpbmRleCA2ZmFhNTYzMTY3Li41
OTRkZTYxNDhmIDEwMDY0NAo+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+PiA+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+PiA+IEBAIC0xMzMsNyArMTMzLDEwIEBA
IHN0cnVjdCBwYWdlX2luZm8KPj4gPiAgICAgICAgICAgKiBvZiBzaGFyaW5nIHNoYXJlIHRoZSB2
ZXJzaW9uIHRoZXkgZXhwZWN0IHRvLgo+PiA+ICAgICAgICAgICAqIFRoaXMgbGlzdCBpcyBhbGxv
Y2F0ZWQgYW5kIGZyZWVkIHdoZW4gYSBwYWdlIGlzIAo+IHNoYXJlZC91bnNoYXJlZC4KPj4gPiAg
ICAgICAgICAgKi8KPj4gPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gKnNoYXJp
bmc7Cj4+ID4gKyAgICAgICAgc3RydWN0IHsKPj4gPiArICAgICAgICAgICAgc3RydWN0IHBhZ2Vf
c2hhcmluZ19pbmZvICppbmZvOwo+PiA+ICsgICAgICAgICAgICByd2xvY2tfdCBsb2NrOwo+PiA+
ICsgICAgICAgIH0gc2hhcmluZzsKPj4gPiAgICAgIH07Cj4+ID4KPj4gPiAgICAgIC8qIFJlZmVy
ZW5jZSBjb3VudCBhbmQgdmFyaW91cyBQR0NfeHh4IGZsYWdzIGFuZCBmaWVsZHMuICovCj4+Cj4+
IEknbSBhZnJhaWQgdGhpcyBpcyBhIG5vLWdvLCBidXQgZm9yIHNvbWUgcmVhc29ucyB3aGljaCBh
cmUgcmF0aGVyIG1vcmUKPj4gc3VidGxlIHRoYXQgdGhleSBhcHBlYXIgaGVyZS4KPj4KPj4gVGhl
cmUgaXMgb25lIHN0cnVjdCBwYWdlX2luZm8gcGVyIDRrIGZyYW1lLCBhbmQgeW91J3ZlIGFkZGVk
IGFuIGV4dHJhIDE2Cj4+IGJ5dGVzLCB0YWtpbmcgaXQgZnJvbSAzMiBieXRlcyB0byA0OCBieXRl
cy4KPj4KPj4gT3RoZXIgdGhhbiBtYWtpbmcgaXQgYSBub24tcG93ZXItb2YtMiAobmV0IGRpZmZz
dGF0IGdyb3cvc2hyaW5rOiAyNTYvMjcKPj4gdXAvZG93bjogNzc1MC8tNTY5NiAoMjA1NCkgZHVl
IHRvIGxlc3MgZWZmaWNpZW50IGFyaXRobWV0aWNbMV0pLCB0aGUKPj4gZnJhbXRhYmxlIGhhcyBh
IGZpeGVkIHZpcnR1YWwgc2l6ZSAoMTI4RyBieSBkZWZhdWx0KSwgc28geW91J3ZlIGVuZGVkIHVw
Cj4+IGRyb3BwaW5nIFhlbidzIG1lbW9yeSBsaW1pdCAoMTZUQiBieSBkZWZhdWx0KSBieSAxLzMu
Cj4gCj4gSW50ZXJlc3RpbmcsIEknbSBub3Qgc3VyZSBJIGNvbXBsZXRlbHkgZm9sbG93IGJ1dCBk
b2VzIHRoaXMgbWVhbiB0aGF0Cj4gdGhpcyBzdHJ1Y3R1cmUgaXMgbm93IG5vdCBhbGxvd2VkIHRv
IGdyb3csIGxpa2UgZXZlciwgb3IgdGhhdCBJIGp1c3QKPiBuZWVkIHRvIGFkZCBwYWRkaW5nIHRv
IGZpeCB1cCBpdHMgYWxpZ25tZW50PwoKSW4gYWRkaXRpb24gdG8gd2hhdCBBbmRyZXcgaGFzIHNh
aWQsIGFsc28gbm90aWNlIGhvdyB3ZSd2ZSBnb25lCnRocm91Z2ggZXh0cmEgaG9vcHMgdG8gYXZv
aWQgZ3Jvd2luZyB0aGUgc3RydWN0dXJlIGluIHRoZSBjb250ZXh0Cm9mIFhTQS0yODAuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
