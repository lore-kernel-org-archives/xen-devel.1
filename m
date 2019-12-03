Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA6AC432C0
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 20:28:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46EA20659
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 20:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="A9MhN+4l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46EA20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icEmS-0005T7-Oy; Tue, 03 Dec 2019 20:28:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icEmQ-0005Sa-Pw
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 20:28:18 +0000
X-Inumbo-ID: 6fc1e072-160b-11ea-9db0-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fc1e072-160b-11ea-9db0-bc764e2007e4;
 Tue, 03 Dec 2019 20:28:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575404898; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=m7AIW5xbzFfYHTNNUD7dgBbJ1S+j7j4S1e5jwBCnZxk=;
 b=A9MhN+4loOBCXBygNtj0GRmvVOs3ofJ5gy3Jzv+NEzY2199p+peFUjks5JQzi2v1oDIiRZrW
 dXDep5iy5u3dFxdssqKO5X+wE8fggRHtMuVy1TjyZTQ3UCbgHagyNfSYFcp0NTqWkyw+kSd6
 gffYT2im19CfCg6+Ru0YKRHewts=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5de6a694.7f3247610cf0-smtp-out-n02;
 Tue, 03 Dec 2019 18:16:52 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g17so4970505wro.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:16:52 -0800 (PST)
X-Gm-Message-State: APjAAAXxpQTALF990vfyPtuQBZJs33znpHPgNIFgvds9F2QHbcE7mjf1
 2eXvIOQmizWCPOIQzFCoWWFrbjiOcKsV1yfzf0I=
X-Google-Smtp-Source: APXvYqzBC+ZNBfMtNyseVpA0kLv6CbkHM2MSZFERIlYW76CIU5TUB9hJXdv2KXeS+xV/jG9ArZSbirOgN80rZSs4N2I=
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr6625973wrn.140.1575397011745; 
 Tue, 03 Dec 2019 10:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <b9a246ee-6d0d-c38b-6669-53c91d61cce1@citrix.com>
In-Reply-To: <b9a246ee-6d0d-c38b-6669-53c91d61cce1@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:16:15 -0500
X-Gmail-Original-Message-ID: <CABfawhm_Ba5Bh25=VSvoOLOxOGyiCKUBNkHouPq8uEDoFCZePQ@mail.gmail.com>
Message-ID: <CABfawhm_Ba5Bh25=VSvoOLOxOGyiCKUBNkHouPq8uEDoFCZePQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjA5IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTIvMjAxOSAxODowNSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZl
bnQuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gPj4gaW5kZXggOTU5MDgzZDhj
NC4uNzY2NzZmZjRjMCAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZl
bnQuaAo+ID4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gPj4gQEAgLTI4
MSw2ICsyODEsNyBAQCBzdHJ1Y3Qgdm1fZXZlbnRfZGVidWcgewo+ID4+ICAgICAgdWludDMyX3Qg
aW5zbl9sZW5ndGg7Cj4gPj4gICAgICB1aW50OF90IHR5cGU7ICAgICAgICAvKiBIVk1PUF9UUkFQ
XyogKi8KPiA+PiAgICAgIHVpbnQ4X3QgX3BhZFszXTsKPiA+PiArICAgIHVpbnQ2NF90IHBlbmRp
bmdfZGJnOwo+ID4gVGhpcyBpcyBqdXN0IGEgbml0cGljayBidXQgSSB3b3VsZCBwcmVmZXIgaWYg
d2UgaGFkIHRoZSBfcGFkIGZpZWxkIGFzCj4gPiB0aGUgbGFzdCBlbGVtZW50IGluIHRoZSBzdHJ1
Y3QgYW5kIGtlZXAgYWxsIDY0LWJpdCBtZW1iZXJzIHVwIGluIHRoZQo+ID4gZnJvbnQuCj4KPiBX
ZWxsIHRoZSByZWFzb24gSSBkaWQgaXQgbGlrZSB0aGlzIGlzIHRoYXQgdGhpcyB2ZXJzaW9uIHdp
bGwgY29udGludWUgdG8KPiBmdW5jdGlvbiB3aXRoIG9sZGVyIGludHJvc3BlY3Rpb24gY29kZS4g
IFRoZSBleHRyYSBmaWVsZCBpcyB3aXRoaW4gYQo+IHVuaW9uIGFuZCBubyBvdGhlciBkYXRhIG1v
dmVzLgo+Cj4gQnkgcmVwb3NpdGlvbmluZyB0byB0aGUgc3RhcnQsIGl0IHdpbGwgYWxtb3N0IGNl
cnRhaW5seSBicmVhayBvbGRlcgo+IGludHJvc3BlY3Rpb24gY29kZSBldmVuIHRob3VnaCBpdCBj
b21waWxlZCBjb3JyZWN0bHkuCj4KPiBZb3VyIGNob2ljZS4KCldlIGFyZSBhbHJlYWR5IGJ1bXBp
bmcgdGhlIGludGVyZmFjZSB2ZXJzaW9uIGZvciB0aGUgbmV4dCByZWxlYXNlIHNvCm9sZCBpbnRy
b3NwZWN0aW9uIGNvZGUgYnkgZGVzaWduIHdpbGwgc3RvcCB3b3JraW5nLiBXZSBtYWtlIG5vIEFC
SQpzdGFiaWxpdHkgZ3VhcmFudGVlcyBiZXR3ZWVuIGludGVyZmFjZSB2ZXJzaW9ucyBzbyB0aGlz
IGlzIGEKbm9uLWlzc3VlLgoKPgo+IH5BbmRyZXcKPgo+IFAuUy4gV2hhdCBpcyB0aGUgcG9pbnQg
b2YgdGFpbC1wYWRkaW5nIGEgc3RydWN0IGluc2lkZSBhIHVuaW9uPwoKVG8gYWx3YXlzIG1ha2Ug
c3VyZSBhbGwgc3RydWN0dXJlcyB1c2VkIGJ5IHRoZSBpbnRlcmZhY2UgYXJlIDY0LWJpdAphbGln
bmVkIHdpdGhvdXQgaGF2aW5nIHRvIGtlZXAgaW4gbWluZCB3aGljaCBvbmUgaXMgdXNlZCBpbiBh
IHVuaW9uCmFuZCB3aGljaCBvbmUgaXNuJ3Qgb3IgaGF2aW5nIHRvIHJlbWVtYmVyIHRoZWlyIHJl
bGF0aXZlIHBvc2l0aW9uIGluCnRoZSBvdmVyYWxsIHN0cnVjdHVyZS4gU28gaXQganVzdCByZWR1
Y2VzIHRoZSBjb2duaXRpdmUgbG9hZC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
