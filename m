Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132C5C982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:09:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425002.1649165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UbG-0006vm-He; Fri, 18 Sep 2026 09:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425002.1649165; Fri, 18 Sep 2026 09:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UbG-0006vf-Ed; Fri, 18 Sep 2026 09:09:42 +0000
Received: by outflank-mailman (input) for mailman id 1425002;
 Fri, 18 Sep 2026 09:09:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x7UbF-0006vZ-Dm
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:09:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7UbE-0044y6-Qa
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:09:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aacffcc-e002-0a2a0a5209dd-0a2a450abc7e-42
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:09:40 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aacffd4-f2d2-0a2a450a0019-4a7de18cda0a-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:09:40 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccead2aecso2485975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 02:09:40 -0700 (PDT)
Received: from [172.18.88.57] (195-200-20-130.mclarenap.oninferno.net.
 [195.200.20.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd225898sm149690625e9.9.2026.09.18.02.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 02:09:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1789722580; x=1790327380; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4pbAVd85TCjqoPT0n6RX7sA3GT9XAtOIfbocwj4B7zM=;
        b=EVRQdJXWD7DO+NsiBIc3czP7VglJsA7LBf85fa28k7MnfgnQhoK5rCJKqnYD0cktrG
         LIxZuwiJpRW7PekbJdmlqegNSa6N9SHZGR5M/9oClY9WW2Sg2IgyK12Op3pcflw5Rmqg
         /9Y6UXpIrDWn8Zk71jVLetX/dURAT0UK8bqyqsXFuxz/mOv2fGx7MNqpxzc2xbxCXDG0
         VqaKStQSbLXcQgc4150u3n0C+R0vvV8P37iNU+7Hc+NDMMp+/ytMIgcgEluuKyD0YC4e
         i4agGQ6HORHTYSWbWnBcTLMGmJGdvtbOv3XBIDHN+onbHZ067rlHcxlqwuk8kD9HFdIH
         gX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722580; x=1790327380;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pbAVd85TCjqoPT0n6RX7sA3GT9XAtOIfbocwj4B7zM=;
        b=T8IWHBbv49N5tf7zedBSDiQIwK+yY2KsLewXYEYVwkLX9CMfxQG1eObfXpN2B17SPb
         WqzfO3aQuH1xgaj65bhTgF4p7l1uHczAGkCPceesHnru52GfvuSsMwQGDTrZsnjJ5sAT
         SF1OELTq91pE9qT8aWk4sYDkdEduFXF5XG89mpyxgcGIOr36itRUTke9RfKZ3lLX9UcW
         tzdnAu3z/SfjBeTe/dR62J1F06mABCMdRLlg+59Z1kI5e0gwcrHVLwImpXRtkTwaXtyV
         S5KiNB3fRahl+CK7Sz1JWOkb0CbdkmTRWP0EUKdX6+A1dZey6wQ+11CRqeLoSCCoKOE1
         vGfA==
X-Forwarded-Encrypted: i=1; AKwUvBwDOi0S1qKrMz5fKxOgKrteRxGL3QteVIlTzrMofwqFmiYMl719uJJ1zajdbVd82uRC5D6VpAGIzMU=@lists.xenproject.org
X-Gm-Message-State: AFuF++kAgZuViJ1N4QW5YRK3seQlhLoGFCnjOwpWlsurv6sKbv8c3Flf
	2XAUrzHdmE16cijxSg2mPTZPwIpBWfS1EJfig3Gt2DzalDqrZ3U0JAmiwACPt8D2be8=
X-Gm-Gg: AYBFou31LuWLO2W9W2Jil6hQRxDqLx2/Nw3uAT1pz9oiPipXKmaf8KdcX20cvOYzroH
	JGN0SksILhS03sna3jHufLZ1bkQ0GBt/ERB6GtKxICia5XUZHq4FkHZPb5nL0U5yadew7GXf7Y0
	L0PMDqrRaKzUrnGB6nrivGecEqB2sVqDlH7KPpD7fe2nD0BxSTBzE0fKn1KyYtCQZmoO4B09RVz
	QELrNv5q5QgzcqacuaVXHZumn3YZy2uqZi8OrJVCIdNy9JXkTUXcSQzHZEJsE2BPrXEu8F0QJf2
	fj4pQ9WdS2xpo4eNJs0GgRc0LH19xGLrHzkz/CPcZY9a21re0N+8fdPUc4xOoxvmCWxKzbdM/aN
	8ofl8CvUIC2z8kLDb47LRltMkccG9lYUItlV4Nq48ZLC+mVAbRdNN5Q0g6PGcGYlwCJEsEClq4D
	pH4J4kFWNfcU9rhyKQBz7ZOJvK+IMVb8Muv6lFeOraV8b0zlHCUiyGK8KBZn4eAuqz+YFzLNjkU
	Soc5KZR8uya41KQHMebKrq9wLPSISoCPyM+Hjk=
X-Received: by 2002:a05:600c:1f8b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49fc5745fc0mr20476465e9.16.1789722580149;
        Fri, 18 Sep 2026 02:09:40 -0700 (PDT)
Message-ID: <86c6c469-1351-45a7-8c09-8914ce44c17f@suse.com>
Date: Fri, 18 Sep 2026 11:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
 <20260918080935.35498-3-frn1furkan10@gmail.com>
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
In-Reply-To: <20260918080935.35498-3-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zaQkt0RjOKjlMvpOzjrGJxpv"
X-purgate-ID: tlsNG-4011c0/1789722580-4B4D7CFC-7FC96A89/35/110847
X-purgate-type: clean
X-purgate-size: 8672

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zaQkt0RjOKjlMvpOzjrGJxpv
Content-Type: multipart/mixed; boundary="------------XwWPDD6i0p6lKYzQXM1MZzCJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org
Message-ID: <86c6c469-1351-45a7-8c09-8914ce44c17f@suse.com>
Subject: Re: [PATCH v2 2/5] xen/sched: rtds: enforce admission control in xl
 sched-rtds
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
 <20260918080935.35498-3-frn1furkan10@gmail.com>
In-Reply-To: <20260918080935.35498-3-frn1furkan10@gmail.com>
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

--------------XwWPDD6i0p6lKYzQXM1MZzCJ
Content-Type: multipart/mixed; boundary="------------CKhYrEjS8L7gv44CW04Bclei"

--------------CKhYrEjS8L7gv44CW04Bclei
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDkuMjYgMTA6MDksIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gTm93IHRoYXQg
d2UgaGF2ZSBpbnRyb2R1Y2VkIGFkbWlzc2lvbiBjb250cm9sIGZvciBuZXcgYW5kDQo+IHJl
bW92ZWQgdW5pdHMuIEV4dGVuZCBpdCB0byBYRU5fRE9NQ1RMX1NDSEVET1BfcHV0aW5mbyBh
bmQNCj4gcHV0dmNwdWluZm8sIHNvIGdyb3dpbmcgYW4gZXhpc3RpbmcgcmVzZXJ2YXRpb24g
dmlhDQo+IHhsIHNjaGVkLXJ0ZHMgaXMgY2hlY2tlZCB0b28uDQo+IA0KPiBwdXRpbmZvIHNl
dHMgdGhlIHNhbWUgKHBlcmlvZCwgYnVkZ2V0KSBmb3IgZXZlcnkgdW5pdCBvZiBhDQo+IGRv
bWFpbiBhdCBvbmNlLCBzbyBpdCB0ZXN0cyB0aGUgd2hvbGUgZG9tYWluJ3MgdXRpbGl6YXRp
b24NCj4gZGVsdGEgYXRvbWljYWxseSwgcmF0aGVyIHRoYW4gdW5pdC1ieS11bml0LCB3aGlj
aCBjb3VsZA0KPiBzcHVyaW91c2x5IHJlamVjdCBhbiBvdmVyYWxsLWFjY2VwdGFibGUgY2hh
bmdlIGRlcGVuZGluZyBvbg0KPiBpdGVyYXRpb24gb3JkZXIuDQo+IA0KPiBwdXR2Y3B1aW5m
byBjaGFuZ2VzIG9uZSB1bml0IGF0IGEgdGltZSwgc28gaXQganVzdCBjYWxscw0KPiBydF90
cnlfc2V0X3V0aWxpemF0aW9uKCkgZGlyZWN0bHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBG
dXJrYW4gQ2FsaXNrYW4gPGZybjFmdXJrYW4xMEBnbWFpbC5jb20+DQpSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------CKhYrEjS8L7gv44CW04Bclei
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

--------------CKhYrEjS8L7gv44CW04Bclei--

--------------XwWPDD6i0p6lKYzQXM1MZzCJ--

--------------zaQkt0RjOKjlMvpOzjrGJxpv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqs/7kFAwAAAAAACgkQsN6d1ii/Ey+J
jAf/b3eVGoFjW0lfQm4/qlx2P30RqrCKUsnJug94tNdpXL6VSv+9+FaZOJgWrTAh5Vl7gTw6UGZI
s5jEArn5NbYTgFg+CQQi0/4ZQXwQi5CrSF2rzxAmqd+xdF4Vcpw/33xUrmgOM3PhPiIjd9T95dfU
8fiZaL6wfKV1TUhth14dYngdov+/s3PMntXwrD6ZyKAVWnUlQ46lG5HgYyZHoV3hq0EA955JhM0Y
rjmV5za43WjmFgkx0jFO1i4x+LcLE2hKbFlUC0VI7Nod+8/Rv5Zn9jOHhy+5YX7kH9xi9f9wwUL5
jOQsKm4i/NOFn1dP/AFON/jd2zsNTZ9KHvA+kcKb0Q==
=UMjs
-----END PGP SIGNATURE-----

--------------zaQkt0RjOKjlMvpOzjrGJxpv--

