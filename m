Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C39C432C0
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 19:24:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C109920640
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 19:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="wJrZ+mV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C109920640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icDm1-0000TA-Uy; Tue, 03 Dec 2019 19:23:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icDlz-0000T5-Tj
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 19:23:47 +0000
X-Inumbo-ID: 6dae54cc-1602-11ea-83b8-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dae54cc-1602-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 19:23:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575401027; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=C/b4pYmfmMUEwL5kQ3a6MAE/4rXKk3RhIyr0rGvAg/c=;
 b=wJrZ+mV1GWk5/UOpL7FKwkFwyaMKzWsH6jGMnEGsQ/0sG5H/q5cS1rPgaoUdDozLriqcEBPi
 Qs6/8grgWPa4MCT1tqqktZZB5IIZrmjGLKRnzp48EmNuI69vhFZO38Upsz86nBdOYhs/7nN6
 tup5eSNEkOGGbDntl/8mzOhBa8U=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mxa.mailgun.org with ESMTP id 5de6a80a.7f267c0eb9b0-smtp-out-n03;
 Tue, 03 Dec 2019 18:23:06 -0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id u8so4717846wmu.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:23:06 -0800 (PST)
X-Gm-Message-State: APjAAAVIgzL9gumejC/lkR5THuOM9xxLkS7GjV/3haNtT6tciKiTeHnk
 XVFKR35gVRoOgfNCq0vNfJpxTWc2W57kPnuuMf8=
X-Google-Smtp-Source: APXvYqxhyxu7e1mGK+AbKNZOpj9Th8wQ2qoYZ9bS9ocLjKsRuv7adtvr8hQt1fB7Z+s+epgqG02spI7sTtCXv2/SXXc=
X-Received: by 2002:a05:600c:506:: with SMTP id
 i6mr36956443wmc.153.1575397385076; 
 Tue, 03 Dec 2019 10:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
 <10135f1d-2247-f6de-a46b-24eba40e44a7@citrix.com>
In-Reply-To: <10135f1d-2247-f6de-a46b-24eba40e44a7@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:22:28 -0500
X-Gmail-Original-Message-ID: <CABfawh=dkaCTw7Z8=P4M0DDL-KdsjBme3Sj536_-Q5bECY=DQw@mail.gmail.com>
Message-ID: <CABfawh=dkaCTw7Z8=P4M0DDL-KdsjBme3Sj536_-Q5bECY=DQw@mail.gmail.com>
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

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjE4IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTIvMjAxOSAxODowOSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjA1IFBNIFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVu
dC5oCj4gPj4+IGluZGV4IDk1OTA4M2Q4YzQuLjc2Njc2ZmY0YzAgMTAwNjQ0Cj4gPj4+IC0tLSBh
L3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy92bV9ldmVudC5oCj4gPj4+IEBAIC0yODEsNiArMjgxLDcgQEAgc3RydWN0IHZtX2V2ZW50
X2RlYnVnIHsKPiA+Pj4gICAgICB1aW50MzJfdCBpbnNuX2xlbmd0aDsKPiA+Pj4gICAgICB1aW50
OF90IHR5cGU7ICAgICAgICAvKiBIVk1PUF9UUkFQXyogKi8KPiA+Pj4gICAgICB1aW50OF90IF9w
YWRbM107Cj4gPj4+ICsgICAgdWludDY0X3QgcGVuZGluZ19kYmc7Cj4gPj4gVGhpcyBpcyBqdXN0
IGEgbml0cGljayBidXQgSSB3b3VsZCBwcmVmZXIgaWYgd2UgaGFkIHRoZSBfcGFkIGZpZWxkIGFz
Cj4gPj4gdGhlIGxhc3QgZWxlbWVudCBpbiB0aGUgc3RydWN0IGFuZCBrZWVwIGFsbCA2NC1iaXQg
bWVtYmVycyB1cCBpbiB0aGUKPiA+PiBmcm9udC4KPiA+IEFsc28sIHNpbmNlIHBlbmRpbmdfZGJn
IHVzZXMgdW5zaWduZWQgaW50IGluIFhlbiwgZG8gd2UgbmVlZCB1aW50NjRfdAo+ID4gZm9yIGl0
IGhlcmU/IFNlZW1zIHRvIG1lIGEgdWludDMyX3Qgd291bGQgc3VmZmljZS4KPgo+IEl0cyAlZHI2
IChidXQgbm90IHF1aXRlLCBkdWUgdG8gY29tcGxleGl0eSB3aXRoIGV4Y2VwdGlvbiBwcmlvcml0
aWVzLAo+IGludGVycnVwdCBzaGFkb3dzLCBhbmQgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgb2Yg
dGhlIFJUTSBiaXQgd2l0aAo+IGludmVydGVkIHBvbGFyaXR5KS4gIEFsbCBvdGhlciByZWdpc3Rl
cnMgaGF2ZSA2NCBiaXQgZmllbGRzIGluIHRoZQo+IGludGVyZmFjZS4KPgo+IFRoZSBvbmx5IGlu
dGVyZXN0aW5nIGJpdHMgaW4gaXQgZmFsbCB3aXRoaW4gdGhlIGZpcnN0IDMyIHdoaWNoIGlzIHdo
eSBpdAo+IGlzIGhhbmRsZWQgaW4gYSBzaG9ydGVyIHdheSB3aXRoaW4gWGVuLiAgTGlrZSAlY3Iw
LCBJIGRvbid0IGV4cGVjdAo+IGFueXRoaW5nIGludGVyZXN0aW5nIHRvIGFwcGVhciBpbiB0aGUg
dXBwZXIgMzIgYml0cy4KPgoKUGVyaGFwcyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gY2FsbCBpdCBk
cjYgaW4gdGhlIGludGVyZmFjZSB0aGVuIHRvCm1ha2UgaXQgbW9yZSBjbGVhciB0aGF0IHRoaXMg
aXMgYSByZWdpc3RlciB2YWx1ZT8KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
