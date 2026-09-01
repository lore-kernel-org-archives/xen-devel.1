Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37514C61DD3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 08:07:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404566.1638229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1JWY-0003Um-6f; Tue, 01 Sep 2026 08:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404566.1638229; Tue, 01 Sep 2026 08:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1JWY-0003Uf-3q; Tue, 01 Sep 2026 08:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1404566;
 Tue, 01 Sep 2026 08:07:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x1JWX-0003UY-9E
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:07:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1JWV-00G8Re-RD
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 10:07:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a9687b0-2eae-0a2a0a5409dd-0a2a4504bc2c-20
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:07:15 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a9687b3-b57f-0a2a45040019-d155da29cda5-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:07:15 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c1677c91969so429467266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 01:07:15 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255f1b1fdasm555613666b.37.2026.09.01.01.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 01:07:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1788250035; x=1788854835; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKng7plS+wfHNbRg40bNCxW0BINUIt1q4fUwO2gBYBY=;
        b=I+yApMdUG881/vhOzZEzo3MwtLKWVSO54O74N1h+4IQGyduyDqo8sP/bMNqJZIvtCA
         mRqBy3xhGvXh5fLif/Hozdazr36g45/gByFb+7BdI+8w39D4cV3tGZq24sH+vkbVGk+B
         uq7nVzcd9KMdcn4bLZLxkm/jBHrvw2ODm4wu8aLYSFBJeobLcfI1BimUDRCHT2YFwzyl
         gS8ljtJffxivOfRjkLt+BnYEvLbwM6psyBcs1TJobBesljoqxX21LCqpj1YCaaongw87
         PIEA9itwdYD6lKTB7J5rn44n1WA5kTMsJ0/ASVYYWZdzcfQ5c9iE74JuKs0FhZ/F/5LQ
         NR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250035; x=1788854835;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKng7plS+wfHNbRg40bNCxW0BINUIt1q4fUwO2gBYBY=;
        b=HCN64tJLWf0P4r7bfR0ZjBRibSV+a+1XV752bRAkm9DR5xIRZqxNI3C3aaYi76VNhp
         mTCYvjVR4IJa/JwQPgExDN7CeSf8UKFpcf4JsS87DiReH99tMwh++bWyD0ICCvckcvEh
         fyQI4c/LzVI7xlpsIReaS5ihB73IK1GSZvM9MYOessJLX7fIfGys7AXHr/n8rDkV66n8
         iKK6DCOjmYMnEDj0vOzrqInGJ1P/i8SI/jnikP14358ceWjnIROvANzDmTljEij+6Gjr
         nn4P87IfIjFkx5xHR5W94my+72rAmh4wDCf+AKP6dd7uymHGKO0RSLn4yZKEWLJG7Ew3
         i52Q==
X-Forwarded-Encrypted: i=1; AHgh+RrS+EQNLwa56bYAX3fI5vjApODu5gt+8Rbtt7iRaO/j8caKDnE0/+Ui9eZRbCmi00gn5bzZDD4+LNg=@lists.xenproject.org
X-Gm-Message-State: AFuF++kmeHNB79o61cjKC43P+FA6cdnDAThB3gFlOV8N46Edg/4r7tAt
	vG4a/GgvprF3Ywy2qSrND+2cFkNEeo39PIKR9i0pNvtb0rH8owCVv0uwqNbFtzys8lQYSs1obKA
	TvNPqcCY=
X-Gm-Gg: AR+sD13R3E+AyImjxoumlOAHu88Fxz5Dam2mNfFm/aWz/zvwYGqYf1Kw/EOXtFB5o5/
	CHHd19XMiGhH5NEbjg+DR9iH+6XjAzl5o+3RyDnLNFBjnpSjDRmLTn2r/B87Y1xpL8bqQviQgq4
	oxYX2Kgohda4ZQN1YC+eb/rrs6XQ+zEOdUuiEgrEtq7j9C39nEbmXmiElVZXZTngGE98DHgBJyH
	AhrWYYsypFVIYNIVGNeAhSKyiPQfyMzzJrscSj6haeXZWvJoGbNTtndGBkf5PZ5Xl0ACDzf1Mch
	iUV1e+2p268TYoncokPaRC1Zihcbtb89c2/Us7c2THRx8NMwX9HSSEEDlYG9ecZRGHivgUyXIeW
	nAXu0tV2hAqKY9NQTIBLdUIDMPPQi8Z7XvJjzxuYhTWawYKpSbPoLTGreFYo3w6JZoSMudVPXdj
	85VeI2GqC/DyeLj4EhNTyEjaWEAlWujW1XwU7EmJmL5P9p9DLTrXl7xegO76Ocfo4m9kkWKkhRO
	sTCpragy+NIzUJpCcIkZd5mq4L+YmG9M2UX6+7I6OMO/Oh1RXhRs9rqhjUlYY74S8P1GeXqNzoA
	vL30v41Rk4MP/w==
