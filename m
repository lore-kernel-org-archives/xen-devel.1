Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A364C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:56:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383074.1626333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXPq-0006JX-5g; Wed, 05 Aug 2026 08:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383074.1626333; Wed, 05 Aug 2026 08:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXPq-0006JQ-2Q; Wed, 05 Aug 2026 08:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1383074;
 Wed, 05 Aug 2026 08:55:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrXPo-0006JJ-L9
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:55:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXPo-00BKzZ-1r
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:55:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72fa83-bab6-0a2a0a5309dd-0a2a4506cf2e-44
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:55:55 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72fa9b-195a-0a2a45060019-d155d030bd83-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:55:55 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6983f20a8bfso1163729a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:55:55 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a166335dfbsm1118557a12.14.2026.08.05.01.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:55:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1785920155; x=1786524955; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ymuh0DcPl2Ots+UHLDeP+fBlqnU5QkdY5IPw7VnqIzk=;
        b=ZJRagDwMfDjEig5odpzlSC2iUk7DCuJihQLqODAvkSPcUZ3zw78qo7p6pYLAl2t/y7
         kW6dt1edRcRaKRpxbOOWw9hMYf32I/qxjDmgayDxhXtNfEi/+qhbIIptd4AR5t6Rv/a+
         FdJegkC7nz9KfSfPzNF7qTiUKdvaOCFZbO3WieIFOlzNAvUGzIEVYmL35RNmri3xhYOA
         oo+eS/3Qz5q2GMy/Z5Kei7PkunJZ1W7f3I1Hk5bYMsUDijjW1xbXCrgEiqOsInhlgA1Z
         tO4Mey+oZ8f0PeUKYC5+wwBo4EJ4/FlmgCsR5I+odaV60wmRMVEBn0oRiYpZRkcnf3i4
         438w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920155; x=1786524955;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ymuh0DcPl2Ots+UHLDeP+fBlqnU5QkdY5IPw7VnqIzk=;
        b=kGV2TKQdGkj3KC5lnyntRSVlt4YbyJ3PlV34k4enHNDyNilk3E7oq9cg2RFCeWQWmk
         RXFNGMli2eB61RrUKOjIr1SG9NoxZ/IBDo/ftnFMYdl1xq7iO+IJZj3jJcdPMK12p86D
         4SxongwG6fe6ayWmKYHRSmxVeSX28tFQMEJSKL1w2rqeYU5zgV871FgMv8tFb327ZBCp
         e/61vB3Obw6Jf6sYVrlWwj/GpqDZmMZ1saY/a3vuSj7u5Vqf/cGJOXDL3wj/siyfudoh
         ITWTOqrFyHz3eYlRbssHh3HU7dWA1QUb39iVC23L24RZZIUgzHvktGza9yCh6EV7W6ab
         EgNw==
X-Forwarded-Encrypted: i=1; AHgh+RovcqL1L1YCrHs7l3qYVP0h4t6AVmWFd64rBRnTx2x2xs2GeUZSqmXvjdOeX8UWtc6Mc4C9Cfk1xK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGSnXa5ZeLRt8MjLURXGyh5yFuilA96O5WZMG9gPiQrY8mpGxo
	GoINcNIQsxf0kchCkP+adFsdL6LTytoZMrFR6s9LizvF5utfVI6OBLDCv/LhwM5WKDE=
X-Gm-Gg: AR+sD13wgU6g6UHkv9UD0nknC3dWlprYnoV062KGlh8kODkj+QR3vosmIrhAsOAXNiN
	sykZl+T+8gsfrxg679xMBCbGTq3S5i/+4RXsr3a6qT1JY5cW488HlAwc5g5ThXMiXgM+Si0pR4d
	NMXbbAZwxyxH365jkS0sBPMsjDC37ihVafuQrJXdAGXoT14R1BoaXgOumPJFVxoq/Gl6OkxraCi
	zqwTh0OO3FH2SpOFYngSO38Kjlh/fBeUtSsae/DryjTzJEFSuogoKc97O5HQ0AbLDiIJpEFo/wq
	gqFPKf/UARyJwL3Tz4w5h5jg00Yj1M/bGr9h1ogjZslRUfAU3a0kwlXMX64v7K/k7xh+Y4OyCXJ
	EkL9WusBi0fOitGiDUzxewhugYukXU1WMaWrRlE3eP7Jj7ydbN71Yy30HS6v4j8JV/A2/5bHYVD
	whfdoZeRd/uQNxjR/wZ63OmtAVhpP4rUR+vHbtZosPbSjPcT9cYI8r+6XtrpGJElGJ6jH/yrOyt
	dkkk7F5z2c+iQYMJ1J++hlzQ2CzZmROyfsOXoPiEn8dGG+TaGITZzyURkwjjp+CaVMTXIYL4301
	iMIoN0HZhB612hg=
X-Received: by 2002:a05:6402:4550:b0:698:3dd2:6802 with SMTP id 4fb4d7f45d1cf-6a14f13c034mr2005116a12.12.1785920155301;
        Wed, 05 Aug 2026 01:55:55 -0700 (PDT)
Message-ID: <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
Date: Wed, 5 Aug 2026 10:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
 <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
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
In-Reply-To: <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3An0i0jnKJ9M07xQcN6POwJ4"
X-purgate-ID: tlsNG-16d1c6/1785920155-F70C777B-7686AAAA/0/0
X-purgate-type: clean
X-purgate-size: 9485

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3An0i0jnKJ9M07xQcN6POwJ4
Content-Type: multipart/mixed; boundary="------------4WW0qjN3x6DNZ0llnQU8epAf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <5febc2c0-4355-48d9-9342-52d590041500@suse.com>
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
 <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
