Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE70C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:36:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383010.1626260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrX77-0007SY-01; Wed, 05 Aug 2026 08:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383010.1626260; Wed, 05 Aug 2026 08:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrX76-0007SR-TR; Wed, 05 Aug 2026 08:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1383010;
 Wed, 05 Aug 2026 08:36:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrX75-0007SI-Jc
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:36:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrX74-00HNgL-KO
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:36:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f611-bab6-0a2a0a5309dd-0a2a450cd29c-2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:36:34 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72f612-f479-0a2a450c0019-d155da2db119-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:36:34 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c167aa9500dso116662666b.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:36:34 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2035e23afcsm89067666b.0.2026.08.05.01.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:36:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1785918994; x=1786523794; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9EKI6NPBJG8Y7nbkj7ihhK4/1jMO++H4iDHuFnaf2I=;
        b=fYAkHzayNo91kYj5u5WCG6iINZ8L0MqiTpo+I9Ivu7HxWdAuAujZigeoxZIAceOyOM
         GJmsKTsycPiGiQXZ/y5oXiyAQIz7bpbPnWxB1g2maEcI4Fxb/nu4EKgft567iwkQUVbb
         SFIMMFHUKuMYWUXcQwZtzsJ9ilVWZXW9Lo5zVQZc0OU0PNLjML3dYqpJbXs2WN5nT3OV
         4gkt+B7i4gyRtNi+MUu74sro2QujIh4GTfuJUxwdmIIFBtBNyQ95l8+Lny2numHYsUkP
         LGsZYMzPyuxkgNtqa3oPao3sXgqiO/7WMJg+smBPlWM0MMTwlc1UIRZGYbe6qO2sK7KE
         ydSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918994; x=1786523794;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9EKI6NPBJG8Y7nbkj7ihhK4/1jMO++H4iDHuFnaf2I=;
        b=WEfxiQLnaFuOKvcVhkcvDrQClFs+SEdGWW71IVmkOdqp6Fc1DqIDapU3yQ8P1X321w
         4s74hNxvzWC4l2DR7l1m4D1Ag0KDBgdnHdqbyFogL217X1+3jjdoZ5GJQogUCJbgQFiY
         Dif54AKfeQey+Ur0LhFYP2OqRfu7NhniQ4EdkZ2FuRtLcU2cL+LaKwiixJreGn8fyGiH
         2dbIu5usj3YyMgFljxDs4E3ROWLKloH0jwE4rzlyQA9u9mOxPLiRFXvlrzfZwFkk3Q93
         vEW9qrLoPN5GsSXFO/yYx6AVV3t24ownVOmgMHgDXsun09hq/LsyIT5PkFvlkvxvuAqC
         DQ0w==
X-Forwarded-Encrypted: i=1; AHgh+RqIG0WljcnYr+W72tBdd7t4bs35kuC0auCfIQJeijjNbQp+ikpoHAVWl4YR0lEtoG17kFESqQTqEeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNn9jQQjR/5IItKylSvyvuxZgTnud8xiscg/cNl0QmlkF5peqm
	GAYdcWjlsVZqwhISEibMLMQQY41WSaxxWKpHuQIwu0ZkHyCzhLfqPHuMiFJn6THby/o=
