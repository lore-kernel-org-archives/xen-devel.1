Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79112C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:29:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366483.1616372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllFA-00060J-Sx; Mon, 20 Jul 2026 10:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366483.1616372; Mon, 20 Jul 2026 10:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllFA-00060C-P6; Mon, 20 Jul 2026 10:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1366483;
 Mon, 20 Jul 2026 10:29:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wllF9-0005zo-DR
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:29:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wllF8-00GUEy-QV
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:29:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5df861-e002-0a2a0a5209dd-0a2a4503ed0e-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:29:02 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5df86e-fae8-0a2a45030019-d155dd2ad936-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:29:02 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f71156e1aso595903f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 03:29:02 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e65644sm27469406f8f.16.2026.07.20.03.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 03:29:01 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784543342; x=1785148142; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aJSBu+o6iIRDp5321QLe+PQzf5+ZDn1LJAcsjtQtgFo=;
        b=Dq2UhlWxjyIuxDpxAuMfDu8vVNJAUIUDsj6nu1x5qLoXSUrGMDFGYFPGLNr6axmOiC
         BYKEGQ9DIywco5UV4uHvd2t7S8hEd2n9vuzuJs+pO/hh6sJSA4SYNIz04n7nHSJsZ4dE
         KV8IPatQi1WoWMeV82TAz5IRlR38C4cacDFYT1dOUPQ/Ncqv2cPtQdkLNLiQj0jJIwPm
         QjTpkncaul5SOCslbYk6DO4f2mGAXOtaGWUhnpTBp6IYvR+eIFVhAmww+jzVLD2oGisF
         gL1LFWU6qoA2pBY7eqrAsExT6y4J7aBDGNiMyvARq4rGzSRvxQYNwT3i1tGgonKvyaZ6
         5FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543342; x=1785148142;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJSBu+o6iIRDp5321QLe+PQzf5+ZDn1LJAcsjtQtgFo=;
        b=GX/TMqvaIKFIcXK/a5isfV3wRoxuY1nVmrodGBArAq5s0KruM7D4ES3ZxVATbFmavV
         ZDD6zl4gse7cSppWc05gMOPwkpmWgt+8Pr/ePliMAt2W59Rud5C9fZgxDWBArtw9vw+3
         B+txHV8pQNKdnzdfTc+EUxsqxWh67rG2azg67Kt3v89xbqxEHzlHbkd4lfIqbXeNM6Es
         Bf24P9upjmIHOo5iewH1J9gnPbQhwJ4wbUqXDnG4OYy8a5N1T9GqEAUwdbHIOndp8XVt
         SpfOz7GF2qSTCImvvX4XuNrNECb2tVdI1oZbBq33sKyt8RENVjJigHMQLlugBI1M/kWn
         akqg==
X-Forwarded-Encrypted: i=1; AHgh+Ro04PgdGcd3PpclR2D6vpVbLwtIcHF3TPiHbYav0HT6C17/17L1mlGGCiyb2G5Zcq1G4VYD+9Oc5L0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1gRKNc+WfuYZhlKyxgMBtBmFcnSssmnIyH5xXsDdLtGznHjCX
	4Sp8NkWoyyIktHtIVo0we7xVhB5UD473c3sR79Ddm7BKDsr+VRBX02K11XgTfvzdETA=
X-Gm-Gg: AR+sD12l0UKdeUh7Z3FmKkyQzHkvJ5JNNIT50EXWpLKys5xqtz3c7uwjOPxNDrtslIQ
	QUPPl5ocejI3RCq9A+FkXZ+p8O/x4MUTy8C43nEewPwQJn8Yg9r5fHREqmxtUwdMHjXKgf6iPXN
	prhFYDUaW335rz1eTiLNXNrHT2tIlfnCTSo0BEVg6HSojJxoOKj8+t0d1dalyQglPQSN6yGVHIB
	MzNh57Gl/zIxF4RUetna7pGG+Eo4CmtdhxfDzPbIjoZKSeQYENqp1NU/amXOhGB9ES/6RY/GNDK
	MhrCv5Eg6HgAONP+bo1xXUicpwnJ/egt10yN6WNWs8K6BTQRKiz9R0EjkhWhaZh55XALbukhgGo
	7LWHH0S9tgtlp8hxZOEAXMSKmAly+/KGqc7XqppaD6H47vrSDvd1ozB1zmbhVvaenief+2ZMxEO
	FXQRtlF0uezIhd6r+3IN03wnsOklN+uw9J0Sc8cMTLgsVOhh/VqbXC9dPce3DKy2e1Iz9vLCGMP
	3CGcc5Sra20ZC/gGMdpnk6itH0/ML79
X-Received: by 2002:a5d:59a4:0:b0:47d:f43b:fd63 with SMTP id ffacd0b85a97d-47f6230e5a4mr14881024f8f.26.1784543342086;
        Mon, 20 Jul 2026 03:29:02 -0700 (PDT)
