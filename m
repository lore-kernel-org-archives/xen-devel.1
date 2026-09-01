Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B4C61DD3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 08:24:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404592.1638256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Jms-0007oX-0s; Tue, 01 Sep 2026 08:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404592.1638256; Tue, 01 Sep 2026 08:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Jmr-0007oQ-U3; Tue, 01 Sep 2026 08:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1404592;
 Tue, 01 Sep 2026 08:24:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x1Jmq-0007oK-GT
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:24:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1Jmp-00CNmP-6e
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 10:24:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a968b98-e002-0a2a0a5209dd-0a2a4509d6c0-44
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:24:07 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a968ba6-be1a-0a2a45090019-d155d031c953-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:24:06 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6a173ad7cf4so6949912a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 01:24:06 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255ee0b23esm523732666b.2.2026.09.01.01.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 01:24:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1788251046; x=1788855846; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ZUBl2Xc+talOjo3mXwBhKTr6Sqay2tUGEBOsxDXBB0=;
        b=KcRBSEVHocBe0sXXVDwbbDwIrJiXnAXeTnv48xf1ERMtjrSY5xjnw3+pQd6YsG92WC
         uEf8FIAwDKKIeUkGIcOxphSXrlQj/r/rTeAbgS7fX2ozV9cBRdj/9YK603GiCt2KVk6S
         Ir4wRt+BFbxO/NGsLba62wbNKwwkOy9lRgVXhLGSAkzyvCqt/v1edNpiN7EWPwob9gc5
         IzQERCNqE9nwiBgZValNGw9Q6N2GKPEkm4CwCqxReZsDs9GJfda9RbYV+yha7wX8hlH+
         tLoCSsMFKPf5bI74YWdUhpNuVnQWA660CQb6CNivSxbcEAY28Lr5Txlz86Awt6oe1idM
         xcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251046; x=1788855846;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZUBl2Xc+talOjo3mXwBhKTr6Sqay2tUGEBOsxDXBB0=;
        b=l6EspLM3GhuxSjhu67bbCyrBdM3ttS5OihoNJnMMpqYqti52TIDEWVrkPKYD2ctweU
         NMy4YW2tO3RKMG9Ed24zkzfOl9EoZJRfuu2sAbTFfQ4XxC4IaiHdXJmj4xP2QCAT6Tlw
         qS0terO8yBfqhuaNJ5T9YS+xTsXZuDcR5IG4c/dCQCh4c2G6wLfh5jDWCfZP3D2GQvI4
         58nou23IEcmEj2rxKkvln2MwRaFjJyranp/1+jGr4WNvA48uclwyLcb04NN/gTSMCY+H
         oWTEVaASl+Y/0PkGU3/WfVRYtLA8RVD4+vGObFiQd9c7TJYB1yC/aE1TkDUtqG1bbdbK
         7Y5A==
X-Forwarded-Encrypted: i=1; AHgh+RqohSPf7RRh8KSEkCJkWWzgW90ZMHknKVG7pJIcxbZkAQDQ7w2D7iiDgaxutOk7dgA/M4UIaSK/OK0=@lists.xenproject.org
X-Gm-Message-State: AFuF++npRTThQnogMCGqrKgRwC1jdOndm38LZfADTfdmrx4VxOcN1Zxn
	NaKKlYF7HktXlLt+v0HKNZfhZkzprTnjqjlM91PSYAkYon8AJYjH09LxVDLXIco+tYo=
X-Gm-Gg: AR+sD114N7fUGGeXAGTviXe+E8MWHTauBwdMqifwDnDfiRDhebCDdyOiphaHs2vVasZ
	nR26NHWGjKyo1nQxmtqIJYS9QxrJN2zwYc/73L22Pp0UKMEBMRtIToLruhckdv45+LGtrkMIZm/
	8j22gzT5GSS6yBz6tNbV7V0HigyFmtTJ5Ke3aVXKziU6ep23ixqOxAeal/vuTwCZ4FrBgfBx+nf
	15JBPc1XKjPc+mZrbMyPxuzUmKbij1tznnoj2OP5II3vG15MHLAnmHsF3+pfb5RJRL/tKQzCsx6
	b0XAJRqLNyis2/gb7CbogUoYsGFxgDZCUQs0g56Dr7EPYRgreg0qt2xnw5kJVHcvSHwmphesixn
	QuypNWUico8Qx0+XHhg5UzCYHoSPf1GVUIVXzxtX/VXhlb4eYeEVSS7QnfaHpBZxLBI0zW5jvJW
	qe5W3g0JV8F+OOCKfqmX461058U0C7mo8dRmd0gp98ZTiR+fO32/2I3Lp4Zf0fMS42n92w1Sdyk
	MeGmgwjBWkRH/jvlNAR5V8VfRSq8US0u6Q0gxkbcu019SuwXp66nBv//V7E+j8+90REaYQBVKLT
	6VI5lOa0MUQKWQ==
