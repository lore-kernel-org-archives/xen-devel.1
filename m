Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3DCC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:04:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383331.1626586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraMX-0004GI-V1; Wed, 05 Aug 2026 12:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383331.1626586; Wed, 05 Aug 2026 12:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraMX-0004GB-SP; Wed, 05 Aug 2026 12:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1383331;
 Wed, 05 Aug 2026 12:04:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wraMW-0004G3-CH
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:04:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wraMV-00ErFj-Ot
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:04:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a7326db-5cb7-0a2a0a5109dd-0a2a450a8a60-0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:04:43 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7326db-f2d2-0a2a450a0019-d155d029ec63-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:04:43 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-69fab5a852cso1253176a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:04:43 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a1453d3825sm1959506a12.0.2026.08.05.05.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 05:04:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1785931483; x=1786536283; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5j/I7AVi0xll2QqyeskKm0Pq/Bxqw77h9LnRP5nnM64=;
        b=cSeU8aMzDgz7nHP55H7Q9PROhsawDqPN5VSqoe9KsV5HLpFio9CPAS4QDWtV+6bwSP
         kdjJl0eFnyUcjGlNbJ7UqvApFqfP5ewGjP0PtA2Y0q8XbPTygLk0kWGZtomHarMiV8wq
         UkdYcPy0Z1lcR8RPViFH8dRhtNJK+55xVHx20c/VVYu0XjGw3XnSh2+bIwtHyxY2SOue
         aa1DCrscknfF/qaimd0eMbVPuUCLhDfHnuQk5To0UfQD8IChc5xgxpFzS120s9FceeOv
         p5rxnLax7GIv42hVxQ6yHEQVpFPCMzG4Utjb+vHPNghgQmaR3qZl+LLGlz1v+A8qL1UJ
         vmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785931483; x=1786536283;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5j/I7AVi0xll2QqyeskKm0Pq/Bxqw77h9LnRP5nnM64=;
        b=p88DiHMNj1Iynq/yu82blkLmyS/jzO2OL2UAnrhWe8Mn7W2xfMoSHzoZBXnBeuhWCL
         W0zPQfWtvXtdAPE8eOiJ1ChoXdHQVz6vahGdSHshaQgQ4Ur2nyXf8sLo8IZ9OBNhO/sj
         4ECQLWdZ3Xy1K4CehZn1roOvUUKqj9MclRnJnFbo56wlL0r2SRu8BT0sfrhwCHjEha+s
         xpPOVd5/oxLjBEquxQrn/lRSocIsHgqeGL0VqDuin9JZU0MHHUfWm43PhHDtermEwDrA
         PNzNuW2Of4YiuNuP1nnfcqoEBd08ff3j0+DpL50svVFpFkC8pi/KgQP+1DxGAJAgSvKq
         htsw==
X-Forwarded-Encrypted: i=1; AHgh+RqDg+M0tFQrEgJ44UUfXJ4V01hFSBPVqrt1s8f3HCRBPr98Juy5ZygHtAMNAWvjr/fOGMfgtCYv4/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhHeDafwjw2bxOvycteCACijEJTk/UfjS9q300HLDEUzib3LIS
	i12ltdzIfwrim2QfyT/eKKFfWV9FP561KKIyxnqVnLwa9rJSWv+wQjmOKMsnNzF3NB8=
X-Gm-Gg: AR+sD12hnxcYYQ2Iuux1o/rHyI6iQmXyjhaoq+xM0FI8N0nReUq3tBDhFRPMaNI0kKD
	eRL79Lkl73PDEeJlFSt8MTLz44zfsNKYdsfZGU6ieouIzw3faTEDA8NsumvPS5vCWCtpx/jRukx
	yetvUwEcX4+ZLafeIrKiJd25r4Dmn7V1vQXAXdSXEWa0u/Xj4VshydRQDwwir29a8HP3H2nwFA0
	C3i0cMU4+bcRHNLnbRNzW0xUuLEJOrixW3oD7oNmmsEfE7PfqichqGmR19N5Fhe/ktQ/LjQhRfi
	6OuduszGTTHZ3B7dRQ9M7MHAvT5j9pXUfP8fLefCGAsHllF9ul5QtkPQKOYIx+rAZ4P5IfSD4l5
	TXIvhmEKYhmPBkmbvU0HVhR7lzTl7oSClINZtqrZUV8G74/IOxVGqZ++4zBUnwmCQJ3WAsyHnOp
	vRvTogsg6y0pZGBQKeE7nQKzW7JQaZJCl0ZpsGHPy573BTWmRW6ELu4WzzPHKn3JKaaYEx+0yzC
	nnuISEm0g1GLPjyGhPMznA5AepK/1zNsNfhmbmegKRIEXBFRlS8mjy+Qec2ecLn0NItaqfoaMv1
	D9YGNiqQHPN6aE8=
X-Received: by 2002:a05:6402:e0d:b0:69e:2d56:690a with SMTP id 4fb4d7f45d1cf-6a14f0bbe0cmr3187654a12.8.1785931483058;
        Wed, 05 Aug 2026 05:04:43 -0700 (PDT)
