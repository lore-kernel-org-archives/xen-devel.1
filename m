Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A784C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:57:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416633.1645603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50p3-0001Ol-RA; Fri, 11 Sep 2026 12:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416633.1645603; Fri, 11 Sep 2026 12:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50p3-0001Oe-Nx; Fri, 11 Sep 2026 12:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1416633;
 Fri, 11 Sep 2026 12:57:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x50p2-0001OS-Td
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:57:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50p2-00E9zX-AD
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:57:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3faba-8faa-0a2a0a5109dd-0a2a45099388-28
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:57:40 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3fac4-be1a-0a2a45090019-4a7de48cb253-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:57:40 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254fa663c1so117060466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 05:57:40 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29660654e4sm74658866b.30.2026.09.11.05.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 05:57:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1789131460; x=1789736260; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2ZiLHVaNmzXwUpXIHPIqZPZKWeplSxgooX+AchZzHA=;
        b=CpBWUrLG92OVTrKyG5lmUr3ySHPtQG3gVVjPYp4PikG3vFVKzaZ/TSKyAOtBumkGKl
         XI/Oc/kPM4geNMFnzLp0PpxVrdzMJjyBMvaMQVkCYUnSGljVY/s/YJJ9Pf7eQuPZaSRR
         1qWK7LQc+D1IQDD19p7BU8oUMcZU4I0khb0zq/j2nutZFn14y9SjEFTzqbQCDy28HOYk
         ZPbz2YgImFKHPtcLrfIVezjHKNtkcqvKBzWaDqXfxlUYW5cDAr4OwyAidcAZwlqYr8PQ
         CWrW5dJSChuaG45fwISdYLQ09K5BpuQpQqybiHl5ryv7jPh9cMpYO70aOKwgTN6Nhgh+
         QIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131460; x=1789736260;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2ZiLHVaNmzXwUpXIHPIqZPZKWeplSxgooX+AchZzHA=;
        b=Wz2Ho2rlvFJExjMsTBdVce/TD7JhdloUtBQiRH5SCiRSp6JfKRNB1qPy6FnaqjMpVB
         wQpCS/BeHn+rFaSU4jhAiZK0Y1L+pzKgHVJpKt2EVn0zEq93XR0lrwT4hjMgx97IJa3a
         nsXXCxDqRROXFgsuSIMWdDXtxzlcQWuqFa/71Q0v7l6Eq9ERPhR7pxU4bEn3djn43quu
         zZglBS0jOS9dASgVdymWighJ0dEL52Dp+EJYrFrarqXtAe3JUTkLkFkzbYZ0OQzx8Jfj
         D4aEBc11nR/FiQs3It2eieirxg2QMc4DHauN++BJQsVyJY2kYMAfkcRPqEtHu9KRsQaP
         2ByQ==
X-Forwarded-Encrypted: i=1; AKwUvByz5+9gGeFHPrhXw5PmMNnPbD1Lvr7oLa4F00SJmzcIC04kSSoOZCEjYTjNd2jDpSBo0/8sE+wHTWA=@lists.xenproject.org
X-Gm-Message-State: AFuF++nHmvfP9c3E3mlnBlEMw8xPwKp8nMQR5qmlJquLLUnsMQB1xc1r
	07vJIT6R5fc9vqt48e99DGXmPLzD3huQKiObznwrrum5veIILmetnZ9rEjzVfCfLVpQ=
