Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094EDC982D9
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:17:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425020.1649193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UiY-0000mP-Mi; Fri, 18 Sep 2026 09:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425020.1649193; Fri, 18 Sep 2026 09:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UiY-0000mI-JW; Fri, 18 Sep 2026 09:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1425020;
 Fri, 18 Sep 2026 09:17:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x7UiX-0000lY-C5
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:17:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7UiW-008h8D-Ov
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:17:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aad0188-bab6-0a2a0a5309dd-0a2a450796fe-32
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:17:12 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aad0198-b4ea-0a2a45070019-4a7de18cbdd4-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:17:12 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so4236165e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 02:17:12 -0700 (PDT)
Received: from [172.18.88.57] (195-200-20-130.mclarenap.oninferno.net.
 [195.200.20.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd225898sm150134065e9.9.2026.09.18.02.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 02:17:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1789723032; x=1790327832; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZcUhFz75ZWOoJCk4PFLmwb+gcGUHGOb/sbvfW40GZY=;
        b=bAuproyoSqulyWNwpdXaqEbbhGJ33cHYUuCHpTW8VTOhkbay5rlQcHzSVjkuixFmzW
         ByYpbeYU4HHOxln6kyz07AqscKjLTC/zbK0lvywevhv1rkhGWTBoqu4S5bzRTF6ZZNqM
         jTAODW4YF05gNbdP8dkr8AysEL6BTsVFaSG5ptmhwtYvjDPzhaEMfzPE5fJfq7nu34rf
         innupSlfC/e59VjrTAVLn062qtiSwmBgPGDJwswGJGV72TKTULg3Ll0++NA07v4z/wkI
         Bp3A/s+GLPHKiOtmSxHogZGWnRsm4C0I0f4R4YCsvqyAzGatmQJevQmX8aZoqrJuSRzr
         cfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723032; x=1790327832;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZcUhFz75ZWOoJCk4PFLmwb+gcGUHGOb/sbvfW40GZY=;
        b=h9DXw3NT9lcHI2Qq9zU/vsghXtMsqC+BdA7j1Oqu7uWJsGXq8GsiX//KoYWHjJYdGq
         2GgVtofKAX3UM166VjDkYa4y5OhT6yxlkRWIprwf8eTU4mg+Hx4xb1ZKSvOUgk09MZ5i
         95JquCRMqLJkkRiERs2hduXOvCQFvwMMEmOGJBtAFqrPRcuMit9MEK9udZdaFthSyq5p
         m+KxYaHTQl2idccRm85TUZkoJF0y/9MWJYCPmCBzSU1FgEVAh5vDkxISWDgJR8afZ1vw
         +ctdLgz/BKjN8GA2+JcESPyBflb68Sy6qc9F07fswnaLwKwBw/PN64+8Uo9OMcLLzis+
         rTTQ==
X-Forwarded-Encrypted: i=1; AKwUvByTqXN7DqAvRDv2Fh6dEO6c2MIVZfeheMi3ksm/3POFmoMQcCVC5VKAsg+ZO+Cw9djC9XsPsuAlf2I=@lists.xenproject.org
X-Gm-Message-State: AFuF++kTIIJtrVpYFjekubHGRi3gmv57WVklGf0UuV7SiXezWAelKTw4
	ReIR4FEbVln7mtgjKbhSc9jWeMxDw+txAhEeVsJQiyHRqkH9cK+bQCApMz5b21sXxEE=
X-Gm-Gg: AYBFou3G1jUUodqwEt/41wfQvO5hJb+MLAlHr7h3nWQLKIv1lOg4KA5/aogdReQ2pM7
	SXNl7sD+AeV4hp7AWHR5NtLdWTPnqn1rUPpdM2nE38zNSZPXNxlQHRG0+cYxr/gx35nn4IrBJ0w
	xHtc6q67wU/nSvzTrxZ/WtTD4ccUDEZUeRIHQ4OJ/Pe4m1qUq8iD9eXizZRSKPdMMvBiSxdMQKd
	ymmlwoQTdfKJ72BsgU2vUv5deFfsmt0/ZkPfJdpg9+2ue6a8poSE/cNi/LpWjnn+picdweeU6fZ
	bet4ZXSmMQznjUoAFxhQx6pp4ieIAAd0K+6NZEaVTD2R17BxehRd95ityOEakuaH6da8R08ESYA
	4d2mUGxnYHv2diaNf3Lvlo1Ep4WPa8qysyB89RuH/zA9UfBYKTd3swSQd6nAA/BVafkXjtr5mbs
	6I+9/ogJqkd7VyBCbTJMg6odk2T4dhZYuuOTzJwA9hSkdYRH+HuryJvEa88jlpD3tEAPyFoA5WH
	gHz5sD7jwKsD7pketeylTXVIjRqtgW2/Y7LaRI=
X-Received: by 2002:a05:600c:674f:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49fc56dbcb5mr20744365e9.3.1789723032023;
        Fri, 18 Sep 2026 02:17:12 -0700 (PDT)
Message-ID: <c36b3c8c-73cb-41ee-a47c-88064df5d4f2@suse.com>
Date: Fri, 18 Sep 2026 11:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] xen/sched: rtds: make admission control
 cpupool-wide toggleable
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
 <20260918080935.35498-5-frn1furkan10@gmail.com>
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
In-Reply-To: <20260918080935.35498-5-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0vxOyawpLT1zKa15vqSHUPXy"
X-purgate-ID: tlsNG-ef75cf/1789723032-36CDFAE4-78C7C25C/35/110847
X-purgate-type: clean
X-purgate-size: 8118

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0vxOyawpLT1zKa15vqSHUPXy
Content-Type: multipart/mixed; boundary="------------TQYFgNNoXv8WFVZufrbHthf7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org
Message-ID: <c36b3c8c-73cb-41ee-a47c-88064df5d4f2@suse.com>
Subject: Re: [PATCH v2 4/5] xen/sched: rtds: make admission control
 cpupool-wide toggleable
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
 <20260918080935.35498-5-frn1furkan10@gmail.com>
In-Reply-To: <20260918080935.35498-5-frn1furkan10@gmail.com>
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

--------------TQYFgNNoXv8WFVZufrbHthf7
Content-Type: multipart/mixed; boundary="------------jyUfGzAcOqHuF0Cmd0NqiqvF"

--------------jyUfGzAcOqHuF0Cmd0NqiqvF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDkuMjYgMTA6MDksIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gQWRkIGEgcGVy
LWNwdXBvb2wgb24vb2ZmIHN3aXRjaCBmb3IgUlREUyBhZG1pc3Npb24gY29udHJvbCB2aWEN
Cj4gWEVOX1NZU0NUTF9zY2hlZHVsZXJfb3AsIGVuYWJsZWQgYnkgZGVmYXVsdCwgc28gYW4g
b3BlcmF0b3IgY2FuDQo+IGRpc2FibGUvZW5hYmxlIGVuZm9yY2VtZW50IGZvciBhIHBvb2wN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZ1cmthbiBDYWxpc2thbiA8ZnJuMWZ1cmthbjEwQGdt
YWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------jyUfGzAcOqHuF0Cmd0NqiqvF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------jyUfGzAcOqHuF0Cmd0NqiqvF--

--------------TQYFgNNoXv8WFVZufrbHthf7--

--------------0vxOyawpLT1zKa15vqSHUPXy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqtAVwFAwAAAAAACgkQsN6d1ii/Ey+c
lgf+K8oO4XT2fRH8qdSy4nVl1CvGNA6VEuBUOH/HLNcWKXzKETfQtZg8YN9l4kFhsjWxlRyHD7wl
k/tamv+Q64cuI54AIA1pqqa6ezrVkoc+9tgpClLr0fR1yg1wJ9e2Hd9Jx9ZZEMxx/+zh7M1nryHm
SWqJpOqdAbIrf/rhC0Wmt0oGhHEg6xeQh3IPBcGl8QWg6zGUS1M0lsU0OSpwLzUldPVP1aSHcO+u
4ImtkY5DACpJnA4iaRwHiLXIXTiWgyui4vZSJePST2//h0PzmBHRXbOxrah9zb/WHpSMfUYsi+AT
E5e/RCFkb/d5tPzDmFri96L90N5hbhoUuJmUzy5gTQ==
=t+Bk
-----END PGP SIGNATURE-----

--------------0vxOyawpLT1zKa15vqSHUPXy--

