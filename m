Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0AC54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 06:42:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377175.1623367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpKSx-0000oP-Aq; Thu, 30 Jul 2026 06:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377175.1623367; Thu, 30 Jul 2026 06:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpKSx-0000oI-7n; Thu, 30 Jul 2026 06:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1377175;
 Thu, 30 Jul 2026 06:42:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wpKSv-0000oC-NS
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 06:42:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpKSu-00GUwL-D0
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:42:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a6af22e-bab6-0a2a0a5309dd-0a2a450cdf0c-42
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:42:00 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a6af238-f479-0a2a450c0019-d155d02cf1bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:42:00 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-698bf053053so2631946a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 23:42:00 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fa8bb6d1asm31931166b.49.2026.07.29.23.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 23:41:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1785393720; x=1785998520; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XdILCz3HzNS6K1cZxxHGlFj5a1gayuOryuynKm/+HRk=;
        b=g/rk5vP100jFg8Dg1wONFbe5ur2nOgAHk7QEhOA51N/lBvJmLsjhqw78TV+JXPIQlE
         /8vIJYDy3344xB2TwFcYiXMDT3Rhw8H2uJJs8bRLl2GkkcvOD5QYFJ0PznYRAfn/PSBi
         tdLD38PVrJ52dvRQ4Ibn4RYnfMLtdnAyPKiZJcqfJPV7lec62ZsD+0/cR4KGbQloS5aj
         9Dj4iP9FDMgu5wSrDk0ZDG6SFFbFxLfq+fu6laOtM3NN/f8sNQHbJQISqNRW3aiFM51U
         jpAg9JYYw/luNtnF0t0IzaCYMHkkQbfYTlDhi4Ae9HcqQXwoCrKD8v/zjvxxI8axBXZV
         KB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393720; x=1785998520;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdILCz3HzNS6K1cZxxHGlFj5a1gayuOryuynKm/+HRk=;
        b=I+eI8ITEZJKixwmI5eiUPiyw3r7uqWPyJDEaFLAS1jknuwNPuc0+OS1CBJK3wmBdqa
         lj9jKWX8C+WOvFRI3VGbLJ3cW0aHVcKyBCfNeBKmSfTC1r+jst8nifXCM7BcLGmsWLaz
         cFxKJgebRUEM7lB05tVyFcs3Wg3jafb/toPm1JxTetFU2N/ofujzJEpN/XYrSpUUa/os
         TBkutwXxQQ+6YEGY7+jDeBNEQ7GME4vnfrG+ohCBnx3B6ujcvlIf4k/b6ZG7k4X9qXZj
         7bI8/NLBfyfJnXCi7CDmhVCho+YtnUZ8brV7SxAu1Ynuh6+fvryRExLlDEXua/aRd4M4
         fJdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWz2EVMxlv1MAvHr2qGkud2qCygxpSlcTGs+dyi6tlQ3nvucVNUFZ89L7phFDIPuzUPuj1AyxDH5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+Hr50Zs5ZjTzP6bVsh3+p6hp6EGoH947rGT2/gdgCaxHuRLKt
	D+C7GqTDt0IYyd5xkszpptdg+05IX3ErM7ruAFF5rn/z379HyWoL7fT8rCDGE7dxqPg=
X-Gm-Gg: AR+sD11uJmdFtCfJ3U0O3mr0fAPBbeFXyHkHjQ7tED0gnpSUMUDtA7/BOape8Qj2rBU
	fffTevVmIasAGVRWLGKHa6idOLr+BOILgxw7kkpgKIAiGynt/WdXfOxhBg3AqC4thndgjtjuPwF
	xC0r+5KzDT7ZvhRClrha7IwvB1czy7cBetgWs29YR10Hx4caNXzOxC2d8iPqzTNIVRQG59vfPnb
	WzmDpViiJzdJ0AbGzYn3LVO3N7nurXL/iXMgXLRVcZB7U18jlvqrQIEWcYlIyPMAqMswY2Uf0EK
	TEiTLIL5ya9v2HgkYGfOC+vphihVI52El8qTN12Ua176aDX6sC0nqyvtXGzR6dlrLgdl0VRJcqe
	z7lbECIeAKE5uyYPdrOqKxCTej6L05zWSPWP3rCBOIMv0mIgmRpAK+/RODzyqdYPHfjcCRxjgQH
	F2XUcAFIzB7G7oawYXWKSAl6n2F/nUj4nffohDufprAo3r27ffTLwe71k1Lgv+jPXO6LtPTbnxw
	AWqPhGu6ZgWakZ29OACV3v03iJ31tOTnpA2i4402AM4gVApA9NpXYEu6LtVSaIrybJ0ZHi7ke7q
	xt9KGkhU1s/v//A=
X-Received: by 2002:a17:906:9f92:b0:c16:9ca5:e551 with SMTP id a640c23a62f3a-c1fa55d53c2mr66861566b.14.1785393719662;
        Wed, 29 Jul 2026 23:41:59 -0700 (PDT)
