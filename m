Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB88C5518F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:11:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381498.1625049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtNn-0007Mf-Dy; Mon, 03 Aug 2026 14:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381498.1625049; Mon, 03 Aug 2026 14:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtNn-0007MY-BL; Mon, 03 Aug 2026 14:11:11 +0000
Received: by outflank-mailman (input) for mailman id 1381498;
 Mon, 03 Aug 2026 14:11:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqtNl-0007MS-Qq
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:11:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqtNl-00F6Hu-7R
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:11:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a170-e002-0a2a0a5209dd-0a2a4501c246-30
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:11:09 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a17d-5984-0a2a45010019-d155da29d80f-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:11:09 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c197e7e4e94so600011466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:11:09 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd466271csm586500966b.60.2026.08.03.07.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:11:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1785766268; x=1786371068; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uuFRCL7uyGFk+NUBtcHerZxA349KsV1wcoysKkIK15g=;
        b=NCWJEphprSXKrxPagfR0bqFkw0oH4KIU1/aDqptyB+Wzyh9Q+Bp2p6ilBwNix/N6QG
         ukouWCirGkSDueieU9Bp56N/45xyrG5N36IpwAt9IRsYGLk8Ib/7TX5vUqHlPOGIbPp9
         a3rrUHU3uZ2iGBGG/KZSTTrGmOeL7rVqEITCS+RW8o696PpLeYS7MZFm9waVBqbWN/W/
         dnvdlBO3U4Hr3sy2pSxZwL0Lfu2dWFmweHZd4iPaChHJFTTOPA+bdgNFQlJ4L1tdaTMr
         ANJJw/Ewk1cx9melKvSaEHa0jWjxfK9ThRDNWI3+wWqRNEqntKESSD5BD0OfJ+0PI5O+
         9wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766268; x=1786371068;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuFRCL7uyGFk+NUBtcHerZxA349KsV1wcoysKkIK15g=;
        b=fgc18GCG1UyQxAu/wQHTe7SOwC+X5vQuHf19+OWjcpHmcvCox/766LrzxdwWvMnTRK
         Ks0ONiqZZPrxvZYvsMcO+z0iOpiGR5xBuIES0bm0hMM1ejaiijEXOiJf5eTbYG8pK4Sf
         HL67hgNhhqsDYUr7xrJA/JjUQp1rU7Korb8p7htAUevxHfZKQA3n0ZT+0CQm/NkRVfEz
         H3HFAIBoUchhztESkHQi3VeCqvDBQ4f4TwY4eLn+AVc+p0XeKTR1h6G6VSW2rCA5Z5VU
         kNRAdH/bmpNnIV90YYhE9K9AVO7E9bL+Khme8GzZcdVCkG1ctcrxuI9+7x3MIPvmAZ4E
         ZOiA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+9LViEgAyWRI4CeZemqBetx8AYGhN7I55H18VhhXqu5FEpS5r9miBFIcYQ0BvBl/aGtOzt8MhaHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzakfviNKMvYJ9yFG/jIp82Po3SmMhh94Xxth/sOvitq+0NsbIN
	0QLaLXW199tXbuyk9oKj3QNR0iHm8ZuqGe2mSPcwOQI85rybgqL5Ak3cXIPoJP2CEr4=
X-Gm-Gg: AR+sD1114PC0Jw+VRaRMKvC081/PU555AKEWInJeQkQB+lS+LUIg7dUDftrY6vuPmFa
	IYg4wFH8CDFR7+pHsik5pJdAOM6sFo9SDHeCuWg9Y3Pbp3iN8vr4asOcUwX43E8mmkIcObDPd5b
	b/nndL9G9BIYAe8XK4eB05HvjILKYVFYAuaFUAEnVmFarpaq6oO4MPLjNJWZup7nLCGCB4yPzG0
	t4dQ6XobLlry6rdtp9gZ2ehGA2CEFykgLe2oSR7TQ8wQ9+s1y29cq9190cnaAOB68zNe2BHH/fC
	LtfOti87yvBfgZCupbUnib7JNjGUPhEokcIoJuJ9eblYYjVZA04IwyUz3JrkcHNDM3CyWHmVSf0
	xf8C/JhM/zsRikGjJbpp7uVAVjiBJHTmOBPVKMtji2QS8RStr8rX7i87Yyna7vBGPvOuZvQCALW
	q7+oHI48AyoUThaqPt19/v+mBno/Znc3PdIdU+B2rdw8TBp++ljFOxoX2c/tf+DF4++dy5uSsuI
	hVK1ZObUcgwFCeh5qdnozHw19Dw87Cw/bL2YeEfj9nkw9Y+JCflD/8/uUDb/qTc427lq0vTOjgw
	YIZvA/xSeJCRavXh2JratB//dA==
