Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75DDC61DD3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 09:23:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404661.1638353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Khi-0004AJ-MC; Tue, 01 Sep 2026 09:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404661.1638353; Tue, 01 Sep 2026 09:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Khi-0004AC-JQ; Tue, 01 Sep 2026 09:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1404661;
 Tue, 01 Sep 2026 09:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x1Khh-000491-DE
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1Khg-003CCt-9n
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 11:22:52 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a96995d-8faa-0a2a0a5109dd-0a2a45018468-32
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 11:22:52 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a9694f7-5984-0a2a45010019-d155d030a455-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 11:03:51 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6a5f968ada7so1695011a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 02:03:51 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a66ccda72bsm493177a12.9.2026.09.01.02.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 02:03:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788253431; x=1788858231; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oD/Tfb1E4zLYaJUhultunEzBMFT48rArzR8BmH+9I8E=;
        b=UJ8Z/trxoUk2Og0Jy8hnL3+y4C6vH/scmktWVChuVsqJfM7bUF7eAZiyOzbn0ZOg3y
         MnSHOwEJ8qawVyuDjtze1qhMFZEjuE/6I4pntIL3LxN7IU9ugFTI0uoypks3rsr8RTod
         kdOb9ASaxWS6qyoAcJuvMJkxR3TYi9VZRsLmvnSO8EE+nY1CA7cTniPiQukphO+EQFka
         ifZ2N7YGlDdnGrZE/fDC+Mhawb1Iz6ulhe4fuys17KfRxtl8Yzf1BzYtNA7sBZrJ9Sma
         PxWfw0CNL5fENxC4MtQKAQEckqPCBxiOIhqfovpdz9ZeOAjfSmNYvHVUsMvbiabaNIjX
         j9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253431; x=1788858231;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oD/Tfb1E4zLYaJUhultunEzBMFT48rArzR8BmH+9I8E=;
        b=Il9xGFJPCDDMfxd7Lsds9AKNUSdCbj+7qn80ooaVfjgi8TFcXJs1i9o/eh6DU9PWBs
         Mo4X09TXjpzObHCt8hZVJqSqaufKQZPmSZ9d6rTp4FmPb1BXmQDJtzwud4/OMNC19bNW
         rS30/K/G4Th8ubaA03xlXTyi2xyhMC+m3LkFKc7aIk04NVuRZK6VbkIV3t06vUQUZg6Y
         CsBorlo1hfIQmRTEHOBs05xPQZ59MbEW6lA6tt3HhXG3vFcfPuPsQPmPylaUtJt/Ss8+
         19H7meDTl1KWzFknwl19p8FWA/IJ9DWofw5suboFLvge/AnErHC+kZvrV9brbMe7dofL
         2khA==
X-Forwarded-Encrypted: i=1; AKwUvBxqjvHDFkFZKMmQ6tALWx0m0zrZZyqWI5kk20wG7N2tex4gmPsEgAs7anE3HykwRXzrokcDzHXYO0I=@lists.xenproject.org
X-Gm-Message-State: AFuF++lp1OA3smZFkIN8bc65CUTgPLpACfRPh8tFDOuPGZRW/Ik+WGFt
	Fwpyc1uVpEExKfQLtQd8eqLcCxNoBcTSitScf/OFnCFpax0mgmnvVXcsHtWgOhMD7V8=
