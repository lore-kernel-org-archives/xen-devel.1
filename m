Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5556DC61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 08:15:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403809.1637772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xAY-0007R5-CV; Mon, 31 Aug 2026 08:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403809.1637772; Mon, 31 Aug 2026 08:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xAY-0007Qy-8j; Mon, 31 Aug 2026 08:15:06 +0000
Received: by outflank-mailman (input) for mailman id 1403809;
 Mon, 31 Aug 2026 08:15:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x0xAW-0007QY-JL
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 08:15:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0xAW-00E6Ut-0A
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 10:15:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a953801-bab6-0a2a0a5309dd-0a2a4509e86e-34
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:15:03 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a953807-be1a-0a2a45090019-d155d033e0f5-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:15:03 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6a20319d030so3977349a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 01:15:03 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a63fad67easm1362246a12.25.2026.08.31.01.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 01:15:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1788164103; x=1788768903; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urlhzVV6xHDy3mje2cdEjOIhxoZL6GLfdgnoLSM7BH0=;
        b=gf8YhMZhLtWMqh+9ryKb5OrSwhYaQQV1v11wNyL5BhbLsQ4umJLCtph6LhocOT0ZHq
         E/6ViRB/BSaSRN4Rn14dxXi5HK1JCvbiUaJHNfyOUGwm3f1X+A/NEQ/Ihk4zZF5rZUKI
         TezAzY6aJH305eJWeH6pFcMBQy9AfNVi1FjF1MxMEPAYk0PT0fNAMgde0CaAJlnsHavJ
         uubIlEDKjscejLHdfQBLY4bqPHjgRMsk5KzeYZ1oTKcdn9tu99fINWfCauzCLy8Pddbc
         2SXLz1WvX4FCib/BBRzsFqdKLhGsQxgYWBBtiDCun4AdRsdbqP8g1AwQ0ACpAsaPI1WV
         N2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164103; x=1788768903;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urlhzVV6xHDy3mje2cdEjOIhxoZL6GLfdgnoLSM7BH0=;
        b=XDpAFyHFUKYN1U6B64nQvPgrsUdGicZlr9XSa78f3sVTKhnQ7P0y7BnxE8GAwJo06O
         mVRDsZXTS+7Oc7r5vhqE1xDw+nHjbqe4xAWQVPwHiIHumDtV1gvR/gi556slsV0l3ysT
         hwClBcWTZikWDIA0ecLWknyfMDyg9LIp6Aaz+jNKB4qG7vmsM1Q/czBD9F5RAldyY+0d
         r78V2xUzlKjAWDYyhRM9pqq0YTS5s6U6YWcYxGyzdFRxXWh2rT0wzNmMQramZSHOybPW
         nqdgBQ/SO4797vhmnrPPjM7vZA4zDUQh/l73HkhgJb/cPSZwwn/W5OxxyUVsr7VotCMm
         FzmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3lQ0QAUGpsIPVuXmnQATJGsVskeBpvZE796AEwuCrYJTSyHM1O/nxPBiO4K42ZtK/jcti6XThNtw=@lists.xenproject.org
X-Gm-Message-State: AFuF++kWodrlyF+zev4yj5BR3MfuR2QmcC7H8tHvMeycHgBSJgcqgCmh
	DhsbHIZ/4wSw6hh+t47mpKBy7AXeE0s1Y+fhpYqBzTB8st9H12YypavxggyIfJESQnc=
X-Gm-Gg: AYBFou2UUigJ+eK9Ls2WagEybZg4h+vZoKdDDdkqvd/KW6tfjTl/d0wTk4N6Cw37lBN
	omkwh5rb97RM9pvat7OMH0QrRXqMcqAwzbAaT9yH4wiGYxmVKxRGIsPsSIuONvsDckqY0YNXfvf
	GjggcPqqMC/nQyWi8AIs+rLSFK7JLfbAtF0HlexVp7YTe+uRpwdiXD/hCr2qOfKyCC9HW0c0MFa
	ZLF+Mm+FoliVeW/Vj5nvI/AFVh0h3oNPnkTWc51fUCvFts8dh85/Agz5ExR69eXkiJJjdL2wYBb
	gW4hW8stu9lZP2k/+Yb12xRK/UNfHF8GboJOglTx/u9CIYLPbfrg/GmaGkO7X56VgV5+RnVE4RH
	Ub6BuJWMBb/++a7kC8PWj+Bllkm6Mek2qEf7Z/l9w1Luz/8zcF8LTqARN8fuGO6kolO4zIPjEPf
	EBXNUCv/mUx2syRo6y3QuLj6bVWgVgQcMpEKoZISM7vTNeufLK6rf8WTPe6W6Pyd6uoBeLqkkuZ
	KSf62XKGdCZAmJ0gZd8FSqUKYRBriwPix/ttoWeg3L9ajqznRe0OlLzm1a+ziBdMlApevoc4sYW
	SL3ArUOVRLL0Ug==
