Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52FDC282DA
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:21:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6B22084C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6B22084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqg5-0006ix-IM; Tue, 09 Apr 2019 13:20:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqg4-0006is-6l
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:20:40 +0000
X-Inumbo-ID: 43d298d9-5aca-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 43d298d9-5aca-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 13:20:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 07:20:37 -0600
Message-Id: <5CAC9C210200007800225E2B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 07:20:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-5-wei.liu2@citrix.com>
 <5C8BC685020000780021F5E5@prv1-mh.provo.novell.com>
 <20190409122203.GN1986@zion.uk.xensource.com>
 <5CAC94DE0200007800225DA3@prv1-mh.provo.novell.com>
 <20190409125912.GO30543@zion.uk.xensource.com>
In-Reply-To: <20190409125912.GO30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 04/55] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
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
Message-ID: <20190409132033.t3QMGOv6Y62TfgNFxlsRBYVdEoVJd8AAZ5ARy-tEo9I@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjU5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDY6NDk6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwOS4wNC4xOSBhdCAxNDoyMiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIEZyaSwgTWFyIDE1LCAyMDE5IGF0IDA5OjM2OjM3QU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMDcuMDIuMTkgYXQgMTc6NDQsIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBUaGUgcGwyZSBhbmQgcGwxZSB2YXJpYWJsZXMgYXJl
IGhlYXZpbHkgKGFiKXVzZWQgaW4gdGhhdCBmdW5jdGlvbi4gSXQKPj4gPj4gPiBpcyBmaW5lIGF0
IHRoZSBtb21lbnQgYmVjYXVzZSBhbGwgcGFnZSB0YWJsZXMgYXJlIGFsd2F5cyBtYXBwZWQgc28K
Pj4gPj4gPiB0aGVyZSBpcyBubyBuZWVkIHRvIHRyYWNrIHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2
YXJpYWJsZS4KPj4gPj4gPiAKPj4gPj4gPiBXZSB3aWxsIHNvb24gaGF2ZSB0aGUgcmVxdWlyZW1l
bnQgdG8gbWFwIGFuZCB1bm1hcCBwYWdlIHRhYmxlcy4gV2UKPj4gPj4gPiBuZWVkIHRvIHRyYWNr
IHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2YXJpYWJsZSB0byBhdm9pZCBsZWFrYWdlLgo+PiA+PiA+
IAo+PiA+PiA+IEludHJvZHVjZSBzb21lIGx7MSwyfXQgdmFyaWFibGVzIHdpdGggbGltaXRlZCBz
Y29wZSBzbyB0aGF0IHdlIGNhbgo+PiA+PiA+IHRyYWNrIGxpZmUgdGltZSBvZiBwb2ludGVycyB0
byB4ZW4gcGFnZSB0YWJsZXMgbW9yZSBlYXNpbHkuCj4+ID4+IAo+PiA+PiBCdXQgeW91IHJldGFp
biBzb21lIHVzZXMgb2YgdGhlIG9sZCB2YXJpYWJsZXMsIGFuZCB0byBiZSBob25lc3QgaXQncwo+
PiA+PiBub3QgcmVhbGx5IGNsZWFyIHRvIG1lIGJ5IHdoYXQgY3JpdGVyaWEgKGFuZCBoYXZpbmcg
bXVsdGlwbGUgaW5zdGFuY2VzCj4+ID4+IG9mIGEgdmFyaWFibGUgbmFtZSBpbiBhIHNpbmdsZSBm
dW5jdGlvbiBpc24ndCBuZWNlc3NhcmlseSBsZXNzIGNvbmZ1c2luZykuCj4+ID4+IEkgdGhpbmsg
d2UgZWl0aGVyIHN0aWNrIHRvIHdoYXQncyB0aGVyZSAoZG9lc24ndCBsb29rIHRvbyBiYWQgdG8g
bWUpLAo+PiA+PiBvciB5b3Ugc3dpdGNoIHRvIHNjb3BlIHJlc3RyaWN0ZWQgcGFnZSB0YWJsZSBw
b2ludGVycyB0aHJvdWdob3V0IHRoZQo+PiA+PiBmdW5jdGlvbiwgc3VjaCB0aGF0IHRoZSBmdW5j
dGlvbiBzY29wZSBzeW1ib2xzIGNhbiBnbyBhd2F5Cj4+ID4+IGFsdG9nZXRoZXIpLgo+PiA+IAo+
PiA+IEkgdGhvdWdodCBteSBjb21taXQgbWVzc2FnZSB3YXMgY2xlYXIgZW5vdWdoOiBpdCBoZWxw
ZWQgdHJhY2tpbmcgdGhlCj4+ID4gbGlmZXRpbWUgb2YgcG9pbnRlcnMgbW9yZSBlYXNpbHkuIFRo
ZXJlIGlzIG5vdGhpbmcgbmV3IGluIHRoaXMgdHJpY2s6Cj4+ID4gdGhlIGxlc3MgdmFyaWFibGVz
IG9mIHRoZSBzYW1lIG5hbWUgdGhlIGJldHRlci4KPj4gPiAKPj4gPiBJbiB0aGlzIHBhdGNoLCBw
bGFjZXMgd2hlcmUgaXQgaXMgY2xlYXIgdGhhdCB1c2luZyBsb2NhbCBzY29wZSB2YXJpYWJsZXMK
Pj4gPiBzdWZmaWNlcyBhcmUgY2hhbmdlZCB0byB1c2UgbG9jYWwgdmFyaWFibGVzLgo+PiA+IAo+
PiA+IEluIHRoZSBlbmQsIHBsKmUgYXJlIG9ubHkgdXNlZCB0byBwb2ludCB0byBlbnRyaWVzIHdo
aWNoIHBvaW50IHRvIHRoZQo+PiA+IHBhZ2UgdGFibGVzIHJlbGF0ZWQgdG8gdGhlIGxpbmVhciBh
ZGRyZXNzIGJlaW5nIG1hcHBlZC4gVGhleSB3b24ndCBiZQo+PiA+IHVzZWQgdG8gcG9pbnQgdG8g
YW55IGludGVybWVkaWF0ZSBwb2ludGVycyB3aGljaCBhcmUgdXNlZCB0byBtYW5pcHVsYXRlCj4+
ID4gcGFnZSB0YWJsZXMuCj4+ID4gCj4+ID4gV2UgY2FuJ3QgZWxpbWluYXRlIGZ1bmN0aW9uIHNj
b3BlIHZhcmlhYmxlcyBiZWNhdXNlIHRoZXkgbmVlZCB0byBzdGF5Cj4+ID4gZnVuY3Rpb24gc2Nv
cGUgLS0gc2VlIGxhdGVyIHBhdGNoZXMgd2hlcmUgdGhleSBhcmUgdW5tYXBwZWQgaW4gdGhlIG91
dAo+PiA+IHBhdGguCj4+IAo+PiBFeGNlcHQgdGhhdCBJJ20gbm90IHJlYWxseSBoYXBweSB3aXRo
IHRoYXQgYXBwcm9hY2ggZWl0aGVyIChub3QKPj4gb25seSBidXQgYWxzbyBiZWNhdXNlIG9mIHRo
ZSBwcm9saWZlcmF0aW9uIG9mIGdvdG8tcykuCj4gCj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhlcmUg
YXJlIGZhciB0b28gbWFueSBleGl0IHBhdGhzIGluIHRoaXMgZnVuY3Rpb24uCj4gUHJldmlvdXNs
eSBpdCB3YXMgb2theSBiZWNhdXNlIHdlIGRpZG4ndCBuZWVkIHRvIGNsZWFuIHVwLiBJdCB3b24n
dCBiZQo+IG9rYXkgb25jZSB3ZSBoYXZlIHRvLgo+IAo+IEkgcGlja2VkIHRoZSBvcHRpb24gdG8g
dW5pZnkgdGhlbSBpbnRvIG9uZSBvciB0d28gcGxhY2VzLgo+IAo+IE9uZSBvcHRpb24gaXMgdG8g
ZHVwbGljYXRlIGNsZWFudXAgY29kZSBpbiBlYWNoIGV4aXQgcGF0aC4gVGhhdCdzCj4gcmVwZXRp
dGl2ZSBhbmQgZXJyb3ItcHJvbmUgSU1ITy4KPiAKPiBPbmUgb3B0aW9uIGlzIHRvIGJyZWFrIHVw
IG1hcF9wYWdlc190b194ZW4gaW50byBzbWFsbGVyIGZ1bmN0aW9ucyB3aGljaAo+IGRvbid0IHJl
cXVpcmUgZ290b3MgYnV0IHJlcXVpcmUgbW9yZSBtYXBwaW5nIC8gdW5tYXBwaW5nLiBJIHRob3Vn
aHQKPiBhYm91dCB0aGF0IGJ1dCBpdCB3YXMgdG9vIG11Y2ggZmFmZiB3aXRob3V0IGdldHRpbmcg
dXMgdG8gd2hlcmUgd2UKPiB3YW50ZWQgdG8gYmUuCj4gCj4gUGljayB5b3VyIHBvaXNvbi4gVGhl
cmUgaXNuJ3QgYW4gZWFzeSBzb2x1dGlvbiB0byB0aGlzLi4uCgpCcmVha2luZyB1cCB0aGUgZnVu
Y3Rpb24gaXMgcXVpdGUgbGlrZWx5IGdvaW5nIHRvIGJlY29tZSB2ZXJ5IGRlc2lyYWJsZQpmb3Ig
NS1sZXZlbCBwYWdlIHRhYmxlcyBhbnl3YXkuIEJ1dCBJJ20gbm90IGdvaW5nIHRvIGluc2lzdCB5
b3UgZG8gdGhpcwp3b3JrIGFzIGEgcHJlcmVxIGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
