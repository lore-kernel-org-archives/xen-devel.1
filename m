Return-Path: <SRS0=9zAz=VP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAACC76191
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jul 2019 09:30:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BEAA20665
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jul 2019 09:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BEAA20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2jW-0006AL-UO; Thu, 18 Jul 2019 09:29:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04i1=VP=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ho2jV-0006AG-CK
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:29:49 +0000
X-Inumbo-ID: 95c4de30-a93e-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95c4de30-a93e-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 09:29:48 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EGkC2BfnyT8Lw3zuexzw4kQ/d0NjYK/nJf4o2jyY2025LhTgOLD6Etx4krK67TUWHY5DK7TyjR
 x/XiTx4qosLDNCYS+V/qippfnKj6o7l9xPY63HfAMLAR/AtqvEzGmkjjOzralRnC5gjjV9rXMl
 5B/ZxQpeXL2i7qhiZCO9hmbLAucTNpxZUjXyqxsFePpltr1MTg6dfRbdetgNjPrL0oZqCg9/oM
 u/nhhRM2DvWmVWy8Ae/RoruPwpbW8TybNRuX3j0nPWxTrN080JBYBg7lFICVcoiwICpOEEmB5S
 IXc=
X-SBRS: 2.7
X-MesageID: 3201586
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,276,1559534400"; 
   d="scan'208";a="3201586"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: "'Foerster, Leonard'" <foersleo@amazon.com>
Thread-Topic: Design session report: Live-Updating Xen
Thread-Index: AQHVOz84rrbZg3jr7UWo9Co44cwhi6bQHpiw
Date: Thu, 18 Jul 2019 09:29:44 +0000
Message-ID: <88ef63e840d54a15a6f3fbc7eefa0128@AMSPEX02CL03.citrite.net>
References: <1563217075.6815.14.camel@amazon.com>
In-Reply-To: <1563217075.6815.14.camel@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiAKPiBMb25nZXIgdGVybSB2aXNp
b246Cj4gCj4gKiBIYXZlIGEgdGlueSBoeXBlcnZpc29yIGJldHdlZW4gR3Vlc3QgYW5kIFhlbiB0
aGF0IGhhbmRsZXMgdGhlIGNvbW1vbiBjYXNlcwo+IAktPiB0aGlzIGVuYWJsZXMgKGFsbW9zdCkg
emVybyBkb3dudGltZSBmb3IgdGhlIGd1ZXN0Cj4gCS0+IHRoZSB0aW55IGh5cGVydmlzb3Igd2ls
bCBtYWludGFpbiB0aGUgZ3Vlc3Qgd2hpbGUgdGhlIHVuZGVybHlpbmcgeGVuIGlzIGtleGVjaW5n
IGludG8gbmV3Cj4gYnVpbGQKPiAKClRoaXMgc291bmRzIHZlcnkgbXVjaCBtb3JlIGxpa2UgYSBL
Vk0gc3lzdGVtLi4uIFRoZSBtYWpvcml0eSBvZiBYZW4gYmVjb21lcyB0aGUgJ2tlcm5lbCBhbmQg
UUVNVScgcGFydCAoaS5lLiBpdCdzIHRoZSBwYXJ0IHRoYXQgYm9vdC1zdHJhcHMgdGhlIHN5c3Rl
bSwgZGVhbHMgd2l0aCBJT01NVSwgQVBJQ3MsIGV0Yy4gYW5kIGluY29ycG9yYXRlcyB0aGUgc2No
ZWR1bGVyKSBhbmQgdGhlIHRpbnkgaHlwZXJ2aXNvciBpcyB0aGUgJ2t2bS5rbycgKGRlYWxzIHdp
dGggYmFzaWMgSS9PIGFuZCBpbnN0cnVjdGlvbiBlbXVsYXRpb24gdHJhcHMpLiBJcyB0aGF0IHRo
ZSBnZW5lcmFsIHNwbGl0IHlvdSBlbnZpc2FnZT8KCiAgUGF1bAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