X-Received: by 2002:a17:907:9453:b0:c25:68c2:7b94 with SMTP id a640c23a62f3a-c2568c27f5cmr1739979566b.8.1788251046384;
        Tue, 01 Sep 2026 01:24:06 -0700 (PDT)
Message-ID: <06e18456-50ac-471d-8323-1560dd8b2a5c@suse.com>
Date: Tue, 1 Sep 2026 10:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
 <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
 <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
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
In-Reply-To: <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FOpXR5AeOYQZznHbHNvuKcY4"
X-purgate-ID: tlsNG-bad1c0/1788251047-3A0C5034-C8A09DE1/0/0
X-purgate-type: clean
X-purgate-size: 12598

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FOpXR5AeOYQZznHbHNvuKcY4
Content-Type: multipart/mixed; boundary="------------ByWW06Shcw4ERjyJwrfNMYSp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <06e18456-50ac-471d-8323-1560dd8b2a5c@suse.com>
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
 <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
 <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
In-Reply-To: <fcbb592a-b321-467a-ba3f-16aef00803af@suse.com>
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

--------------ByWW06Shcw4ERjyJwrfNMYSp
Content-Type: multipart/mixed; boundary="------------KsVYHFfYnEm42DHbauQwVP4L"

--------------KsVYHFfYnEm42DHbauQwVP4L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjYgMTA6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wOS4yMDI2
IDEwOjA3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDEuMDkuMjYgMDk6MjIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDMxLjA4LjIwMjYgMTQ6NTksIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDMxLjA4LjI2IDExOjQ1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gT24gMzEvMDgvMjAyNiA2OjE2IGFtLCBGdXJrYW4gQ2FsaXNrYW4gd3JvdGU6
DQo+Pj4+Pj4gRXZlcnkgdmNwdV9jcmVhdGUoKSBjYWxsIHNpdGUgdGhhdCBidWlsZHMgbW9y
ZSB0aGFuIG9uZSB2Y3B1IGxvb3BzDQo+Pj4+Pj4gb3ZlciBpZHMgdXAgdG8gZC0+bWF4X3Zj
cHVzIGFuZCBzdG9wcyBvbiB0aGUgZmlyc3QgZmFpbHVyZSwgYnV0IG5vbmUNCj4+Pj4+PiBv
ZiB0aGVtIHJvbGwgbWF4X3ZjcHVzIGJhY2sgdG8gbWF0Y2guIFRoaXMgbGVhdmVzIGQtPnZj
cHVbaV0gPT0gTlVMTA0KPj4+Pj4+IGZvciBpZHMgYmVsb3cgbWF4X3ZjcHVzDQo+Pj4+Pg0K
Pj4+Pj4gQXMgSSB0b2xkIHlvdSBiZWZvcmUsIHlvdSBtdXN0IGNvcGUgd2l0aCB0aGlzIHBy
b3BlcnR5IGluIG5vbi1lcnJvcg0KPj4+Pj4gc2NlbmFyaW9zLg0KPj4+Pj4NCj4+Pj4+PiAs
IHdoaWNoIGFueXRoaW5nIHdhbGtpbmcgZC0+dmNwdVtdIGNhbiB0aGVuDQo+Pj4+Pj4gZGVy
ZWZlcmVuY2UuIFRoaXMgaXMgd2hhdCBjYXVzZWQgdGhlIGNyYXNoOiBzY2hlZF9tb3ZlX2Rv
bWFpbigpDQo+Pj4+Pj4gd2Fsa3MgZXZlcnkgdmNwdSBzbG90IHVwIHRvIG1heF92Y3B1cyB3
aXRob3V0IGNoZWNraW5nIGZvciBlbXB0eQ0KPj4+Pj4+IG9uZXMsIHNvIHdoZW4gYSBkb21h
aW4gYnVpbHQgaW4gYSBub24tZGVmYXVsdCBjcHVwb29sIGhhZCB2Y3B1DQo+Pj4+Pj4gY3Jl
YXRpb24gZmFpbCBwYXJ0d2F5IHRocm91Z2gsIGRvbWFpbl9raWxsKCkgbGF0ZXIgbW92aW5n
IGl0IGJhY2sNCj4+Pj4+PiB0byB0aGUgZGVmYXVsdCBjcHVwb29sIGhhbmRlZCBvbmUgb2Yg
aXRzIGVtcHR5IHNsb3RzIHN0cmFpZ2h0IHRvDQo+Pj4+Pj4gdGhlIG5ldyBjcHVwb29sJ3Mg
c2NoZWR1bGVyLCBjYXVzaW5nIGEgTlVMTC1wb2ludGVyIGRlcmVmZXJlbmNlDQo+Pj4+Pj4g
aW5zaWRlIHNjaGVkX2FsbG9jX3VkYXRhKCkuDQo+Pj4+Pj4NCj4+Pj4+PiBBZGQgdmNwdXNf
Y3JlYXRlKGQpOiBjcmVhdGVzIGV2ZXJ5IHZjcHUgb2YgZCB1cCB0byBtYXhfdmNwdXMgYW5k
DQo+Pj4+Pj4gcm9sbHMgbWF4X3ZjcHVzIGJhY2sgdG8gdGhlIGZhaWxlZCBpZCBvbiBlcnJv
ci4gVGhpcyBrZWVwcw0KPj4+Pj4+IGQtPnZjcHVbaV0gaXMgbm9uLU5VTEwgZm9yIGFsbCBp
IDwgZC0+bWF4X3ZjcHVzDQo+Pj4+Pg0KPj4+Pj4gTm8sIGl0IHJlYWxseSBkb2Vzbid0Lg0K
Pj4+Pj4NCj4+Pj4+PiAsIGluc3RlYWQgb2YgZ3VhcmRpbmcNCj4+Pj4+PiBldmVyeSByZWFk
ZXIgb2YgZC0+dmNwdVtdIGFnYWlucyBob2xlcyBpbmRpdmlkdWFsbHkuDQo+Pj4+Pj4NCj4+
Pj4+PiBDb252ZXJ0IGV2ZXJ5IHNpdGUgdGhhdCBidWlsZHMgdmNwdXMgaW4gYSBsb29wIHRv
IGNhbGwgdGhpcyBmdW5jdGlvbg0KPj4+Pj4+IGluc3RlYWQuDQo+Pj4+Pj4NCj4+Pj4+PiBG
aXhlczogNjE2NDk3MDk0MjFhICgieGVuL2RvbWFpbjogQWxsb2NhdGUgZC0+dmNwdVtdIGlu
IGRvbWFpbl9jcmVhdGUoKSIpDQo+Pj4+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRnVya2FuIENhbGlz
a2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29tPg0KPj4+Pj4NCj4+Pj4+IEZvciB0aGUgYXZv
aWRhbmNlIG9mIGEgbG9uZyBkcmF3bi1vdXQgYXJndW1lbnQsIG5hY2suwqAgVW5kZXIgbm8N
Cj4+Pj4+IGNpcmN1bXN0YW5jZXMgYXJlIHlvdSBlZGl0aW5nIGQtPm1heF9jcHVzIGFmdGVy
IGl0J3MgcHV0IGludG8gdGhlIGRvbWFpbg0KPj4+Pj4gbGlzdC4NCj4+Pj4+DQo+Pj4+PiBZ
b3UndmUgY2hvc2VuIHRvIGRvIHNvIGF0IGEgcG9pbnQgd2hlcmUgdGhlIGRvbWFpbiBvYmpl
Y3QgaXMgbGl2ZSwNCj4+Pj4+IHZpc2libGUgaW4gdGhlIHN5c3RlbSBhbmQgYWJsZSB0byBi
ZSB0aGUgdGFyZ2V0IG9mIG90aGVyIGh5cGVyY2FsbHMuDQo+Pj4+Pg0KPj4+Pj4gRnVydGhl
cm1vcmUgeW91IGhhdmUgbm90IGZpeGVkIHdoYXQgeW91ciBjb21taXQgbWVzc2FnZSBjbGFp
bXMuDQo+Pj4+PiBkLT52Y3B1Wy4uLl0gaXMgc3RpbGwgTlVMTCBmb3IgYW4gYXJiaXRyYXJ5
IHBlcmlvZCBvZiB0aW1lLCBpbmNsdWRpbmcNCj4+Pj4+IGJlaW5nIGFibGUgdG8gYmUgdGhl
IHRhcmdldCBvZiBoeXBlcmNhbGxzLCBiZWZvcmUgdkNQVXMgYXJlIGNyZWF0ZWQuDQo+Pj4+
Pg0KPj4+Pj4gQWxsIGNvZGUgTVVTVCBiZSBhYmxlIHRvIGNvcGUgd2l0aCBkLT52Y3B1Wy4u
Ll0gYmVpbmcgTlVMTC7CoCBJdCdzIGhvdw0KPj4+Pj4gdGhlIG9iamVjdCBsaWZlY3ljbGVz
IG11c3Qgd29yaywgYmVjYXVzZSBjcmVhdGluZyB2Q1BVcyBpcyBub3QgYXRvbWljDQo+Pj4+
PiB3aXRoIHJlc3BlY3QgdG8gY3JlYXRpbmcgZG9tYWlucy4NCj4+Pj4NCj4+Pj4gV291bGQg
eW91IGJlIGZpbmUgd2l0aCBtZSBjcmVhdGluZyBhIHBhdGNoIHNlcmllcyBtb3ZpbmcgdmNw
dSBjcmVhdGlvbiBpbnRvDQo+Pj4+IGRvbWFpbl9jcmVhdGUoKT8NCj4+Pg0KPj4+IFRoaXMg
d2FzIGRpc2N1c3NlZCBiZWZvcmUsIGFuZCBob3dldmVyIG5pY2UgaXQgd291bGQgYmUgZm9y
IHRoZSBpc3N1ZSBhdCBoYW5kLA0KPj4+IGl0IHdvdWxkIGdldCBpbiB0aGUgd2F5IG9mIHVz
IHdhbnRpbmcgdG8gaGF2ZSBDUFUgcG9saWN5IGZvciBkb21haW5zIHB1dCBpbg0KPj4+IHBs
YWNlIGJlZm9yZSB2Q1BVLXMgYXJlIGNyZWF0ZWQsIHN1Y2ggdGhhdCBvbiB4ODYgdGhlIFhT
QVZFIGFyZWEgY2FuIGJlIHNpemVkDQo+Pj4gb25jZSBhbmQgZm9yIGFsbC4NCj4+DQo+PiBU
aGlzIGNvdWxkIGJlIGRvbmUgd2hlbiB1bnBhdXNpbmcgdGhlIGRvbWFpbiBpbml0aWFsbHku
DQo+IA0KPiBJbW8gdW5wYXVzaW5nIHNob3VsZG4ndCBmYWlsIGJlY2F1c2Ugb2YgbWVtb3J5
IHNob3J0YWdlLg0KDQpBcyBsb25nIGFzIHRoZSBkb21haW4gaGFzbid0IHN0YXJ0ZWQgcnVu
bmluZyBJIGRvbid0IHNlZSB3aHkgdGhpcyB3b3VsZCBiZQ0KZGlmZmVyZW50IHRvIHRoZSBj
YXNlIHdoZXJlIG5vdCBhbGwgdmNwdXMgY291bGQgYmUgY3JlYXRlZC4NCg0KQlRXLCBJIHdp
bGwgYWRkcmVzcyBzY2VuYXJpb3MgbGlrZSB0aGF0IGluIG15IFhlbiBzdW1taXQgcHJlc2Vu
dGF0aW9uLiA6LSkNCg0KDQpKdWVyZ2VuDQo=
--------------KsVYHFfYnEm42DHbauQwVP4L
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KsVYHFfYnEm42DHbauQwVP4L--

--------------ByWW06Shcw4ERjyJwrfNMYSp--

--------------FOpXR5AeOYQZznHbHNvuKcY4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqWi6UFAwAAAAAACgkQsN6d1ii/Ey/B
Fwf/cjrGJs91R6W+scxAe6iEVTQjgNLlPs51Bgp+94tI0lRBFwg7OkTPdUms4cikgWrYQZpnyqrI
lWOy6/w8j9RJ79zwjNZNp8DSAt7LiriYEaOF999qjc55oXo/wJbyFLuFeWPmQT3scRikRsTNpmC8
2j9Y9ABLhn/znrPKaAY6zSQuKGiujXCCGdLQMML0JJ9/BNgQnwcQ8meV3lr/L5HqNlWdgvjJeFfg
mqs6FHdBYBjYB/zPcfU5z9Mng4izfnWau8yse4dM3XXws0IYX3hYXfOljmDRZbt8bgYeRLCyYrLc
uouO+Rwe03JgRDN33lJXx9HCqvTIfVWz2zkzNQMx2g==
=XsQH
-----END PGP SIGNATURE-----

--------------FOpXR5AeOYQZznHbHNvuKcY4--

