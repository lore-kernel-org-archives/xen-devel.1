Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2880C55179
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381521.1625076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtTL-0000RV-H6; Mon, 03 Aug 2026 14:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381521.1625076; Mon, 03 Aug 2026 14:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqtTL-0000RO-ED; Mon, 03 Aug 2026 14:16:55 +0000
Received: by outflank-mailman (input) for mailman id 1381521;
 Mon, 03 Aug 2026 14:16:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqtTJ-0000R3-Sj
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:16:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqtTI-005cGg-TQ
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:16:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a2c5-2eae-0a2a0a5409dd-0a2a4507bab2-44
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:16:52 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a70a2d4-b4ea-0a2a45070019-d155da2ced76-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:16:52 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c15cf78d1a2so407034366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:16:52 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd4454321sm537745666b.31.2026.08.03.07.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:16:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1785766612; x=1786371412; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2tPYjDuAYCYdNaJq4I9qGJyfSrpnRvk91bWPEkVR1nk=;
        b=EDgd2SrWvzhq8buZhuYuzrEiEmbwfvaWd2Zq0jIzm8nFrMd5/YJsB52bUoqbwXacuU
         0aWXppOqzq8nSbDF6ZrVvWkfnAkkonh2Arj+Xd/mj8dp48DTFlNHi0GbCSgiY/FrSI6L
         ATMxmgOAgES8H9JapvlKAyb/TCkdOeAQdGCi1w8abU0732iPT3jrAV4hI5hxzOG12Be9
         bO0bz7gfyP9f78VOWZkzTZj7uGBWVDx7F9yVVg8otAUV3nP6/fPK3daA9HAEQPti8p+O
         4e1iJQGO5nf08he24e7EL8ndlQ3AuOYXn/gCqOvtmJxMW74saUmTIuoU3fp9PAEjvpC2
         KB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766612; x=1786371412;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tPYjDuAYCYdNaJq4I9qGJyfSrpnRvk91bWPEkVR1nk=;
        b=E4zKDGrJA/8BFMyE1eg1gdp35ExkwQUyUsAqKXCQTyJ+2UTopF7Q9MnZhTbq7Lyhac
         8XhYDVlc3bv0sAhW5jOZ1UMrEmuypbTZSkfuwrf96MU7M2tVmETd2bNemHKjxL/djJwf
         bXLuqXXB5zdJRh5mIl3z2u7Dz7s+nwkf52qkT4Z8kxVmpVDNyQjbd5LL9Je0WiAGQnVa
         T5WSQ9tihXVGzi5GG67JSWOM8O+aThKzBHzmx2vtwteEI4SLamNzobfGc1bHPYYv5MeW
         wEln+TCrF4/0q8exMOarWDDE+k3xyLTwyF767iN+I/sFCuCiKROsyFrbF8+4edsZsZ9L
         PDQg==
X-Forwarded-Encrypted: i=1; AHgh+RoHKdWNxQvacuQIIRdciCeNDjzD2pUO05PKfJxetdGFC9UwqrEAGxyKUa2kO1dJOAYpj98K5JTKCUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzup9LZT27UezuhOacVFG5AgxMcxw/XcUD4K1ZYmGcDQTZrGuzO
	EC/MSlS6IlhtSk2Ku1YXTzb483YF2vJ7W05ltte7R29E6dS/tXgsCmQCfzaOF9MTFMY=
X-Gm-Gg: AR+sD12wAS/tPVRG0vqcqwR+8i5q8CN3jfuJMGSIOJFwOP810OaGRInKhPKSzZKw6ud
	psjBlHThcYs3ajvSm0t3NGzFYHJYH5HqwZ2skSAXD9Sot9QMhXb2ACKZ+ZnJKf94iKyz5i5U/4E
	R+tlaTBbo80+uK0HDiSsKALfKpnaNjJlFVAeLyCdcOJ9RYp1hh2sKbYlI5paemuGrRT/jO5ZUvR
	eoQ7r6PSjd1FI4EvhgbUNYn7AGZNRzzRThqnc9QIM3MUh/DEWnkFBVH+RJpC4Ff6lXolSXSrHRG
	Nr81SnGAoOcoqkVO7jSGNDX2HXhvKfEXMXmB1CliIpBpnN29vQO1UxilC0gxfQ7g1/WyT1iVXhP
	rI6qVd5eeq/kaW1qkZIOwCaRDgAMCrGStmWuNH4eGkThV7j+HsegPQ+vD4zjZb7sYkVAKw7jmIC
	wmvbSF9QGGlU3RvsTtEqalVrG1HTHqh35KCiQl3Qn7iTaGrv7KvVUvaiubDQqpoldA2PQv1P8PT
	FOxz4wLvZP/clgtHuBtIHCr3AswssiNWqzOvGGbYPJLfOOz/SNqeQzjfoahEDHGXTyPOqEZGEZj
	kS+AuED4svNHa5A=
X-Received: by 2002:a17:907:3e24:b0:c16:1a00:3feb with SMTP id a640c23a62f3a-c1fe7eec66dmr989728066b.15.1785766612172;
        Mon, 03 Aug 2026 07:16:52 -0700 (PDT)
