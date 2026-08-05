Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF54C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 07:18:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382904.1626180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVtX-0008Qe-WE; Wed, 05 Aug 2026 07:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382904.1626180; Wed, 05 Aug 2026 07:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVtX-0008QX-Su; Wed, 05 Aug 2026 07:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1382904;
 Wed, 05 Aug 2026 07:18:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrVtW-0008QR-Nn
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 07:18:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrVtV-002tHM-Ls
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:18:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72e3bb-5cb7-0a2a0a5109dd-0a2a4509d8b2-24
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 09:18:29 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72e3c5-be1a-0a2a45090019-d155da33e9ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 09:18:29 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so103074166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 00:18:29 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2036276e58sm83701266b.28.2026.08.05.00.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 00:18:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1785914309; x=1786519109; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=esFyuAFubsfqFMhJEZXWNUGl8u3Au7VYmA42/rCClR8=;
        b=LAnQ3dNRtmsPr7y9exiEhdmXeDktO4PfTS1cAyTXS2iRN83vXxvc+dS0HiBeosItPp
         ztTnD0GhiSAVrZTwENN2vR0uDFMJ0V8Mt0TEkZti+BeU4HmFiwB+z1UKbBDxGdb04WpS
         p8CRTyGo4w8JyYHaQ0cH79b3GDfhPJuVFGlZpjfmbNy7/m5HH/x7Mr+Crl0jGA3MZsL9
         wj9aEVvpwXMCpjpRMq9gMTNNobqh9Or+GdYzhScChR8J6vaqfdwFNpE6+4BP+mCaoJrD
         5/5YtvnxTIripaY5qNwpORQp58u7H3jE5ookrmuEe9h2XUWbjnivM46oO5bAzLma3rED
         YPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914309; x=1786519109;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esFyuAFubsfqFMhJEZXWNUGl8u3Au7VYmA42/rCClR8=;
        b=Kn1IJnZtSPJk2ceJcADVrxewEUHfYU7GpRIGUndtgWFCqjafIgaubwkaWcL6z7KUm6
         gQRmU+f8n5UYroAafoEyYq2cp4MXjk78rUArxyGbAKUN3bfFvwZKLvSQEF3qeEQzCNSH
         xO4qNDkQjLp4my2STmgMsyavnUE25+V689fejWD4jN+YfDTt1B8jbmJvFoGNyFECCHAJ
         J0UuzqHbUP+d+14BOiJ1BrvP9CgwxR0sULUSPPTn/CO/ZZRysj1DtX+uD0m4T4qXqiQ/
         3TR6K/wOFKYne7j8OwUHZthzPk2LoA9GlF0b06d+V9I8WICzvau9kUJJkZIM6CtPCEbU
         +k8w==
X-Forwarded-Encrypted: i=1; AHgh+RpUvL8wNfL58mlCsBEhRFrBK38AhWzguYPbQsA12kWk/Iwf+0foXq01CkN6PlPotS4bqBgRXfvWW6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEKhSx8wKojE7CXAtmuaOLriBNA0wwBWiMx6bZ/2Hvg/bFFXor
	oF8YdsX8SLhAFuKIpyai5Anfa+ktK93aWdqJXGAzOtHgnxcxWqmVOP91o8dzYPkeqD0=
X-Gm-Gg: AR+sD116znp8lTbs3C4XBqXIZym+u8CVqyi6bFF1rVFFbrTpvX/AlWLRXBfAf6MBOiG
	BUM+P0xK27myszfi3caYutChGzwq900fjxGTxrGmj/t/6/Tvz1mk10aixMefdmVmFUXsicbkmRJ
	ne+Ey7m7LlJ0RkRx2fvcPzNIMA1W1wVkKC7RXy63pmcSdlcKh9/cwFeDTEKGWHQ2ir8DBW3GEN/
	1fd03VrG6pDJPp9ObTO8rVXAwBkqDKDRUs70L6VQRUffTSeO/D1CERd7Z3X0chj/K3I8QSkJHBG
	F6CaGyw6akRTGkUxxXq68r6wQnalEW3J9/rQpWAkcpfWLxJsQmURyMZ2kguTx8GlDFqwUp2eH3f
	RYI64ZXRSoSablD4Z36S3FYUEf1iseMAcrMrpZ4DAWVBwUG16MC2wNZzvc5zQqKjLPBGuAMD9sX
	Vspz7RfijU+J6Y42x7JPVfQw4tEZARvAeJz4S49f1ro2tWyxI4aXWBpXXE0FYOXuP5T8TZfQnvN
	ePR04UF3JZtnsdff/f6TN8Tb0a0o6GDcILHMaa9Zgx4ZKKgvkWE64aiXENJQBgBtXagFWfvCxM9
	rPfbAM1K3uRbLrB++1LF7cGRTA==
