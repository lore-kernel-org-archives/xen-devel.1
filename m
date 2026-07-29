Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88FAC53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:26:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376061.1623032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5Ey-00006i-FM; Wed, 29 Jul 2026 14:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376061.1623032; Wed, 29 Jul 2026 14:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5Ey-00006b-Ck; Wed, 29 Jul 2026 14:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1376061;
 Wed, 29 Jul 2026 14:26:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wp5Ex-00006V-QJ
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:26:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5Ex-007wVi-6o
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:26:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a6a0d86-bab6-0a2a0a5309dd-0a2a45038e0c-28
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:26:35 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a6a0d9a-fae8-0a2a45030019-d155da32ecd0-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:26:35 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c15f47e6297so121558366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:26:35 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1f83cdf452sm126130866b.14.2026.07.29.07.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 07:26:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1785335194; x=1785939994; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wkFtYNqsSRXyUMxwxmhrS/LJgTShce8Xuqvelo7AOW0=;
        b=EWemrbVfmhYXBUOp8CvyCXiuJqgdV6TyTo3ji0F3Ru+CWN6WLeQmM2QGdU05IkbKwl
         +cNdZ0U/q/Z+hjKAvLePvPUbbiXU+b++yz2NHb63+abcjAbAxPSLP++3rV3tYQudf5JB
         IxDN0UUXTOpB0GsyF1LavfKPYbn9CWgyxRY4UZwTxBHfMnM++6yI4hcaff8ugQzOFfYO
         Tb15XDlziI+RWlCRKkEzMTemGTQS/b3G9fdiMTjObZpz7WKiYyAwt+onQCB/e52stvhC
         sgcS6cvg2oQPaeVOgejy8tu5ifkvvxtqk0R1pIGejP2/9FY+HUnV/8Pt4KA68rYEiSUT
         5FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785335194; x=1785939994;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkFtYNqsSRXyUMxwxmhrS/LJgTShce8Xuqvelo7AOW0=;
        b=rPYhdq9Av+Ub7KVlQJsi0RCYqMwvYwXCwF3NYoohCtXvjjxyJFMhRpESOlYLtjgBeq
         ARWSrBbOlvjeNvFqWGZhbWUQy6Xo6cfZomPZI9l/Kmg1YOHz7sx35uMySVWjq+1CaFh5
         rvxajhZyQFdfOd2smulwKNuGJ2qTwTf7glOyRZnlz52Px+rehcyxr2zRjB80Ye3VrfZ7
         vivEHItuBQytWYjYznEFSzmQxe5BFVSj4zcua6ZiEmtEqakZPivG3gx6cYgdPPsEI6Y1
         79xMSRjs14Qtrc1Qk8eMDmaUp3+C7PuF42pi5CvtBiXgyruO5SldqZWrrIEgDSAcl6wG
         19JQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWXfmj4W1l/rx2Y+nSA78o7tGcAybKBqJgDjI3YjpV8vhUamWP+1IHSxQ+WZ0Mlr/23OP5iOvax3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBB4878ZNozh4a7y6SU/1V32TZDTIJVQgtA0tmmPZ91/O8QPxW
	kT9T2P9WW3MQyUTphtlMWb3tcwtIyauA6zDh1hIaUvoDzmOTILJ1q799oLavAylu6zY=
X-Gm-Gg: AR+sD10NMMYmh31DpFBNFn7P8vNT4z2SfjDWsd11RlWKVLfeo0fW5w0HXRuqoSXp/Bb
	4W1UTd+KXSLLHXYquV4R4Px7lLP2eCucYgLvYHYMaPteohnAHkiRq1QGLyb19kp9Ub4bX08/a5a
	WJJzgH7YfCEHcMXW4m9Qq97fCePIbe5WD3Ej9Q2Z0aU8uN3XJPs8ElghMfeHSm7DkLJAvQuKMUv
	VEHOeJZJliLqN/NqW08lIyl7VL8TbziirYh/qepS2cNo1PDyI9azW8zXCMTU0kLAnAkeBic/FMi
	H4MwFfrCJdz8bSIWRr9NoEh7xMR3NDg4u0DLXKP5HAO7ulqt22/CXriBHLl6rqOopxQ50sjclGd
	AzHIXdAi1N2VFuKPUp0OxXs3VdH6CKvhE3Uv/cYeG6cncavhHTofg0UWmz3bTgx0FKCA8CK+QvC
	4DoSamQSU83le0qmg1JgEAikK6KNp0R17XEqfSn4UIMihP7v5DiAn+MyGyNbAjBa8N3LhAl3sVm
	CSTmYiBrYR1K4K5WmakfWNAtpSt/wFhjTcBljR9xDyi2CkF5IHznwfrT1IHJYU9DhL8rkR+K3zM
	TKZ5LgcHQ3to21Q=
X-Received: by 2002:a17:907:3cc2:b0:c19:473b:dc8f with SMTP id a640c23a62f3a-c1f71e956d7mr434501466b.3.1785335194535;
        Wed, 29 Jul 2026 07:26:34 -0700 (PDT)
