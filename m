Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA98C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 23:19:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0BF2175B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 23:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6+Ibu0D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0BF2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJRA4-00053g-7f; Wed, 24 Apr 2019 23:18:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YTlI=S2=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hJRA2-00053W-Vj
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 23:18:43 +0000
X-Inumbo-ID: 4280ec26-66e7-11e9-92d7-bc764e045a96
Received: from mail-ua1-x944.google.com (unknown [2607:f8b0:4864:20::944])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4280ec26-66e7-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 23:18:26 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id a46so6655881uae.2;
 Wed, 24 Apr 2019 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:date:subject:cc:to
 :message-id; bh=oP4zn4uJA1x3Tc7j4kcCfiq+8EfvOyMPcPSED/vuu60=;
 b=m6+Ibu0DvRynIiOLZeS/+nIuyQ4O/sP95s3dBqlbBlh/Ot672pFobsV5MSAqtMTgVh
 kB8yxpSJIOBC29ssNoDNtT2bkTPCfEGKMZ8qEJSO0IS7Bt68ilKl16aLSpBKXw6gLrpy
 JPnCFRCvyW/7Nz3hinA9PnQf88HoT9dnsk6/Vg0OEpdDvboLHtgci2RRoT2JvIzFo05K
 BYrEgZDS/M5avYEBr4sgAqFGp4cvqKMpNsmEOI/5TX2hENHo/wUaULr3BYhp+0FGcU9Z
 aTqVYeyeGck408IoE4orTRF5M/BFQtbfck3qoRKtvtBVDLhsar4NDzATZAOSi2v/H6P+
 ULGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
 :subject:cc:to:message-id;
 bh=oP4zn4uJA1x3Tc7j4kcCfiq+8EfvOyMPcPSED/vuu60=;
 b=DLXJ8KZDvNzfNK7GEYyTnmKGWs5tshM2dx/V1pLAwGec+31ngTIUg1oa14jutoDD5/
 HgSfHwX1dYaQjZezHgL6oh/TseC7/l4aAkpgf32thdgYjmTiULu5CZMGf4zAl+FYmMn8
 Or2S6YXHuDL49vHFqGJfoRGdSBuepCOvJTICY91H39627K4pt2ro1dWoISIcgfujYZ/n
 z12raPyV3DppvuO+NmZJzS79HZyKtkuNQhLHMyDhS86oKqZAuljNZo70U2+R+z9olAI0
 5lsSMUy6N8drtpfb1H7yoo+hATr8jqWvT2sJ7GBmj5liv98qajY3LCPgWfVkft3uLDXP
 1ghA==
X-Gm-Message-State: APjAAAU+vexNbagrmudNOXbQ/v25WIQ66m67s5iTubVQHcY2peM/+Btt
 lQfu/pZgimomVvZjkT4IU8KhRAclGS8NRyzg
X-Google-Smtp-Source: APXvYqyKN0sJUfiS4E76gs5717c5cSypPyKn2wY9Jbllr8vsFx4/B+6jkFhBKiEk/6SHyuwhzZMdYQ==
X-Received: by 2002:ab0:7358:: with SMTP id k24mr3198003uap.104.1556147903797; 
 Wed, 24 Apr 2019 16:18:23 -0700 (PDT)
Received: from [192.168.0.101] (ip88-74-15-186.ct.co.cr. [186.15.74.88])
 by smtp.gmail.com with ESMTPSA id l125sm4971914vsd.31.2019.04.24.16.18.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Apr 2019 16:18:22 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Wed, 24 Apr 2019 17:18:18 -0600
To: xen-devel <xen-devel@lists.xenproject.org>,
 win-pv-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 Minios-devel <minios-devel@lists.xenproject.org>
