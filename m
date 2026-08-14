Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477F6C5CFDB
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 13:25:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391136.1631120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuruj-0006Dv-JE; Fri, 14 Aug 2026 13:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391136.1631120; Fri, 14 Aug 2026 13:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuruj-0006Do-Fg; Fri, 14 Aug 2026 13:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1391136;
 Fri, 14 Aug 2026 13:25:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wuruh-0006Df-Ik
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 13:25:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wurug-00CihR-VS
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 15:25:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a7f1730-e002-0a2a0a5209dd-0a2a45079726-36
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 15:25:34 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7f174e-b4ea-0a2a45070019-d155da2fdd51-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 15:25:34 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c15b1da6b82so122782866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 06:25:34 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c212339636fsm104236366b.2.2026.08.14.06.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 06:25:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1786713934; x=1787318734; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMEaVxlhuns8hkig2UsUJQAIUbQ2e1I1Zup33AB/514=;
        b=gX1Yk6MrJZ0YSD1Ryseb7B0cu/KZBQaZJJG+p8ww+shEHU5xna81L8IxWTsIqsUYDE
         TdIbCGkhXuYKUsu4nvdvGYf7jxwspM1g3pUvSU6EgO2mPdMfneAg1vip6nNAPzKj9mwF
         DI1AnmQYA0dspvFFcAv82Z5tMrtqLfaD/ArTkFzJwfYwR2evRHyd4QYsT+0re8bnzruA
         bZ3eGuujVfnbcnINwg40zmFmeFyjOuCx9mKM62UbzGcdqfUD9L5YohOgelqUOrzr4HNF
         yGSwMMXiJUu1VPDxsSCZ2p8+T994I12rniP6klbGcqrR/DzzggrzXg/uba+rLcvvNLHF
         3lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713934; x=1787318734;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMEaVxlhuns8hkig2UsUJQAIUbQ2e1I1Zup33AB/514=;
        b=rp2nRiPLT+gjJh95C23cSojjoctIaRZ1Vd23JFpCmLDuIzbW7vl97Ol4s0d+Ke/z/F
         Qy7/YQ53bSD/wh8XAhRQU3b8e6QQIAZWB+840DBvvht5BaA0fx+AVtGiKFpMTrPumM3R
         v0VU3XFL3HFRNI8EbyEQmbOW5a5Ry+eeqEN/+km0igCvGde1Vu8ru52q7V+JprFTFGD1
         k57g0vtC5h5UUcF+fGKxcO1a+hf92DL0L1suwqzPPl+1VpVnBhzOgW1fPZfKchMamjGe
         t4EOAF+WyB6+JSGEtCWAJELb0SWAB8IJ5Gik78yqvG4dyDmPonYGm8kj8hQ1INdl3jtI
         mC4g==
X-Forwarded-Encrypted: i=1; AHgh+RqLxjucAgOPeh+/7OxQvnKNr+EXfqx/qUxs/u2LQm7HiWW0oKvtX4u/FPifqwtR54NcPqITdcBoLPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSQmyZsYSp4VT24LCin2oUzCp+JCHsO7/gC7ia00cRSJYCZdAP
	kFDyefvB5Ah10YTo/Xomsc7PdPyWhPlAoaVkIafJQ9gihYmh+9ZCyACoi8HJw2SqmZQ=
X-Gm-Gg: AR+sD12ugDA2DEKHS9nOkSU/LDCQglRpwujYHptoPIKUG2OaPySwN0kebBsQTTAaTTV
	kUQVo9kMH+jlxkknA9dnZ79aJH9jx0VUnjsqQ6aKyLarHr1n4TD8qMmzcqfhSrxjfnOTDOXilUC
	CxJw2Xlgoa/l8ugzZeF6lDWOhoxl3hToVLfbAZ5TbdK87Qgl6VbPwWqZmx5FzpuYuzl3bTFjd8W
	MJm9mL/Qz5iYzHmKZawl1trdCGyi6K+QCFxrOYaN2lJJZr1FyLhw3xxyUKvZrxLCeapSpYQ1aCR
	bqD32iUoaIY5x6Z6npyn8VSlyXquCyn2xomp0NoBwKgfCFwynBSYZQdm34p+HlxIuFAdWlFoAM0
	+wZH33v+VFLUFjw3AwmVnW7swje87/UCKtOCPu70e92bWGb19fsX6IfWy3h+dff0pCemsUks/m9
	ZZBDVBiwtrPolgVKv7tFo4aJAQUbXDzLr9wB0T0OA3RbCmBqxMMHx+9JDFjVtPn+08wi3o6KvUx
	9rIirDCn5oNOR+nBpGcSYxEAuljRmWA48LCO9dnkCNx5I4hYgtLEYAp4ExKoaBQrTC/kYDuhDq2
	AKvsdC9jfgycjA==
X-Received: by 2002:a17:906:fe43:b0:c1c:5c90:1bad with SMTP id a640c23a62f3a-c212a154559mr268829266b.14.1786713934359;
        Fri, 14 Aug 2026 06:25:34 -0700 (PDT)
Message-ID: <4b7ee4e9-7a38-401d-9b9e-371173e8165c@suse.com>
Date: Fri, 14 Aug 2026 15:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pcifront: Fix PCI device reference leak in AER
 handling