Message-ID: <3694fde6-de06-4cac-afe7-67997c821aa1@suse.com>
Date: Thu, 30 Jul 2026 08:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] keyhandler: add handler to show Xen command line
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
References: <20260730061459.2702672-2-dmukhin@ford.com>
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
In-Reply-To: <20260730061459.2702672-2-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xSsCY0u64o4PEmF5C55DNxbs"
X-purgate-ID: tlsNG-d25034/1785393720-50321A5B-2F891B3B/0/0
X-purgate-type: clean
X-purgate-size: 8472

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xSsCY0u64o4PEmF5C55DNxbs
Content-Type: multipart/mixed; boundary="------------27xILhdRyeNGgR5Htm2iTYxP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
Message-ID: <3694fde6-de06-4cac-afe7-67997c821aa1@suse.com>
Subject: Re: [PATCH v1] keyhandler: add handler to show Xen command line
References: <20260730061459.2702672-2-dmukhin@ford.com>
In-Reply-To: <20260730061459.2702672-2-dmukhin@ford.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------27xILhdRyeNGgR5Htm2iTYxP
Content-Type: multipart/mixed; boundary="------------5jcl0AxCdUCDWYCPlZ8Y83vu"

--------------5jcl0AxCdUCDWYCPlZ8Y83vu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDcuMjYgMDg6MTUsIGRtdWtoaW5AZm9yZC5jb20gd3JvdGU6DQo+IEZyb206IERl
bmlzIE11a2hpbiA8ZG11a2hpbkBmb3JkLmNvbT4NCj4gDQo+IEN1cnJlbnRseSB0aGVyZSdz
IG5vIHdheSB0byBwcmludCBYZW4gY29tbWFuZCBsaW5lIG9uIHRoZSBlbWVyZ2VuY3kgY29u
c29sZQ0KPiBmb3IgZGVidWdnaW5nIHB1cnBvc2VzLg0KPiANCj4gQWRkIG5ldyBrZXloYW5k
ZXIgJ0MnIHRvIGFkZCAoc2F2ZWQpIGNvbW1hbmQgbGluZSBwcmludG91dCBmb3IgZGVidWdn
aW5nDQo+IHRoZSBzeXN0ZW0uDQoNCidDJyBpcyBhbHJlYWR5IHRha2VuIGZvciAidHJpZ2dl
ciBhIGNyYXNoZHVtcCIuIE1hbnkga2V5aGFuZGxlcnMgYXJlDQpyZWdpc3RlcmVkIGR5bmFt
aWNhbGx5IHZpYSByZWdpc3Rlcl9rZXloYW5kbGVyKCkuDQoNCldoYXQgYWJvdXQgJ1gnIGZv
ciAiR2VuZXJhbCBYZW4gaW5mb3JtYXRpb24iPw0KDQpUaGlzIHdvdWxkIGFsbG93IGZvciBh
ZGRpbmcgbW9yZSBpbmZvcm1hdGlvbiBsYXRlciwgbGlrZSBlLmcuIHBoeXNpY2FsDQptZW1v
cnkgc2l6ZSwgbnVtYmVyIG9mIENQVXMsIG51bWJlciBvZiBhY3RpdmUgZG9tYWlucywgZXRj
Liwgd2l0aG91dCB0aGUNCm5lZWQgb2YgYnVybmluZyBhbm90aGVyIGRlYnVnIGtleSBmb3Ig
dGhhdC4NCg0KDQpKdWVyZ2VuDQo=
--------------5jcl0AxCdUCDWYCPlZ8Y83vu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------5jcl0AxCdUCDWYCPlZ8Y83vu--

--------------27xILhdRyeNGgR5Htm2iTYxP--

--------------xSsCY0u64o4PEmF5C55DNxbs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpq8jYFAwAAAAAACgkQsN6d1ii/Ey/B
EAf9EVOfjjZqxZnxLMHECjMGkXt0kdxm0VblICj+CNvSaSJNZg+WGTvuLqmsGVjX61j4g3mPBlLv
6QRNUSPiLxrDYG/V1LXob1WpwS/br8mjxSpN1trqQFe2speofvDg4eGG19PB0ethYWw7FFg8mp6z
OIHorAd0PnF6J7rqtyllLlOUk2pvtSNU0IyrTjI7AaiHZpzg2Rlz5TEMDNWCXoQLLiax9I4ehorg
JJv8t31ZDaNGvuB5s0gSyFD5x2JmWFIFBqdNG7Hg7ibHWDQPzjf9NyRflGkBkFUoMD32n7KoWydI
Zh/1YA4A7Q7KXMeGYzKIPel1lfPTlBW6ymVaRsp3bg==
=KFSM
-----END PGP SIGNATURE-----

--------------xSsCY0u64o4PEmF5C55DNxbs--