Message-ID: <bed904b1-792e-4233-86a1-6c38678c9689@suse.com>
Date: Wed, 5 Aug 2026 14:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/xen: fix init of balloon stats again
To: Roger Pau Monne <roger@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Yannick Martin <yannick.martin@okazoo.eu>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Matthias Goergens <matthias.goergens@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20260805094008.95778-1-roger@xenproject.org>
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
In-Reply-To: <20260805094008.95778-1-roger@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nrg9apKmLaIB11gz9qpYEwWd"
X-purgate-ID: tlsNG-4011c0/1785931483-50CCBCFC-E207E094/0/0
X-purgate-type: clean
X-purgate-size: 7677

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nrg9apKmLaIB11gz9qpYEwWd
Content-Type: multipart/mixed; boundary="------------D3cUtnDAbK80qUskmqQx0yJU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Roger Pau Monne <roger@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Yannick Martin <yannick.martin@okazoo.eu>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Matthias Goergens <matthias.goergens@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <bed904b1-792e-4233-86a1-6c38678c9689@suse.com>
Subject: Re: [PATCH v2] x86/xen: fix init of balloon stats again
References: <20260805094008.95778-1-roger@xenproject.org>
In-Reply-To: <20260805094008.95778-1-roger@xenproject.org>

--------------D3cUtnDAbK80qUskmqQx0yJU
Content-Type: multipart/mixed; boundary="------------OE5OoLbEmJF7vthcfOs1YCtK"

--------------OE5OoLbEmJF7vthcfOs1YCtK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTE6NDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhlIGhhbmRs
aW5nIG9mIGV4dHJhIG1lbW9yeSByZWdpb25zIGRvbmUgaW4gYmFsbG9vbl9hZGRfcmVnaW9u
cygpIGlzIG5vdA0KPiBjb3JyZWN0IGZvciBQViBndWVzdHMsIHNpbmNlIHRoZSBpbml0aWFs
IHRhcmdldCBpcyBzZXQgdG8gcmVmbGVjdCB0aGUgcmVhbA0KPiBtZW1vcnkgdGhlIHN5c3Rl
bSBoYXMsIG5vdCB3aGF0J3MgZGVzY3JpYmVkIG9uIHRoZSBtZW1vcnkgbWFwLCB3aGljaCBj
YW4gYmUNCj4gaGlnaGVyIGlmIG1lbW9yeSAhPSBtYXhtZW0uDQo+IA0KPiBJbnRyb2R1Y2Ug
c2VwYXJhdGUgbG9naWMgZm9yIGFkZGl0aW9uIHZzIHN1YnRyYWN0aW9uIGluDQo+IGJhbGxv
b25fYWRkX3JlZ2lvbnMoKSBhbmQgaGFuZGxlIGV4dHJhIHJlZ2lvbnMgY29ycmVjdGx5IGJ5
IGFkZGluZyB0aGVtIHRvDQo+IHRoZSB0b3RhbCBhbW91bnQgb2YgcGFnZXMsIGluc3RlYWQg
b2Ygc3VidHJhY3RpbmcgZnJvbSB0aGUgY3VycmVudCBhbmQNCj4gdGFyZ2V0IHBhZ2VzIGFt
b3VudHMuDQo+IA0KPiBJbiB0aGUgY29tbW9uIGNhc2UgUFYgZG9tVS9kb20wIGFuZCBQVkgg
ZG9tMCB3aWxsIHVzZSB0aGUgYWRkaXRpb24gcGF0aCwNCj4gc2luY2UgdGhlIGluaXRpYWwg
dGFyZ2V0IHJlZmxlY3RzIHRoZSByZWFsIGFzc2lnbmVkIG1lbW9yeS4gIEhWTSBhbmQgUFZI
DQo+IGRvbVVzIHVzZSB0aGUgc3VidHJhY3Rpb24gcGF0aCwgc2luY2UgdGhlIHRhcmdldCBp
cyBzZXQgYmFzZWQgb24gdGhlIGFtb3VudA0KPiBvZiBtZW1vcnkgcmVwb3J0ZWQgaW4gdGhl
IG1lbW9yeSBtYXAsIHdpdGhvdXQgYWNjb3VudGluZyBmb3IgcmVsZWFzZWQNCj4gcmVnaW9u
cy4NCj4gDQo+IEZpeGVzOiA4N2FmNjMzNjg5Y2UgKCJ4ODYveGVuOiBmaXggYmFsbG9vbiB0
YXJnZXQgaW5pdGlhbGl6YXRpb24gZm9yIFBWSCBkb20wIikNCj4gRml4ZXM6IDA5NDljNjQ2
ZDY0NiAoIlBhcnRpYWwgcmV2ZXJ0ICJ4ODYveGVuOiBmaXggYmFsbG9vbiB0YXJnZXQgaW5p
dGlhbGl6YXRpb24gZm9yIFBWSCBkb20wIiIpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyQHhlbnByb2plY3Qub3JnPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------OE5OoLbEmJF7vthcfOs1YCtK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------OE5OoLbEmJF7vthcfOs1YCtK--

--------------D3cUtnDAbK80qUskmqQx0yJU--

--------------nrg9apKmLaIB11gz9qpYEwWd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpzJtoFAwAAAAAACgkQsN6d1ii/Ey/j
bwf/fx2QwqDkGGCIigcGoZhn8yP3B7uDWZ+sZc7Bm1NfMoo/yOxkhdwtrt2Tz6AXVZNRcRiSNMil
aI/cHFD+uTmUapvrFEk8BYKvrg6lJut7jSOIrlGxQgW1ymY3PNRidN3mYLiZMT4jBNIJLfm0a4Kr
yxYxKgZrdc4Je8rqiak1mFCfsbvQZUzcaasimPbr78cfa+ssRXV9Cvhmsdk0fNKcsEyXvO3ugdBY
ewD1FKFt5C60Sv3V9hg6q9BGlwzeDjQimm7z942/kx9xhxsK+8sv3W/wFhxSpRaQwSSsiO20gzlA
OtZTMDPJCc0COKJi+cp1ZQk1MFbCIF+gH2ArpKtlXg==
=TvOA
-----END PGP SIGNATURE-----

--------------nrg9apKmLaIB11gz9qpYEwWd--

