Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EF7C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:51:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366683.1616630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlpKo-000667-4i; Mon, 20 Jul 2026 14:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366683.1616630; Mon, 20 Jul 2026 14:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlpKo-000660-1i; Mon, 20 Jul 2026 14:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1366683;
 Mon, 20 Jul 2026 14:51:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wlpKm-00065u-D2
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:51:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlpKl-00C6pT-QE
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:51:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5e35c9-e002-0a2a0a5209dd-0a2a4509d848-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:51:04 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5e35d8-be1a-0a2a45090019-d155d035b024-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:51:04 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-69e5f8a193bso4814770a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:51:04 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69e700055a8sm4688280a12.28.2026.07.20.07.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 07:51:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1784559064; x=1785163864; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n9RYpcFqmsoIc1HMRe8YLrIc4YNMb0nBJ8I8pp/B1sk=;
        b=MRKRt4eIqMne0We9q5sn2tdfesBJHHAUnLnmtSk/vsylJtoi2jvnPyeVjv9Gxt4zKI
         i+fe1w/rlOfQ+sDZuHu3lqpDsn6c3MUoL9wSudb6a4iBeOpGRx6EVgKFN1S+i85NdDAo
         56bYgeYICOy9ClGsFMVBDibGN+DzjyWLZ3M1NcdcWqCHz0mxaCzBXm4XZJ0nYpZfXQrh
         fF+9kjLLcEsgeNTbgJ9DZPhruS5b6CHX2xPhVPh8UOobrRmssx8OjbOb73l0zWhxfVWE
         4XhLh+5HpMnRZqgStpXeDOuvGpi7icsqJqdmkdfau/XLEE9qZqFLLcIUclE/oowDvJN4
         BEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559064; x=1785163864;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9RYpcFqmsoIc1HMRe8YLrIc4YNMb0nBJ8I8pp/B1sk=;
        b=MJAJ9LgmzfQwP/chjnGxMutXKSvar8Sm4kiBYl5IrxPppSJVLB6Dgw5ddnflE9ochs
         f3P5Q3VU5XXAZ3t2iy4CIayfoL1071AwhT2TQ0xU9Vm2nVawCVJOklbO4+dvIsHuxlWl
         XVRdwRYFlbOeF1Qqra8XMLzNBaTcv5t65kG6pWSF1peYVVyuWGbpvIY05KkpCvD4FpZx
         LboZX+1Tn0+1F7X61dUiwIfdCigDJpQ7VQmSDDB4V8Rpqdo4aODbQAS3vJrXrpQWZLIF
         /chdsp7kslZaFyk11ShpljqhU7t2oXaSBzsASXnn1Aumd9GxLAZd/LvtmbHDVZEhacQ0
         8r4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rowl2Z3GmGysqbhX2IVTPqxNiaDXnAIVTtP/HEchoPkLfxL22g/zOjWu/9GYdr0Q8EJuN7gzoKWjtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnAJWOZamjTPfJhnqXo8p8YwesifQDYKRcaAhcYAuoJtXrVFzh
	nVGXjmV8Cq1A9jUWK8J7a6TKZ1I+pjo+ISSYfPrpgwV0dyHebu7rsHueoEtkJ46D6Y4=
X-Gm-Gg: AfdE7cllZgel6wwYIS8zWySiIlB2ZW1fNthR4GFZ8W3/2WRAYZt/93f2VRuKhPYcbCM
	r6VtrDMtFsbtnEVIrddcB7QfCtcfIOAVPSilKx9gqqoIMnx4QPnU4RwUuEdHK5+sLBWScTW+mDO
	Z6wGKVd9HRxL7kxRO9eiUsX6bfiGal/ZQFx0LATL0cOTq8ZJMOsqTrZTT+Slk6YxIBDFBjt0Z16
	dteK2483pFD8lK5/WtTQDbi8qW+QzrA6vPeoK4QopG4i2nnltxSb2HVXy7aj9tNM1FEo8f4xEPK
	1FvaoBcJroeZkpuqf0vaVqxHrfunQRmXzHPsEyY49qArkLINwxTFn0p2j82Ks/lY0D41n2/ZHQp
	Dw7pNhwFpibIitOss6bAYfZCw7TtdNYoIep4qbYG4UogiIT+5ajKAqim904GwrluYXuHDa8GPGH
	7Fc/psMy57xXe85UgS0VxsKGLe4v2oJydF2ApaaEY9ydtH8fw4swIuqmyrM+J0EaSYGsjrak2MA
	OdQIglHua1uVUd++WZai7pUzhYIk/Zl
