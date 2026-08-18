Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59932C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:24:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393549.1632368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEB0-0004zi-HO; Tue, 18 Aug 2026 07:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393549.1632368; Tue, 18 Aug 2026 07:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEB0-0004zb-ED; Tue, 18 Aug 2026 07:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1393549;
 Tue, 18 Aug 2026 07:24:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwEAz-0004zV-Cn
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:24:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEAy-001ht8-Pf
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:24:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a84088b-2eae-0a2a0a5409dd-0a2a450688fc-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:24:00 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a840890-195a-0a2a45060019-d155d035e11d-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:24:00 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6a157f90752so6246682a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:24:00 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3d85319b1sm1607716a12.13.2026.08.18.00.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:23:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1787037840; x=1787642640; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v6Ect+BVV2rp46H08828Mnkf1AjJmDKjQgbbV67/FTI=;
        b=Ut9LaYxfh03YDcbtaJTiSubF1Todv+n6fgsh3J/5o1lcq1PBDBqd89w0gP5EA077z5
         Dm9iPwvE28B8JtD4QZFlmcQnPqQEWidCDBhb39QsOGlB3zvEvSFhJuhoV/pj6MB6zKop
         CsdKThK3lgxKGr8f2WizQ1IcWUEytOqU/hWgAkknyDVdmpFSs29thNpTlpet8Sh+5CZV
         m94Uf8ke0KrTiRYmALmuvUQ12KPJ3pQqD7FkLMxTjA4McUGE2yuS5qINvFwxj6RWLbCs
         MPuwZxPGpGxQo1SwaU5DOjvv9yw5Itfj3Le18g+HiRjmpOTlB/G97Sl+SPzVcNn//5t1
         0ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037840; x=1787642640;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6Ect+BVV2rp46H08828Mnkf1AjJmDKjQgbbV67/FTI=;
        b=IbBhNubSAI3Rgn603NnJ+ByOnH0isbqGdu9rKSBNhR9pi2iCyEbCqqFhBVJrsau24P
         xsJLbZKS/m22E+wbm9cYzqcJnFFgI+Z+6aFQsqvjc7MQvSeG6uI3OiNeFH9adEVbiDq9
         MUJgacqU95wiHE8N9fmsAVcUY9PgxnzblIGSKr90r+cZu7gQ/hzA0JDIzNAXvDJi8d6F
         1SV0mHd6tetDYJ3BEFyZ5KP5DnxX3b13PcycyDOOfrZuagB4jGz+aFCsNNYZlr8etABJ
         95z2y75dSkhurn1y3iuYrqN8obrALcGfHYrQZSBGFz9sHf9Y6ehp6/k4o7qEI0dsW/F1
         LQBA==
X-Forwarded-Encrypted: i=1; AHgh+RobPa06e+hC0ahyGhGCaF2t/1ZS4fEmgeNYgZ9pC/QCvYlKQGBxLG+FlsMf4215TS+AFQlXlSu4wO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNdVX3fyJOns9uu+3GddEZ8fqkBEJhCwMHqImXxSXUz5wFAtvI
	BtC2t5BTShyVS5/Db3pZowHlilOhw+r3HjbAlLUxUyqwkkvXgiQmDo7Ur4cjUnoZ8Wo=