X-Received: by 2002:a17:906:eec4:b0:c1c:2ee9:5e6d with SMTP id a640c23a62f3a-c2039c39717mr221970566b.17.1785914308967;
        Wed, 05 Aug 2026 00:18:28 -0700 (PDT)
Message-ID: <affa78c9-4c19-460d-89a1-0e84cada1c52@suse.com>
Date: Wed, 5 Aug 2026 09:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the xen-tip tree
To: Mark Brown <broonie@kernel.org>, Val Packett
 <val@invisiblethingslab.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <anITNOG1qicdE-TI@sirena.org.uk>
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
In-Reply-To: <anITNOG1qicdE-TI@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L7qBEoEZ6lPklBnqZkcGdVog"
X-purgate-ID: tlsNG-bad1c0/1785914309-3A8D9034-236C979F/0/0
X-purgate-type: clean
X-purgate-size: 6658

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L7qBEoEZ6lPklBnqZkcGdVog
Content-Type: multipart/mixed; boundary="------------ZcgnOy51QMT7gJN76OXrlRf3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mark Brown <broonie@kernel.org>, Val Packett
 <val@invisiblethingslab.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <affa78c9-4c19-460d-89a1-0e84cada1c52@suse.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
References: <anITNOG1qicdE-TI@sirena.org.uk>
In-Reply-To: <anITNOG1qicdE-TI@sirena.org.uk>

--------------ZcgnOy51QMT7gJN76OXrlRf3
Content-Type: multipart/mixed; boundary="------------qchc6mwxCU6mnmvcmLbmokzs"

--------------qchc6mwxCU6mnmvcmLbmokzs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjYgMTg6MjgsIE1hcmsgQnJvd24gd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+
IEFmdGVyIG1lcmdpbmcgdGhlIHhlbi10aXAgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1
aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4g
RVJST1I6IG1vZHBvc3Q6ICJpbml0X21tIiBbZHJpdmVycy94ZW4veGVuLXByaXZjbWQua29d
IHVuZGVmaW5lZCENCj4gDQo+IENhdXNlZCBieSBjb21taXQNCj4gDQo+ICAgIDY0ZDI2ZmIy
YWQxZjIgKHhlbjogcHJpdmNtZDogZml4IGlvZXZlbnRmZCBjcmFzaCB1bmRlciBQViBkb21h
aW4pDQo+IA0KPiBJIGhhdmUgdXNlZCB0aGUgdHJlZSBmcm9tIG5leHQtMjAyNjA4MDMgaW5z
dGVhZC4NCg0KSSBoYXZlIGRyb3BwZWQgdGhlIG9mZmVuZGluZyBwYXRjaCBmcm9tIHRoZSB4
ZW4tdGlwIHRyZWUuDQoNCg0KSnVlcmdlbg0K
--------------qchc6mwxCU6mnmvcmLbmokzs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qchc6mwxCU6mnmvcmLbmokzs--

--------------ZcgnOy51QMT7gJN76OXrlRf3--

--------------L7qBEoEZ6lPklBnqZkcGdVog
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpy48MFAwAAAAAACgkQsN6d1ii/Ey9R
7wf9EnPpdhTlTSVTBo1XfcO3WLaKMCfAgydfl0DD0cEZZj9aFaRzq+tF8ImI6z0Fv6wjjacd/uX/
46sX/I8Pe7iLweHDhkW1F5/0TFutOTy8Mi2zQMQ0geK7F8gVHV8Hl/jBpZ2boYlqlMiU0nUzqOYb
YKS9aoqJ3HtholZxj4BoOcigsqojd7912AZ+pEiiEF5OVTyk/QfyunOvXmk3qQ/KjqAdwezEKU3Y
sy9iQABE8SZSwXcQQSn/0Vw4DjlzUk1KwpgMou/VhGKY0Q8Dd3OZdnswMMlggZtjrP6uxnzjaR+w
01iC1kheI/gztx4Hhf6wHFB4dS0888S66aR0QSjw2Q==
=NrhC
-----END PGP SIGNATURE-----

--------------L7qBEoEZ6lPklBnqZkcGdVog--