X-Received: by 2002:a17:907:6094:b0:c25:34c7:44d1 with SMTP id a640c23a62f3a-c255667bfc7mr1913252366b.0.1788250035030;
        Tue, 01 Sep 2026 01:07:15 -0700 (PDT)
Message-ID: <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
Date: Tue, 1 Sep 2026 10:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: Jan Beulich <jbeulich@suse.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
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
In-Reply-To: <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0tnotbH2Mecj0aVMudFcmloO"
X-purgate-ID: tlsNG-ebf023/1788250035-C34C3B50-9B894D95/0/0
X-purgate-type: clean
X-purgate-size: 12142

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0tnotbH2Mecj0aVMudFcmloO
Content-Type: multipart/mixed; boundary="------------Ch3mKlZbr100lCOUF5CdLELp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dfaggioli@suse.com, gwd@xenproject.org, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <258aa564-4856-4d28-8b90-aa858b25fdd2@suse.com>
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
 <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
 <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
In-Reply-To: <8a187b46-9ec2-4040-bd00-c71059dad952@suse.com>
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

--------------Ch3mKlZbr100lCOUF5CdLELp
Content-Type: multipart/mixed; boundary="------------pJ5AhE12pSrlxrhgyBuQJdrZ"

--------------pJ5AhE12pSrlxrhgyBuQJdrZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjYgMDk6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMS4wOC4yMDI2
IDE0OjU5LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMzEuMDguMjYgMTE6NDUsIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMzEvMDgvMjAyNiA2OjE2IGFtLCBGdXJrYW4g
Q2FsaXNrYW4gd3JvdGU6DQo+Pj4+IEV2ZXJ5IHZjcHVfY3JlYXRlKCkgY2FsbCBzaXRlIHRo
YXQgYnVpbGRzIG1vcmUgdGhhbiBvbmUgdmNwdSBsb29wcw0KPj4+PiBvdmVyIGlkcyB1cCB0
byBkLT5tYXhfdmNwdXMgYW5kIHN0b3BzIG9uIHRoZSBmaXJzdCBmYWlsdXJlLCBidXQgbm9u
ZQ0KPj4+PiBvZiB0aGVtIHJvbGwgbWF4X3ZjcHVzIGJhY2sgdG8gbWF0Y2guIFRoaXMgbGVh
dmVzIGQtPnZjcHVbaV0gPT0gTlVMTA0KPj4+PiBmb3IgaWRzIGJlbG93IG1heF92Y3B1cw0K
Pj4+DQo+Pj4gQXMgSSB0b2xkIHlvdSBiZWZvcmUsIHlvdSBtdXN0IGNvcGUgd2l0aCB0aGlz
IHByb3BlcnR5IGluIG5vbi1lcnJvcg0KPj4+IHNjZW5hcmlvcy4NCj4+Pg0KPj4+PiAsIHdo
aWNoIGFueXRoaW5nIHdhbGtpbmcgZC0+dmNwdVtdIGNhbiB0aGVuDQo+Pj4+IGRlcmVmZXJl
bmNlLiBUaGlzIGlzIHdoYXQgY2F1c2VkIHRoZSBjcmFzaDogc2NoZWRfbW92ZV9kb21haW4o
KQ0KPj4+PiB3YWxrcyBldmVyeSB2Y3B1IHNsb3QgdXAgdG8gbWF4X3ZjcHVzIHdpdGhvdXQg
Y2hlY2tpbmcgZm9yIGVtcHR5DQo+Pj4+IG9uZXMsIHNvIHdoZW4gYSBkb21haW4gYnVpbHQg
aW4gYSBub24tZGVmYXVsdCBjcHVwb29sIGhhZCB2Y3B1DQo+Pj4+IGNyZWF0aW9uIGZhaWwg
cGFydHdheSB0aHJvdWdoLCBkb21haW5fa2lsbCgpIGxhdGVyIG1vdmluZyBpdCBiYWNrDQo+
Pj4+IHRvIHRoZSBkZWZhdWx0IGNwdXBvb2wgaGFuZGVkIG9uZSBvZiBpdHMgZW1wdHkgc2xv
dHMgc3RyYWlnaHQgdG8NCj4+Pj4gdGhlIG5ldyBjcHVwb29sJ3Mgc2NoZWR1bGVyLCBjYXVz
aW5nIGEgTlVMTC1wb2ludGVyIGRlcmVmZXJlbmNlDQo+Pj4+IGluc2lkZSBzY2hlZF9hbGxv
Y191ZGF0YSgpLg0KPj4+Pg0KPj4+PiBBZGQgdmNwdXNfY3JlYXRlKGQpOiBjcmVhdGVzIGV2
ZXJ5IHZjcHUgb2YgZCB1cCB0byBtYXhfdmNwdXMgYW5kDQo+Pj4+IHJvbGxzIG1heF92Y3B1
cyBiYWNrIHRvIHRoZSBmYWlsZWQgaWQgb24gZXJyb3IuIFRoaXMga2VlcHMNCj4+Pj4gZC0+
dmNwdVtpXSBpcyBub24tTlVMTCBmb3IgYWxsIGkgPCBkLT5tYXhfdmNwdXMNCj4+Pg0KPj4+
IE5vLCBpdCByZWFsbHkgZG9lc24ndC4NCj4+Pg0KPj4+PiAsIGluc3RlYWQgb2YgZ3VhcmRp
bmcNCj4+Pj4gZXZlcnkgcmVhZGVyIG9mIGQtPnZjcHVbXSBhZ2FpbnMgaG9sZXMgaW5kaXZp
ZHVhbGx5Lg0KPj4+Pg0KPj4+PiBDb252ZXJ0IGV2ZXJ5IHNpdGUgdGhhdCBidWlsZHMgdmNw
dXMgaW4gYSBsb29wIHRvIGNhbGwgdGhpcyBmdW5jdGlvbg0KPj4+PiBpbnN0ZWFkLg0KPj4+
Pg0KPj4+PiBGaXhlczogNjE2NDk3MDk0MjFhICgieGVuL2RvbWFpbjogQWxsb2NhdGUgZC0+
dmNwdVtdIGluIGRvbWFpbl9jcmVhdGUoKSIpDQo+Pj4+IFN1Z2dlc3RlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBGdXJrYW4g
Q2FsaXNrYW4gPGZybjFmdXJrYW4xMEBnbWFpbC5jb20+DQo+Pj4NCj4+PiBGb3IgdGhlIGF2
b2lkYW5jZSBvZiBhIGxvbmcgZHJhd24tb3V0IGFyZ3VtZW50LCBuYWNrLsKgIFVuZGVyIG5v
DQo+Pj4gY2lyY3Vtc3RhbmNlcyBhcmUgeW91IGVkaXRpbmcgZC0+bWF4X2NwdXMgYWZ0ZXIg
aXQncyBwdXQgaW50byB0aGUgZG9tYWluDQo+Pj4gbGlzdC4NCj4+Pg0KPj4+IFlvdSd2ZSBj
aG9zZW4gdG8gZG8gc28gYXQgYSBwb2ludCB3aGVyZSB0aGUgZG9tYWluIG9iamVjdCBpcyBs
aXZlLA0KPj4+IHZpc2libGUgaW4gdGhlIHN5c3RlbSBhbmQgYWJsZSB0byBiZSB0aGUgdGFy
Z2V0IG9mIG90aGVyIGh5cGVyY2FsbHMuDQo+Pj4NCj4+PiBGdXJ0aGVybW9yZSB5b3UgaGF2
ZSBub3QgZml4ZWQgd2hhdCB5b3VyIGNvbW1pdCBtZXNzYWdlIGNsYWltcy4NCj4+PiBkLT52
Y3B1Wy4uLl0gaXMgc3RpbGwgTlVMTCBmb3IgYW4gYXJiaXRyYXJ5IHBlcmlvZCBvZiB0aW1l
LCBpbmNsdWRpbmcNCj4+PiBiZWluZyBhYmxlIHRvIGJlIHRoZSB0YXJnZXQgb2YgaHlwZXJj
YWxscywgYmVmb3JlIHZDUFVzIGFyZSBjcmVhdGVkLg0KPj4+DQo+Pj4gQWxsIGNvZGUgTVVT
VCBiZSBhYmxlIHRvIGNvcGUgd2l0aCBkLT52Y3B1Wy4uLl0gYmVpbmcgTlVMTC7CoCBJdCdz
IGhvdw0KPj4+IHRoZSBvYmplY3QgbGlmZWN5Y2xlcyBtdXN0IHdvcmssIGJlY2F1c2UgY3Jl
YXRpbmcgdkNQVXMgaXMgbm90IGF0b21pYw0KPj4+IHdpdGggcmVzcGVjdCB0byBjcmVhdGlu
ZyBkb21haW5zLg0KPj4NCj4+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggbWUgY3JlYXRpbmcg
YSBwYXRjaCBzZXJpZXMgbW92aW5nIHZjcHUgY3JlYXRpb24gaW50bw0KPj4gZG9tYWluX2Ny
ZWF0ZSgpPw0KPiANCj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGJlZm9yZSwgYW5kIGhvd2V2ZXIg
bmljZSBpdCB3b3VsZCBiZSBmb3IgdGhlIGlzc3VlIGF0IGhhbmQsDQo+IGl0IHdvdWxkIGdl
dCBpbiB0aGUgd2F5IG9mIHVzIHdhbnRpbmcgdG8gaGF2ZSBDUFUgcG9saWN5IGZvciBkb21h
aW5zIHB1dCBpbg0KPiBwbGFjZSBiZWZvcmUgdkNQVS1zIGFyZSBjcmVhdGVkLCBzdWNoIHRo
YXQgb24geDg2IHRoZSBYU0FWRSBhcmVhIGNhbiBiZSBzaXplZA0KPiBvbmNlIGFuZCBmb3Ig
YWxsLg0KDQpUaGlzIGNvdWxkIGJlIGRvbmUgd2hlbiB1bnBhdXNpbmcgdGhlIGRvbWFpbiBp
bml0aWFsbHkuDQoNCk9UT0ggSSBkb24ndCBzZWUgeHN0YXRlX2FsbG9jX3NhdmVfYXJlYSgp
IGxvb2tpbmcgYXQgdGhlIGRvbWFpbidzIGNwdSBwb2xpY3kNCmF0IGFsbC4gSXMgdGhpcyBh
IHBsYW4gZm9yIHRoZSBmdXR1cmU/DQoNCkFuZCBhZGRpdGlvbmFsbHkgdGhlcmUgaXMgbm8g
Z3VhcmQgZm9yIGF2b2lkaW5nIHRoZSB2Y3B1cyBiZWluZyBjcmVhdGVkIGJlZm9yZQ0KdGhl
IHBvbGljeSBpcyBiZWluZyBzZXQuDQoNCg0KSnVlcmdlbg0K
--------------pJ5AhE12pSrlxrhgyBuQJdrZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pJ5AhE12pSrlxrhgyBuQJdrZ--

--------------Ch3mKlZbr100lCOUF5CdLELp--

--------------0tnotbH2Mecj0aVMudFcmloO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqWh7IFAwAAAAAACgkQsN6d1ii/Ey93
3wf/UcBXGREpPNr0BE2U8RYQwJLYo+iP253CxF6/2uixXEdtLP+l6wvXLIULCKaGFgArDYqDnvvz
PjFZiXDWhfYOgXUVQFzz6tNXd6niuDLDxeZdqjz+GqZOne8Vr+jbn7jdR4Ifi9/rm/FM0zub1pwP
t+mjx+2CeH4Hse9C3m3+TKBVzZDO/kj2p32EXTPI/nCyMNVhzG8fh0zi08xmWDXWzgFlcgncvScu
V+CfhKft796YWCj+D50bLXGTT/nNq66yyG6eHAlFs5qOndpZPHOvYnfv0EpIq8piin9yK8XKP+Pc
g/DWaJepu1dMOq2NYnM5DoX3S+TVenj/HLtPp37R7w==
=9a/z
-----END PGP SIGNATURE-----

--------------0tnotbH2Mecj0aVMudFcmloO--