X-Received: by 2002:a17:907:da15:b0:c16:2dc0:e1ef with SMTP id a640c23a62f3a-c1fe7ee26f5mr869611266b.14.1785766268469;
        Mon, 03 Aug 2026 07:11:08 -0700 (PDT)
Message-ID: <8b5d403c-e77a-45cb-9e3c-d6ccc8ea7a20@suse.com>
Date: Mon, 3 Aug 2026 16:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: privcmd: fix ioeventfd crash under PV domain
To: Val Packett <val@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
References: <20260708082934.16038-1-val@invisiblethingslab.com>
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
In-Reply-To: <20260708082934.16038-1-val@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1AXnnEZdKSQIDXhChQCpZZ8V"
X-purgate-ID: tlsNG-d62444/1785766269-BDE78757-0F716071/0/0
X-purgate-type: clean
X-purgate-size: 6791

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1AXnnEZdKSQIDXhChQCpZZ8V
Content-Type: multipart/mixed; boundary="------------jjPFIGwq8ny90GlEvD0bObib";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Val Packett <val@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
Message-ID: <8b5d403c-e77a-45cb-9e3c-d6ccc8ea7a20@suse.com>
Subject: Re: [PATCH] xen: privcmd: fix ioeventfd crash under PV domain
References: <20260708082934.16038-1-val@invisiblethingslab.com>
In-Reply-To: <20260708082934.16038-1-val@invisiblethingslab.com>

--------------jjPFIGwq8ny90GlEvD0bObib
Content-Type: multipart/mixed; boundary="------------3t26jS1XeIREdEEEzFWgOEUG"

--------------3t26jS1XeIREdEEEzFWgOEUG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDcuMjYgMTA6MTgsIFZhbCBQYWNrZXR0IHdyb3RlOg0KPiBTdGFydGluZyBhIHZp
cnRpbyBiYWNrZW5kIGluIGEgUFYgZG9tYWluIHdvdWxkIHBhbmljIHRoZSBrZXJuZWwgaW4N
Cj4gYWxsb2NfaW9yZXEsIHRyeWluZyB0byBkZXJlZmVyZW5jZSB2bWEtPnZtX3ByaXZhdGVf
ZGF0YSBhcyBhIHBhZ2VzDQo+IHBvaW50ZXIgd2hlbiBpbiByZWFsaXR5IGl0IHN0YXllZCBh
cyBQUklWX1ZNQV9MT0NLRUQuDQo+IA0KPiBBdm9pZCBjcmFzaGluZyBieSBoYW5kbGluZyB0
aGUgUFJJVl9WTUFfTE9DS0VEIGNhc2UgaW4gYWxsb2NfaW9yZXEuDQo+IFBWIHN1cHBvcnQg
cmVxdWlyZXMgbWFwcGluZyB0aGUgdmlydGlvIGlvcmVxIHBhZ2UgZXhwbGljaXRseSBpbnRv
DQo+IHRoZSBrZXJuZWwncyBwYWdlIHRhYmxlcywgc28gZG8gaXQgb24tZGVtYW5kIHdoZW4g
UFJJVl9WTUFfTE9DS0VEDQo+IGlzIHNlZW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWYWwg
UGFja2V0dCA8dmFsQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------3t26jS1XeIREdEEEzFWgOEUG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------3t26jS1XeIREdEEEzFWgOEUG--

--------------jjPFIGwq8ny90GlEvD0bObib--

--------------1AXnnEZdKSQIDXhChQCpZZ8V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpwoXsFAwAAAAAACgkQsN6d1ii/Ey/U
DAgAmd+R/wiU6Lccg8jX9tw5WrYHgjVRd99YLcspiEseAHZsU4BLHRyV8hSKHyR/ATE6m4shUuly
OsgYSf32bvicsIHYOiDbJ4XGkF8w7KItltBOv9QUYImxtaT5iQ/FkC2vuGEzkbubqXPQ9glUnK3K
7Kbh2+FzdkDLPJi12zgYaUWh43Hcqs0vbx/3uYjU0Vv0TVSVoUUx+dbA4R2j7qQUK11hRY0PfpX3
8JErwCCGhoxGQrYQFSKRf/Cjjx1Ki9NGOpfGDSWmVYRnRgKFeGZG0ClYO5e4GPbRg+BeP3xCH5tQ
N9AAdG7HnOPj8UGJulZGa4TGD8X6BS8/fjE+hhKd1w==
=xYVH
-----END PGP SIGNATURE-----

--------------1AXnnEZdKSQIDXhChQCpZZ8V--