In-Reply-To: <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
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

--------------4WW0qjN3x6DNZ0llnQU8epAf
Content-Type: multipart/mixed; boundary="------------U7EZUbIJg56Wv00dnzU6nCTX"

--------------U7EZUbIJg56Wv00dnzU6nCTX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTA6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOC4yMDI2
IDEwOjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvYXJjaC94ODYveGVuL01h
a2VmaWxlDQo+PiArKysgYi9hcmNoL3g4Ni94ZW4vTWFrZWZpbGUNCj4+IEBAIC0zNyw4ICsz
Nyw4IEBAIG9iai0kKENPTkZJR19YRU5fUFZIKQkJKz0gZW5saWdodGVuX3B2aC5vDQo+PiAg
IG9iai0kKENPTkZJR19FVkVOVF9UUkFDSU5HKQkrPSB0cmFjZS5vDQo+PiAgIA0KPj4gICBv
YmotJChDT05GSUdfU01QKQkJKz0gc21wLm8NCj4+ICtvYmotJChDT05GSUdfU01QKQkJKz0g
c21wX2h2bS5vDQo+PiAgIG9iai0kKENPTkZJR19YRU5fUFZfU01QKSAgCSs9IHNtcF9wdi5v
DQo+PiAtb2JqLSQoQ09ORklHX1hFTl9QVkhWTV9TTVApICAJKz0gc21wX2h2bS5vDQo+IA0K
PiBTaW1pbGFyIGlzc3VlIGhlcmUgLSBpbiBhIFBWLW9ubHkgY29uZmlnIHNtcF9odm0ubyBk
b2Vzbid0IHdhbnQgLyBzaG91bGRuJ3QNCj4gbmVlZCBidWlsZGluZy4NCg0KTm90ZSB0aGF0
IEkgZGlkbid0IGNoYW5nZSBhbnkgZnVuY3Rpb25hbGl0eS4NCg0KSSBhZ3JlZSB0aGF0IGl0
IHNlZW1zIGEgbGl0dGxlIGJpdCBzdHJhbmdlLCBidXQgaW4gdGhlIGVuZCBJIGJlbGlldmUN
CnRoZSBjdXJyZW50IHN0YXR1cyBpcyBva2F5LWlzaC4gUFYtb25seSBoYXNuJ3QgYmVlbiBz
b21ldGhpbmcgaW4gdXBzdHJlYW0NCkxpbnV4IHNpbmNlIFhlbiBzdXBwb3J0IHdhcyBhZGRl
ZCwgYXMgUFYgd2FzIGFsd2F5cyBtZWFudCB0byBiZSBhbg0KYWx0ZXJuYXRpdmUgdG8gYmFy
ZSBtZXRhbCBzdXBwb3J0IHZpYSBwYXJhdmlydCBwYXRjaGluZy4gSXQgbWlnaHQgaGF2ZQ0K
YmVlbiBwb3NzaWJsZSB0byBidWlsZCBhIGtlcm5lbCBub3QgcmVhbGx5IGZ1bmN0aW9uYWwg
b24gYmFyZSBtZXRhbCwgYnV0DQp0aGlzIHdhcyBtb3JlIGxpa2UgdGhlIGFiaWxpdHkgdG8g
YnVpbGQgYSB4ODYga2VybmVsIG5vdCB3b3JraW5nIG9uIGFueQ0KZXhpc3RpbmcgbWFjaGlu
ZS4NCg0KSU1PIHRoZSBYZW4ga2VybmVsIGNvbmZpZyBvcHRpb25zIHNob3VsZCBhbGxvdyBm
b3IgYWRkaW5nIFhlbi1zcGVjaWZpYw0KZmVhdHVyZXMsIGJ1dCBtaW5pbXVtIFhlbiBzdXBw
b3J0IHNob3VsZCBhbHdheXMgaGF2ZSBiYXNpYyBIVk0gc3VwcG9ydCwNCndoaWNoIGluY2x1
ZGVzIHRoZSBYZW4gc3BlY2lmaWMgcGVyZm9ybWFuY2UgZW5oYW5jZW1lbnRzLg0KDQoNCkp1
ZXJnZW4NCg==
--------------U7EZUbIJg56Wv00dnzU6nCTX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------U7EZUbIJg56Wv00dnzU6nCTX--

--------------4WW0qjN3x6DNZ0llnQU8epAf--

--------------3An0i0jnKJ9M07xQcN6POwJ4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpy+poFAwAAAAAACgkQsN6d1ii/Ey9l
6wf/W3HihkA9Uswmcrucb7tqvb9cOHanp54LuaclrG8FpHgmia/XK9kqYKucq8x/PjndxPRRw7iR
tOMrc8W+tFk+XoFiPSL20Py+7dy8Gx1QVCCnCigJtCZB2lQNI5kem5MHtHz67Tfeol5ECFyI4QcZ
RTyT+QOQzr1I0lZkFOjG7XJSneJxE+w+p5bS6kkoL3hW+MX3Jg2r/ZMlJGKkSS1Ox229E5FdLYhM
worPO50+LlSCLD7yv3dsOCl5UtTFgLJhucCae9ETY6SGYEguxWR1/73YNOHC4rSBGkWVDSFIlHYR
BahBO/dX9OJjLhhhfcGUhITJJA7rF1BLqz2AY+ZPRw==
=GhTB
-----END PGP SIGNATURE-----

--------------3An0i0jnKJ9M07xQcN6POwJ4--

