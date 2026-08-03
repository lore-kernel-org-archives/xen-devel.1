Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFABC5518E
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 10:34:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381356.1624942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqpzz-0001ji-Ck; Mon, 03 Aug 2026 10:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381356.1624942; Mon, 03 Aug 2026 10:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqpzz-0001jb-A7; Mon, 03 Aug 2026 10:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1381356;
 Mon, 03 Aug 2026 10:34:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqpzy-0001jU-RW
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 10:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqpzy-007cMG-84
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:34:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a706ea6-5cb7-0a2a0a5109dd-0a2a450a85da-28
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:34:22 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a706ead-f2d2-0a2a450a0019-d155da29c161-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:34:22 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c1c4c7ddaf6so490500366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:34:22 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd450d731sm524364066b.47.2026.08.03.03.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 03:34:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1785753261; x=1786358061; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RW+5JNTzwVuFTHOA2ETGOuWyQINN5n5cjuH4cgKFvXg=;
        b=YtYEbHloRzvkzvnlBgxOR8SFEHBvgvWfjXG1CRsL39XTeAyQXNrUgocv2ZPYw45i6s
         gY51SbXHuxi9JzlkXJcCvup+j0dafxkcrwZOm6eVaHsX5fn7WQgvf+dIy5GlloExvxMO
         MuOJTFGJK++mKnv2wvGojhAK3x9taC0JF3dCiYYWnYsM6yqPz/lCfeBXmcO9iGXkyasp
         hAIvO/m6whunp1D44/gir+u3phPLwqSppz4lF3VFBNGjqtM+26XwL/X0oUjY5UmtMFtP
         xF+V8gV+6ZfQ38S8QptYOHb7Wh1jDzuKAl9sBKb8Wyj+i17Dh/v3Ycq6WnxOeXL+NOCy
         cXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753261; x=1786358061;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW+5JNTzwVuFTHOA2ETGOuWyQINN5n5cjuH4cgKFvXg=;
        b=Ulnffc7cuJ4LCy0X00lj1gUS+rFCdVuVxniRJj8rn4Fwe+1OQ5qciZy4iidS4dm2+E
         dLFacrxsgIZzCWUSiyBl7iA8a2j8OjYeWypspEx2a49K+/TEe0gjCaPXRbYKM6Dwlthc
         qQYXKXXgbhOc1HouGXzZJBN4T51SWutyPBRTI0eDiNbZlA9TNOBmcXRoMmjKbxk015Ka
         xZ+qIpOdRoYQeMlvGQzIaAJr1xOYKY5ktXN03JHWPGD6zi2DpjIS+P06qtlsy9Znx9rM
         p98r/9MZEaJWbzt5a9OhkVys+8goXpA6nQ8cvA+iYJ9rqbx37+Rq/4QAdGMcvhx2+lXC
         a/dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6SHqBAMJkbwb6MeXI0gAjWoe80/jrRP7+fi9N7oH/mZsmJxZbITM593kkjcZy3QFxM9vUprk6vCs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhqL4vJobiTjanPvMQjJGTIIgFCQBuws+p1fNKxQUqRSfJneEZ
	JE3lbuI6//b6+JTVvvO1cSUfT1MIJQ+jGvt6yQVYIoPplp1ZsK+6q1TympWSMBnGyi0=
