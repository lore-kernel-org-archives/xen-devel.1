Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4130FC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 05:44:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393391.1632188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCbq-0007Jr-0G; Tue, 18 Aug 2026 05:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393391.1632188; Tue, 18 Aug 2026 05:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCbp-0007Jk-Tu; Tue, 18 Aug 2026 05:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1393391;
 Tue, 18 Aug 2026 05:43:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwCbo-0007Je-U3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 05:43:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwCbn-00DqME-P8
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:43:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a83f0f8-bab6-0a2a0a5309dd-0a2a4501de26-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:43:35 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a83f107-5984-0a2a45010019-d155d02ce835-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:43:35 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6a3efa2b38aso54370a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 22:43:35 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c217fecb5basm135337566b.24.2026.08.17.22.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 22:43:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787031815; x=1787636615; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uj5ouZ8w73nv2SuftarM6ZvYwcksL+tx8lGaHlWS118=;
        b=WySCVVyTbcQXpLlMsN+PmoPywiXNeEnahkKDe8DsM49aukYCgx4pGpezm9AMeGgz/T
         VEyF1HnF4iCJd7BaR2QZo47ZpuQbDOIWHF+WVMWLZ6MwaAPRnmxAs+FMRhZb+9rUASlt
         nbSZZR0C8TWEEB/FNCiCRl3zbdgP2W5iM9jx6SN777csZm7dUa4zHxI+/A0B6pvAUK2a
         YpGHxUr2HtnlsfhlYVpW80MTKVxQJ/ZSzzOPiZNebt0lSNgNpLSs7fam3xAwUTrcbWU/
         K49744cOcUg2ehrGr+VcU8XunoFfBnvbzbGpWakRo7TCzDUEqWEYEyVhRLTkha+FYH/r
         4DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031815; x=1787636615;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uj5ouZ8w73nv2SuftarM6ZvYwcksL+tx8lGaHlWS118=;
        b=q/yXT91XtXhS+wUuUZac83ij4xTqWEj/Tl4pI6ggcvj9IyNQuQ1pWYcyeeEVPm6r7T
         j8mEFGaJVMRw3hjba9FX4l7EcjYq8DfLV/L9RJvxlbj7KquG0TXXYbGcWcjcMiJcm/qn
         4WLOmMmQAcNWjQ+aly3wNNAF1ZsSlHpReYgnVvSEsVUFqreZ1qgIklIA5TmrSPTeCAHY
         a4GTjjhn0dHo1rcIHX7lAY2SDBI2HxqehU4lppWm7xnPbMyeTtcF5SIFsXXyUgeXPC6C
         TQ6LWVJWfkItg0lcRBz0N8cN8vnyojQTKGzsy/BN1KDNmlhYQE6NGXB+oCjH0+3z9tgH
         VTxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8ChoByE1usxoounRm/PILmIJYq9s6bU+1lQFxKvLpgMaBl8HQbxIlO2mFAgfhc/LxxeL9k77rf7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHYGKkNfj3WPEAmk6V0PTaHkh67rlpjFYVVlBMbu7ohsrl7eJl
	0O8er8RTdj0TRqCactcE6SXDMjGABhVMG2Bm6ptTHcg5Sm2+aY4tHNkvzlkKCLHvRSU=
X-Gm-Gg: AR+sD11lq5tOfcEB03gkXCzz5FF8hkKcoIKeepnL5aAx0XQktBx9bXpr7hvOhSWDZ0A
	z04PDbvLKsrtbaDDWZjY/hTiu+ct7dn3RJpo4tCvStBsh/vdLFg/Q+mjeqE8IHV5ObXZXwoVdsi
	ovcE03JRXmSyU6wYyXQBVo+CWAJIEmLqskeSF5J/C8blDCKBKjidlfZwv0OPR2OIMFTW0IHBSlK
	3QvC4M5lmMpTjAVo8E9peT2IETh08hiZJ4NLrkweMysPY/xYQpUi2jZVfWqYs/mvX6vuOg2RfzV
	+IJa0rgblUQdzavqjwUDCezngVhegKEwBNSc9GpN7YYA4+qLh431PJNx5/s3upPPPpen/hzMnXw
	CmEkUzrrDBLqA7zhcdnEfAxuawdMKfZZk2ReqweF/sLTGz+tM5ezCmaarw08uL9dLOfgpl0H7N3
	Eg/4wgXEEfiPO0CF/0lwLx2rNpvMEPsf2cm2dzYBjyurt2/Z9kOVIHIHb0tYiOgL8Yj3OWhY7q8
	48efEbLE6tu8/dx0cHG78Zfw0+21Bx2LtjJNYpUSL2oXRpm7xvBWrnW5F2eaAVjrbfQ2VSoBWoV
	q6QsUNhATZ7rU9OJBLYLjqRz
X-Received: by 2002:a17:907:f448:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c212a0443cfmr1374879966b.14.1787031814968;
        Mon, 17 Aug 2026 22:43:34 -0700 (PDT)
Message-ID: <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com>
Date: Tue, 18 Aug 2026 07:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
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
In-Reply-To: <aoM4ufGg8QO51XB9@end>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tQB5j0FSmt5iRAzDX8p0gRza"
X-purgate-ID: tlsNG-d62444/1787031815-C495A757-FBF61EC0/0/0
X-purgate-type: clean
X-purgate-size: 7644

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tQB5j0FSmt5iRAzDX8p0gRza
Content-Type: multipart/mixed; boundary="------------6bVqFvJnMDP0UEC8xwTKNt0t";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
In-Reply-To: <aoM4ufGg8QO51XB9@end>