X-Received: by 2002:a05:6402:4402:b0:69c:9197:4413 with SMTP id 4fb4d7f45d1cf-69e652dfccemr5648070a12.36.1784559063677;
        Mon, 20 Jul 2026 07:51:03 -0700 (PDT)
Message-ID: <8325bdf3-5c6e-4894-82ae-9cbe4c1b583a@suse.com>
Date: Mon, 20 Jul 2026 16:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260720081833.4122182-1-jgross@suse.com>
 <1784557340.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@vates.tech>
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
In-Reply-To: <1784557340.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uG0R09MFqjRUdXlCPgTSdVgX"
X-purgate-ID: tlsNG-bad1c0/1784559064-BD2CC034-032E030A/0/0
X-purgate-type: clean
X-purgate-size: 9798

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uG0R09MFqjRUdXlCPgTSdVgX
Content-Type: multipart/mixed; boundary="------------utpEe4a0oshVnjz33ACGh00g";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <8325bdf3-5c6e-4894-82ae-9cbe4c1b583a@suse.com>
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
References: <20260720081833.4122182-1-jgross@suse.com>
 <1784557340.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@vates.tech>
In-Reply-To: <1784557340.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@vates.tech>
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

--------------utpEe4a0oshVnjz33ACGh00g
Content-Type: multipart/mixed; boundary="------------xhK9UbBtdJ3xWRREiT42r0NM"