X-Gm-Gg: AR+sD12bVu1BksX/3+bWRGae4K3JC6zSf4u/jM4OFFjYR4qrFVK/OqMvBZWisEcKNPs
	F6PyeRs4yziB1Hs8IAqk/ZEUPDl+mdf8UPg6OpTFeNjP1dMzO/vy15/5DyqOArNp78gU77qtVD4
	flmpw7s27kHkh6q1AOv2FdrIX86VQ18+VDE/F9FMMYbGkzIIkOcErPR4pCmDha9pT3mMRQd1pN2
	J0RBgN2OKqo30mwPc9ToqkDlXbCnjSsGsi0OSpfm+UxhXEy343GE5AV1OvNp3eu1nLwmbmvv/lx
	yyQtdm0DoYkoKAFgd8JFb9P3T1XEyMIRkOHh8bu/uWnp9qj2B4mztkRhesZ9EOUmRVH+MVM8dtG
	rrNXajw3fq7hl0ZyIH20b21LXzPipiEFjBCqQ2Ni4IDpwNRKYsh0RKLEqOke7VXybF04xPX3Jv/
	3hd4t7j8MfCEuqJL8luJ6+IvEfYOYD8pBPpVsG5CkxetXDwr5wSNs9XYCTcwAWhOyTWtLNyN8w/
	mkpox4uslS6hcCK01fQpWdLkXro1vDCr3ZsbCBB6wYwtgObCTyRmqcYim0O6wyjm1xDyXZUlj9S
	2m73LlJliH9VTFE=
X-Received: by 2002:a17:907:c318:b0:c1f:b883:ed3b with SMTP id a640c23a62f3a-c1ff13e1e3cmr705662966b.4.1785753261255;
        Mon, 03 Aug 2026 03:34:21 -0700 (PDT)
Message-ID: <b90e2fa6-0725-4f39-8a5f-31b02c8aef72@suse.com>
Date: Mon, 3 Aug 2026 12:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] xen/sched: split scheduler vtable from scheduler
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, oleksii.kurochko@gmail.com
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
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
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NhSDnOO0pxwLPqjEg1D6vQsE"
X-purgate-ID: tlsNG-4011c0/1785753262-53ED2CFC-E433D674/0/0
X-purgate-type: clean
X-purgate-size: 13198

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NhSDnOO0pxwLPqjEg1D6vQsE
Content-Type: multipart/mixed; boundary="------------0wFAAmCsdOzQMaRLESNA7cV0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, oleksii.kurochko@gmail.com
Message-ID: <b90e2fa6-0725-4f39-8a5f-31b02c8aef72@suse.com>
Subject: Re: [PATCH 0/7] xen/sched: split scheduler vtable from scheduler
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
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

--------------0wFAAmCsdOzQMaRLESNA7cV0
Content-Type: multipart/mixed; boundary="------------CBTZ4VXU29aSPHmdICCq7QhP"