Message-Id: <2ADAA9B2-F3F1-4EFA-89FF-EFED22ABF722@xenproject.org>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: [Xen-devel] Please submit Summit Design Sessions before May 6th
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
Cc: Committers <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKd2UgYXJlIHBsYW5uaW5nIHRvIGxhdW5jaCB0aGUgcHJvZ3JhbSBmb3IgdGhlIFhl
biBQcm9qZWN0IERldmVsb3BlciBTdW1taXQgdGhlIHdlZWsgb2YgTWF5IDZ0aC4gSW4gdGhlIGlu
dGVyZXN0IG9mIGF0dHJhY3RpbmcgbW9yZSBhdHRlbmRlZXMgaXQgaXMgaW1wb3J0YW50IHRoYXQg
d2UgaGF2ZSBhIGdvb2QgcHJvZ3JhbSB3aGVuIHdlIGxhdW5jaC4gVGhlIHRhbGsgc3VibWlzc2lv
bnMgaGF2ZSBiZWVuIGdvb2QgdGhpcyB5ZWFyLCBidXQgYXMgNTAlIG9mIG91ciBjb250ZW50IGFy
ZSBkZXNpZ24gc2Vzc2lvbnMgaXQgd291bGQgYmUgYW1hemluZyBpZiB3ZSBjb3VsZCBsYXVuY2gg
d2l0aCBhcyBtYW55IGRlc2lnbiBzZXNzaW9ucyBhcyBwb3NzaWJsZSBhcyBpdCB3aWxsIG1ha2Ug
aXQgZWFzaWVyIGZvciBzb21lIGF0dGVuZGVlcyB0byBnZXQgdHJhdmVsIGFwcHJvdmFsIHRvIGNv
bWUgdG8gdGhlIGV2ZW50LiAKClRodXMsIGlmIHlvdSBhbHJlYWR5IGhhdmUgYSBkZXNpZ24gc2Vz
c2lvbiBpbiBtaW5kLCBwbGVhc2Ugc3VibWl0IGl0IG5vdyBvciBhdCB0aGUgbGF0ZXN0IGJ5IE1h
eSA2dGgKCkJlc3QgUmVnYXJkcwpMYXJzClAuUy46IEkgQkNDJ2VkIHBlb3BsZSB3aG8gaGF2ZSBz
dWJtaXR0ZWQgdGFsa3MgdG8gdGhlIHN1bW1pdCAKCkhvdyB0byBjcmVhdGUgYSBkZXNpZ24gc2Vz
c2lvbgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KMTogR28gdG8gaHR0cHM6Ly9kZXNp
Z24tc2Vzc2lvbnMueGVucHJvamVjdC5vcmcvCjI6IENyZWF0ZSBhIHVzZXJuYW1lLCBidXQgdW5s
ZXNzIHlvdSB3YW50IHlvdXIgZS1tYWlsIGFkZHJlc3MgdG8gYmUgcHVibGljIGRvbid0IHVzZSB5
b3VyIGUtbWFpbCBhZGRyZXNzIGFzIHVzZXJuYW1lCjM6IFN1Ym1pdCBhIGRlc2lnbiBzZXNzaW9u
CgpJZiB5b3UgYXJlIHN1Ym1pdHRpbmcgYSBkZXNpZ24gc2Vzc2lvbiB5b3UgYXJlIGV4cGVjdGVk
IHRvIG1vZGVyYXRlIGFuZCBsZWFkIHRoZSBkaXNjdXNzaW9uLiBIb3dldmVyLCBpZiB5b3UgZmVl
bCB1bmNvbWZvcnRhYmxlIGRvaW5nIHNvLCBhIG1vcmUgZXhwZXJpZW5jZWQgbW9kZXJhdG9yIHN1
Y2ggYXMgSSBvciBhbnkgb2YgdGhlIG1haW50YWluZXJzIGNhbiBoZWxwIGFuZCBjby1tb2RlcmF0
ZS4gCgpOb3RlIHRoYXQgZGVzaWduIHNlc3Npb25zIGFyZSBOT1QgdGFsa3MsIGJ1dCBkaXNjdXNz
aW9ucyB3aXRoIHRhbmdpYmxlIG91dHB1dCAoZS5nLiBhIHNldCBvZiBub3RlcyBwdWJsaXNoZWQg
b24gYSBsaXN0LCBwaG90b3Mgb2Ygd2hpdGVib2FyZHMsIGV0YykuIEEgZmV3IHNsaWRlcyB0byBp
bnRyb2R1Y2UgYSB0b3BpYyBhcmUgcGVybWlzc2libGUuIEFzIG1vZGVyYXRvciwgeW91IGRvbid0
IGhhdmUgdG8gd3JpdGUgdGhlIG5vdGVzLCBidXQgY2FuIG5vbWluYXRlIHNvbWVvbmUgaW4gdGhl
IGdyb3VwIG9mIHBlb3BsZSBhdHRlbmRpbmcgdGhlIHNlc3Npb24gdG8gZG8gc28uIAoKV2hhdCBo
YXMgYmVlbiBzdWJtaXR0ZWQgc28gZmFyCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpT
ZWUgaHR0cHM6Ly9kZXNpZ24tc2Vzc2lvbnMueGVucHJvamVjdC5vcmcvbGlzdC9kaXNjdXNzaW9u
CiAKV2hhdCBhcmUgZGVzaWduIHNlc3Npb25zPwo9PT09PT09PT09PT09PT09PT09PT09PT09ClRo
ZSBhaW0gb2YgdGhlIERlc2lnbiBhbmQgUHJvYmxlbSBTb2x2aW5nIHNlc3Npb25zIGFyZSB0byBn
aXZlIGRldmVsb3BlcnMgdGhlIG9wcG9ydHVuaXR5IHRvIG1lZXQgZmFjZS10by1mYWNlIHRvOgoq
IENvb3JkaW5hdGUgYW5kIHBsYW4gdXBjb21pbmcgZmVhdHVyZXMKKiBEaXNjdXNzIGFuZCBhZ3Jl
ZSBvbiB0aGUgZGVzaWduIGFuZCBhcmNoaXRlY3R1cmUgb2YgZnV0dXJlIGZ1bmN0aW9uYWxpdHkK
KiBTb2x2ZSBzcGVjaWZpYyBwcm9ibGVtcyBpbiBleGlzdGluZyBhbmQgCiogRGlzY3VzcyBhbmQg
YWdyZWUgb24gYmVzdCBwcmFjdGljZXMgYW5kIGNoYW5nZXMgdG8gaG93IHRoZSBjb21tdW5pdHkg
d29ya3MKKiBJbnRlcmFjdGl2ZSBsZXNzb25zIGxlYXJuZWQgc2Vzc2lvbnMgY292ZXJpbmcgZXhw
ZXJpZW5jZXMgb2YgY29udHJpYnV0b3JzLCB1c2VycyBhbmQgdmVuZG9ycwoKRXhhbXBsZXMgb2Yg
cGFzdCBEZXNpZ24gU2Vzc2lvbnMKKiBDYWRlbmNlIG9mIFhlbiBQcm9qZWN0IGFuZCBtYWludGVu
YW5jZSByZWxlYXNlcwoqIERldmVsb3BpbmcgdGhlIGFyY2hpdGVjdHVyZSBhbmQgZGVzaWduIGZv
ciBYZW4gUHJvamVjdCBsaXZlIHBhdGNoaW5nCiogVXBkYXRpbmcgdGhlIFhlbiBQcm9qZWN0IHNl
Y3VyaXR5IHBvbGljeQoqIEV2b2x1dGlvbiBvZiB2aXJ0dWFsIG1hY2hpbmUgaW50cm9zcGVjdGlv
biAoaW5jbHVkaW5nIEhXIGFzc2lzdGFuY2UpIGluIHRoZSBYZW4gSHlwZXJ2aXNvcgoqIEhvdyB0
byBkZS1wcml2aWxlZ2luZyBRRU1VIGFuZCB0aGUgeDg2IGVtdWxhdG9yIHRvIHJlZHVjZSB0aGUg
aW1wYWN0IG9mIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdGllcyBpbiB0aG9zZSBjb21wb25lbnRzLAoq
IEltcGxlbWVudGluZyBLQ29uZmlnIHN1cHBvcnQgd2hpY2ggYWxsb3dzIHRvIHJlbW92ZSBwYXJ0
cyBvZiBYZW4gYXQgY29tcGlsZSB0aW1lIGFuZCBydW4tdGltZSBkaXNhYmxlbWVudCBvZiBYZW4g
ZmVhdHVyZXMgdG8gcmVkdWNlIFhlbuKAmXMgdHJ1c3RlZCBjb21wdXRpbmcgYmFzZQoqIFBsYW5u
aW5nIHRoZSBuZXh0IHN0YWdlIG9mIFBWSCAod2hpY2ggbGVkIHRvIGEgcmUtdGhpbmsgYW5kIFBW
SCB2MikKKiBQbGFubmluZyBzZXNzaW9ucyBmb3IgWGVuIEhhcmR3YXJlIHN1cHBvcnQsIGluY2x1
ZGluZyBob3cgdG8gaW1wbGVtZW50IFBDSSBwYXNzdGhyb3VnaCBvbiBBUk0sIGhvdyB3ZSBjYW4g
aW1wcm92ZSB0ZXN0aW5nIGZvciB0aGUgaW5jcmVhc2luZyByYW5nZSBvZiBBUk0gSFcgd2l0aCBz
dXBwb3J0IGZvciB2aXJ0dWFsaXphdGlvbiwgYW5kIGhvdyB0byBpbXBsZW1lbnQgYWx0MnBtIG9u
IEludGVsIGFyY2hpdGVjdHVyZXMKKiBSZWxlYXNlIHBsYW5uaW5nCiogUmVzdGFydGFibGUgRG9t
MCBhbmQgZHJpdmVyIGRvbWFpbnMKKiBUZXN0aW5nIGFuZCB0ZXN0aW5nIGZyYW1ld29ya3MKClRo
ZXJlIGlzIG5vIENmUCBmb3IgZGVzaWduIHNlc3Npb25zOiBzZXNzaW9ucyBjYW4gc3RpbGwgYmUg
c3VibWl0dGVkIGR1cmluZyB0aGUgY29uZmVyZW5jZS4gVGhlcmUgaXMgYWxzbyBubyBwcmUtZGV0
ZXJtaW5lZCBzY2hlZHVsZTogYXR0ZW5kZWVzIHdpbGwgZHVyaW5nIHRoZSBldmVudCB2b3RlIG9u
IHdoaWNoIHNlc3Npb25zIHRvIGF0dGVuZCBhbmQgb3VyIGRlc2lnbiBzZXNzaW9uIHNjaGVkdWxp
bmcgdG9vbCB3aWxsIGRvIGF1dG9tYXRpYyBzY2hlZHVsaW5nIHRyeWluZyB0byBtaW5pbWlzZSBj
b25mbGljdHMgYmV0d2VlbiBhdHRlbmRlZXMuIAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
