Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B35C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:10:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F3520675
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="Okwf17Qb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F3520675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK2UF-0007lI-Gr; Fri, 26 Apr 2019 15:10:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hK2UE-0007cE-6l
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:10:02 +0000
X-Inumbo-ID: 5c63b8cc-6835-11e9-807e-17892fbc2138
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c63b8cc-6835-11e9-807e-17892fbc2138;
 Fri, 26 Apr 2019 15:10:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556291400; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=HXwKwdwqi6uyxG6Uv2L+wHHywk/qsSjh+y6uLbvf3J4=;
 b=Okwf17Qb5EB+YPUsYbMO2YoBoKCXgBsuV8zYANVCF1zz0v/1UQ8CYLtQRaVtusW31Tvt2j1F
 c7Mjz78oAUMB5of7X95zaJreZ5nf3gZCbBpwSZnO1u+rCLRS6cS0oWnV52thLgSrcHVgjvxc
 D9l1MGJ/N9B0HIHvVmR2gpCVfjI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5cc31f47.7f6b6a76f7b0-smtp-out-n02;
 Fri, 26 Apr 2019 15:09:59 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id h11so4861756wmb.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 08:09:58 -0700 (PDT)
X-Gm-Message-State: APjAAAWTAXLkUQdawJYNSlaP+weF2NUKfyUrZ1pl0HP8gkq7ZUeNb3qM
 X5yG17dLvs8m/UQ3x6phjKywsOG9IPber7+h26Q=
X-Google-Smtp-Source: APXvYqyEQ3SABN8owt5uODqxmlqwafHJIgb+rIb85kkGlZ/GnXbgcawV/TqK61PP74gwMtAdU6q557R7q+n03uWTZRM=
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr7911382wmc.54.1556291397579; 
 Fri, 26 Apr 2019 08:09:57 -0700 (PDT)
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
 <CABfawhmr1pK6BODzxfJpOeRz8U8DCacprBUpLMny0fg6qBZZQg@mail.gmail.com>
 <5CC31A1302000078002297E3@prv1-mh.provo.novell.com>
