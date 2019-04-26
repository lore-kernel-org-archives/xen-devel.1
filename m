Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618F9C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:48:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DB92077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DB92077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK28r-0005wP-CG; Fri, 26 Apr 2019 14:47:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hK28q-0005wK-9j
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:47:56 +0000
X-Inumbo-ID: 4570b352-6832-11e9-9859-17c5d24d140f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4570b352-6832-11e9-9859-17c5d24d140f;
 Fri, 26 Apr 2019 14:47:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 08:47:52 -0600
Message-Id: <5CC31A1302000078002297E3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 08:47:47 -0600
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
 <5CC303B60200007800229748@prv1-mh.provo.novell.com>
 <CABfawhmr1pK6BODzxfJpOeRz8U8DCacprBUpLMny0fg6qBZZQg@mail.gmail.com>
In-Reply-To: <CABfawhmr1pK6BODzxfJpOeRz8U8DCacprBUpLMny0fg6qBZZQg@mail.gmail.com>
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
Message-ID: <20190426144747.i6hxGzVJ7HZx7smc0FCJnBLbSl8KL8dCKlF2qyR4nc0@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDE1OjE4LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNzoxMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMjYuMDQuMTkgYXQgMTQ6MjQsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPj4gPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAzOjI0IEFNIEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+ID4+Cj4+ID4+ID4+PiBPbiAy
Ni4wNC4xOSBhdCAwMjoxMiwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiA+PiA+IEkg
d291bGQgYmUgT0sgd2l0aCBwdXR0aW5nIHRoZSB3aG9sZSB0aGluZyBiZWhpbmQKPj4gPj4gPiBD
T05GSUdfSEFTX01FTV9TSEFSSU5HIGFuZCBoYXZpbmcgdGhhdCBiZSBvZmYgYnkgZGVmYXVsdC4g
SXMgdGhhdCBhCj4+ID4+ID4gZmVhc2libGUgcm91dGUgZnJvbSB5b3VyIFBPVj8KPj4gPj4KPj4g
Pj4gU28gaXMgdGhlcmUgYW55dGhpbmcgd3Jvbmcgd2l0aCBteSBlYXJsaWVyIHN1Z2dlc3Rpb24g
b2YKPj4gPj4gcmUtcHVycG9zaW5nIHRoZSBzaGFyaW5nIGZpZWxkIHRvIGF0dGFjaCBhIHN0cnVj
dHVyZSB0byB0aGUgcGFnZQo+PiA+PiB3aGljaCBjb250YWlucyB0aGUgbmVjZXNzYXJ5IGxvY2s/
IEkuZS4gaW4gdGhlIHNpbXBsZXN0IGNhc2UgYnkKPj4gPj4gYWRkaW5nIHRoZSBsb2NrIHRvIHN0
cnVjdCBwYWdlX3NoYXJpbmdfaW5mbyBpdHNlbGY/Cj4+ID4KPj4gPiBZZXMsIHRoYXQgd29uJ3Qg
d29yayB1bmZvcnR1bmF0ZWx5LiBUaGUgbG9jayBpcyBzdXBwb3NlZCB0byBwcm90ZWN0Cj4+ID4g
dXBkYXRlcyBtYWRlIHRvIHRoZSBzdHJ1Y3R1cmUgYnV0IGFsc28gZnJlZWluZyBpdC4gSWYgdGhl
IGxvY2sgbGl2ZXMKPj4gPiB3aXRoaW4gdGhlIHN0cnVjdHVyZSBpdCBvYnZpb3VzbHkgd291bGQg
aGF2ZSB0byBiZSB1bmxvY2tlZCBiZWZvcmUgaXRzCj4+ID4gZnJlZWQsIGJ1dCBpZiBpdHMgdW5s
b2NrZWQgYmVmb3JlIGZyZWVkIHRoZW4gYW5vdGhlciB0aHJlYWQgd2FpdGluZyBvbgo+PiA+IGl0
IGNvdWxkIGNvbnRpbnVlIHdpdGhvdXQgcmVhbGl6aW5nIGl0IGlzIGJlaW5nIGZyZWVkLgo+Pgo+
PiBDYW4ndCB5b3UgUkNVLWZyZWUgdGhlIHN0cnVjdHVyZSBpbnN0ZWFkLCBhZnRlciBkZXRhY2hp
bmcgaXQgZnJvbQo+PiB0aGUgbWFpbiBzdHJ1Y3QgcGFnZV9pbmZvIGluc3RhbmNlPyBPZiBjb3Vy
c2UgYWxsIGludm9sdmVkIHBhcnRpZXMKPj4gdGhlbiBuZWVkIHRvIGJlIGF3YXJlIHRoYXQgb25j
ZSB0aGV5J3ZlIGFjcXVpcmVkIHRoZSBsb2NrLCB0aGUKPj4gcG9pbnRlciBpbiBzdHJ1Y3QgcGFn
ZV9pbmZvIG1heSBoYXZlIGJlY29tZSBOVUxMLCB3aGljaAo+PiBwcmVzdW1hYmx5IHdvdWxkIGRp
cmVjdCB0aGVtIHRvIGRyb3AgdGhlIGxvY2sgYWdhaW4gcmlnaHQgYXdheS4KPiAKPiBJdCdzIGEg
Y2hpY2tlbi1hbmQtdGhlLWVnZyBwcm9ibGVtLiBJdCB3b3VsZG4ndCBiZSBzYWZlIHdpdGhvdXQg
YSBsb2NrCj4gdG8gZG8gYW55dGhpbmcgd2l0aCB0aGF0IHN0cnVjdHVyZS4gSGF2aW5nIGEgY2Fs
bGVyIGJlIGFibGUgdG8gZ3JhYgo+IHRoZSBsb2NrIGJ1dCBoYXZlIGFuIHVuZGVyc3RhbmRpbmcg
dGhhdCB0aGUgc3RydWN0dXJlIC0gaW5jbHVkaW5nIHRoZQo+IGxvY2sgaXRzZWxmIC0gbWF5IGJl
IGZyZWVkIGlzIG5vdCBhIGZlYXNpYmxlIHJvdXRlLgoKQnV0IGJ5IHVzaW5nIFJDVSB0aGUgc3Ry
dWN0dXJlIGNhbid0IGJlIGZyZWVkIGJlaGluZCB0aGUgYmFjayBvZgphbnlvbmUgaG9sZGluZyBh
IGxvY2suIFBhcnRpZXMgb2JzZXJ2aW5nIHRoZSBwb2ludGVyIHRvIGJlY29tZQpOVUxMIGNvdWxk
IHN0aWxsICh1c2luZyBhIGxvY2FsIGNvcHkgb2YgdGhlIHBvaW50ZXIpIGFjY2VzcyB0aGUKc3Ry
dWN0dXJlIChhbmQgaGVuY2UgdGhlIGxvY2spLgoKPiBJZiBpdCB3YXMgcG9zc2libGUKPiB0byBk
byB0aGF0IGtpbmQtb2YgY29vcmRpbmF0aW9uIHRoZW4gd2Ugd291bGRuJ3QgbmVlZCBhIGxvY2sg
aW4gdGhlCj4gZmlyc3QgcGxhY2UuCgpJJ20gbm90IGNvbnZpbmNlZCBvZiB0aGlzLCBidXQgSSdt
IGFsc28gbm90IGFuIFJDVSBzcGVjaWFsaXN0LCBzbwp0aGVyZSBtYXkgd2VsbCBiZSB3YXlzIG9m
IGdldHRpbmcgdGhpbmdzIHRvIHdvcmsgdGhhdCB3YXkgd2l0aG91dAphbnkgbG9jay4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
