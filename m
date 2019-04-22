Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0EBC10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 22:00:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AAB92064A
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 22:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxHDvtYx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AAB92064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIgyi-00055P-3f; Mon, 22 Apr 2019 21:59:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c0q/=SY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hIgyh-00055K-HP
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 21:59:55 +0000
X-Inumbo-ID: f551330d-6549-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f551330d-6549-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 21:59:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C02AD2064A;
 Mon, 22 Apr 2019 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555970393;
 bh=g/94QuOgZ5RvIhgkotPARblbR6pqVs8GVoc5oV7KTEM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OxHDvtYxpXgrcmhZQw4xghvqIspzDRnk3r1Y3e0JoGtyrYEnXQ7OVwCwt2aC/2vf2
 +kDqYcxXtiC0iolmLRMMdPfqhy1O5A2H1TKBkTrUtgzDsXEsI2VPAe/DqNg/lp9769
 MQsN97N+EcDjC5btETra5E3viTJLAIUhhGZnHYMc=
Date: Mon, 22 Apr 2019 14:59:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c748bb73-03d8-bb00-6b72-3f5b04d89c48@arm.com>
Message-ID: <alpine.DEB.2.10.1904221431580.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <d3020727-f29c-5485-75a4-d96b3a9b0a92@arm.com>
 <alpine.DEB.2.10.1904191632380.1370@sstabellini-ThinkPad-X260>
 <c748bb73-03d8-bb00-6b72-3f5b04d89c48@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422215952.F_IncgnkAPCREi-Tfu2RHKHhCdVXqO8I0b59hpxGE50@z>