X-Received: by 2002:a05:6402:11c7:b0:6a6:32fa:1e99 with SMTP id 4fb4d7f45d1cf-6a632fa1f41mr6814150a12.17.1788164103229;
        Mon, 31 Aug 2026 01:15:03 -0700 (PDT)
Message-ID: <dc4dbc44-db87-4de3-9246-e91f50a50c9c@suse.com>
Date: Mon, 31 Aug 2026 10:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, roger@xenproject.org, anthony.perard@vates.tech,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-3-frn1furkan10@gmail.com>
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
In-Reply-To: <20260831051637.5029-3-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DWM0289lF4t9Wvzmxn75QdGO"
X-purgate-ID: tlsNG-bad1c0/1788164103-3B6D2034-DEC4EAEF/0/0
X-purgate-type: clean
X-purgate-size: 10009

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DWM0289lF4t9Wvzmxn75QdGO
Content-Type: multipart/mixed; boundary="------------2q1Kb8RhwnZp9ay7kIyrojY0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, roger@xenproject.org, anthony.perard@vates.tech,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech
Message-ID: <dc4dbc44-db87-4de3-9246-e91f50a50c9c@suse.com>
Subject: Re: [PATCH v3 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-3-frn1furkan10@gmail.com>
In-Reply-To: <20260831051637.5029-3-frn1furkan10@gmail.com>
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

--------------2q1Kb8RhwnZp9ay7kIyrojY0
Content-Type: multipart/mixed; boundary="------------YNB0V2PxAtL0o0IQAKoC2VX2"

--------------YNB0V2PxAtL0o0IQAKoC2VX2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDguMjYgMDc6MTYsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gc2NoZWRfaW5p
dF92Y3B1KCkgY2FsbHMgaW5pdF90aW1lcigpIGZvciBhIHZjcHUncyBwZXJpb2RpY190aW1l
ciwNCj4gc2luZ2xlc2hvdF90aW1lciBhbmQgcG9sbF90aW1lciBiZWZvcmUgaXQgY2FuIGZh
aWwgLS0gdGhlc2UNCj4gYmVjb21lIGxpdmUsIGxpbmtlZCBpbnRvIHRoZWlyIHRhcmdldCBw
Q1BVJ3MgcGVyLWNwdSB0aW1lciBsaXN0DQo+IHJlZ2FyZGxlc3Mgb2Ygd2hhdCBoYXBwZW5z
IG5leHQuIElmIHRoZSBzY2hlZF9hbGxvY191ZGF0YSgpIGNhbGwNCj4gZnVydGhlciBkb3du
IHRoZW4gZmFpbHMsIHRoZSBmdW5jdGlvbiBmcmVlcyB0aGUgc2NoZWRfdW5pdCB2aWENCj4g
c2NoZWRfZnJlZV91bml0KCkgYW5kIHJldHVybnMgMSwgYnV0IG5ldmVyIHVubGlua3MgdGhl
c2UgdGhyZWUNCj4gdGltZXJzLg0KPiANCj4gVGhlIGNhbGxlciwgdmNwdV9jcmVhdGUoKSwg
bWFrZXMgdGhpcyB3b3JzZTogb24gc2NoZWRfaW5pdF92Y3B1KCkNCj4gcmV0dXJuaW5nIG5v
bnplcm8gaXQganVtcHMgdG8gZmFpbF93cSwgc2tpcHBpbmcgZmFpbF9zY2hlZCBhbmQNCj4g
dGh1cyBzY2hlZF9kZXN0cm95X3ZjcHUoKSAtLSB0aGUgb25seSBmdW5jdGlvbiBvbiB0aGlz
IHBhdGggdGhhdA0KPiBjYWxscyBraWxsX3RpbWVyKCkgb24gdGhlbS4gdmNwdV9kZXN0cm95
KCkgdGhlbiBmcmVlcyB0aGUgdmNwdSwNCj4gYW5kIHRoZSB0aHJlZSB0aW1lcnMgZW1iZWRk
ZWQgaW4gaXQsIHdoaWxlIHRoZXkgYXJlIHN0aWxsIGxpbmtlZA0KPiBpbnRvIHRoYXQgc2hh
cmVkIGxpc3QuDQo+IA0KPiBUaGlzIHNpbGVudGx5IGNvcnJ1cHRzIHRoYXQgbGlzdC4gSXQg
b25seSBzaG93cyB1cCBsYXRlciwgd2hlbg0KPiBzb21ldGhpbmcgZWxzZSB0b3VjaGVzIGEg
bmVpZ2hib3JpbmcgdGltZXI6IHNjaGVkX21vdmVfZG9tYWluKCkNCj4gY3Jhc2hlZCB3aXRo
ICJBc3NlcnRpb24gJ2VudHJ5LT5wcmV2LT5uZXh0ID09IGVudHJ5JyBmYWlsZWQiIG9uIGEN
Cj4gY29tcGxldGVseSB1bnJlbGF0ZWQsIHZhbGlkIHZjcHUncyB0aW1lci4NCj4gDQo+IENh
bGwgc2NoZWRfZGVzdHJveV92Y3B1KCkgaW4gc2NoZWRfaW5pdF92Y3B1KCkncyBvd24gZmFp
bHVyZQ0KPiBicmFuY2ggaW5zdGVhZCBvZiBzY2hlZF9mcmVlX3VuaXQoKSwgc28gaXQgZG9l
c24ndCBkZXBlbmQNCj4gb24gdGhlIGNhbGxlciByZWFjaGluZyBzY2hlZF9kZXN0cm95X3Zj
cHUoKSB0byB1bmRvIHdoYXQgaXQgc2V0DQo+IHVwIGl0c2VsZi4gc2NoZWRfZGVzdHJveV92
Y3B1KCkgYXNzdW1lcyB1bml0LT5wcml2IGlzIHNldCwgd2hpY2gNCj4gaXMgbm90IHRoZSBj
YXNlIGhlcmUsIHNvIG1ha2UgaXQgb25seSBmcmVlIHRoZSB1ZGF0YSBhbmQgcmVtb3ZlDQo+
IHRoZSB1bml0IGlmIHVuaXQtPnByaXYgaW4gbm9uLU5VTEwuDQo+IA0KPiBGaXhlczogZDg4
NGIxMDc3ODE3ICgiRG9tYWluIGNyZWF0aW9uL2Rlc3RydWN0aW9uIGNsZWFudXBzLiIpDQo+
IFNpZ25lZC1vZmYtYnk6IEZ1cmthbiBDYWxpc2thbiA8ZnJuMWZ1cmthbjEwQGdtYWlsLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0K
DQpKdWVyZ2VuDQo=
--------------YNB0V2PxAtL0o0IQAKoC2VX2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------YNB0V2PxAtL0o0IQAKoC2VX2--

--------------2q1Kb8RhwnZp9ay7kIyrojY0--

--------------DWM0289lF4t9Wvzmxn75QdGO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqVOAYFAwAAAAAACgkQsN6d1ii/Ey8r
SQf/cCUar0krTO+rYSJt4LhQW6FY9yAfyV/A2sa9EFRRbWxVsZgRwke4bF20+jBxO7hbT+rW9sp3
kEjx5+J9KerKVZuCtQtmchkHdb6JwP0UT2Hx5uAHYG27p/733R0gzJmxTb/r0GmX/IPKF6iOwzSK
fHwN5S76Bfb4io6d/tPq/v/0LmKQFEWIt9SHlY/qc04/iFZ747kyhznav8T8TU47ePQJj097wtgP
JLFBKrRoe/WWL8PwszYAS03NpxNWzsU21EkAgAL2saW91Q5lvubIdx5ZOHt+ntNp2q4QHD71DcdX
4DuC6oihOVmi4ok0wfyfyGouXCpYcCa82p7XVhBeIg==
=QCRr
-----END PGP SIGNATURE-----

--------------DWM0289lF4t9Wvzmxn75QdGO--

