Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF161C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 10:56:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384586.1627459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrvlP-0003xH-FD; Thu, 06 Aug 2026 10:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384586.1627459; Thu, 06 Aug 2026 10:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrvlP-0003xA-Af; Thu, 06 Aug 2026 10:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1384586;
 Thu, 06 Aug 2026 10:55:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrvlO-0003x4-FH
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 10:55:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrvlN-00A61n-SW
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 12:55:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a74682d-2eae-0a2a0a5409dd-0a2a4507b530-20
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 12:55:49 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a746835-b4ea-0a2a45070019-d155da36c597-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 12:55:49 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c1c24ec9525so325530266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:55:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c203642435dsm235407766b.44.2026.08.06.03.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 03:55:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1786013749; x=1786618549; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xWlyahj/sMjy6rjl58blxQkLJ8D2LwIzxmQQ1iH7RK8=;
        b=cRTT9L98pyCyyGRAr6yVPOiK359gWpF2b2nft3GqSddxkIar1MIPIknJvbS7TK4jKP
         855O6hhyrnn9JbUFEdPRuK1VMURhRrqrZMQ+R/19Mgx3wkx1fp1D7upSMdg0frNJm+aO
         4Ve/2h8Ry44MtgLBNBToUYVKBtLNkHZVCh7zNJ5RnywA1wZfV6Ow3lHFINjqx0EcBQ4L
         M5J15y6VJXw4jrMutQ4yN5WibrLsCrHxzxzmI3Wp7fUSuPdivxgU3D1ZHb4RqmmLkzFF
         IpVcCmxYXQmPdIS3iPwc7NoCzKRq0W9CEq+N2/Ox0XkPSBdilKlecl7r41+g3d+ejUo6
         N5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013749; x=1786618549;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWlyahj/sMjy6rjl58blxQkLJ8D2LwIzxmQQ1iH7RK8=;
        b=UdWe0/toFAPhcrvHMCcydKwLlAE6RXxOx1FwP2v8FLedSF/3EuSOthbWxjNG89uctu
         WwZdQBL0TxAnBvSz7o9juh2NKjTqh1yaB4xGdz8lio5Df/9BCUi3T22YknlENoMhgxls
         QzwMc2ZVicwoF1heX9c28VxenwguEnyg6yd641isGFa9ojBIpzuzrZgCIpz7th4f4tsb
         ezABykdD17dNl61DKLG/jBO4JgWaQemeRUSnOWH+ykpb8uuvCY2cIEEZWkRYDzTSM2vB
         FyDimyMwNA+w5OI5SUe1Or6zyS86So/renk3PZFKRYutbSkH3F7wFiNwiAYQcCuMqj++
         PpWg==
X-Forwarded-Encrypted: i=1; AHgh+RpInJmP+NdGVN9CIhpjf2PobKusA9KkfOcWT4oEuZ9fApm5WeywJObR0hLQzG/jGI6z0DkZOajJp3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeDmjqe+aaY2CjhJnf6s4iviTKRpX8nbEyAf11afn/ruSEAPpx
	oigzfLhtMwBATTq7JsEyEA+T63d2GothCdklqL03fNNvHfRlu/li4KOmSeeqbfkxyg0=
X-Gm-Gg: AR+sD12NeMn0m1dmIB1CInzMIbI73CV6fYoGnPmMzbY3b0S6ggmoOpWmTDaWDQ/JYkt
	TC4j7f6PyyCIlPMmAbNWdslHfzJSeGnbytPilIwv0ioXWgHvTjqbbGO7Tz1EFSWhMvI/oIJA2Lx
	4Vl9X7IMqzfmNlxla4uCa2Y/LWieBlU73UUryIf2DZguh8/0qHzb5QmWsEOvrMTDOnGIj7bfi0o
	aOre6Wp4nLcQhhSxoI+98Mi0idhWPCSk8FaZgSVI8n5SC2Ammswl0OlOAeqI1z6mAQ9gZmvfj4f
	fiA5GZWpO8I85OY+Z8khI8rpYtyMbD/QBGbyOAev2Pe5+lME8WhvM4u5pxLxE3UipvQH6QJtRjK
	/4w5ZWHHr8BZ4sXbEUKhYn1We/zl0//45WTVgfjBtm7PqTPZArvyNFdEggzIoIN/PlPwYxPVm9t
	iEVNYW9WgRcYCHQXqSnVD3XJLwro/defxF5bUv4uoYgDoz/cIIhDf5apXzhyAiBFDM4WNVGIe45
	cHcK1kmCvGniHuPYortlCEQCrqne5wOVg3dPv+DISUzGH2KpS8Ch81dhgWvL9PrhgBa+fJbR/kn
	CKyAcGx6oWVb7IPilmOtX41eNUE=
X-Received: by 2002:a17:907:97d3:b0:c15:e33b:8c4d with SMTP id a640c23a62f3a-c2039ad16a9mr695343566b.4.1786013749295;
        Thu, 06 Aug 2026 03:55:49 -0700 (PDT)