X-Gm-Gg: AR+sD12ZS78mO6Pid9a9wmVFuR7qhZDpsp4jBLN6z1Fnr89wA/q3MuTNIVAYow+0z9H
	5foG4wA4aUqQLsTm+yBRRlSiaVzlbFnUQKvVbWj+XNpN/Ufv9wEiMYuDoCUm7MVwJVyr62/8NOG
	/u5MlStNIEBA/KMovifeGaPB/JqwUldK8COHoLuZsGhbdSNvexY0KiQyTEiPpAq/YjilNtei9Km
	uLYnGBsf2O1K71QFDYE5PmaeikhhK2jAClKAD26DJtIEPCr2cJijyx5CaVzk1tdjsKw5nZzf5W2
	C7YZip5WENoP0wnOOwGXoa7oMEaX0aXdg7IvrdGZcECkPtGqIRkLS/zrhsHPIhUKFJkPDR4TULD
	OXwMKw4owlF8iJAb94HSI76MKWbwUsQAS25EGhO1GCd6I7u8kfZAUqly2puBBvvCkeeSZvrs8VZ
	6Ch0TJbaUQOGDXOd/CcT+D1ac8wg0HOLVRe5Yea+ECs8G9T9EwJqjzqeP/Nddj8sXdrn6sPBUWA
	LLdfhMMBuG4V9NIPrLOkOTClNQGg/rWshcb7Keh31WW658Oc9bXIBDPVrrN2p2x0xOtEpw8C/5U
	+4RZZzLkerklJJY=
X-Received: by 2002:a17:907:ea8b:b0:c16:126b:98b4 with SMTP id a640c23a62f3a-c2039c03283mr237087466b.3.1785918993934;
        Wed, 05 Aug 2026 01:36:33 -0700 (PDT)
Message-ID: <15824536-dff6-426d-b54c-6a1f362adaa2@suse.com>
Date: Wed, 5 Aug 2026 10:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen: Drop CONFIG_XEN_PVHVM
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-3-jgross@suse.com>
 <7179e004-76df-42be-94fd-f314614e65cd@citrix.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <7179e004-76df-42be-94fd-f314614e65cd@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------03hIooiG2e5DB35vNVoqR7Vu"
X-purgate-ID: tlsNG-d25034/1785918994-774D7A5B-045C80CA/0/0
X-purgate-type: clean
X-purgate-size: 8222

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------03hIooiG2e5DB35vNVoqR7Vu
Content-Type: multipart/mixed; boundary="------------dsfviep0ZNxgC3wnR9IF0PBk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <15824536-dff6-426d-b54c-6a1f362adaa2@suse.com>
Subject: Re: [PATCH 2/4] xen: Drop CONFIG_XEN_PVHVM
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-3-jgross@suse.com>
 <7179e004-76df-42be-94fd-f314614e65cd@citrix.com>
In-Reply-To: <7179e004-76df-42be-94fd-f314614e65cd@citrix.com>

--------------dsfviep0ZNxgC3wnR9IF0PBk
Content-Type: multipart/mixed; boundary="------------cjd2b7oUonfOwrhy1dlPiUfP"

