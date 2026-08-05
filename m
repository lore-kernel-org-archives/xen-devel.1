Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DBCC55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:01:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383457.1626734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbF6-0002wF-Fr; Wed, 05 Aug 2026 13:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383457.1626734; Wed, 05 Aug 2026 13:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbF6-0002w8-CF; Wed, 05 Aug 2026 13:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1383457;
 Wed, 05 Aug 2026 13:01:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrbF4-0002w1-B2
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:01:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrbF3-00F0hI-Jl
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:01:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a73340f-5cb7-0a2a0a5109dd-0a2a450cca3a-10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:01:05 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a733411-f479-0a2a450c0019-d155d032e8bf-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:01:05 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6a097f5ab95so1386932a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:01:05 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a1462c4432sm1966922a12.26.2026.08.05.06.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 06:01:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1785934864; x=1786539664; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dy7OAYKdpFSION1qK9mLR1WaGwo6ArtSEVtHpH3KkpM=;
        b=QQEf42qJnrTxfo1zRW2FSPqPD3+R4acarIimedep5XEd7SDJKp+981nbkjpxKz1eqL
         HObxr1QAG8EpkQPtnqfjflKePiVCoWUQFHeoW9kNQP/+nUvHaexVsURXj92Kw7yPnRPa
         4tGaf6tt104+f1o32w5XjHwazbJ7d5EV89jkDukdRbKt07ZvBJoSqzCVO8cyXuiTI78Q
         ZOBF/EnzGunbJQUjtHIGVQKXoXQAZMBqfCbrJm+Xzs+IAx6xiaUbxC6ZY2RA5y9ZTwyn
         2C38InWsC/WjudtPE9ybA23ur9/DKk8JcYa6GhaYMS1aiCODk37c+AjS8R/SqsMTksl6
         rpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934864; x=1786539664;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dy7OAYKdpFSION1qK9mLR1WaGwo6ArtSEVtHpH3KkpM=;
        b=Q4ovANe17yu7rglKxdLIvC9vhs0RUNZJq8ib1OhVcc8T8rABupDCIHT1UOZvOFcKTn
         sJbOlYM3Xt08J3e01c/k60Qe5kub4s+KeIRhOysJ1XhbZd+8u/XR7Eso6blJkqrl1hqY
         aXoviu7IG20UVn6XsXJKgE35muiDBts/E/6qhAWuUVIZQr0diffHyaxp0+LmxITLWGrG
         PDVytwBeQYeugNo1+Oy/WZFQ5nmfXwcrmLaISINyqKgkSccpVqkHkC8DJiLia75le4TS
         OHsdR/5JY+/jw2lWENKFIEr5Ko3pjjGGzObV6WvIaVd0l0Ishp2ZZx4/nzj4EOBnfjWs
         JK+w==
X-Forwarded-Encrypted: i=1; AHgh+Roq46QCZtxZctSerCzozF5SCWdkj39e5z6JlrCPlXgAqVAoQUdCXIQjl7w0f45gseGjWDXrm+Zz4BU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW9bg1Y5hAu0WWgwXC8+h0phdvT/uHWzJbV/N7YcYYnUh85WXO
	bJk0hjZ49pqlUnKAHf7MeAoGSkgQ8LVkSd4Lx6IvzYH6wFkHEc/uZ7RdYYA0/J5T604B0ciSJoj
	k5sPPldE=