Message-ID: <083db883-558a-4000-b404-bf170c8309ee@suse.com>
Date: Thu, 6 Aug 2026 12:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jane Malalane <jane.malalane@citrix.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260806015233.202486-1-jason.andryuk@amd.com>
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
In-Reply-To: <20260806015233.202486-1-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gzu0resIcHTErGXU9L6jffqY"
X-purgate-ID: tlsNG-ef75cf/1786013749-A7AD0AE4-1F58DC6E/0/0
X-purgate-type: clean
X-purgate-size: 7261

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gzu0resIcHTErGXU9L6jffqY
Content-Type: multipart/mixed; boundary="------------L5O05nTVmBw2yqdmWVg9WV73";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jane Malalane <jane.malalane@citrix.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <083db883-558a-4000-b404-bf170c8309ee@suse.com>
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
References: <20260806015233.202486-1-jason.andryuk@amd.com>
In-Reply-To: <20260806015233.202486-1-jason.andryuk@amd.com>

--------------L5O05nTVmBw2yqdmWVg9WV73
Content-Type: multipart/mixed; boundary="------------dAXaIYIpph80x9DFkCdb7Wm8"

--------------dAXaIYIpph80x9DFkCdb7Wm8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDguMjYgMDM6NTIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEFsbG93IGRpc2Fi
bGluZyBYRU5fUFZIVk0gZm9yIGEgUFYtb25seS4gIEEgc3R1YiBpbiB0aGUgZXZlbnQgY2hh
bm5lbA0KPiBjb2RlIG5lZWRzIHRvIGJlIGZpeGVkIGZpcnN0Lg0KPiANCj4gSmFzb24gQW5k
cnl1ayAoMik6DQo+ICAgIHhlbi9ldmVudHM6IEZpeCB4ZW5fc2V0X3VwY2FsbF92ZWN0b3Ig
c3R1Yg0KPiAgICB4ZW4vS2NvbmZpZzogc2VsZWN0IFhFTl9QVkhWTQ0KPiANCj4gICBhcmNo
L3g4Ni94ZW4vS2NvbmZpZyAgICAgICAgICAgICB8IDggKysrKystLS0NCj4gICBkcml2ZXJz
L3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQoNCkkgZGlkIGEgY29tcGFy
aXNvbiBvZiBhIGtlcm5lbCBidWlsdCB3aXRoIHlvdXIgcGF0Y2hlcyBkaXNhYmxpbmcgWEVO
X1BWSFZNDQphbmQgbXkgcGF0Y2hlcyB3aXRoIFhFTl9QVkhWTV9HVUVTVCBkaXNhYmxlZC4N
Cg0KVGhlIGtlcm5lbCBidWlsdCB3aXRoIG15IHBhdGNoZXMgaXMgNiBieXRlcyBzbWFsbGVy
IHRoYW4gdGhlIG9uZSB3aXRoIHlvdXINCnBhdGNoZXMuDQoNClNvIEkgZG9uJ3Qgc2VlIGFu
eSByZWFzb24gdG8gdGFrZSB5b3VyIHBhdGNoZXMsIHdoaWNoIGNvbmZsaWN0IHdpdGggbWlu
ZSwNCmVzcGVjaWFsbHkgYXMgbXkgcGF0Y2hlcyBoYXZlIGEgbmVnYXRpdmUgZGlmZnN0YXQg
b24gc291cmNlIGxldmVsLCB0b28uDQoNCg0KSnVlcmdlbg0K
--------------dAXaIYIpph80x9DFkCdb7Wm8
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

--------------dAXaIYIpph80x9DFkCdb7Wm8--

--------------L5O05nTVmBw2yqdmWVg9WV73--

--------------gzu0resIcHTErGXU9L6jffqY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmp0aDQFAwAAAAAACgkQsN6d1ii/Ey+b
ZQf/eR48/c6KEp1olIh7+JTTsmH0G/RHs3eVKzlrAUmx17yAJxXhxEBiCbNuFtTdpRc4SFAWWi2d
XLjAxZtiokcZc5oGlpwzz/wgcoKdlAmbUeEdUHo/dHPeWh2SHHK51pEPMq0QCr/mawOqo85QqtGp
hG0KNePaAbCA7n/sQWbU5ZBmZ7dZfkpK/bksP5KWv198P4M4QsdAIV+xZnzGLf5ffnV8e7LjGu+j
j3QLat8JdlvwVnI14qguA8Ce8D9GQopQXd497qZqGhLWtP7UZWxSLU2FVVGL0I2LN7XFsVbTDJqm
+WltejLIAw3PP+bhWWUuu7eWKoonlNWr0jlf50QEDA==
=Bbn+
-----END PGP SIGNATURE-----

--------------gzu0resIcHTErGXU9L6jffqY--