X-Gm-Gg: AR+sD10pFCe5g5LjuR+z3sy5niGDonhEjANvPTYIYt6LYfu37UxEiRHpy7PKhLOC8wg
	+k15hnHMCpO4f1iHzUkmOW0kxJlIrVf9LryI5019hY5jcuuQPDcDR/VmTgTNzTSr6PvbGzeNGsU
	cc5QDQBcJaz0eB0sbxhirFZHf3G0ufRl7VZyaQmoYaAyZhduyYXvvkl5eIzBEGpX0QJx2MzxpjH
	n45nliJpq7aWCUj8fMLgtB4W33Xnp8ZYuXElbolaoR6O4w4zWSQisBjHJ6p6fMW9s+Ho24Pe15d
	uVh3QqVzvV2qvTj8DosG514SKVFFs6DCJl5srPBBTqpN9ZjiO14TtDwrRXr9aut1nwSwE3mUNiK
	QEQwRcDTyNh+T/vob8L33GuX2ky9Zl9TMzTQJXOsJblhUEnrJg92FnzTpNrFNV/5PJwMBPK7i6w
	18tg3lFssVFkTTiLgBA0cZ7SFVIfGomjeCD8HZeX0WkSLW0dUsrhFkwWs5khAMUDWUxRPYUSRvw
	liMpHNLYVrILJwT0CV3xned2b1jTqzwtzl2Z2MjcT5OGbE4DQDoAFoYrWck34+pHIUJkacv3MYq
	2tlR3KpYvQKgog==
X-Received: by 2002:a05:6402:20d1:10b0:6a3:8525:b9da with SMTP id 4fb4d7f45d1cf-6a3d1f2c5d1mr4361648a12.4.1787037840095;
        Tue, 18 Aug 2026 00:24:00 -0700 (PDT)
Message-ID: <d4fc3ae9-e048-4e66-bd18-d4a7a2024dd6@suse.com>
Date: Tue, 18 Aug 2026 09:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-3-frn1furkan10@gmail.com>
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
In-Reply-To: <20260818063259.18733-3-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------in5zL4sb5tT0i26bidN0O2OD"
X-purgate-ID: tlsNG-16d1c6/1787037840-F4A0477B-E750C1C6/0/0
X-purgate-type: clean
X-purgate-size: 9528

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------in5zL4sb5tT0i26bidN0O2OD
Content-Type: multipart/mixed; boundary="------------hy22a6UXLvCxK10ANgSLlwHt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org
Message-ID: <d4fc3ae9-e048-4e66-bd18-d4a7a2024dd6@suse.com>
Subject: Re: [PATCH 2/2] xen/sched: core: kill unarmed timers on
 sched_init_vcpu() failure
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
 <20260818063259.18733-3-frn1furkan10@gmail.com>
In-Reply-To: <20260818063259.18733-3-frn1furkan10@gmail.com>
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

--------------hy22a6UXLvCxK10ANgSLlwHt
Content-Type: multipart/mixed; boundary="------------2oZQmAeItHC3huexOgzquQki"