X-Gm-Gg: AYBFou0ptqoCF5TaGheJ0QpCxgdk0Cf2fzMO0e8GHki36vBCwEvvKld6llGwqtg0E4O
	l01NvmDqTNsiohiu7seXWlRvY1f3SqDhr9DuL454zNex7Gen8VEIhvxGvmA5AUn3KDXETB8c8uO
	lv0yjojFxA9ac27lVZssPqUCD1ZUO5OM1pBxRoL0Ml25hR3QIblOeyERjzfXR0ACcm26hMBhLQx
	L1ITbgfrXJBnci5B3l66MmK7mFCwij9wLRSjfoA9lxMlKzelSnSunBu78NCAmIjjnHMiQc34ezo
	fv8wzpnQj8b6H214HfC05tqn7pb7Q/vRXOKbYRDgPqD1Tw8kVO2v4UdhHGMooFtfFXrAtwmAX/2
	TpjHx7Pvj9qvmtqHMJyCxQnVBJQdHA8PdaSz+Ckly/ojdF3RyV69GVyonbEjMBAosqBLiZoYX9a
	9hoEIBbo/PtzD7Ja+poReV+K/JGHArAeqGaVkAmFR01HLJ38hlI/D+XqAggepcjEdHFGFoINx4f
	6r+wGf1zG8lWI8V1xD2qn9qDTXLtGPTvL4FnZ8Mojlo6jtW2tHEwi+HF8YEj8FhVshtrnx3G+wV
	17Xa+fiLB5tM/w==
X-Received: by 2002:a05:6402:21cb:b0:6a5:f4ef:7fae with SMTP id 4fb4d7f45d1cf-6a66a735633mr2559766a12.6.1788253430591;
        Tue, 01 Sep 2026 02:03:50 -0700 (PDT)
Message-ID: <4a8c362a-9aac-4e0c-aea6-bc5841143ce6@suse.com>
Date: Tue, 1 Sep 2026 11:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: Jan Beulich <jbeulich@suse.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
 <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
 <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
 <06e18456-50ac-471d-8323-1560dd8b2a5c@suse.com>
 <844b82eb-5a8b-4e49-8a97-f1311120b61f@suse.com>
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
In-Reply-To: <844b82eb-5a8b-4e49-8a97-f1311120b61f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WT0gR00oQdO63Q0G5F6VN9z0"
X-purgate-ID: tlsNG-d62444/1788253431-BDC79757-DB75A911/19/8849265665
X-purgate-type: clean
X-purgate-size: 13612

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WT0gR00oQdO63Q0G5F6VN9z0
Content-Type: multipart/mixed; boundary="------------CW4ogjS7zWmg5moZ9mFj4xNj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4a8c362a-9aac-4e0c-aea6-bc5841143ce6@suse.com>
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
 <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
 <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
 <06e18456-50ac-471d-8323-1560dd8b2a5c@suse.com>
 <844b82eb-5a8b-4e49-8a97-f1311120b61f@suse.com>
In-Reply-To: <844b82eb-5a8b-4e49-8a97-f1311120b61f@suse.com>
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

--------------CW4ogjS7zWmg5moZ9mFj4xNj
Content-Type: multipart/mixed; boundary="------------PwyUcfJHW0oJhKVge5b0oTJr"

