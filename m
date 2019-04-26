Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3B3C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:12:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE882077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE882077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK0eV-0006gn-UN; Fri, 26 Apr 2019 13:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hK0eU-0006gi-N1
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:12:30 +0000
X-Inumbo-ID: f07374be-6824-11e9-b40f-93c16147c074
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f07374be-6824-11e9-b40f-93c16147c074;
 Fri, 26 Apr 2019 13:12:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 07:12:26 -0600
Message-Id: <5CC303B60200007800229748@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 07:12:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
 <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
 <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
In-Reply-To: <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
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
Message-ID: <20190426131222.wLSbTyhuQsBqYPUVt_DIx4hszmVRWWRO_7ioWl5V22k@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDE0OjI0LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMzoyNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMjYuMDQuMTkgYXQgMDI6MTIsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPj4gPiBJIHdvdWxkIGJlIE9LIHdpdGggcHV0dGluZyB0aGUgd2hv
bGUgdGhpbmcgYmVoaW5kCj4+ID4gQ09ORklHX0hBU19NRU1fU0hBUklORyBhbmQgaGF2aW5nIHRo
YXQgYmUgb2ZmIGJ5IGRlZmF1bHQuIElzIHRoYXQgYQo+PiA+IGZlYXNpYmxlIHJvdXRlIGZyb20g
eW91ciBQT1Y/Cj4+Cj4+IFNvIGlzIHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggbXkgZWFybGll
ciBzdWdnZXN0aW9uIG9mCj4+IHJlLXB1cnBvc2luZyB0aGUgc2hhcmluZyBmaWVsZCB0byBhdHRh
Y2ggYSBzdHJ1Y3R1cmUgdG8gdGhlIHBhZ2UKPj4gd2hpY2ggY29udGFpbnMgdGhlIG5lY2Vzc2Fy
eSBsb2NrPyBJLmUuIGluIHRoZSBzaW1wbGVzdCBjYXNlIGJ5Cj4+IGFkZGluZyB0aGUgbG9jayB0
byBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gaXRzZWxmPwo+IAo+IFllcywgdGhhdCB3b24ndCB3
b3JrIHVuZm9ydHVuYXRlbHkuIFRoZSBsb2NrIGlzIHN1cHBvc2VkIHRvIHByb3RlY3QKPiB1cGRh
dGVzIG1hZGUgdG8gdGhlIHN0cnVjdHVyZSBidXQgYWxzbyBmcmVlaW5nIGl0LiBJZiB0aGUgbG9j
ayBsaXZlcwo+IHdpdGhpbiB0aGUgc3RydWN0dXJlIGl0IG9idmlvdXNseSB3b3VsZCBoYXZlIHRv
IGJlIHVubG9ja2VkIGJlZm9yZSBpdHMKPiBmcmVlZCwgYnV0IGlmIGl0cyB1bmxvY2tlZCBiZWZv
cmUgZnJlZWQgdGhlbiBhbm90aGVyIHRocmVhZCB3YWl0aW5nIG9uCj4gaXQgY291bGQgY29udGlu
dWUgd2l0aG91dCByZWFsaXppbmcgaXQgaXMgYmVpbmcgZnJlZWQuCgpDYW4ndCB5b3UgUkNVLWZy
ZWUgdGhlIHN0cnVjdHVyZSBpbnN0ZWFkLCBhZnRlciBkZXRhY2hpbmcgaXQgZnJvbQp0aGUgbWFp
biBzdHJ1Y3QgcGFnZV9pbmZvIGluc3RhbmNlPyBPZiBjb3Vyc2UgYWxsIGludm9sdmVkIHBhcnRp
ZXMKdGhlbiBuZWVkIHRvIGJlIGF3YXJlIHRoYXQgb25jZSB0aGV5J3ZlIGFjcXVpcmVkIHRoZSBs
b2NrLCB0aGUKcG9pbnRlciBpbiBzdHJ1Y3QgcGFnZV9pbmZvIG1heSBoYXZlIGJlY29tZSBOVUxM
LCB3aGljaApwcmVzdW1hYmx5IHdvdWxkIGRpcmVjdCB0aGVtIHRvIGRyb3AgdGhlIGxvY2sgYWdh
aW4gcmlnaHQgYXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