Message-ID: <d65f80e2-2585-4728-9dee-43130278a9db@suse.com>
Date: Wed, 29 Jul 2026 16:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/evtchn: fix wrong usage of array_index_nospec()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260729141254.345989-1-jgross@suse.com>
 <ab05fe35-1017-49ce-be3d-69afe3ffb62b@suse.com>
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
In-Reply-To: <ab05fe35-1017-49ce-be3d-69afe3ffb62b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MGcRpTDU0oCkYcUoLAW2n8pv"
X-purgate-ID: tlsNG-33051d/1785335195-7448C4E9-E068EA2F/0/0
X-purgate-type: clean
X-purgate-size: 9126

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MGcRpTDU0oCkYcUoLAW2n8pv
Content-Type: multipart/mixed; boundary="------------XbpG1UKf0tojx2JE0CTNCueJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <d65f80e2-2585-4728-9dee-43130278a9db@suse.com>
Subject: Re: [PATCH] xen/evtchn: fix wrong usage of array_index_nospec()
References: <20260729141254.345989-1-jgross@suse.com>
 <ab05fe35-1017-49ce-be3d-69afe3ffb62b@suse.com>
In-Reply-To: <ab05fe35-1017-49ce-be3d-69afe3ffb62b@suse.com>
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

--------------XbpG1UKf0tojx2JE0CTNCueJ
Content-Type: multipart/mixed; boundary="------------rQYV7CqueS207LqZIK6XYUaP"

--------------rQYV7CqueS207LqZIK6XYUaP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDcuMjYgMTY6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNy4yMDI2
IDE2OjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9ldmVu
dF9maWZvLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZXZlbnRfZmlmby5jDQo+PiBAQCAtNzEs
MTEgKzcxLDEwIEBAIHN0YXRpYyBpbmxpbmUgZXZlbnRfd29yZF90ICpldnRjaG5fZmlmb193
b3JkX2Zyb21fcG9ydChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4gICAgICAgICovDQo+
PiAgICAgICBzbXBfcm1iKCk7DQo+PiAgIA0KPj4gLSAgICBwID0gYXJyYXlfaW5kZXhfbm9z
cGVjKHBvcnQgLyBFVlRDSE5fRklGT19FVkVOVF9XT1JEU19QRVJfUEFHRSwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICBkLT5ldnRjaG5fZmlmby0+bnVtX2V2dGNobnMpOw0K
Pj4gLSAgICB3ID0gcG9ydCAlIEVWVENITl9GSUZPX0VWRU5UX1dPUkRTX1BFUl9QQUdFOw0K
Pj4gKyAgICBwID0gYXJyYXlfaW5kZXhfbm9zcGVjKHBvcnQsIGQtPmV2dGNobl9maWZvLT5u
dW1fZXZ0Y2hucyk7DQo+PiArICAgIHcgPSBwICUgRVZUQ0hOX0ZJRk9fRVZFTlRfV09SRFNf
UEVSX1BBR0U7DQo+IA0KPiBJIGRvbid0IHNlZSB3aHkgdGhlIGNhbGN1bGF0aW9uIG9mIHcg
d291bGQgYWxzbyBuZWVkIHRvIGNoYW5nZSAtIHdoaWNoZXZlciB3YXkNCj4gaXQgaXMsIHcg
aXMgYm91bmRlZCBieSBFVlRDSE5fRklGT19FVkVOVF9XT1JEU19QRVJfUEFHRSAoYW5kIGhl
bmNlIHNhZmUpLg0KDQpJIHRob3VnaHQgaXQgd291bGQgYmUgY2xlYW5lciB0byB1c2UgcCBm
b3IgdGhlIGluZGV4IEFORCB0aGUgb2Zmc2V0Lg0KDQo+IFByZWZlcmFibHkgd2l0aCB0aGF0
IHVuZG9uZSAoY2FuIGRvIHdoaWxlIGNvbW1pdHRpbmcpOg0KDQpJZiB5b3UgcHJlZmVyIHRo
aXMsIGdvIGFoZWFkLg0KDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------rQYV7CqueS207LqZIK6XYUaP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rQYV7CqueS207LqZIK6XYUaP--

--------------XbpG1UKf0tojx2JE0CTNCueJ--

--------------MGcRpTDU0oCkYcUoLAW2n8pv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpqDZkFAwAAAAAACgkQsN6d1ii/Ey9b
jAgAg8Ezmt2wSUBU1aT+h8Gb2bULq018e+fhwHnXVBuiGsOZrec8n9o1E8hWqRfVJUSKbK5on9nh
2W6wEielY3JdeTbWbQRDhWPMU+vt5iiaaJV2eaadOw3QfSQS55J2m9vGbxCuHUJzkAJbLJuPd627
b2zx+nZ6PpgpdADSLmmKyIPRh7esYs2t5c6RI1Cplmfq6oVMuEUPjP1FzQb5EF2TpBTMOUjVPU0Z
RpH84sOnUS0rizre2ainZugdOc7hmv4S0LgLQnnxgniPOUPY0Sky+nc0NB8KuUJSt6L92AtxotAE
SYepT1EH5iC8M0r7nxHwCHyHZYopoRfy6aEj4d77NA==
=oW6/
-----END PGP SIGNATURE-----

--------------MGcRpTDU0oCkYcUoLAW2n8pv--