X-Gm-Gg: AR+sD13hO26k4whFaJ2UmvtuZHlgkky2h158Zs/hyFBB66r1t/D00CcibFPH9TyIQ0w
	J/DBNArHw4vRcknpN8XdScW1J4ngPvr08tUFNjI1r6NZIidEFyhFSliUQ2xsvcluKUlpH+hu6dp
	cllAlRs5lYbE2jrnh4itKyFLWd5WhhxuC0cL3p5eK8ik4bjOtBMOErrFqUWlqZF+hgDJCffg+LJ
	XITDR0XTNA3CGcMcwOnWYWArrRtYT0fiVVZPpxZ12RzvITsCxcLH+fM4ZVxytYcLyqsjQoOHnFM
	NyMw66QFuViHzwoAjCZv4LLT+tljQzcPOaup/Z+z6xkC3WzXNmtZkRAo9AMayxDpyEsnKAIeFh5
	eBxaDmMbps8c2TEKvyIaQjF1dRc5tdDLOoYM9wgVsJLhkuOerTOg/SMGkJNCANj1muzTFXk7F6c
	IsL25FHj1BeuZHItQmSFdUl+q7kZfP5h2KzCWU5X2t6JEaBoSIFMrPHsjxoQ8BNPrr5fa25YEIo
	TPH6YSKnww83SK+E2ERRHcgFGo0lhFczHpCtzyXmbsfx/Pejb0KbD0m4UzsifApzAUXsgo3iwcU
	nsf0BncCtf1BxAw=
X-Received: by 2002:a05:6402:50cf:b0:6a0:7a06:302a with SMTP id 4fb4d7f45d1cf-6a14f0e51f6mr3480243a12.3.1785934863571;
        Wed, 05 Aug 2026 06:01:03 -0700 (PDT)
Message-ID: <9ecb95f6-5235-4032-b0ab-c8b2f5a8830e@suse.com>
Date: Wed, 5 Aug 2026 15:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/sched: split scheduler vtable from struct
 scheduler
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260804055327.22119-2-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MaBRrfc6bR2rpKhS7HyJH9hK"
X-purgate-ID: tlsNG-d25034/1785934865-52331A5B-2BDD2FDC/0/0
X-purgate-type: clean
X-purgate-size: 9864

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MaBRrfc6bR2rpKhS7HyJH9hK
Content-Type: multipart/mixed; boundary="------------k00BdssbclEkhrLi90HNJ0s9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com
Message-ID: <9ecb95f6-5235-4032-b0ab-c8b2f5a8830e@suse.com>
Subject: Re: [PATCH v2 1/2] xen/sched: split scheduler vtable from struct
 scheduler
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-2-frn1furkan10@gmail.com>
In-Reply-To: <20260804055327.22119-2-frn1furkan10@gmail.com>
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

--------------k00BdssbclEkhrLi90HNJ0s9
Content-Type: multipart/mixed; boundary="------------CoTMydheAf7SCdPdQy3APn7A"