T24gU3VuLCAyMSBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiA+ID4gPiBpbmRl
eCAzMGNmYjAxLi41YjhmY2M1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0u
Ywo+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+ID4gPiA+IEBAIC0xMDY4LDkgKzEw
NjgsMjQgQEAgaW50IHVubWFwX3JlZ2lvbnNfcDJtdChzdHJ1Y3QgZG9tYWluICpkLAo+ID4gPiA+
ICAgIGludCBtYXBfbW1pb19yZWdpb25zKHN0cnVjdCBkb21haW4gKmQsCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
IG1mbl90IG1mbikKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuLAo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjYWNoZV9wb2xpY3kpCj4gPiA+ID4g
ICAgewo+ID4gPiA+IC0gICAgcmV0dXJuIHAybV9pbnNlcnRfbWFwcGluZyhkLCBzdGFydF9nZm4s
IG5yLCBtZm4sCj4gPiA+ID4gcDJtX21taW9fZGlyZWN0X2Rldik7Cj4gPiA+ID4gKyAgICBwMm1f
dHlwZV90IHQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgc3dpdGNoICggY2FjaGVfcG9saWN5ICkK
PiA+ID4gPiArICAgIHsKPiA+ID4gPiArICAgIGNhc2UgQ0FDSEVBQklMSVRZX01FTU9SWToKPiA+
ID4gPiArICAgICAgICB0ID0gcDJtX3JhbV9ydzsKPiA+ID4gCj4gPiA+IFBvdGVudGlhbGx5LCB5
b3Ugd2FudCB0byBjbGVhbiB0aGUgY2FjaGUgaGVyZS4KPiA+IAo+ID4gV2UgaGF2ZSBiZWVuIHRh
bGtpbmcgYWJvdXQgdGhpcyBhbmQgSSBoYXZlIGJlZW4gbG9va2luZyB0aHJvdWdoIHRoZQo+ID4g
Y29kZS4gSSBhbSBzdGlsbCBub3QgZXhhY3RseSBzdXJlIGhvdyB0byBwcm9jZWVkLgo+ID4gCj4g
PiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgY2FjaGVhYmxlIHJlc2VydmVkX21lbW9yeSBwYWdlcyBz
aG91bGQgYmUgdHJlYXRlZAo+ID4gZGlmZmVyZW50bHkgZnJvbSBub3JtYWwgbWVtb3J5LCBpbiBy
ZWdhcmRzIHRvIGNsZWFuaW5nIHRoZSBjYWNoZT8gSXQKPiA+IHNlZW1zIHRvIG1lIHRoYXQgdGhl
eSBzaG91bGQgYmUgdGhlIHNhbWUgaW4gdGVybXMgb2YgY2FjaGUgaXNzdWVzPwo+IAo+IFlvdXIg
d29yZGluZyBpcyBhIGJpdCBjb25mdXNpbmcuIEkgZ3Vlc3Mgd2hhdCB5b3UgY2FsbCAibm9ybWFs
IG1lbW9yeSIgaXMKPiBndWVzdCBtZW1vcnksIGFtIEkgcmlnaHQ/CgpZZXMsIHJpZ2h0LiBJIHdv
bmRlciBpZiB3ZSBuZWVkIHRvIGNvbWUgdXAgd2l0aCBjbGVhcmVyIHRlcm1zLiBHaXZlbiB0aGUK
bWFueSB0eXBlcyBvZiBtZW1vcnkgd2UgaGF2ZSB0byBkZWFsIHdpdGgsIGl0IG1pZ2h0IGJlY29t
ZSBldmVuIG1vcmUKY29uZnVzaW5nIGdvaW5nIGZvcndhcmQuIEd1ZXN0IG5vcm1hbCBtZW1vcnkg
bWF5YmU/IE9yIGd1ZXN0IFJBTT8KCgo+IEFueSBtZW1vcnkgYXNzaWduZWQgdG8gdGhlIGd1ZXN0
IGlzIGFuZCBjbGVhbiAmIGludmFsaWRhdGUgKHRlY2huaWNhbGx5IGNsZWFuCj4gaXMgZW5vdWdo
KSBiZWZvcmUgZ2V0dGluZyBhc3NpZ25lZCB0byB0aGUgZ3Vlc3QgKHNlZSBmbHVzaF9wYWdlX3Rv
X3JhbSkuIFNvCj4gdGhpcyBwYXRjaCBpcyBpbnRyb2R1Y2luZyBhIGRpZmZlcmVudCBiZWhhdmlv
ciB0aGF0IHdoYXQgd2UgY3VycmVudGx5IGhhdmUgZm9yCj4gb3RoZXIgbm9ybWFsIG1lbW9yeS4K
ClRoaXMgaXMgd2hhdCBJIHdhcyB0cnlpbmcgdG8gdW5kZXJzdGFuZCwgdGhhbmtzIGZvciB0aGUg
cG9pbnRlci4gSSBhbQp1bnN1cmUgd2hldGhlciB3ZSB3YW50IHRvIGRvIHRoaXMgZm9yIHJlc2Vy
dmVkLW1lbW9yeSByZWdpb25zIHRvbzogb24Kb25lIGhhbmQsIGl0IHdvdWxkIG1ha2UgdGhpbmdz
IG1vcmUgY29uc2lzdGVudCwgb24gdGhlIG90aGVyIGhhbmQgSSBhbQpub3Qgc3VyZSBpdCBpcyB0
aGUgcmlnaHQgYmVoYXZpb3IgZm9yIHJlc2VydmVkLW1lbW9yeS4gTGV0J3MgdGhpbmsgaXQKdGhy
b3VnaC4KClRoZSB1c2UgY2FzZSBpcyBjb21tdW5pY2F0aW9uIHdpdGggb3RoZXIgaGV0ZXJvZ2Vu
ZW91cyBDUFVzLiBJbiB0aGF0CmNhc2UsIGl0IHdvdWxkIG1hdHRlciBpZiBhIGRvbVUgY3Jhc2hl
cyB3aXRoIHRoZSByaW5nIG1hcHBlZCBhbmQgYW4KdW5mbHVzaGVkIHdyaXRlIChwYXJ0aWFsPykg
dG8gdGhlIHJpbmcuIFRoZSBkb21VIGdldHMgcmVzdGFydGVkIHdpdGggdGhlCnNhbWUgcmluZyBt
YXBwaW5nLiBJbiB0aGlzIGNhc2UsIGl0IGxvb2tzIGxpa2Ugd2Ugd291bGQgd2FudCB0byBjbGVh
bgp0aGUgY2FjaGUuIEl0IHdvdWxkbid0IG1hdHRlciBpZiBpdCBpcyBkb25lIGF0IFZNIHNodXRk
b3duIG9yIGF0IFZNCmNyZWF0aW9uIHRpbWUuCgpTbyBtYXliZSBpdCBtYWtlcyBzZW5zZSB0byBk
byBzb21ldGhpbmcgbGlrZSBmbHVzaF9wYWdlX3RvX3JhbSBmb3IKcmVzZXJ2ZWQtbWVtb3J5IHBh
Z2VzLiBJdCBzZWVtcyBzaW1wbGUgdG8gZG8gaXQgYXQgVk0gY3JlYXRpb24gdGltZSwKYmVjYXVz
ZSB3ZSBjb3VsZCBpbnZhbGlkYXRlIHRoZSBjYWNoZSB3aGVuIG1hcF9tbWlvX3JlZ2lvbnMgaXMg
Y2FsbGVkLAplaXRoZXIgdGhlcmUgb3IgZnJvbSB0aGUgZG9tY3RsIGhhbmRsZXIuIE9uIHRoZSBv
dGhlciBoYW5kLCBJIGRvbid0IGtub3cKd2hlcmUgdG8gZG8gaXQgYXQgZG9tYWluIGRlc3RydWN0
aW9uIHRpbWUgYmVjYXVzZSBubyBkb21jdGwgaXMgY2FsbGVkIHRvCnVubWFwIHRoZSByZXNlcnZl
ZC1tZW1vcnkgcmVnaW9uLiBBbHNvLCBjbGVhbmluZyB0aGUgY2FjaGUgYXQgZG9tYWluCmRlc3Ry
dWN0aW9uIHRpbWUgd291bGQgaW50cm9kdWNlIGEgZGlmZmVyZW5jZSBjb21wYXJlZCB0byBndWVz
dCBub3JtYWwKbWVtb3J5LgoKSSBrbm93IEkgc2FpZCB0aGUgb3Bwb3NpdGUgaW4gb3VyIG1lZXRp
bmcsIGJ1dCBtYXliZSBjbGVhbmluZyB0aGUgY2FjaGUKZm9yIHJlc2VydmVkLW1lbW9yeSByZWdp
b25zIGF0IGRvbWFpbiBjcmVhdGlvbiB0aW1lIGlzIHRoZSByaWdodCB3YXkKZm9yd2FyZD8KCgo+
IEJ1dCBteSBjb25jZXJuIGlzIHlvdSBtYXkgaW5jb25zaXN0ZW50bHkgdXNlIHRoZSBtZW1vcnkg
YXR0cmlidXRlcyBicmVha2luZwo+IGNvaGVyZW5jeS4gRm9yIGluc3RhbmNlLCB5b3UgbWFwIGlu
IEd1ZXN0IEEgd2l0aCBjYWNoZWFibGUgYXR0cmlidXRlcyB0aGVuCj4gYWZ0ZXIgdGhlIGd1ZXN0
IGRpZWQsIHlvdSByZW1hcCB0byBndWVzdCBCIHdpdGggYSBub24tY2FjaGVhYmxlIGF0dHJpYnV0
ZXMuCj4gZ3Vlc3QgQiBtYXkgaGF2ZSBhbiBpbmNvbnNpc3RlbnQgdmlldyBvZiB0aGUgbWVtb3J5
IG1hcHBlZC4KCkkgdGhpbmsgdGhhdCBhbnl0aGluZyBjYXVzZWQgYnkgdGhlIHVzZXIgc2VsZWN0
aW5nIHRoZSB3cm9uZwpjYWNoZWFiaWxpdHkgYXR0cmlidXRlcyBpcyBub3Qgc29tZXRoaW5nIHdl
IGhhdmUgdG8gc3VwcG9ydCBvciBjYXJlCmFib3V0IChtb3JlIGFib3V0IGl0IGJlbG93KS4KCgo+
IFRoaXMgaXMgb25lIGNhc2Ugd2hlcmUgY2xlYW5pbmcgdGhlIGNhY2hlIHdvdWxkIGJlIG5lY2Vz
c2FyeS4gT25lIGNvdWxkCj4gY29uc2lkZXIgdGhpcyBpcyBwYXJ0IG9mIHRoZSAiZGV2aWNlIHJl
c2V0IiAodGhpcyBpcyBhIGJpdCBvZiB0aGUgbmFtZSBhYnVzZSksCj4gc28gWGVuIHNob3VsZCBu
b3QgdGFrZSBjYXJlIG9mIGl0Lgo+IAo+IFRoZSBtb3N0IGltcG9ydGFudCBiaXQgaXMgdG8gaGF2
ZSBkb2N1bWVudGF0aW9uIHRoYXQgcmVmbGVjdCB0aGUgaXNzdWVzIHdpdGgKPiBzdWNoIHBhcmFt
ZXRlcnMuIFNvIHRoZSB1c2VyIGlzIGF3YXJlIG9mIHdoYXQgY291bGQgZ28gd3Jvbmcgd2hlbiB1
c2luZwo+ICJpb21lbSIuCgpJIGFncmVlLiBJJ2xsIGJlIHZlcnkgY2xlYXIgYWJvdXQgdGhlIGNv
bnNlcXVlbmNlcyBvZiBjaG9vc2luZyB3cm9uZyBvcgppbmNvbnNpc3RlbnQgYXR0cmlidXRlcyBp
biB0aGUgZG9jcy4gQWxzbywgSSdsbCBiZSB2ZXJ5IGNsZWFyIGFib3V0CmNhY2hlLWZsdXNoaW5n
LCBkb2N1bWVudGluZyBwcm9wZXJseSB0aGUgaW1wbGVtZW50ZWQgYmVoYXZpb3IgKHdoaWNoIGF0
CnRoZSBtb21lbnQgaXMgbm8tY2FjaGUtZmx1c2hlcykuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