To: Ruoyu Wang <ruoyuw560@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813153138.3953222-1-ruoyuw560@gmail.com>
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
In-Reply-To: <20260813153138.3953222-1-ruoyuw560@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QkHGccM4PCCVbRXCFyU4NGNi"
X-purgate-ID: tlsNG-ef75cf/1786713934-A68D9AE4-E15D3077/0/0
X-purgate-type: clean
X-purgate-size: 7259

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QkHGccM4PCCVbRXCFyU4NGNi
Content-Type: multipart/mixed; boundary="------------IAEm0KX69fq5JmryQhnoqDqx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <4b7ee4e9-7a38-401d-9b9e-371173e8165c@suse.com>
Subject: Re: [PATCH] xen/pcifront: Fix PCI device reference leak in AER
 handling
References: <20260813153138.3953222-1-ruoyuw560@gmail.com>
In-Reply-To: <20260813153138.3953222-1-ruoyuw560@gmail.com>

--------------IAEm0KX69fq5JmryQhnoqDqx
Content-Type: multipart/mixed; boundary="------------e6EjXp9l0KI8S0BNgoOoL0MO"

--------------e6EjXp9l0KI8S0BNgoOoL0MO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDguMjYgMTc6MzEsIFJ1b3l1IFdhbmcgd3JvdGU6DQo+IHBjaV9nZXRfZG9tYWlu
X2J1c19hbmRfc2xvdCgpIGluY3JlbWVudHMgdGhlIHJlZmVyZW5jZSBjb3VudCBvZiB0aGUN
Cj4gcmV0dXJuZWQgUENJIGRldmljZS4gcGNpZnJvbnRfY29tbW9uX3Byb2Nlc3MoKSBkcm9w
cyB0aGF0IHJlZmVyZW5jZSBvbmx5DQo+IHdoZW4gdGhlIGRldmljZSBvciBpdHMgZHJpdmVy
IGlzIG1pc3NpbmcuIEFsbCBwYXRocyBmb3IgYSBib3VuZCBkZXZpY2UNCj4gZWl0aGVyIHJl
dHVybiBkaXJlY3RseSBhZnRlciBpbnZva2luZyBhbiBlcnJvciByZWNvdmVyeSBjYWxsYmFj
ayBvciBmYWxsDQo+IHRocm91Z2ggd2l0aG91dCBjYWxsaW5nIHBjaV9kZXZfcHV0KCkuIENv
bnNlcXVlbnRseSwgZWFjaCBBRVIgcmVxdWVzdCBmb3INCj4gYSBib3VuZCBkZXZpY2UgbGVh
a3MgYSByZWZlcmVuY2UgYW5kIGNhbiBrZWVwIHRoZSBkZXZpY2UgYWxsb2NhdGVkIGFmdGVy
DQo+IHJlbW92YWwuDQo+IA0KPiBTdG9yZSB0aGUgY2FsbGJhY2sgcmVzdWx0LCByZWxlYXNl
IHRoZSByZWZlcmVuY2UgYWZ0ZXIgY2FsbGJhY2sgZGlzcGF0Y2gsDQo+IGFuZCB0aGVuIHJl
dHVybiB0aGUgcmVzdWx0LiBUaGlzIGtlZXBzIHRoZSBkZXZpY2UgYWxpdmUgd2hpbGUgaXRz
IGNhbGxiYWNrDQo+IHJ1bnMgYW5kIGJhbGFuY2VzIHRoZSBsb29rdXAgb24gZXZlcnkgc3Vj
Y2Vzc2Z1bCBwYXRoLg0KPiANCj4gVGhpcyBpc3N1ZSB3YXMgZm91bmQgYnkgYSBzdGF0aWMg
YW5hbHlzaXMgY2hlY2tlciBhbmQgY29uZmlybWVkIGJ5IG1hbnVhbA0KPiBzb3VyY2UgcmV2
aWV3Lg0KPiANCj4gRml4ZXM6IDk1NmE5MjAyY2QxMiAoInhlbi1wY2lmcm9udDogWGVuIFBD
SSBmcm9udGVuZCBkcml2ZXIuIikNCj4gU2lnbmVkLW9mZi1ieTogUnVveXUgV2FuZyA8cnVv
eXV3NTYwQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------e6EjXp9l0KI8S0BNgoOoL0MO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------e6EjXp9l0KI8S0BNgoOoL0MO--

--------------IAEm0KX69fq5JmryQhnoqDqx--

--------------QkHGccM4PCCVbRXCFyU4NGNi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmp/F00FAwAAAAAACgkQsN6d1ii/Ey9I
yQgAju8yaOfqsyi6C4ahXULTuTk5AvglXAwL3z2+BD8jSyFkX5+zN4N4izExwQt85obHCcFRbKzL
jWuvSaIC5NR4v1YJDydGZeDdiR2wP4C0XTHEafps/quX58OkLOqVCnz61J7KPpaZAKWicUmtdTUX
3QDbVRjsiz4qpUe31kxlN8nNi33KZ7WM1BNHcg4wDVjTnIErTjQ3Nw8+X3/ErTexNcBxPO3Ed8JP
ErYudznnqO8oCXz5jRhA5YK/r6OsKu7kj8z7Vh/SqumIVzxGN5EoNVe4D2PPa5wsW7WBYSZJrbe/
YtGFT5Q4mYvLHSby4wBM2CGl1aSDTNkcdhiGZ2j5Ag==
=sLha
-----END PGP SIGNATURE-----

--------------QkHGccM4PCCVbRXCFyU4NGNi--

