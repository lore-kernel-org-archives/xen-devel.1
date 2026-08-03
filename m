Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA72C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:16:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381516.1625067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtSv-0008VG-Ac; Mon, 03 Aug 2026 14:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381516.1625067; Mon, 03 Aug 2026 14:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtSv-0008V9-7W; Mon, 03 Aug 2026 14:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1381516;
 Mon, 03 Aug 2026 14:16:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqtSt-0008V3-Ft
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:16:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqtSs-000Vfj-Ft
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:16:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a2ab-5cb7-0a2a0a5109dd-0a2a450bce52-36
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:16:26 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a2ba-b7e8-0a2a450b0019-d155d034d556-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:16:26 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6984169c126so5837989a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:16:26 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd455ab7dsm554385966b.58.2026.08.03.07.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:16:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1785766586; x=1786371386; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9zmKpIRJOfwxhVT7o5SfsschrPF9Vp2UNHR3Vo7J7+8=;
        b=G29KKn78HpxbUgJFLcTuU/G9ezHarDKKGzPoZ2GGXzTa2c1AA+pIBPbf5P6X4e6hr1
         VfaphAP0Az8ah/pWfebawQ1DUQ9jCvg9j7kMa/WiPTi+t9ktHX19UDJLxksPf/ETAQhx
         BfxvJooVgCx1QYSkldMxKd1+i2c8PD9cc3MG7ZwLGPcd2oOIJ/ke5R+wc7m1FuCV6pyQ
         ZlJ0u4vOj5JJqPXjgI+XplRunvjZkWjP57IPpIc/xeZgMo5opzgM0/GXPgW5h2eH0yTL
         0tt8oeFDwvErgXgji8DniGc3WUkWxs5fBBo4JnYVh34gGNQxApoPaOyBjBR8axEA6AgU
         SV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766586; x=1786371386;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zmKpIRJOfwxhVT7o5SfsschrPF9Vp2UNHR3Vo7J7+8=;
        b=dQgnvOV2FfOBU2XySuH7WnY9wjsxEV6okKq+dTBs6f+bQecwjXTD5YWy4QPE2U0IDy
         Kvy9A8ea2xyoQ6ilToR0ngG3tTwGsz3854PTW9OCjRFoD6Cnmw9D+4ichE5ffm5TsgGr
         Wpxy3P53Ol25IgpCHnpNT+2k13XylxhKGK1dur0kY0FbFeh0gQv/cUu1iBuk/qHdx6XN
         SZCX305UuWoDCKi+B7JiLfRM2WY9+FHxw1822nMsru1bt70FYsYD23uqImw26Kx1rFf6
         lKa4n75OaKzViIaxJNSoh9cBILm4v3kEJA7074m9RwkDlEbVzynbQdCVor4RkFfyCJju
         U2/Q==
X-Forwarded-Encrypted: i=1; AHgh+Roydl6Jkt1QmKb2O2TqKNATIAvqnuqZwui2jXXMFpuC5va86jXGuxMdJud7qKZLX8BAZoup4eazd0U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb/JlisrugPBJ/Y5E6JNYiaptP5MT5xE6pzWMgPYVBHzo2vr/L
	6De6zYc5clJn2sQZr1dwAGC7xP1Px/yUSuBgTzT4adm1bPl/Fj+CrhyaKba1o3N7fEY=
X-Gm-Gg: AR+sD13VZqLcbt4JTJo0VQsolFhK+6nzYGsCdrMdgXuo6mcrCult9z+p68gvg9Yl0kK
	AMcs8o765zDG5ZuCNz69pmY3EDZExrejNZCTdN0yOOIY23Z7/c3t0VmNHY9yReVwiqKR5cTmqzC
	xHcXPTUbEkey4jCEuLoVZHhcG63uHexO0Qb2S8QlRuIipYuT/x3ongo7wotmcJm8zdRll1lbXpn
	/jHhdD31TuW7tBgEZtH2x76Ub5QRgpJabLunJCC3n/GcPbu1/Xkhn2kcsY/sahnp7toFY7vWQ/a
	Qd8QFDlJhCoIcSHRNt1+gD9lMY9Aa5ykqx1rKhfETuPIPyobkpiLPH6mhzWL2PkVz+AaQxBi0Sf
	whHhzB07mMIlUQe3fKBf96ZCslIed67SGvcL0m58NffsQfzC77hmi0WwjtN//d5G9BXPCRCkRR2
	OqujY2PVCITGhxkQQRHPLjp07WbWIeSZMrfDCELyIro6DW39l57EJV8BgVx2bK1xG7CkXSIa9Ma
	VU5yGmkzf6li0uUbvDeY7fIYB/lysvg5ZxwrtOuY90HENm6fr1zZZ0seJJCxALszIx3ICi52f/y
	kT4IpCXBkU/KdGs=
X-Received: by 2002:a17:907:db01:b0:c15:cfb4:6a6 with SMTP id a640c23a62f3a-c1fe816c171mr848842166b.30.1785766585905;
        Mon, 03 Aug 2026 07:16:25 -0700 (PDT)
Message-ID: <862428ae-e706-4300-9eff-d55db42e841b@suse.com>
Date: Mon, 3 Aug 2026 16:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/xenbus: log more information when device state
 got reset
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4RlqZjK6tRdeNjWmWmqFkmOH"
X-purgate-ID: tlsNG-42698a/1785766586-18CCF9EA-48D2CD05/0/0
X-purgate-type: clean
X-purgate-size: 6452

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4RlqZjK6tRdeNjWmWmqFkmOH
Content-Type: multipart/mixed; boundary="------------M8zyK6hx8ej1F0xDZaNfD0nJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Message-ID: <862428ae-e706-4300-9eff-d55db42e841b@suse.com>
Subject: Re: [PATCH 1/2] xen/xenbus: log more information when device state
 got reset
References: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>

--------------M8zyK6hx8ej1F0xDZaNfD0nJ
Content-Type: multipart/mixed; boundary="------------1FvQFrZLlUfEjHgTmLcxY5wr"

--------------1FvQFrZLlUfEjHgTmLcxY5wr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjYgMDU6MDgsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gRWFzZSBkaWFnbm9zaW5nIHdoYXQgYWN0dWFsbHkgY2hhbmdlZC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNp
YmxldGhpbmdzbGFiLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------1FvQFrZLlUfEjHgTmLcxY5wr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1FvQFrZLlUfEjHgTmLcxY5wr--

--------------M8zyK6hx8ej1F0xDZaNfD0nJ--

--------------4RlqZjK6tRdeNjWmWmqFkmOH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpworkFAwAAAAAACgkQsN6d1ii/Ey9s
Kgf/V4G7MjXBhRqRA7cRQIYPI151zhTJOQc1Q7MZzibRI5Nb6tN+diWzCGnEoCXOJ9fHUKppBtzt
w9BgEYrmWtMRG+jM1itBKMdC83vOX5ik0WJumFNlntYHBNV55D2aQSwNt6xpq4XfKcEafYjvQi2a
cNuxv5ex8NK8/9UFpifeOAFqouarh02Qf95WmXX7JcsHKUUpcI/LHXqfoK6Y9BS5gieTFTAp3a8P
sy2cZG/soaRTkQ9junw5Z3Yl7aOPITi+zE1xDK/r1afxEwCmUHx+zPv3C0DyjP0z/kRsZ4YV2GD9
xn9lQ68FslYXfponE8FIKuAk27Mo8FC5xUDXq5T/Xg==
=vh3K
-----END PGP SIGNATURE-----

--------------4RlqZjK6tRdeNjWmWmqFkmOH--