--------------PwyUcfJHW0oJhKVge5b0oTJr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjYgMTA6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wOS4yMDI2
IDEwOjI0LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDEuMDkuMjYgMTA6MTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAxLjA5LjIwMjYgMTA6MDcsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDAxLjA5LjI2IDA5OjIyLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDMxLjA4LjIwMjYgMTQ6NTksIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+
Pj4gT24gMzEuMDguMjYgMTE6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4+IE9u
IDMxLzA4LzIwMjYgNjoxNiBhbSwgRnVya2FuIENhbGlza2FuIHdyb3RlOg0KPj4+Pj4+Pj4g
RXZlcnkgdmNwdV9jcmVhdGUoKSBjYWxsIHNpdGUgdGhhdCBidWlsZHMgbW9yZSB0aGFuIG9u
ZSB2Y3B1IGxvb3BzDQo+Pj4+Pj4+PiBvdmVyIGlkcyB1cCB0byBkLT5tYXhfdmNwdXMgYW5k
IHN0b3BzIG9uIHRoZSBmaXJzdCBmYWlsdXJlLCBidXQgbm9uZQ0KPj4+Pj4+Pj4gb2YgdGhl
bSByb2xsIG1heF92Y3B1cyBiYWNrIHRvIG1hdGNoLiBUaGlzIGxlYXZlcyBkLT52Y3B1W2ld
ID09IE5VTEwNCj4+Pj4+Pj4+IGZvciBpZHMgYmVsb3cgbWF4X3ZjcHVzDQo+Pj4+Pj4+DQo+
Pj4+Pj4+IEFzIEkgdG9sZCB5b3UgYmVmb3JlLCB5b3UgbXVzdCBjb3BlIHdpdGggdGhpcyBw
cm9wZXJ0eSBpbiBub24tZXJyb3INCj4+Pj4+Pj4gc2NlbmFyaW9zLg0KPj4+Pj4+Pg0KPj4+
Pj4+Pj4gLCB3aGljaCBhbnl0aGluZyB3YWxraW5nIGQtPnZjcHVbXSBjYW4gdGhlbg0KPj4+
Pj4+Pj4gZGVyZWZlcmVuY2UuIFRoaXMgaXMgd2hhdCBjYXVzZWQgdGhlIGNyYXNoOiBzY2hl
ZF9tb3ZlX2RvbWFpbigpDQo+Pj4+Pj4+PiB3YWxrcyBldmVyeSB2Y3B1IHNsb3QgdXAgdG8g
bWF4X3ZjcHVzIHdpdGhvdXQgY2hlY2tpbmcgZm9yIGVtcHR5DQo+Pj4+Pj4+PiBvbmVzLCBz
byB3aGVuIGEgZG9tYWluIGJ1aWx0IGluIGEgbm9uLWRlZmF1bHQgY3B1cG9vbCBoYWQgdmNw
dQ0KPj4+Pj4+Pj4gY3JlYXRpb24gZmFpbCBwYXJ0d2F5IHRocm91Z2gsIGRvbWFpbl9raWxs
KCkgbGF0ZXIgbW92aW5nIGl0IGJhY2sNCj4+Pj4+Pj4+IHRvIHRoZSBkZWZhdWx0IGNwdXBv
b2wgaGFuZGVkIG9uZSBvZiBpdHMgZW1wdHkgc2xvdHMgc3RyYWlnaHQgdG8NCj4+Pj4+Pj4+
IHRoZSBuZXcgY3B1cG9vbCdzIHNjaGVkdWxlciwgY2F1c2luZyBhIE5VTEwtcG9pbnRlciBk
ZXJlZmVyZW5jZQ0KPj4+Pj4+Pj4gaW5zaWRlIHNjaGVkX2FsbG9jX3VkYXRhKCkuDQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gQWRkIHZjcHVzX2NyZWF0ZShkKTogY3JlYXRlcyBldmVyeSB2Y3B1
IG9mIGQgdXAgdG8gbWF4X3ZjcHVzIGFuZA0KPj4+Pj4+Pj4gcm9sbHMgbWF4X3ZjcHVzIGJh
Y2sgdG8gdGhlIGZhaWxlZCBpZCBvbiBlcnJvci4gVGhpcyBrZWVwcw0KPj4+Pj4+Pj4gZC0+
dmNwdVtpXSBpcyBub24tTlVMTCBmb3IgYWxsIGkgPCBkLT5tYXhfdmNwdXMNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gTm8sIGl0IHJlYWxseSBkb2Vzbid0Lg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gLCBp
bnN0ZWFkIG9mIGd1YXJkaW5nDQo+Pj4+Pj4+PiBldmVyeSByZWFkZXIgb2YgZC0+dmNwdVtd
IGFnYWlucyBob2xlcyBpbmRpdmlkdWFsbHkuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQ29udmVy
dCBldmVyeSBzaXRlIHRoYXQgYnVpbGRzIHZjcHVzIGluIGEgbG9vcCB0byBjYWxsIHRoaXMg
ZnVuY3Rpb24NCj4+Pj4+Pj4+IGluc3RlYWQuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gRml4ZXM6
IDYxNjQ5NzA5NDIxYSAoInhlbi9kb21haW46IEFsbG9jYXRlIGQtPnZjcHVbXSBpbiBkb21h
aW5fY3JlYXRlKCkiKQ0KPj4+Pj4+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGdXJrYW4gQ2FsaXNr
YW4gPGZybjFmdXJrYW4xMEBnbWFpbC5jb20+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZvciB0aGUg
YXZvaWRhbmNlIG9mIGEgbG9uZyBkcmF3bi1vdXQgYXJndW1lbnQsIG5hY2suwqAgVW5kZXIg
bm8NCj4+Pj4+Pj4gY2lyY3Vtc3RhbmNlcyBhcmUgeW91IGVkaXRpbmcgZC0+bWF4X2NwdXMg
YWZ0ZXIgaXQncyBwdXQgaW50byB0aGUgZG9tYWluDQo+Pj4+Pj4+IGxpc3QuDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IFlvdSd2ZSBjaG9zZW4gdG8gZG8gc28gYXQgYSBwb2ludCB3aGVyZSB0aGUg
ZG9tYWluIG9iamVjdCBpcyBsaXZlLA0KPj4+Pj4+PiB2aXNpYmxlIGluIHRoZSBzeXN0ZW0g
YW5kIGFibGUgdG8gYmUgdGhlIHRhcmdldCBvZiBvdGhlciBoeXBlcmNhbGxzLg0KPj4+Pj4+
Pg0KPj4+Pj4+PiBGdXJ0aGVybW9yZSB5b3UgaGF2ZSBub3QgZml4ZWQgd2hhdCB5b3VyIGNv
bW1pdCBtZXNzYWdlIGNsYWltcy4NCj4+Pj4+Pj4gZC0+dmNwdVsuLi5dIGlzIHN0aWxsIE5V
TEwgZm9yIGFuIGFyYml0cmFyeSBwZXJpb2Qgb2YgdGltZSwgaW5jbHVkaW5nDQo+Pj4+Pj4+
IGJlaW5nIGFibGUgdG8gYmUgdGhlIHRhcmdldCBvZiBoeXBlcmNhbGxzLCBiZWZvcmUgdkNQ
VXMgYXJlIGNyZWF0ZWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEFsbCBjb2RlIE1VU1QgYmUgYWJs
ZSB0byBjb3BlIHdpdGggZC0+dmNwdVsuLi5dIGJlaW5nIE5VTEwuwqAgSXQncyBob3cNCj4+
Pj4+Pj4gdGhlIG9iamVjdCBsaWZlY3ljbGVzIG11c3Qgd29yaywgYmVjYXVzZSBjcmVhdGlu
ZyB2Q1BVcyBpcyBub3QgYXRvbWljDQo+Pj4+Pj4+IHdpdGggcmVzcGVjdCB0byBjcmVhdGlu
ZyBkb21haW5zLg0KPj4+Pj4+DQo+Pj4+Pj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCBtZSBj
cmVhdGluZyBhIHBhdGNoIHNlcmllcyBtb3ZpbmcgdmNwdSBjcmVhdGlvbiBpbnRvDQo+Pj4+
Pj4gZG9tYWluX2NyZWF0ZSgpPw0KPj4+Pj4NCj4+Pj4+IFRoaXMgd2FzIGRpc2N1c3NlZCBi
ZWZvcmUsIGFuZCBob3dldmVyIG5pY2UgaXQgd291bGQgYmUgZm9yIHRoZSBpc3N1ZSBhdCBo
YW5kLA0KPj4+Pj4gaXQgd291bGQgZ2V0IGluIHRoZSB3YXkgb2YgdXMgd2FudGluZyB0byBo
YXZlIENQVSBwb2xpY3kgZm9yIGRvbWFpbnMgcHV0IGluDQo+Pj4+PiBwbGFjZSBiZWZvcmUg
dkNQVS1zIGFyZSBjcmVhdGVkLCBzdWNoIHRoYXQgb24geDg2IHRoZSBYU0FWRSBhcmVhIGNh
biBiZSBzaXplZA0KPj4+Pj4gb25jZSBhbmQgZm9yIGFsbC4NCj4+Pj4NCj4+Pj4gVGhpcyBj
b3VsZCBiZSBkb25lIHdoZW4gdW5wYXVzaW5nIHRoZSBkb21haW4gaW5pdGlhbGx5Lg0KPj4+
DQo+Pj4gSW1vIHVucGF1c2luZyBzaG91bGRuJ3QgZmFpbCBiZWNhdXNlIG9mIG1lbW9yeSBz
aG9ydGFnZS4NCj4+DQo+PiBBcyBsb25nIGFzIHRoZSBkb21haW4gaGFzbid0IHN0YXJ0ZWQg
cnVubmluZyBJIGRvbid0IHNlZSB3aHkgdGhpcyB3b3VsZCBiZQ0KPj4gZGlmZmVyZW50IHRv
IHRoZSBjYXNlIHdoZXJlIG5vdCBhbGwgdmNwdXMgY291bGQgYmUgY3JlYXRlZC4NCj4gDQo+
IEkgZG8uIE9uZSBjb3VsZCBjcmVhdGUgYSBkb21haW4gcmVhZHkgdG8gYmUgdW5wYXVzZWQs
IGJ1dCBiZWluZyBrZXB0IHBhdXNlZA0KPiB1bnRpbCB3aGF0ZXZlciBldmVudCB0cmlnZ2Vy
cyBpdHMgbGF1bmNoaW5nLiBUaGF0IGJldHRlciB3b3VsZG4ndCBmYWlsLCBleGNlcHQNCj4g
aW4gZXh0cmFvcmRpbmFyeSBzaXR1YXRpb25zLg0KDQpPa2F5LCB0aGVuIHdlIGNvdWxkIGFk
ZCBYRU5fRE9NQ1RMX2ZpbmFsaXplIGRvaW5nIHRoZSBmaW5hbCBhbGxvY2F0aW9ucyBBTkQN
CmRvaW5nIHRoZSBjcmVhdGlvbl9maW5pc2hlZCBoYW5kbGluZy4gVGhpcyB3b3VsZCBldmVu
IGNhdGNoIHRvZGF5J3MgZG9tYWluDQpjcmFzaGluZyBpbiB0aGUgVk1YIHNwZWNpZmljIGRv
bWFpbl9jcmVhdGlvbl9maW5pc2hlZCgpIGNhbGxiYWNrLg0KDQpBdCB0aGUgc2FtZSB0aW1l
IFhFTl9ET01DVExfbWF4X3ZjcHVzIHdvdWxkIGJlIGRyb3BwZWQsIHNvIHRoZXJlIGlzbid0
IG1vcmUNCndvcmsgZm9yIHRoZSB0b29sc3RhY2suDQoNCg0KSnVlcmdlbg0K
--------------PwyUcfJHW0oJhKVge5b0oTJr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------PwyUcfJHW0oJhKVge5b0oTJr--

--------------CW4ogjS7zWmg5moZ9mFj4xNj--

--------------WT0gR00oQdO63Q0G5F6VN9z0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqWlPUFAwAAAAAACgkQsN6d1ii/Ey+b
NAf9FM2FeqlbKwCg4XEAaXSow6OBvuDu9ypz5S83KBI7NahDpFglJ9s2W7APdi/wTGnGP621V2/Q
yerUcVVEBo8XHsdVn6NOhxBdItN4BuKIcLa7SrQyAO/jWWEzK171CN/2Q5UK0oqeYQZft2CFmIjh
qOmTUHgkDFEjAbUjEtRrrcP+C7KzUJ5NDVzHVEyZKiRMZufzWxfYY625nOPXZENqHAOHH19jUfPR
kB6CboFEwh8PScEpdBdrptrwtyiHLOYDvtUWVTMfjeMxYXsaQPJ3PQGddhF0867QywASiQBiOvar
aFlFjlmXBBF+qlfx1BeSJ0nmBRL8pidxsmXJfZnpjw==
=uZMb
-----END PGP SIGNATURE-----

--------------WT0gR00oQdO63Q0G5F6VN9z0--

