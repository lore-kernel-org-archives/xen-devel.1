Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD52C04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 15:29:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E6E20657
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 15:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E6E20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIK8-0002sm-Pu; Thu, 16 May 2019 15:29:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRIK7-0002sh-HB
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:29:35 +0000
X-Inumbo-ID: 675dfc46-77ef-11e9-8a4e-17301319c23b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 675dfc46-77ef-11e9-8a4e-17301319c23b;
 Thu, 16 May 2019 15:29:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 09:29:32 -0600
Message-Id: <5CDD81DA020000780022FCD7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 09:29:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Ian Jackson" <Ian.Jackson@eu.citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
 <71ca1c58-55a1-657e-a633-95aeb0cde3b8@citrix.com>
In-Reply-To: <71ca1c58-55a1-657e-a633-95aeb0cde3b8@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516152930.hnkg9852xRP7k2T6z5vjRQ9UEvYm5XArD12KgFI6yoM@z>

Pj4+IE9uIDE2LjA1LjE5IGF0IDE3OjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDUvMjAxOSAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE2
LjA1LjE5IGF0IDE3OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAyNi8wNC8yMDE5IDEzOjAyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+IE9uIDI2LzA0LzIw
MTkgMTI6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9uIDE4LzAzLzIwMTkgMTY6MTMs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gQWxsLAo+Pj4+Pj4KPj4+Pj4+IHRoZSByZWxlYXNl
IGlzIGR1ZSBieSB0aGUgZW5kIG9mIHRoZSBtb250aCwgYnV0IHdpbGwgbGlrZWx5IGRvbid0IG1h
a2UKPj4+Pj4+IGl0IGJlZm9yZSBlYXJseSBBcHJpbC4gUGxlYXNlIHBvaW50IG91dCBiYWNrcG9y
dHMgeW91IGZpbmQgbWlzc2luZyBmcm9tCj4+Pj4+PiB0aGUgcmVzcGVjdGl2ZSBzdGFnaW5nIGJy
YW5jaCwgYnV0IHdoaWNoIHlvdSBjb25zaWRlciByZWxldmFudC4gVGhlCj4+Pj4+PiBvbmUgY29t
bWl0IEkndmUgcXVldWVkIGFscmVhZHkgb24gdG9wIG9mIHdoYXQgd2FzIGp1c3QgcHVzaGVkIGlz
Cj4+Pj4+Pgo+Pj4+Pj4gMjJlMmY4ZGRkZgl4ODYvZTgyMDogZml4IGJ1aWxkIHdpdGggZ2NjOQo+
Pj4+PiBmZmI2MGE1OGRmNDg0MTljMWYyNjA3Y2QzY2M5MTlmYTJiZmM5YzJkICJ0b29scy9taXNj
L3hlbnBtOiBmaXggZ2V0dGluZwo+Pj4+PiBpbmZvIHdoZW4gc29tZSBDUFVzIGFyZSBvZmZsaW5l
IiBmb3IgNC4xMSBhbmQgZWFybGllci4KPj4+PiBPaCwgYW5kIDY3N2U2NGRiZTMxNTM0MzYyMGMz
YjI2NmU5ZWIxNjYyM2IxMTgwMzggInRvb2xzL29jYW1sOiBEdXAyCj4+Pj4gL2Rldi9udWxsIHRv
IHN0ZGluIGluIGRhZW1vbml6ZSgpIiBhZ2FpbiBmb3IgNC4xMiBhbmQgZWFybGllci4KPj4+IElu
IGFkZGl0aW9uLAo+Pj4KPj4+IDJlYzUzMzllYzkyMSAidG9vbHMvbGlieGw6IGNvcnJlY3QgdmNw
dSBhZmZpbml0eSBvdXRwdXQgd2l0aCBzcGFyc2UKPj4+IHBoeXNpY2FsIGNwdSBtYXAiCj4+PiAx
MjkwMjVmZTMwOTMgIm94ZW5zdG9yZWQ6IERvbid0IHJlLW9wZW4gYSB4ZW5jdHJsIGhhbmRsZSBm
b3IgZXZlcnkKPj4+IGRvbWFpbiBpbnRyb2R1Y3Rpb24iCj4+PiA3YjIwYTg2NWJjMTAgInRvb2xz
L29jYW1sOiBSZWxlYXNlIHRoZSBnbG9iYWwgbG9jayBiZWZvcmUgaW52b2tpbmcgYmxvY2sKPj4+
IHN5c2NhbGxzIgo+Pj4gYzM5M2I2NGRjZWU2ICJ0b29scy9saWJ4YzogRml4IGlzc3VlcyB3aXRo
IGxpYnhjIGFuZCBYZW4gaGF2aW5nCj4+PiBkaWZmZXJlbnQgZmVhdHVyZXNldCBsZW5ndGhzIgo+
Pj4gODI4NTVhYmE1YmY5ICJ0b29scy9saWJ4YzogRml4IGVycm9yIGhhbmRsaW5nIGluIGdldF9j
cHVpZF9kb21haW5faW5mbygpIgo+Pj4gNDhkYWI5NzY3ZDJlICJ0b29scy94bDogdXNlIGxpYnhs
X2RvbWFpbl9pbmZvIHRvIGdldCBkb21haW4gdHlwZSBmb3IKPj4+IHZjcHUtcGluIgo+Pj4KPj4+
IDM2NWFhYmI2ZTUwMiAidG9vbHMvbGlieGVuZGV2aWNlbW9kZWw6IGFkZAo+Pj4geGVuZGV2aWNl
bW9kZWxfbW9kaWZpZWRfbWVtb3J5X2J1bGsgdG8gbWFwIiBpcyBwb3NzaWJseSBhIGNhbmRpZGF0
ZSwgYnV0Cj4+PiBpcyBhbHNvIGNvbXBsaWNhdGVkIGJ5IHRoZSBzdGFibGUgU09OQU1FLiAgSXQg
aXMgcGVyaGFwcyBlYXNpZXN0IHRvCj4+PiBpZ25vcmUsIHNlZWluZyBhcyB0aGUgaXNzdWUgaGFz
IGFscmVhZHkgZ29uZSB1bm5vdGljZWQgZm9yIDIgeWVhcnMuCj4+IFVubGVzcyB0aGVzZSBhcmUg
cmVhbGx5IHVyZ2VudCB0byBwdXQgaW4sIEknZCBsaWtlIHRoZW0gdG8gYmUgZGVmZXJyZWQKPj4g
dG8gNC4xMS4zLiBXaXRoIFhTQS0yOTcgb3V0IHdlJ3ZlIGFscmVhZHkgc3RhcnRlZCB0aGUgKGxl
YWYgdHJlZSkKPj4gdGFnZ2luZyBwcm9jZXNzLCBzbyBJIHdhcyByZWFsbHkgaG9waW5nIHRvIGdl
dCB0aGlzIG11Y2ggZGVsYXllZAo+PiByZWxlYXNlIG91dCByYXRoZXIgc29vbmVyIHRoYW4gbGF0
ZXIuCj4gCj4gQXQgYSBtaW5pbXVtLCBmZmI2MGE1OGRmNCBhbmQgZmZiNjBhNThkZjQgbmVlZCBi
YWNrcG9ydGluZywgYmVjYXVzZSB0aGV5Cj4gYXJlIGJyZWFrYWdlIG9mIHRvb2xzIGNhdXNlZCBi
eSBvdXIgcmVjb21tZW5kYXRpb24gdG8gdHVybiBvZmYgU01UIGluCj4gcmVjZW50IFhTQXMuCj4g
Cj4gRXZlcnl0aGluZyBlbHNlIGNhbiBiZSBkZWZlcnJlZCBpZiBuZWNlc3NhcnkuCgpXZWxsLCBp
dCdzIG1vc3RseSBhbiBhbGwgb3Igbm90aGluZyB0aGluZzogSWYgYW5vdGhlciBvc3N0ZXN0IGZs
aWdodCBpcwpnb2luZyB0byBiZSBuZWVkZWQgYW55d2F5LCB0aGVuIHBlcmhhcHMgdGhlIGZ1bGwg
c2V0IGNvdWxkIHN0aWxsCmJlIHB1dCBpbi4gQnV0IHdlJ3JlIGFscmVhZHkgbGF0ZSBieSAxLjUg
bW9udGhzLi4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