In-Reply-To: <5CC31A1302000078002297E3@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Apr 2019 09:09:20 -0600
X-Gmail-Original-Message-ID: <CABfawhmP6mgJLTC1OLdqtiCCxmJOpY-2Ok+m89hZa-PA-t2+Dw@mail.gmail.com>
Message-ID:
 <CABfawhmP6mgJLTC1OLdqtiCCxmJOpY-2Ok+m89hZa-PA-t2+Dw@mail.gmail.com>
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
Message-ID: <20190426150920.KpCQ5_mCTTxrvrvV0Snauj42Goghft9tnD8cMV66p5w@z>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgODo0NyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE1OjE4LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCA3OjEyIEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiA+Pj4gT24gMjYuMDQu
MTkgYXQgMTQ6MjQsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+PiA+IE9uIEZyaSwg
QXByIDI2LCAyMDE5IGF0IDM6MjQgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPiA+PiA+Pgo+ID4+ID4+ID4+PiBPbiAyNi4wNC4xOSBhdCAwMjoxMiwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gSSB3b3VsZCBiZSBPSyB3aXRoIHB1dHRpbmcg
dGhlIHdob2xlIHRoaW5nIGJlaGluZAo+ID4+ID4+ID4gQ09ORklHX0hBU19NRU1fU0hBUklORyBh
bmQgaGF2aW5nIHRoYXQgYmUgb2ZmIGJ5IGRlZmF1bHQuIElzIHRoYXQgYQo+ID4+ID4+ID4gZmVh
c2libGUgcm91dGUgZnJvbSB5b3VyIFBPVj8KPiA+PiA+Pgo+ID4+ID4+IFNvIGlzIHRoZXJlIGFu
eXRoaW5nIHdyb25nIHdpdGggbXkgZWFybGllciBzdWdnZXN0aW9uIG9mCj4gPj4gPj4gcmUtcHVy
cG9zaW5nIHRoZSBzaGFyaW5nIGZpZWxkIHRvIGF0dGFjaCBhIHN0cnVjdHVyZSB0byB0aGUgcGFn
ZQo+ID4+ID4+IHdoaWNoIGNvbnRhaW5zIHRoZSBuZWNlc3NhcnkgbG9jaz8gSS5lLiBpbiB0aGUg
c2ltcGxlc3QgY2FzZSBieQo+ID4+ID4+IGFkZGluZyB0aGUgbG9jayB0byBzdHJ1Y3QgcGFnZV9z
aGFyaW5nX2luZm8gaXRzZWxmPwo+ID4+ID4KPiA+PiA+IFllcywgdGhhdCB3b24ndCB3b3JrIHVu
Zm9ydHVuYXRlbHkuIFRoZSBsb2NrIGlzIHN1cHBvc2VkIHRvIHByb3RlY3QKPiA+PiA+IHVwZGF0
ZXMgbWFkZSB0byB0aGUgc3RydWN0dXJlIGJ1dCBhbHNvIGZyZWVpbmcgaXQuIElmIHRoZSBsb2Nr
IGxpdmVzCj4gPj4gPiB3aXRoaW4gdGhlIHN0cnVjdHVyZSBpdCBvYnZpb3VzbHkgd291bGQgaGF2
ZSB0byBiZSB1bmxvY2tlZCBiZWZvcmUgaXRzCj4gPj4gPiBmcmVlZCwgYnV0IGlmIGl0cyB1bmxv
Y2tlZCBiZWZvcmUgZnJlZWQgdGhlbiBhbm90aGVyIHRocmVhZCB3YWl0aW5nIG9uCj4gPj4gPiBp
dCBjb3VsZCBjb250aW51ZSB3aXRob3V0IHJlYWxpemluZyBpdCBpcyBiZWluZyBmcmVlZC4KPiA+
Pgo+ID4+IENhbid0IHlvdSBSQ1UtZnJlZSB0aGUgc3RydWN0dXJlIGluc3RlYWQsIGFmdGVyIGRl
dGFjaGluZyBpdCBmcm9tCj4gPj4gdGhlIG1haW4gc3RydWN0IHBhZ2VfaW5mbyBpbnN0YW5jZT8g
T2YgY291cnNlIGFsbCBpbnZvbHZlZCBwYXJ0aWVzCj4gPj4gdGhlbiBuZWVkIHRvIGJlIGF3YXJl
IHRoYXQgb25jZSB0aGV5J3ZlIGFjcXVpcmVkIHRoZSBsb2NrLCB0aGUKPiA+PiBwb2ludGVyIGlu
IHN0cnVjdCBwYWdlX2luZm8gbWF5IGhhdmUgYmVjb21lIE5VTEwsIHdoaWNoCj4gPj4gcHJlc3Vt
YWJseSB3b3VsZCBkaXJlY3QgdGhlbSB0byBkcm9wIHRoZSBsb2NrIGFnYWluIHJpZ2h0IGF3YXku
Cj4gPgo+ID4gSXQncyBhIGNoaWNrZW4tYW5kLXRoZS1lZ2cgcHJvYmxlbS4gSXQgd291bGRuJ3Qg
YmUgc2FmZSB3aXRob3V0IGEgbG9jawo+ID4gdG8gZG8gYW55dGhpbmcgd2l0aCB0aGF0IHN0cnVj
dHVyZS4gSGF2aW5nIGEgY2FsbGVyIGJlIGFibGUgdG8gZ3JhYgo+ID4gdGhlIGxvY2sgYnV0IGhh
dmUgYW4gdW5kZXJzdGFuZGluZyB0aGF0IHRoZSBzdHJ1Y3R1cmUgLSBpbmNsdWRpbmcgdGhlCj4g
PiBsb2NrIGl0c2VsZiAtIG1heSBiZSBmcmVlZCBpcyBub3QgYSBmZWFzaWJsZSByb3V0ZS4KPgo+
IEJ1dCBieSB1c2luZyBSQ1UgdGhlIHN0cnVjdHVyZSBjYW4ndCBiZSBmcmVlZCBiZWhpbmQgdGhl
IGJhY2sgb2YKPiBhbnlvbmUgaG9sZGluZyBhIGxvY2suIFBhcnRpZXMgb2JzZXJ2aW5nIHRoZSBw
b2ludGVyIHRvIGJlY29tZQo+IE5VTEwgY291bGQgc3RpbGwgKHVzaW5nIGEgbG9jYWwgY29weSBv
ZiB0aGUgcG9pbnRlcikgYWNjZXNzIHRoZQo+IHN0cnVjdHVyZSAoYW5kIGhlbmNlIHRoZSBsb2Nr
KS4KPgo+ID4gSWYgaXQgd2FzIHBvc3NpYmxlCj4gPiB0byBkbyB0aGF0IGtpbmQtb2YgY29vcmRp
bmF0aW9uIHRoZW4gd2Ugd291bGRuJ3QgbmVlZCBhIGxvY2sgaW4gdGhlCj4gPiBmaXJzdCBwbGFj
ZS4KPgo+IEknbSBub3QgY29udmluY2VkIG9mIHRoaXMsIGJ1dCBJJ20gYWxzbyBub3QgYW4gUkNV
IHNwZWNpYWxpc3QsIHNvCj4gdGhlcmUgbWF5IHdlbGwgYmUgd2F5cyBvZiBnZXR0aW5nIHRoaW5n
cyB0byB3b3JrIHRoYXQgd2F5IHdpdGhvdXQKPiBhbnkgbG9jay4KClBlcmhhcHMsIGJ1dCB0aGF0
J3MgYWxzbyB3YXkgYmV5b25kIHdoYXQgSSBoYXZlIGJhbmR3aWR0aCBhdCB0aGlzIHRpbWUKdG8g
aW52ZXN0aWdhdGUuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