X-Gm-Gg: AYBFou0nr/CYa2jHeiQ26sH0hSLCSTNPWyuULkxrZVhYyPHUpkH8MQZh2ersIaf5xW5
	az27Wy+CbFpnrv9tYmUIutEe1XrV3m5aOjkdoeGTsr7MRPs+C5V/FaDDmcgGGXwee06+IxV7gPU
	RIVFQ09drj1jOn+wu3Qc3brQ1vVh+Zgjw9YVIw6tN4mm0+NS+H3todfXjIdnEeHPIhWCEVNXSvn
	qptp2lJStwO4P2TZWh8Bu842u3iZ7L3aTcoQo529P8eUk6aOir9Q8sXAlNHTACYn7yArtF+0pCE
	LE3J3Mm2bSpoYCpWznr3Kgp71pnX9mH7VK6ahVDX0sFppNq6JiGdtjBVOWGN136zxAfFeOdfXHd
	f1wKdhM/1rfK5vfxUhWWhfsryUlrpmH9qxE2fFHH1tRAXw2+ikNQKzEquA06Y5go21dayghcS2j
	WkIpcr8VNXzItKnRbWnST536sc2rrnFyzy0JAD/bCLCz00278dVdnTLjZZnPGVs227hlrKt5iy0
	tQ+iPRuXoaEWhSsNKfnErPQBwDy3D1n4RVx9962BYUxKUdPJS8bIXleFMSRhKF3mr5eFqBjD3Zz
	OyiR3eSoH5GOdZG0p8fQ8HEzPhQgK8nfvXs=
X-Received: by 2002:a17:906:ba8e:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c2966694d6cmr313978366b.12.1789131459543;
        Fri, 11 Sep 2026 05:57:39 -0700 (PDT)
Message-ID: <1a24d3e6-8ea5-4016-b795-ce1bc9a63fb7@suse.com>
Date: Fri, 11 Sep 2026 14:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xen/sched: rtds: add per-cpupool admission control
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <7fb66cfd-b1b0-4f58-b35c-229aa679f737@gmail.com>
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
In-Reply-To: <7fb66cfd-b1b0-4f58-b35c-229aa679f737@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4lu8hLzxESlKFKDy2TQHmgaK"
X-purgate-ID: tlsNG-bad1c0/1789131460-39AC0034-94EB9D97/0/0
X-purgate-type: clean
X-purgate-size: 11382

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4lu8hLzxESlKFKDy2TQHmgaK
Content-Type: multipart/mixed; boundary="------------juwuBqxKAIoht7m3B8qUH0qh";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com
Message-ID: <1a24d3e6-8ea5-4016-b795-ce1bc9a63fb7@suse.com>
Subject: Re: [PATCH 0/5] xen/sched: rtds: add per-cpupool admission control
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <7fb66cfd-b1b0-4f58-b35c-229aa679f737@gmail.com>
In-Reply-To: <7fb66cfd-b1b0-4f58-b35c-229aa679f737@gmail.com>
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

--------------juwuBqxKAIoht7m3B8qUH0qh
Content-Type: multipart/mixed; boundary="------------p5Tmn16gtgNGcALKWqHIJiKc"

