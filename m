Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD361C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:19:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4802077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="KmJ9ZOmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4802077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK0kt-0006w2-On; Fri, 26 Apr 2019 13:19:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hK0ks-0006vv-GX
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:19:06 +0000
X-Inumbo-ID: dd8d2cce-6825-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd8d2cce-6825-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 13:19:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556284745; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=MrgMAMiurTVzWlhuFTZ0NxPlaCDjev/0TRSF2F3ffNs=;
 b=KmJ9ZOmKzmv22MLS8tQsoOsMUHjFKwdp7O9GlqD3tWqiUpYRsgmI+ylhS5fwBmDhNSeI++fo
 7Ksbaeb1bayMocyP9OMbS57e8Uh5gB3+6d9M0NveBdpzByaTC+s8HW6kq/qr10Qs21M2H6Qg
 r+1trNI6lfHNKfRh5jObdSbtzms=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mxa.mailgun.org with ESMTP id 5cc30548.7f5cbee00030-smtp-out-n02;
 Fri, 26 Apr 2019 13:19:04 -0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r6so4446445wrm.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:19:04 -0700 (PDT)
X-Gm-Message-State: APjAAAW/BBEVWcfzDKloaqvlr36PLBShR0oEI3QqdyadjfDUp45DTFJ4
 lmQzt7l/pg7Pg9emZ90Pyns0t4ssklMPgUDa0MY=
X-Google-Smtp-Source: APXvYqzVSREuanBK5fDRmyn3LnRDJ0KB6r3/UxcdCdkedt/MXDTj4sbMkszuFuSh4MA9p1YXGHE8XL5Sv+QUIOcdBCc=
X-Received: by 2002:a5d:6988:: with SMTP id g8mr9149435wru.117.1556284743494; 
 Fri, 26 Apr 2019 06:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
 <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
 <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
 <5CC303B60200007800229748@prv1-mh.provo.novell.com>
In-Reply-To: <5CC303B60200007800229748@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Apr 2019 07:18:26 -0600
X-Gmail-Original-Message-ID: <CABfawhmr1pK6BODzxfJpOeRz8U8DCacprBUpLMny0fg6qBZZQg@mail.gmail.com>
Message-ID:
 <CABfawhmr1pK6BODzxfJpOeRz8U8DCacprBUpLMny0fg6qBZZQg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
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
Message-ID: <20190426131826.7pHDKHLDwwJp3td5_z_78ty0QP2A-2ORqhhLbv9x9RM@z>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgNzoxMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE0OjI0LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAzOjI0IEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiA+Pj4gT24gMjYuMDQu
MTkgYXQgMDI6MTIsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+PiA+IEkgd291bGQg
YmUgT0sgd2l0aCBwdXR0aW5nIHRoZSB3aG9sZSB0aGluZyBiZWhpbmQKPiA+PiA+IENPTkZJR19I
QVNfTUVNX1NIQVJJTkcgYW5kIGhhdmluZyB0aGF0IGJlIG9mZiBieSBkZWZhdWx0LiBJcyB0aGF0
IGEKPiA+PiA+IGZlYXNpYmxlIHJvdXRlIGZyb20geW91ciBQT1Y/Cj4gPj4KPiA+PiBTbyBpcyB0
aGVyZSBhbnl0aGluZyB3cm9uZyB3aXRoIG15IGVhcmxpZXIgc3VnZ2VzdGlvbiBvZgo+ID4+IHJl
LXB1cnBvc2luZyB0aGUgc2hhcmluZyBmaWVsZCB0byBhdHRhY2ggYSBzdHJ1Y3R1cmUgdG8gdGhl
IHBhZ2UKPiA+PiB3aGljaCBjb250YWlucyB0aGUgbmVjZXNzYXJ5IGxvY2s/IEkuZS4gaW4gdGhl
IHNpbXBsZXN0IGNhc2UgYnkKPiA+PiBhZGRpbmcgdGhlIGxvY2sgdG8gc3RydWN0IHBhZ2Vfc2hh
cmluZ19pbmZvIGl0c2VsZj8KPiA+Cj4gPiBZZXMsIHRoYXQgd29uJ3Qgd29yayB1bmZvcnR1bmF0
ZWx5LiBUaGUgbG9jayBpcyBzdXBwb3NlZCB0byBwcm90ZWN0Cj4gPiB1cGRhdGVzIG1hZGUgdG8g
dGhlIHN0cnVjdHVyZSBidXQgYWxzbyBmcmVlaW5nIGl0LiBJZiB0aGUgbG9jayBsaXZlcwo+ID4g
d2l0aGluIHRoZSBzdHJ1Y3R1cmUgaXQgb2J2aW91c2x5IHdvdWxkIGhhdmUgdG8gYmUgdW5sb2Nr
ZWQgYmVmb3JlIGl0cwo+ID4gZnJlZWQsIGJ1dCBpZiBpdHMgdW5sb2NrZWQgYmVmb3JlIGZyZWVk
IHRoZW4gYW5vdGhlciB0aHJlYWQgd2FpdGluZyBvbgo+ID4gaXQgY291bGQgY29udGludWUgd2l0
aG91dCByZWFsaXppbmcgaXQgaXMgYmVpbmcgZnJlZWQuCj4KPiBDYW4ndCB5b3UgUkNVLWZyZWUg
dGhlIHN0cnVjdHVyZSBpbnN0ZWFkLCBhZnRlciBkZXRhY2hpbmcgaXQgZnJvbQo+IHRoZSBtYWlu
IHN0cnVjdCBwYWdlX2luZm8gaW5zdGFuY2U/IE9mIGNvdXJzZSBhbGwgaW52b2x2ZWQgcGFydGll
cwo+IHRoZW4gbmVlZCB0byBiZSBhd2FyZSB0aGF0IG9uY2UgdGhleSd2ZSBhY3F1aXJlZCB0aGUg
bG9jaywgdGhlCj4gcG9pbnRlciBpbiBzdHJ1Y3QgcGFnZV9pbmZvIG1heSBoYXZlIGJlY29tZSBO
VUxMLCB3aGljaAo+IHByZXN1bWFibHkgd291bGQgZGlyZWN0IHRoZW0gdG8gZHJvcCB0aGUgbG9j
ayBhZ2FpbiByaWdodCBhd2F5LgoKSXQncyBhIGNoaWNrZW4tYW5kLXRoZS1lZ2cgcHJvYmxlbS4g
SXQgd291bGRuJ3QgYmUgc2FmZSB3aXRob3V0IGEgbG9jawp0byBkbyBhbnl0aGluZyB3aXRoIHRo
YXQgc3RydWN0dXJlLiBIYXZpbmcgYSBjYWxsZXIgYmUgYWJsZSB0byBncmFiCnRoZSBsb2NrIGJ1
dCBoYXZlIGFuIHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgc3RydWN0dXJlIC0gaW5jbHVkaW5nIHRo
ZQpsb2NrIGl0c2VsZiAtIG1heSBiZSBmcmVlZCBpcyBub3QgYSBmZWFzaWJsZSByb3V0ZS4gSWYg
aXQgd2FzIHBvc3NpYmxlCnRvIGRvIHRoYXQga2luZC1vZiBjb29yZGluYXRpb24gdGhlbiB3ZSB3
b3VsZG4ndCBuZWVkIGEgbG9jayBpbiB0aGUKZmlyc3QgcGxhY2UuCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