--------------6bVqFvJnMDP0UEC8xwTKNt0t
Content-Type: multipart/mixed; boundary="------------kZsM7JLqna0GOsHQvKS1f2o0"

--------------kZsM7JLqna0GOsHQvKS1f2o0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDguMjYgMTg6MzcsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgbHVuLiAxNyBhb8O7dCAyMDI2IDEwOjI0OjAyICswMjAwLCBhIGVjcml0Og0K
Pj4gT24gMTcuMDguMjYgMDk6NDgsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+PiBKdWVy
Z2VuIEdyb3NzLCBsZSBsdW4uIDE3IGFvw7t0IDIwMjYgMDk6MTg6NDEgKzAyMDAsIGEgZWNy
aXQ6DQo+Pj4+IFRoZXJlIGlzIG5vIHVzZXIgb2YgbGlicGNpIGxlZnQgaW4gc3R1YmRvbXMu
DQo+Pj4+DQo+Pj4+IFJlbW92ZSBsaWJwY2kgZnJvbSB0aGUgc3R1YmRvbSBidWlsZCBzeXN0
ZW0uDQo+Pj4NCj4+PiBXb3VsZG4ndCBpdCBiZSB1c2VmdWwgdG8ga2VlcCB0aGlzIGZvciBh
bnlib2R5IHdobyB3b3VsZCB3YW50IHRvIGRyaXZlIGENCj4+PiBQQ0kgY2FyZCBmcm9tIGEg
c3R1YmRvbWFpbj8NCj4+Pg0KPj4+IEkgbWVhbiwgaW4gdGhlIHpsaWIgY2FzZSwgaXQncyBy
ZWFsbHkgYSBtZXJlIHF1ZXN0aW9uIG9mIGJ1aWxkICYgbGluaywNCj4+PiBzbyB3ZSBkb24n
dCBuZWVkIHRvIHNoaXAgaXQsIHBlb3BsZSBjYW4gZG8gaXQgdGhlbXNlbHZlcyBlYXNpbHkg
bGlrZSBmb3INCj4+PiBhbnkgb3RoZXIgbGlicmFyeS4NCj4+Pg0KPj4+IEJ1dCBoZXJlIHRo
ZXJlIGlzIGFjdHVhbCBwb3J0aW5nIHdvcmssIHRoYXQgd2UnZCBiZXR0ZXIgbm90IGxvc2Ug
YnV0DQo+Pj4ga2VlcCBzaGlwcGluZy4NCj4+DQo+PiBUaGlzIGlzIGFsbCBzdGlsbCBhdmFp
bGFibGUgdmlhIGdpdC4NCj4gDQo+IE5vLCBpdCBpcyBub3QgcmVhbGx5Lg0KPiANCj4gSSBr
ZWVwIHJlYWRpbmcgdGhpcyBhcmd1bWVudCwgYnV0IHBlb3BsZSB3aWxsIG5vdCBrbm93IHRo
YXQgc29tZXRoaW5nDQo+IGV4aXN0cyBpbiB0aGUgZ2l0IGhpc3RvcnksIGFuZCB3aWxsIGp1
c3QgYXNzdW1lIHRoYXQgaXQgZG9lcyBub3QgZXhpc3QNCj4gYW5kIGhhcyB0byBiZSB3cml0
dGVuLg0KDQpXaGF0IGFib3V0IGFkZGluZyBhIGNvbW1lbnQgdG8gdGhlIHN0dWJkb20gTWFr
ZWZpbGUgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgbGlrZToNCg0KIyBwY2l1dGlscyBzdXBwb3J0
IGhhcyBiZWVuIHJlbW92ZWQgd2l0aCBjb21taXQgPGNvbW1pdC1pZD4sIHJldmVydCB0aGF0
IHBhdGNoDQojIGluIGNhc2UgaXQgaXMgbmVlZGVkIGFnYWluLg0KDQpJIHRoaW5rIHRoaXMg
d291bGQgYmUgcHJlZmVyYWJsZSBvdmVyIHVudXNlZCBhbmQgcHJvYmFibHkgYml0LXJvdHRl
biBjb2RlIGluDQp0aGUgcmVwb3NpdG9yeS4NCg0KDQpKdWVyZ2VuDQo=
--------------kZsM7JLqna0GOsHQvKS1f2o0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------kZsM7JLqna0GOsHQvKS1f2o0--

--------------6bVqFvJnMDP0UEC8xwTKNt0t--

--------------tQB5j0FSmt5iRAzDX8p0gRza
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB4BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqD8QYFAwAAAAAACgkQsN6d1ii/Ey+O
KQf3cE0awkimgMkVGuPlyZHJKpE67HDAcz0BFRMDEresolAZrJfiNh3hl6hVIL+VcRc019huIoPx
gsPTILajwsSHNVeWd1ojXUEtMrDMbSGdx4N4lDp4gnxlzv00ygBYS4rYC5h5MunYTUN/u4jp/8+v
8tLVrX/m+E93wx6tXPiRvW9mssts194O6B2U9jNozuVChKACCQl3J6D2VD29PhPgFhw2x592nPbf
2Up+HjsyYvMHm0rn2t5Pc4X5Y/LH4CjPr1mkuJc6ak4EZxOueI0SELV3buGiO45n0whLmshJjKV3
NUtbEFtc/i2rZhuipJol0vkR3AD3j47TaFiNwOBH
=uv3p
-----END PGP SIGNATURE-----

--------------tQB5j0FSmt5iRAzDX8p0gRza--