--------------xhK9UbBtdJ3xWRREiT42r0NM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDcuMjYgMTY6MjIsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBMZSAyMC8wNy8yMDI2
IMOgIDEwOjIwLCBKdWVyZ2VuIEdyb3NzIGEgw6ljcml0wqA6DQo+PiBUaGUgZ3J1Yi1wdiBz
dHViZG9tcyAoMzItIGFuZCA2NC1iaXQpIGFyZSBkaXNhYmxlZCBieSBkZWZhdWx0IHNpbmNl
DQo+PiBzZXZlcmFsIHllYXJzIG5vdy4NCj4+DQo+PiBSZW1vdmUgdGhlbSBpbiBvcmRlciB0
byBlbmFibGUgcmVtb3ZpbmcgcXVpdGUgc29tZSBtb3JlIGNvZGUgZnJvbSBYZW4uDQo+PiBJ
biBjYXNlIHNvbWVvbmUgaXMgcmVhbGx5IGRlcGVuZGluZyBvbiBncnViLXB2LCB0aGV5IGNh
biBlYXNpbHkgdGFrZSBpdA0KPj4gZnJvbSBhbiBvbGRlciBYZW4gYnVpbGQsIGFzIHRoZXJl
IGlzIG5vIFhlbiB2ZXJzaW9uIGRlcGVuZGVuY3kgaW4NCj4+IGdydWItcHYgKGEgdmVyc2lv
biBidWlsdCAzIHllYXJzIGFnbyBoYXMgYmVlbiB0ZXN0ZWQgdG8gc3RpbGwgd29yaw0KPj4g
d2l0aCBjdXJyZW50IDQuMjMgc3RhZ2luZyBYZW4pLg0KPj4NCj4+IE5vdGUgdGhhdCBhZnRl
ciB0aGlzIHNlcmllcyBoYXMgYmVlbiBjb21taXR0ZWQsIHNvbWUgYWRkaXRpb25hbA0KPj4g
Y2xlYW51cCBpcyBwb3NzaWJsZSBieSByZW1vdmluZyBzdHViZG9tIGxpYnBjaSBhbmQgemxp
YiBzdXBwb3J0LCBidXQNCj4+IHRoaXMgd2lsbCByZXF1aXJlIGEgbW9kaWZpY2F0aW9uIG9m
IE1pbmktT1MgZGVwZW5kaW5nIG9uIHRoZXNlIHBhdGNoZXMuDQo+Pg0KPj4gQ2hhbmdlcyBp
biBWMjoNCj4+IC0gbW92ZWQgb25lIGh1bmsgZnJvbSBwYXRjaCAyIHRvIHBhdGNoIDENCj4+
DQo+PiBKdWVyZ2VuIEdyb3NzICg1KToNCj4+IMKgwqAgc3R1YmRvbTogcmVtb3ZlIHN1cHBv
cnQgZm9yIGdydWItcHYNCj4+IMKgwqAgc3R1YmRvbTogcmVtb3ZlIHN1cHBvcnQgZm9yIGJ1
aWxkaW5nIGluIDMyLWJpdCBtb2RlDQo+PiDCoMKgIHN0dWJkb206IHJlbW92ZSBidWlsZGlu
ZyBvZiBsaWJ4ZW5ndWVzdCBhbmQgbGlieGVuY3RybA0KPj4gwqDCoCBkb2NzOiByZW1vdmUg
c3RhbGUgc3R1YmRvbSBlbnRyaWVzIGZyb20gc3R1YmRvbS50eHQNCj4+IMKgwqAgdG9vbHMv
bGlieGVuZ3Vlc3Q6IHJlbW92ZSBNaW5pLU9TIHNwZWNpZmljIHBhcnRzDQo+Pg0KPiANCj4g
V2UgcHJvYmFibHkgd2FudCB0byBhZGQgYSBjaGFuZ2Vsb2cgbm90ZSB0byBzdGF0ZSB0aGF0
IHRoaXMgaGFzIGJlZW4gcmVtb3ZlZDsgDQo+IEZlZG9yYSBhdCBsZWFzdCBzdGlsbCBidWls
ZHMgdGhpcyBjb21wb25lbnQuDQoNCkkgd2FudGVkIHRvIGFkZCB0aGUgY2hhbmdlbG9nIG5v
dGUgb25seSBhZnRlciB0aGlzIHNlcmllcyBhbmQgYW4gYWRkaXRpb25hbA0KY2xlYW51cCAo
cmVxdWlyZXMgYSBNaW5pLU9TIGNoYW5nZSkgaGF2ZSBnb25lIGluLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------xhK9UbBtdJ3xWRREiT42r0NM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xhK9UbBtdJ3xWRREiT42r0NM--

--------------utpEe4a0oshVnjz33ACGh00g--

--------------uG0R09MFqjRUdXlCPgTSdVgX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpeNdYFAwAAAAAACgkQsN6d1ii/Ey9i
lAf8DojcC+VEKoEO11jOFleI4NMjr5fYdzV+xc7Mc9Zk7XwpSz/3I/WMrpUx9ACQ/eUnggC7xocL
wfENEHjev2HpbSP/gvbPoL6fKAHY4bCIMCKTlH839OgpYlibTyBViI9NzZ9H4gW1gFmTnZr2OqHO
/kcySy5oe1CsaOHgp2NEKGnapetslxGgfs2eaxZRrYsT6TLTzjCmHnIx4fpbFPzAU/INrXLxhGDU
GNqJ9jbwFDHkCr7CM5M5lOIlzJomA+q9QMrNJuelW8PBSJPnogGoTEZgDXPyYYq3p3COZE+twVw6
ynTiMCVycEisDUESj32bcarzxcmjT+BRxqym06x5SQ==
=5jb0
-----END PGP SIGNATURE-----

--------------uG0R09MFqjRUdXlCPgTSdVgX--