Message-ID: <2b954e31-0551-4706-ab56-f24a8380b527@suse.com>
Date: Mon, 20 Jul 2026 12:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] {libxl,xl}: Add xl trigger debug
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
 <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------84ZHUl0IOgdOn8wZYiHk8hG8"
X-purgate-ID: tlsNG-33051d/1784543342-6C6DE4E9-7774DC77/0/0
X-purgate-type: clean
X-purgate-size: 7490

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------84ZHUl0IOgdOn8wZYiHk8hG8
Content-Type: multipart/mixed; boundary="------------Zb0Rkc1pAxSfr7IPDu6zoum0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <2b954e31-0551-4706-ab56-f24a8380b527@suse.com>
Subject: Re: [PATCH 2/2] {libxl,xl}: Add xl trigger debug
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
 <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
In-Reply-To: <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>

--------------Zb0Rkc1pAxSfr7IPDu6zoum0
Content-Type: multipart/mixed; boundary="------------zHb70pH6EhL14DLemQkMlpi3"

--------------zHb70pH6EhL14DLemQkMlpi3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDcuMjYgMTE6MjcsIFR1IERpbmggd3JvdGU6DQo+IFVzZSBYRU5fRE9NQ1RMX1NF
TkRUUklHR0VSX0RFQlVHIHRvIGFsbG93IHByaW50aW5nIGRpYWdub3N0aWNzDQo+IGluZm9y
bWF0aW9uIG9mIGEgc3BlY2lmaWMgZG9tYWluLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVHUg
RGluaCA8bmdvYy10dS5kaW5oQHZhdGVzLnRlY2g+DQo+IC0tLQ0KPiAgIHRvb2xzL2xpYnMv
bGlnaHQvbGlieGxfZG9tYWluLmMgIHwgNCArKysrDQo+ICAgdG9vbHMvbGlicy9saWdodC9s
aWJ4bF90eXBlcy5pZGwgfCAxICsNCj4gICB0b29scy94bC94bF9jbWR0YWJsZS5jICAgICAg
ICAgICB8IDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
ZG9tYWluLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbWFpbi5jDQo+IGluZGV4IDM3
ZmNkOTI4NzEuLjJkODI5MGRiZmEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQv
bGlieGxfZG9tYWluLmMNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb21haW4u
Yw0KPiBAQCAtMjE5MCw2ICsyMTkwLDEwIEBAIGludCBsaWJ4bF9zZW5kX3RyaWdnZXIobGli
eGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICBjYXNlIExJQlhMX1RSSUdH
RVJfUzNSRVNVTUU6DQo+ICAgICAgICAgICBkb21haW5fczNfcmVzdW1lKGFvLCBlZ2MsIGRv
bWlkKTsgLyogbXVzdCBiZSBsYXN0ICovDQo+ICAgICAgICAgICByZXR1cm4gQU9fSU5QUk9H
UkVTUzsNCj4gKyAgICBjYXNlIExJQlhMX1RSSUdHRVJfREVCVUc6DQo+ICsgICAgICAgIHJj
ID0geGNfZG9tYWluX3NlbmRfdHJpZ2dlcihjdHgtPnhjaCwgZG9taWQsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX1NFTkRUUklHR0VSX0RF
QlVHLCB2Y3B1aWQpOw0KPiArICAgICAgICBicmVhazsNCg0KWW91IGFyZSBzZW5kaW5nIFZJ
UlFfREVCVUcgb25seSB0byBvbmUgdmNwdS4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBh
ZGQNCnRoZSBjYXBhYmlsaXR5IHRvIHNlbmQgaXQgdG8gYWxsIHZjcHVzIG9mIGEgZG9tYWlu
Pw0KDQoNCkp1ZXJnZW4NCg==
--------------zHb70pH6EhL14DLemQkMlpi3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zHb70pH6EhL14DLemQkMlpi3--

--------------Zb0Rkc1pAxSfr7IPDu6zoum0--

--------------84ZHUl0IOgdOn8wZYiHk8hG8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpd+G0FAwAAAAAACgkQsN6d1ii/Ey96
Ngf+OzzSqO1C7qcfyafd+giSdFD3AE+p0cnyTIEyFrlYvz1jcKF02chmlFZukZ7eCFNUIB9KL5ti
Zp/JCeheqceD6OINeLY+hav6iTu+w3HCNuwvo2ngEFLTDteOk8DpleyKnCYEyJtBfhG/gdVqw91W
aoSRatQFGLYDnCgeNk6eAa2cyfUTSFNzJZRb/0ZrX6k3NbWlN7V+fXSJleVYHW6B8wGCOJRtgwrB
M19zpkYlQq3Zv1j4ruwqf2pJwgt0GifobZYTYeYnbj43gehcnIfn5inMUwG6fNOIbIsk3TkMniqL
X877FNIDvIoYRw7KLvHrdQFX+RyYK1g4FzE78805yA==
=tWOZ
-----END PGP SIGNATURE-----

--------------84ZHUl0IOgdOn8wZYiHk8hG8--