--------------CBTZ4VXU29aSPHmdICCq7QhP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjYgMDc6MDYsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gRWFjaCBzdHJ1
Y3Qgc2NoZWR1bGVyIGN1cnJlbnRseSBkb3VibGVzIGFzIGJvdGggYSBzY2hlZHVsZXINCj4g
YmFja2VuZCdzIHN0YXRpYyB2dGFibGUgKG5hbWUsIG9wdF9uYW1lLCBzY2hlZF9pZCBhbmQg
ZXZlcnkNCj4gZnVuY3Rpb24gcG9pbnRlcikgYW5kIHRoZSBwZXItY3B1cG9vbCBydW50aW1l
IG9iamVjdCB0aGF0DQo+IHNjaGVkdWxlcl9hbGxvYygpIGFsbG9jYXRlcy4gQmVjYXVzZSB0
aGVzZSBhcmUgdGhlIHNhbWUgdHlwZSwNCj4gc2NoZWR1bGVyX2FsbG9jKCkgbWVtY3B5KClz
IHRoZSBlbnRpcmUgdnRhYmxlIGludG8gYSBmcmVzaCBoZWFwDQo+IGFsbG9jYXRpb24gZm9y
IGV2ZXJ5IGNwdXBvb2wgaXQgY3JlYXRlcy4gV2l0aCBOIGNwdXBvb2xzIHJ1bm5pbmcNCj4g
dGhlIHNhbWUgc2NoZWR1bGVyLCB0aGlzIGR1cGxpY2F0ZXMgTiBjb3BpZXMgb2YgaWRlbnRp
Y2FsIGZ1bmN0aW9uDQo+IHBvaW50ZXJzIGFuZCBpZGVudGlmeWluZyBmaWVsZHMgdGhhdCBu
ZXZlciBkaWZmZXIgYmV0d2Vlbg0KPiBpbnN0YW5jZXMgLSB0aGUgb25seSBmaWVsZHMgdGhh
dCBhcmUgZ2VudWluZWx5IHBlci1jcHVwb29sIGFyZQ0KPiBzY2hlZF9kYXRhIGFuZCBjcHVw
b29sLg0KPiANCj4gVGhpcyBzZXJpZXMgc3BsaXRzIHRoZSB2dGFibGUgb3V0IGludG8gaXRz
IG93biB0eXBlLCBzdHJ1Y3QNCj4gc2NoZWRfb3BzLCBzbyBpdCBjYW4gYmUgc2hhcmVkIGJ5
IGV2ZXJ5IGNwdXBvb2wgdXNpbmcgYSBnaXZlbg0KPiBzY2hlZHVsZXIgaW5zdGVhZCBvZiBj
b3BpZWQgcGVyIGNwdXBvb2wuIHN0cnVjdCBzY2hlZHVsZXIgaXMgbGVmdA0KPiBob2xkaW5n
IG9ubHkgd2hhdCBpcyBhY3R1YWxseSBwZXItaW5zdGFuY2U6IGEgcG9pbnRlciB0byB0aGUN
Cj4gc2hhcmVkIHNjaGVkX29wcywgcGx1cyBzY2hlZF9kYXRhIGFuZCBjcHVwb29sLg0KPiAN
Cj4gVGhlIHNlcmllcyBpcyBzdHJ1Y3R1cmVkIGFzIGludHJvZHVjZS9taWdyYXRlL3JlbW92
ZSwgc28gdGhhdA0KPiBldmVyeSBjb21taXQgYnVpbGRzIGFuZCBib290cyBvbiBpdHMgb3du
Og0KPiANCj4gICAgLSBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBzdHJ1Y3Qgc2NoZWRfb3BzLCBS
RUdJU1RFUl9TQ0hFRF9PUFMoKSwNCj4gICAgICBhbmQgYSBzY2hlZF9vcHNfYXJyYXlbXSBh
bG9uZ3NpZGUgdGhlIGV4aXN0aW5nIHNjaGVkdWxlcnNbXSwNCj4gICAgICBleHRlbmRpbmcg
ZXZlcnkgbG9va3VwIHBhdGggKHNjaGVkdWxlcl9hbGxvYygpLA0KPiAgICAgIHNjaGVkX2dl
dF9ieV9uYW1lKCksIHNjaGVkdWxlcl9pbml0KCkpIHRvIHNlYXJjaCBib3RoIGFycmF5cy4N
Cj4gICAgICBUaGlzIGlzIHB1cmVseSBhZGRpdGl2ZSAtIG5vIHNjaGVkdWxlciB1c2VzIGl0
IHlldC4NCj4gDQo+ICAgIC0gVGhlIG5leHQgZml2ZSBwYXRjaGVzIGVhY2ggbWlncmF0ZSBv
bmUgc2NoZWR1bGVyIGJhY2tlbmQNCj4gICAgICAoY3JlZGl0LCBjcmVkaXQyLCBydGRzLCBh
cmluYzY1MywgbnVsbCkgZnJvbSBzdHJ1Y3Qgc2NoZWR1bGVyDQo+ICAgICAgdG8gc3RydWN0
IHNjaGVkX29wcy4gRWFjaCBpcyBzbWFsbCwgbWVjaGFuaWNhbCwgYW5kDQo+ICAgICAgaW5k
ZXBlbmRlbnRseSBiaXNlY3RhYmxlLCB3aXRoIG5vIGJlaGF2aW9yYWwgZGlmZmVyZW5jZSwg
c2luY2UNCj4gICAgICBzY2hlZHVsZXJfYWxsb2MoKSBidWlsZHMgYW4gaWRlbnRpY2FsIHJ1
bnRpbWUgc3RydWN0IHNjaGVkdWxlcg0KPiAgICAgIHJlZ2FyZGxlc3Mgb2Ygd2hpY2ggYXJy
YXkgYSBtYXRjaCBpcyBmb3VuZCBpbi4NCj4gDQo+ICAgIC0gVGhlIGZpbmFsIHBhdGNoIHJl
bW92ZXMgdGhlIG9sZCBzY2hlZHVsZXJzW10gYW5kDQo+ICAgICAgUkVHSVNURVJfU0NIRURV
TEVSKCkgcGF0aCBub3cgdGhhdCBub3RoaW5nIHVzZXMgaXQsIHNocmlua3MNCj4gICAgICBz
dHJ1Y3Qgc2NoZWR1bGVyIGRvd24gdG8geyBvcHMsIHNjaGVkX2RhdGEsIGNwdXBvb2wgfSwg
YW5kDQo+ICAgICAgdXBkYXRlcyBldmVyeSBhY2Nlc3NvciBpbiBwcml2YXRlLmggYWNjb3Jk
aW5nbHkuDQo+IA0KPiBGdXJrYW4gQ2FsaXNrYW4gKDcpOg0KPiAgICB4ZW4vc2NoZWQ6IGlu
dHJvZHVjZSBzdHJ1Y3Qgc2NoZWRfb3BzIGFzIGEgc2hhcmVkIHNjaGVkdWxlciB2dGFibGUN
Cj4gICAgeGVuL3NjaGVkOiBjcmVkaXQ6IG1pZ3JhdGUgdG8gbmV3IHNjaGVkX29wcw0KPiAg
ICB4ZW4vc2NoZWQ6IGNyZWRpdDI6IG1pZ3JhdGUgdG8gbmV3IHNjaGVkX29wcw0KPiAgICB4
ZW4vc2NoZWQ6IHJ0ZHM6IG1pZ3JhdGUgdG8gbmV3IHNjaGVkX29wcw0KPiAgICB4ZW4vc2No
ZWQ6IGFyaW5jNjUzOiBtaWdyYXRlIHRvIG5ldyBzY2hlZF9vcHMNCj4gICAgeGVuL3NjaGVk
OiBudWxsOiBtaWdyYXRlIHRvIG5ldyBzY2hlZF9vcHMNCj4gICAgeGVuL3NjaGVkOiByZW1v
dmUgb2xkIHNjaGVkdWxlciByZWdpc3RyYXRpb24sIHNocmluayBzdHJ1Y3Qgc2NoZWR1bGVy
DQo+IA0KPiAgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICB8ICAgMiArLQ0KPiAgIHhl
bi9hcmNoL3BwYy94ZW4ubGRzLlMgICAgICB8ICAgMiArLQ0KPiAgIHhlbi9hcmNoL3Jpc2N2
L3hlbi5sZHMuUyAgICB8ICAgMiArLQ0KPiAgIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAg
ICB8ICAgMiArLQ0KPiAgIHhlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMuYyB8ICAxMSArLS0t
DQo+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgICAgIHwgIDgwICsrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tDQo+ICAgeGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMgIHwgICA2
ICstLQ0KPiAgIHhlbi9jb21tb24vc2NoZWQvY3JlZGl0LmMgICB8ICAgNSArLQ0KPiAgIHhl
bi9jb21tb24vc2NoZWQvY3JlZGl0Mi5jICB8ICAgNSArLQ0KPiAgIHhlbi9jb21tb24vc2No
ZWQvbnVsbC5jICAgICB8ICAgNSArLQ0KPiAgIHhlbi9jb21tb24vc2NoZWQvcHJpdmF0ZS5o
ICB8IDEwMCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gICB4ZW4v
Y29tbW9uL3NjaGVkL3J0LmMgICAgICAgfCAgIDUgKy0NCj4gICB4ZW4vaW5jbHVkZS94ZW4v
eGVuLmxkcy5oICAgfCAgIDggKy0tDQo+ICAgMTMgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2Vy
dGlvbnMoKyksIDExNyBkZWxldGlvbnMoLSkNCj4gDQoNCllvdSBoYXZlIGEgc2VyaWVzIGhl
cmUgd2hpY2ggaXMgYWRkaW5nIDExNiBsaW5lcyBhbmQgcmVtb3ZpbmcgMTE3Lg0KDQpQYXRj
aCA3IGFsb25lIGlzIHJlbW92aW5nIDI0OCBsaW5lcyB3aGlsZSBhZGRpbmcgNjcgbGluZXMu
DQoNClNvIGluIHRoZSBlbmQgdGhlcmUgaXMgYSBzaW5nbGUgcGF0Y2ggaW4gdGhpcyBzZXJp
ZXMgd2hpY2ggaGFzIG1vcmUgY29kZQ0KY2h1cm4gdGhhbiB0aGUgY29tcGxldGUgc2VyaWVz
IHdoZW4gYWRkZWQgaW4gb25lIGdvLg0KDQpJT1c6IG1ha2luZyB0aGlzIGp1c3QgYSBzaW5n
bGUgcGF0Y2ggd291bGQgYmUgZWFzaWVyIHRvIHJldmlldyB0aGFuIHRoZQ0KbGFzdCBwYXRj
aCBhbG9uZSwgbGV0IGFsb25lIGFsbCB0aGUgdGVtcG9yYXJ5IG1vZGlmaWNhdGlvbnMgd2hp
Y2ggd291bGQNCmJlIGdvbmUgd2hlbiBtZXJnaW5nIGFsbCBwYXRjaGVzIGludG8gb25lLiBB
bmQgd2l0aCB0aGF0IHlvdSBjb3VsZCBldmVuDQpkcm9wIHNvbWUgb2YgdGhlIHJlbmFtaW5n
IHlvdSBkaWQgKGUuZy4gaW4gdGhlIGxpbmtlciBmaWxlKSwgbWFraW5nIHRoZQ0KZGlmZiBl
dmVuIHNtYWxsZXIuDQoNCkkgYWdyZWUgd2l0aCB0aGUgb3ZlcmFsbCBnb2FsLCBidXQgSSdt
IHNwYXJpbmcgbXkgdGltZSBkb2luZyBhIHRob3JvdWdoDQpyZXZpZXcgb2YgdGhlIHNlcmll
cyBpbiB0aGlzIHNoYXBlLg0KDQoNCkp1ZXJnZW4NCg==
--------------CBTZ4VXU29aSPHmdICCq7QhP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CBTZ4VXU29aSPHmdICCq7QhP--

--------------0wFAAmCsdOzQMaRLESNA7cV0--

--------------NhSDnOO0pxwLPqjEg1D6vQsE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpwbqwFAwAAAAAACgkQsN6d1ii/Ey9T
wwgAjxhwwwWWs686CCBFHwePzXm29voDe8LchNCVr02zbdtFKaSEqU1rGaMJl39LT4pgr8CHOnFy
KIijRAkVwI5TgcFoPamVfWN3WJ56teAzVjEC7thKFi/StkbxvrXYJa6TIrTUzBnsLl96HNPQJMGh
izbuaoyhOgw3IUSd2hF1RTYf6gVF8cLEX8ZHlL/q1jYH5Qx1+hJvKc1esPqobcaMOzQP2wWPaNb3
xL+b219muAc1khjAS9GGVnUIeV9w2ErJcPM7moAZHc8oDpX+yNEgk5Vq+XiZ8pJYCOGj9fuBBcXS
ieQz+a0t0jjLwMPuvGzMtMytV2ew4zn8cCVUXe++TA==
=r5DE
-----END PGP SIGNATURE-----

--------------NhSDnOO0pxwLPqjEg1D6vQsE--