Message-ID: <68379ceb-85a7-4d86-aa05-00766b4d6da3@suse.com>
Date: Mon, 3 Aug 2026 16:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/xenbus: check otherend_id only after it has been
 initialized
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
 <20260803030822.4104093-2-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20260803030822.4104093-2-marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Np676FD9hdO4V5vtfRruHXLO"
X-purgate-ID: tlsNG-ef75cf/1785766612-A66DAAE4-D371476D/0/0
X-purgate-type: clean
X-purgate-size: 7591

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Np676FD9hdO4V5vtfRruHXLO
Content-Type: multipart/mixed; boundary="------------HYR8tqeqAMQWvqblcxL6iSaN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Message-ID: <68379ceb-85a7-4d86-aa05-00766b4d6da3@suse.com>
Subject: Re: [PATCH 2/2] xen/xenbus: check otherend_id only after it has been
 initialized
References: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
 <20260803030822.4104093-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20260803030822.4104093-2-marmarek@invisiblethingslab.com>

--------------HYR8tqeqAMQWvqblcxL6iSaN
Content-Type: multipart/mixed; boundary="------------xBoTws2zYZvW03IxmXVfJFNO"

--------------xBoTws2zYZvW03IxmXVfJFNO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjYgMDU6MDgsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gV2hlbiBkZXZpY2UganVzdCBnb3QgaW5pdGlhbGl6ZWQgKGZvciBleGFtcGxlIG9uIG1v
ZHVsZSBsb2FkKSwgdGhlDQo+IG90aGVyZW5kX2lkIGZpZWxkIGlzIGluaXRpYWxpemVkIG9u
bHkgYWZ0ZXINCj4geGVuYnVzX3JlYWRfb3RoZXJlbmRfZGV0YWlscygpIGdldHMgY2FsbGVk
LiBJZiB4ZW5zdG9yZSB3YXRjaCB0cmlnZ2Vycw0KPiB4ZW5idXNfZGV2X2NoYW5nZWQoKSBi
ZWZvcmUgdGhhdCwgaXQgbWlnaHQgY29uc2lkZXIgc3RpbGwgemVyb2VkDQo+IG90aGVyZW5k
X2lkIGZpZWxkIChub3QgbWF0Y2hpbmcgYWN0dWFsIHhlbnN0b3JlIGNvbnRlbnQpIGFzIGEg
c2lnbiBvZg0KPiBkZXZpY2Ugc3RhdGUgcmVzZXQuIEl0IGNhbiBoYXBwZW4gYmVjYXVzZSB4
ZW5zdG9yZSB3YXRjaCBhcmUgaGFuZGxlZCBpbg0KPiBhbm90aGVyIHRocmVhZCAoeGVud2F0
Y2gpLCB3aGljaCBjYW4gcnVuIGluIHBhcmFsbGVsIHRvIHRoZSBpbml0aWFsDQo+IGRldmlj
ZSBwcm9iZSBydW5uaW5nIGF0IG1vZHVsZSBsb2FkLiBJbiB0aGF0IGNhc2UsIGl0IHdvdWxk
IGNhbGwNCj4gZGV2aWNlX3VucmVnaXN0ZXIoKSwgd2hpY2ggd291bGQgZGVhZGxvY2sgYWdh
aW5zdCBkZXZpY2UgcHJvYmUgZnJvbQ0KPiBtb2R1bGUgaW5pdC4NCj4gDQo+IEZpeCB0aGlz
IGJ5IGNvbnNpZGVyaW5nIGRldi0+b3RoZXJlbmRfaWQgY2hhbmdlIG9ubHkgYWZ0ZXIgZGV2
LT5vdGhlcmVuZA0KPiBpcyBzZXQgKHdoaWNoIGhhcHBlbiBhZnRlciBvdGhlcmVuZF9pZCBp
cyBpbml0aWFsaXplZCkuDQo+IA0KPiBGaXhlczogZTJkY2Y5MDY1NTM2ICJ4ZW4veGVuYnVz
OiBiZXR0ZXIgaGFuZGxlIGJhY2tlbmQgY3Jhc2giDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0K
DQpKdWVyZ2VuDQo=
--------------xBoTws2zYZvW03IxmXVfJFNO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xBoTws2zYZvW03IxmXVfJFNO--

--------------HYR8tqeqAMQWvqblcxL6iSaN--

--------------Np676FD9hdO4V5vtfRruHXLO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpwotMFAwAAAAAACgkQsN6d1ii/Ey//
HggAmKerqd0ZKg0S7g5eb6J9TTXeuOhucdi85EdBRUmVgzfUGSpehy8fMSuix01V9s4AWmbFwBu0
Wjs5pu2Z1W2J6m5kduTsNqU7S5hQ8Hkpuk5obLb18yg6o4aMR4ZzC1dlHV0uWmmfLr6yoEssvY7K
P5Fp5Cys4xAi0Q6gi0MCC/9gkbDR4Ykm4vmN1Tl2E4PCe+WbPwogtjIj9LunF0sk1AsOOXduqhFW
tqz2B1cwu+u/qhQRgwR+qXenip25ScMAtl9nZKNqo/BZwHRCbnf4dP+2cvi0dd6FUXaQn69F/slW
v4DBcz9e9wBxykk4gQRmzZcsffCcyrwdl25tSduAlw==
=Gvk9
-----END PGP SIGNATURE-----

--------------Np676FD9hdO4V5vtfRruHXLO--