--------------p5Tmn16gtgNGcALKWqHIJiKc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDkuMjYgMTQ6MjUsIEZ1cmthbiDDh2FsxLHFn2thbiB3cm90ZToNCj4gDQo+IE9u
IDgvMjYvMjYgMDc6NTcsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4+IFJURFMgY3VycmVu
dGx5IGhhcyBubyBhZG1pc3Npb24gY29udHJvbDogbm90aGluZyBzdG9wcyB0aGUgc3VtIG9m
DQo+PiBhbGwgYWRtaXR0ZWQgdW5pdHMnIChidWRnZXQvcGVyaW9kKSByZXNlcnZhdGlvbnMg
aW4gYSBjcHVwb29sIGZyb20NCj4+IGV4Y2VlZGluZyB3aGF0IGl0cyBwQ1BVcyBjYW4gYWN0
dWFsbHkgcHJvdmlkZS4gT25jZSB0aGF0IGhhcHBlbnMsDQo+PiB0aGUgZ2xvYmFsLUVERiBk
ZWFkbGluZSBndWFyYW50ZWVzIHRoZSBzY2hlZHVsZXIgaXMgYnVpbHQgYXJvdW5kIG5vDQo+
PiBsb25nZXIgaG9sZCBmb3IgYW55IHVuaXQgc2hhcmluZyB0aGF0IHBvb2wuDQo+Pg0KPj4g
VGhpcyBzZXJpZXMgYWRkcyBhZG1pc3Npb24gY29udHJvbCB0byBwcmV2ZW50IHRoYXQsIHRy
YWNrcyBhbmQNCj4+IHJlcG9ydCB1dGlsaXphdGlvbiwgYW5kIG1ha2VzIHRoZSBjaGVjayB0
b2dnbGVhYmxlIHBlciBjcHVwb29sIHNvDQo+PiBhbiBvcGVyYXRvciBjYW4gZGlzYWJsZSBp
dCBpZiB0aGV5IGludGVudGlvbmFsbHkgd2FudCB0byBvdmVyY29tbWl0Lg0KPj4NCj4+IFBh
dGNoIDEgaW50cm9kdWNlcyB0aGUgY29yZSBtZWNoYW5pc206IGEgcnVubmluZyB1dGlsaXph
dGlvbiB0b3RhbA0KPj4gcGVyIGNwdXBvb2wsIGEgZml4ZWQtcG9pbnQgcmVwcmVzZW50YXRp
b24gb2YgYSB1bml0J3MgKGJ1ZGdldC9wZXJpb2QpLA0KPj4gYW5kIGEgY2FwYWNpdHkgY2hl
Y2sgZW5mb3JjZWQgaW4gcnRfYWxsb2NfdWRhdGEoKS9ydF9mcmVlX3VkYXRhKCkgLQ0KPj4g
dGhlIGxpZmVjeWNsZSBob29rcyB0aGF0IGNhdGNoIGV2ZXJ5IG5ldyB1bml0J3MgZGVmYXVs
dCByZXNlcnZhdGlvbi4NCj4+DQo+PiBQYXRjaCAyIGV4dGVuZHMgdGhlIHNhbWUgY2hlY2sg
dG8gZG9tY3RsLCBzbyBncm93aW5nIGFuIGV4aXN0aW5nDQo+PiByZXNlcnZhdGlvbiB2aWEg
eGwgc2NoZWQtcnRkcyBpcyBjaGVja2VkIHRvby4NCj4+DQo+PiBQYXRjaCAzIHJlcG9ydHMg
YSBjcHVwb29sJ3MgYWRtaXR0ZWQgdXRpbGl6YXRpb24gYWdhaW5zIGl0cyBjYXBhY2l0eQ0K
Pj4gdmlhIHRoZSAncicgZGVidWcga2V5Lg0KPj4NCj4+IFBhdGNoIDQgbWFrZXMgYWRtaXNz
aW9uIGNvbnRyb2wgaXRzZWxmIHRvZ2dsZWFibGUgcGVyIGNwdXBvb2wNCj4+IChlbmFibGVk
IGJ5IGRlZmF1bHQpIHZpYSBzeXNjdGwuDQo+Pg0KPj4gUGF0Y2ggNSB3aXJlcyB0aGF0IHRv
Z2dsZSB0aHJvdWdoIGxpYnhsIGFuZCBhZGRzIC1zLy1hIHRvDQo+PiB4bCBzY2hlZC1ydGRz
LCBhbmQgZG9jdW1lbnRzIGl0Lg0KPj4NCj4+IEZ1cmthbiBDYWxpc2thbiAoNSk6DQo+PiAg
ICB4ZW4vc2NoZWQ6IHJ0ZHM6IGFkZCBnbG9iYWwtRURGIHV0aWxpemF0aW9uIGFkbWlzc2lv
biBjb250cm9sDQo+PiAgICB4ZW4vc2NoZWQ6IHJ0ZHM6IGVuZm9yY2UgYWRtaXNzaW9uIGNv
bnRyb2wgaW4geGwgc2NoZWQtcnRkcw0KPj4gICAgeGVuL3NjaGVkOiBydGRzOiByZXBvcnQg
dXRpbGl6YXRpb24gYW5kIGNhcCB2aWEgZGVidWcga2V5DQo+PiAgICB4ZW4vc2NoZWQ6IHJ0
ZHM6IG1ha2UgYWRtaXNzaW9uIGNvbnRyb2wgY3B1cG9vbC13aWRlIHRvZ2dsZWFibGUNCj4+
ICAgIHRvb2xzOiBleHBvc2UgYWRtaXNzaW9uIGNvbnRyb2wgdG9nZ2xlIHZpYSB4bCBzY2hl
ZC1ydGRzDQo+Pg0KPj4gICBkb2NzL21hbi94bC4xLnBvZC5pbiAgICAgICAgICAgICAgICAg
fCAgMjAgKysrDQo+PiAgIHRvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbyB8
ICAyMyArKysNCj4+ICAgdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbyAgIHwg
ICA0ICsNCj4+ICAgdG9vbHMvaW5jbHVkZS9saWJ4bC5oICAgICAgICAgICAgICAgIHwgICA0
ICsNCj4+ICAgdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmggICAgICAgICAgICAgIHwgICA2ICsN
Cj4+ICAgdG9vbHMvbGlicy9jdHJsL3hjX3J0LmMgICAgICAgICAgICAgIHwgIDQwICsrKysr
Kw0KPj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3NjaGVkLmMgICAgICAgfCAgNDYgKysr
KysrDQo+PiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsICAgICB8ICAgNSAr
DQo+PiAgIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICAgICAgICAgICB8ICAgOCArLQ0K
Pj4gICB0b29scy94bC94bF9zY2hlZC5jICAgICAgICAgICAgICAgICAgfCAxMDMgKysrKysr
KysrKysrKy0NCj4+ICAgeGVuL2NvbW1vbi9zY2hlZC9ydC5jICAgICAgICAgICAgICAgIHwg
MjA1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gICB4ZW4vaW5jbHVkZS9wdWJs
aWMvc3lzY3RsLmggICAgICAgICAgfCAgIDUgKw0KPj4gICAxMiBmaWxlcyBjaGFuZ2VkLCA0
NjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+IA0KPiBIaSBKdWVyZ2Vu
LA0KPiANCj4gQ2FuIEkgZ2V0IGEgcmV2aWV3IG9uIHRoaXMgc2VyaWVzIHBsZWFzZT8NCg0K
SSB3YXMgcXVpdGUgYnVzeSBwcmVwYXJpbmcgZm9yIFhlbiBzdW1taXQuIEknbSBwbGFubmlu
ZyB0byBkbyB0aGUgcmV2aWV3IG9uDQp0aGUgdHJhaW4gdG8gTXVuaWNoLiA6LSkNCg0KDQpK
dWVyZ2VuDQo=
--------------p5Tmn16gtgNGcALKWqHIJiKc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------p5Tmn16gtgNGcALKWqHIJiKc--

--------------juwuBqxKAIoht7m3B8qUH0qh--

--------------4lu8hLzxESlKFKDy2TQHmgaK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqj+sIFAwAAAAAACgkQsN6d1ii/Ey84
dQf8DYhBYEUROaWLk7YyTPOMfP6NxEGnvvvhx8nFPgIzM0tGA3J+vM30ZqcD1563Mf74Fn0wTD4Z
D4BNjJbS9wdfgsQrJUncheqqWZqq1AZB2tsWL32h1h+a1cVyrenIqhK79sBaEx9F2t0MS2IgdysK
Hi69isJowxmYhEjhc6Ci/t6Er5K770M9EMzb2UK8kkikkTo1X/5UjdeaqwtQyGC5OEC/27tl8uAB
zTt4AxhtFHy8iAQvnEHK9E4DzrePwdzNZb6rDjejoqkMNSUH96Fga1llBdtMH/m3JiTdJvfNlOSB
g1NGQDcNa98VR7dBjk6SqcUIV7gWuLSahmHpDaDz3w==
=btQ7
-----END PGP SIGNATURE-----

--------------4lu8hLzxESlKFKDy2TQHmgaK--