--------------cjd2b7oUonfOwrhy1dlPiUfP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTA6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA1LzA4LzIw
MjYgOToyMSBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIHg4NiBDT05GSUdfWEVO
X1BWSFZNIGlzIG5vdyBhIHN5bm9ueW0gb2YgQ09ORklHX1hFTi4NCj4+DQo+PiBJbiBYZW4g
c3BlY2lmaWMgeDg2IGNvZGUgaXQgY2FuIGJlIGp1c3QgZHJvcHBlZCwgaW4gbm9uLVhlbiBz
cGVjaWZpYw0KPj4geDg2IGNvZGUgaXQgY2FuIGJlIHJlcGxhY2VkIHdpdGggQ09ORklHX1hF
Ti4NCj4+DQo+PiBJbiBhcmNoaXRlY3R1cmUgaW5kZXBlbmRlbnQgY29kZSBpdCBpcyB1c2Vk
IG9ubHkgd2hlcmUgQ09ORklHX1hFTiBpcw0KPj4gZGVmaW5lZCwgc28gaXQgY2FuIGJlIHJl
cGxhY2VkIHdpdGggQ09ORklHX1g4NiB0aGVyZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2lkdGVudHJ5LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9p
ZHRlbnRyeS5oDQo+PiBpbmRleCAyMGY1NDg3MDI0MDQuLmY0MDBjZmFjNjlhNiAxMDA2NDQN
Cj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2lkdGVudHJ5LmgNCj4+ICsrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2lkdGVudHJ5LmgNCj4+IEBAIC03NDUsNyArNzQ1LDcgQEAg
REVDTEFSRV9JRFRFTlRSWV9TWVNWRUMoSFlQRVJWX1NUSU1FUjBfVkVDVE9SLAkJc3lzdmVj
X2h5cGVydl9zdGltZXIwKTsNCj4+ICAgREVDTEFSRV9JRFRFTlRSWV9TWVNWRUMoSFlQRVJW
SVNPUl9DQUxMQkFDS19WRUNUT1IsCXN5c3ZlY19hY3JuX2h2X2NhbGxiYWNrKTsNCj4+ICAg
I2VuZGlmDQo+PiAgIA0KPj4gLSNpZmRlZiBDT05GSUdfWEVOX1BWSFZNDQo+PiArI2lmZGVm
IENPTkZJR19YRU4NCj4+ICAgREVDTEFSRV9JRFRFTlRSWV9TWVNWRUMoSFlQRVJWSVNPUl9D
QUxMQkFDS19WRUNUT1IsCXN5c3ZlY194ZW5faHZtX2NhbGxiYWNrKTsNCj4+ICAgI2VuZGlm
DQo+IA0KPiBJJ20gdmVyeSBoYXBweSB0byBzZWUgYSByZWR1Y3Rpb24gaW4gdGhlIG51bWJl
ciBvZiBLY29uZmlnIHN5bWJvbHMgZm9yDQo+IFhlbiAodGhlcmUgYXJlIGRlZmluaXRlbHkg
dG9vIG1hbnkpLCBidXQgdGhpcyBsb29rcyB3b25reS4NCj4gDQo+IE9yIGFyZSB5b3Ugc2F5
aW5nIHRoYXQgdGhlcmUgcmVhbGx5IGlzIG5vIHdheSB0byBidWlsZCBhIFhlbiBQViBndWVz
dA0KPiBleGNsdWRpbmcgdGhlIEhWTS1vbmx5IGJpdHM/DQoNClNlZW1zIHNvLCB5ZXMuDQoN
ClRoaXMgaGFzIGJlZW4gbGlrZSB0aGlzIGZvciBhdCBsZWFzdCBzZXZlcmFsIHllYXJzIG5v
dy4NCg0KV2hhdCB5b3UgY2FuIGRvIGlzIHRvIGNvbmZpZ3VyZSB0aGUga2VybmVsIHRvIGV4
Y2x1ZGUgdGhlIFhlbiBwbGF0Zm9ybSBQQ0kNCmRldmljZSAoQ09ORklHX1hFTl9QVkhWTV9H
VUVTVD1uKS4NCg0KDQpKdWVyZ2VuDQo=
--------------cjd2b7oUonfOwrhy1dlPiUfP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cjd2b7oUonfOwrhy1dlPiUfP--

--------------dsfviep0ZNxgC3wnR9IF0PBk--

--------------03hIooiG2e5DB35vNVoqR7Vu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpy9hEFAwAAAAAACgkQsN6d1ii/Ey+o
lwf/ZILi9GqY0ASMTn4+F5mdqH6HoBgZNN8A+OfdA1+17y9CliPpJyiKtL0udlK3bOKxohVmIfKZ
Q3uWtADSqNY510idPN+fWMd9jpZjBEPmTJsGuArUx+i848GfvSm3A260oIhf2U15Pu7s/BGXjAiO
renbxyOoIRaXJkXnrokmXMfs64bRolirMHBWDyO+sVdmXeM2hze9HJzXg3eDy27YOqcNAj3mZg6H
q/2lTFRIu3P5RouIyhB7KoA7Ct1uqLuaiPL8cGNnxGI4TKrXiOSG4+PHi4xaYBB4BLRZ9GLgamSh
XbOVOZSEJZ0m6en6Pys6Y+uZBPbg1uc4x2gr35dFPw==
=Hyf+
-----END PGP SIGNATURE-----

--------------03hIooiG2e5DB35vNVoqR7Vu--