--------------CoTMydheAf7SCdPdQy3APn7A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjYgMDc6NTMsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gc3RydWN0IHNj
aGVkdWxlciBjdXJyZW50bHkgc2VydmVzIHR3byBwdXJwb3NlczogaXQgaXMgdGhlIHN0YXRp
Yw0KPiB2dGFibGUgYSBzY2hlZHVsZXIgYmFja2VuZCBkZWZpbmVzIChuYW1lLCBvcHRfbmFt
ZSwgc2NoZWRfaWQsIGFuZA0KPiBhbGwgaXRzIGZ1bmN0aW9uIHBvaW50ZXJzKSwgYW5kIGl0
IGlzIGFsc28gdGhlIHBlci1jcHVwb29sIHJ1bnRpbWUNCj4gb2JqZWN0IHNjaGVkdWxlcl9h
bGxvYygpIGFsbG9jYXRlcy4gQmVpbmcgdGhlIHNhbWUgdHlwZSBmb3JjZXMNCj4gc2NoZWR1
bGVyX2FsbG9jKCkgdG8gbWVtY3B5KCkgdGhlIHdob2xlIHZ0YWJsZSBpbnRvIGEgZnJlc2gN
Cj4gYWxsb2NhdGlvbiBwZXIgY3B1cG9vbCwgZHVwbGljYXRpbmcgaWRlbnRpY2FsIGZ1bmN0
aW9uIHBvaW50ZXJzDQo+IGFjcm9zcyBldmVyeSBjcHVwb29sIHVzaW5nIHRoZSBzYW1lIHNj
aGVkdWxlci4NCj4gDQo+IFNwbGl0IHRoZSB2dGFibGUgb3V0IGludG8gaXRzIG93biB0eXBl
LCBzdHJ1Y3Qgc2NoZWRfb3BzLCBzbyBpdA0KPiBjYW4gYmUgc2hhcmVkIGJ5IGV2ZXJ5IGNw
dXBvb2wgdXNpbmcgYSBnaXZlbiBzY2hlZHVsZXIgaW5zdGVhZCBvZg0KPiBjb3BpZWQgcGVy
IGNwdXBvb2wuIHN0cnVjdCBzY2hlZHVsZXIgaXMgbGVmdCBob2xkaW5nIG9ubHkgd2hhdCBp
cw0KPiBhY3R1YWxseSBwZXItaW5zdGFuY2U6IGEgcG9pbnRlciB0byB0aGUgc2hhcmVkIHNj
aGVkX29wcywgcGx1cw0KPiBzY2hlZF9kYXRhIGFuZCBjcHVwb29sLiBzY2hlZHVsZXJfYWxs
b2MoKSBub3cgc3RvcmVzIGEgcG9pbnRlciB0bw0KPiB0aGUgbWF0Y2hpbmcgc2NoZWRfb3Bz
IGluc3RhbmNlIGluc3RlYWQgb2YgY29weWluZyBpdHMgZmllbGRzLCBhbmQNCj4gZXZlcnkg
YWNjZXNzb3IgaW4gcHJpdmF0ZS5oIGlzIHVwZGF0ZWQgZnJvbSBzLT5maWVsZCB0bw0KPiBz
LT5vcHMtPmZpZWxkIHRvIG1hdGNoLg0KPiANCj4gRXZlcnkgaW4tdHJlZSBzY2hlZHVsZXIg
YmFja2VuZCAoY3JlZGl0LCBjcmVkaXQyLCBydGRzLCBhcmluYzY1MywNCj4gbnVsbCkgaXMg
Y29udmVydGVkIGZyb20gc3RydWN0IHNjaGVkdWxlciB0byBzdHJ1Y3Qgc2NoZWRfb3BzLg0K
PiANCj4gQSBoYW5kZnVsIG9mIGNhbGwgc2l0ZXMgZWxzZXdoZXJlIHJlYWQgYSBzY2hlZHVs
ZXIncyBuYW1lLA0KPiBvcHRfbmFtZSBvciBzY2hlZF9pZCBkaXJlY3RseSBhbmQgYXJlIHVw
ZGF0ZWQgdG8gZ28gdGhyb3VnaA0KPiAtPm9wcyBhcyB3ZWxsLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogRnVya2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29tPg0KDQpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4N
Cg==
--------------CoTMydheAf7SCdPdQy3APn7A
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

--------------CoTMydheAf7SCdPdQy3APn7A--

--------------k00BdssbclEkhrLi90HNJ0s9--

--------------MaBRrfc6bR2rpKhS7HyJH9hK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpzNA4FAwAAAAAACgkQsN6d1ii/Ey9K
2gf/aXMssP8XDAyhOIOkEt4YoePTHfdH5BPzbI3OLIYHRDSw6T/ynN4iw40h6HNRy10Hs8hG0X2i
djTW6AqTlOXn3jtqAgWRa7DDy8abE06RJGt4euMXHR2z4eisXZqubSNmtpkSRf+AU05cqHqr/G2J
CTxNz0fSbBVz6wClkxvZkF695w436XE2VzTedtU2/b1RZKeawnpBD8j/7LKgM7UgjbTKbjtHhWWe
sxq/KCbElZVlu/cEBQp2mVf4RMz9BKVPcRvrcmIuiSqdkT6UmUzGRG0xgzLXlEKWwUQ0QCkqYgKW
MrIjVQF14z9erj5FZUwEv93aB6W2k5A39pntEMY+xA==
=OprQ
-----END PGP SIGNATURE-----

--------------MaBRrfc6bR2rpKhS7HyJH9hK--