--------------2oZQmAeItHC3huexOgzquQki
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjYgMDg6MzIsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gc2NoZWRfaW5p
dF92Y3B1KCkgY2FsbHMgaW5pdF90aW1lcigpIGZvciBhIHZjcHUncyBwZXJpb2RpY190aW1l
ciwNCj4gc2luZ2xlc2hvdF90aW1lciBhbmQgcG9sbF90aW1lciBiZWZvcmUgaXQgY2FuIGZh
aWwgLS0gdGhlc2UNCj4gYmVjb21lIGxpdmUsIGxpbmtlZCBpbnRvIHRoZWlyIHRhcmdldCBw
Q1BVJ3MgcGVyLWNwdSB0aW1lciBsaXN0DQo+IHJlZ2FyZGxlc3Mgb2Ygd2hhdCBoYXBwZW5z
IG5leHQuIElmIHRoZSBzY2hlZF9hbGxvY191ZGF0YSgpIGNhbGwNCj4gZnVydGhlciBkb3du
IHRoZW4gZmFpbHMsIHRoZSBmdW5jdGlvbiBmcmVlcyB0aGUgc2NoZWRfdW5pdCB2aWENCj4g
c2NoZWRfZnJlZV91bml0KCkgYW5kIHJldHVybnMgMSwgYnV0IG5ldmVyIHVubGlua3MgdGhl
c2UgdGhyZWUNCj4gdGltZXJzLg0KPiANCj4gVGhlIGNhbGxlciwgdmNwdV9jcmVhdGUoKSwg
ZG9lcyB3b3JzZTogb24gc2NoZWRfaW5pdF92Y3B1KCkNCj4gcmV0dXJuaW5nIG5vbnplcm8g
aXQganVtcHMgdG8gZmFpbF93cSwgc2tpcHBpbmcgZmFpbF9zY2hlZCBhbmQNCj4gdGh1cyBz
Y2hlZF9kZXN0cm95X3ZjcHUoKSAtLSB0aGUgb25seSBmdW5jdGlvbiBvbiB0aGlzIHBhdGgg
dGhhdA0KPiBjYWxscyBraWxsX3RpbWVyKCkgb24gdGhlbS4gdmNwdV9kZXN0cm95KCkgdGhl
biBmcmVlcyB0aGUgdmNwdSwNCj4gYW5kIHRoZSB0aHJlZSB0aW1lcnMgZW1iZWRkZWQgaW4g
aXQsIHdoaWxlIHRoZXkgYXJlIHN0aWxsIGxpbmtlZA0KPiBpbnRvIHRoYXQgc2hhcmVkIGxp
c3QuDQo+IA0KPiBUaGlzIHNpbGVudGx5IGNvcnJ1cHRzIHRoYXQgbGlzdC4gSXQgb25seSBz
aG93cyB1cCBsYXRlciwgd2hlbg0KPiBzb21ldGhpbmcgZWxzZSB0b3VjaGVzIGEgbmVpZ2hi
b3JpbmcgdGltZXI6IHNjaGVkX21vdmVfZG9tYWluKCkNCj4gY3Jhc2hlZCB3aXRoICJBc3Nl
cnRpb24gJ2VudHJ5LT5wcmV2LT5uZXh0ID09IGVudHJ5JyBmYWlsZWQiIG9uIGENCj4gY29t
cGxldGVseSB1bnJlbGF0ZWQsIHZhbGlkIHZjcHVzJ3MgdGltZXIuDQo+IA0KPiBLaWxsIGFs
bCB0aHJlZSB0aW1lcnMgaW4gc2NoZWRfaW5pdF92Y3B1KCkncyBvd24gZmFpbHVyZSBicmFu
Y2gsDQo+IHNvIGl0IGRvZXNuJ3QgZGVwZW5kIG9uIHRoZSBjYWxsZXIgcmVhY2hpbmcgc2No
ZWRfZGVzdHJveV92Y3B1KCkNCj4gdG8gdW5kbyB3aGF0IGl0IHNldCB1cCBpdHNlbGYuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBGdXJrYW4gQ2FsaXNrYW4gPGZybjFmdXJrYW4xMEBnbWFp
bC5jb20+DQoNCkFwYXJ0IGZyb20gdGhlIG1pc3NpbmcgRml4ZXM6IHRhZzoNCg0KUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------2oZQmAeItHC3huexOgzquQki
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------2oZQmAeItHC3huexOgzquQki--

--------------hy22a6UXLvCxK10ANgSLlwHt--

--------------in5zL4sb5tT0i26bidN0O2OD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqECI8FAwAAAAAACgkQsN6d1ii/Ey9q
Rwf+L2k3awXc3UT0xayKlNJypmTwgpurZd+e/oogZbePtjmYOLhhd3Lc1tvsWGNUiV+tuft0OFFg
7RSZ/0mT7hG1dZ9GCSAHnWoKVh73ePdEzuwYenY7D8lyu4mwk8UndihQPOEksGVAbfiq7AqdLATW
9oHEkjn5xIE7SllJQVCYUrqg4gZ8yqUJL5TBeg5+cLYqZC80eBM61OAWB8Fw9SiLGoRX9BgYbuh8
tRhvJy0wEpf66CfC27GW/TYG/yeJfQYs5j2nuQdwhS7f0LRkXkE8joklty2ZIKs+u+oAZbEkUa7y
BF2e4qTjM0O33uRU1hjzH/gbV1lMu1OhHPrqMMQK4w==
=e9ze
-----END PGP SIGNATURE-----

--------------in5zL4sb5tT0i26bidN0O2OD--

