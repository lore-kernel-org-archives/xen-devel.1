Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6608CD98E2
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:08:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340069.1601067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZo8A-00070i-1H; Wed, 17 Jun 2026 11:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340069.1601067; Wed, 17 Jun 2026 11:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZo89-00070b-Ug; Wed, 17 Jun 2026 11:08:25 +0000
Received: by outflank-mailman (input) for mailman id 1340069;
 Wed, 17 Jun 2026 11:08:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZo88-00070V-Kf
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:08:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZo88-008fyb-1Q
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:08:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a32801d-bab6-0a2a0a5309dd-0a2a450996ba-40
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:08:23 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a328027-2497-0a2a45090019-d155d02fed38-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:08:23 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-695427c153fso1493504a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:08:23 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-695647013acsm669463a12.11.2026.06.17.04.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:08:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781694503; x=1782299303; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WedC1mXsbbN4loHE94HnAQ/P3582RQ7Gi6ixRBXYS4M=;
        b=MPXGJBHNTjRf+LmeAYilUufP89KblQfRWyl6r0ZZ/zFDnku3oXOeWhl+ryvN2WCS3z
         Sa+RGKsCBV5krRQRLkm0fsgNqRGwljS9cOsuFlRMql/N0eWThTDOEqVpe3FnQtzlb7HB
         xDhHkv6Ab2z1mlgyacmuPEW9ls/JYFQ0xEWyb5BFmo43VIkO5t0MbxodGtawhBkoKAih
         uA9LPaNs0wyopKZ+Zz5XszeyfkxN8unjK7JTQru5k2G90s9hacz4G6cV3pHuh8KqApPD
         BDLctWKpQhYr1q9NbX/ZBkXvxnNkQGHF2LSWCO6gVPyl82+m0tbMLKqSfzR/UhNkc7hx
         8Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694503; x=1782299303;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WedC1mXsbbN4loHE94HnAQ/P3582RQ7Gi6ixRBXYS4M=;
        b=Ff7Yd1DFHCRpTUFMFrZvl4P/CcNmpFZm1z0N7V629RXdHY80Jb6zJIfVdZKv83ZCYu
         /ITJ/3a0jVw1XtBydzG2aLMb6ghGM6PMPfbXCnbW4zmvWiXiEK2XQu7t2bWne6Om3a6p
         RFoRXIqO+Z1I2bcPuZDKOCSiQvzTACiDe7qwVdxlvJSkWxtRWkyA1bRFG5/1EYG+er0x
         C8P449MIju2fFvmck8shqY2VgITx072FiIrlBNZ5Wgl6C7CCu7A3Wo8Rq7jQMnvvkEWo
         cLU3M/yDeL+NVluexstLUaG8e7oPlETg3LB3r3PTPzUYhFYZ9+zHIoT9QxaTa0FzZhyQ
         9ZJg==
X-Forwarded-Encrypted: i=1; AFNElJ9wD3DybCXZObagva6xdZ33l3EkwtKBHAkox9u5F4Vrb1tv3wUGeezP1xIR/6NzV3uUd22bCKTy9cY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFNs0cc5/90VrfFNT95W27a2V9TPXd+6RCjfS2F4NPPuCD9duq
	HC6dDKIunn+iapU2yQN1v2zq+JJzyNlZhYpiCJmZFA4n1De3a38psDAj1rnN3WXUYAk=
X-Gm-Gg: AfdE7cna27nbaHB5IDR4MbZ/KsX0XZ8QfjYjkpdx7pA3gL+gCQjQeB75UHDhr1g1gOe
	lp46M9xLZI3cTUq86WDZsiIg1G20REbHAdiVLlOCiUddRMgXv9J6txP3e6SNek0wOE9S7TyDQzy
	oiT+hT5PVW6HpRrd5TyYWGyoPS0mckctG8fGSaKUohXj6aIn03LT/plvHSx0I8FOA/+Hyoei/Zy
	jV48Kf6PSvkV4ve0mOCOeySdB5Dxji/6lNKq0THc+btsv/tIjEBbLjQzkbyhTTf9bibgyg4tbpS
	c9xAq5dTgdFqNTjZE9FzOC/+q6DzpYVMGrsTtWYmyIYdEnnbds0NAvzwl1wR+gW45N1Xmw1/3Zv
	nfFG8sWgvAWImGpRIvXBM7wiakg9xsEMTICODA4+ucevaVDcAJBgSW0bEnSH0QqO1nVXG6bGrcl
	GK0KC4XnLcLWwPyTvpX6+T49YLlTVeyN2ibn5yL/5FuKlGRO77997TM31zAxiIEE/QYRzruC+HL
	iIrbIYDh8wlUrAYMybPfAu0VQgAsZClAVleTgcBTtA=
X-Received: by 2002:a05:6402:5d3:b0:66e:cf8d:6970 with SMTP id 4fb4d7f45d1cf-695474312eamr1838728a12.20.1781694503361;
        Wed, 17 Jun 2026 04:08:23 -0700 (PDT)
Message-ID: <e8e8d0f6-5032-409c-b01a-aefca6dd8fe4@suse.com>
Date: Wed, 17 Jun 2026 13:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 5/7] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
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
In-Reply-To: <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CwLhzHl9MnPoPEtLRDewSF5q"
X-purgate-ID: tlsNG-bad1c0/1781694503-42F76A53-EBEDE690/10/73395122804
X-purgate-type: spam
X-purgate-size: 8778

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CwLhzHl9MnPoPEtLRDewSF5q
Content-Type: multipart/mixed; boundary="------------Y0h33gM5s0Ek8ezXuKhFJY9s";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <e8e8d0f6-5032-409c-b01a-aefca6dd8fe4@suse.com>
Subject: Re: [PATCH v2 for-4.22? 5/7] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
In-Reply-To: <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
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

--------------Y0h33gM5s0Ek8ezXuKhFJY9s
Content-Type: multipart/mixed; boundary="------------RX0ujNUSQHmaAS5PusIPgsJL"

--------------RX0ujNUSQHmaAS5PusIPgsJL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDYuMjYgMTE6MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBjcHVtYXNrX3RvX3hl
bmN0bF9iaXRtYXAoKSBtYXkgcmV0dXJuIGVycm9ycy4gQ2xlYXJpbmcgdGhlIGVycm9yIGlu
ZGljYXRvcg0KPiBvZiBhbiBlYXJsaWVyIHN1Y2ggY2FsbCBieSBhIChzdWNjZXNzZnVsKSBs
YXRlciBjYWxsIGlzIG1pc2xlYWRpbmcgdGhlDQo+IGNhbGxlci4gRm9yICJzZXQiLCBrZWVw
IHNldHRpbmcgc29mdCBhZmZpbml0eSBpZiB0aGUgaGFyZCBhZmZpbml0eSBjb3B5LQ0KPiBi
YWNrIGZhaWxzOyBvbmx5IGFjY3VtdWxhdGUgcmVzcGVjdGl2ZSBlcnJvcnMuDQo+IA0KPiBX
aGlsZSBmaWRkbGluZyB3aXRoIHJldHVybiB2YWx1ZXMsIGFsc28gZHJvcCBhIHJlZHVuZGFu
dCBjbGVhcmluZyBvZg0KPiAicmV0Ii4gVGhpcyBlbGltaW5hdGVzIGEgTWlzcmEgQzoyMDEy
IHJ1bGUgMi4yICgiVGhlcmUgc2hhbGwgYmUgbm8gZGVhZA0KPiBjb2RlIikgdmlvbGF0aW9u
Lg0KPiANCj4gRml4ZXM6IDZlNGVjYzZkNTg4NCAoInNjaGVkOiBET01DVExfKnZjcHVhZmZp
bml0eSB3b3JrcyB3aXRoIGhhcmQgYW5kIHNvZnQgYWZmaW5pdHkiKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFJlbGVhc2UtQWNrZWQt
Ynk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJn
ZW4NCg==
--------------RX0ujNUSQHmaAS5PusIPgsJL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RX0ujNUSQHmaAS5PusIPgsJL--

--------------Y0h33gM5s0Ek8ezXuKhFJY9s--

--------------CwLhzHl9MnPoPEtLRDewSF5q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoygCYFAwAAAAAACgkQsN6d1ii/Ey+h
+gf8ClAm5Z0vwA/LOIlQ2R99A7ZBtqwSV3Wj+pEPv7BeOIF+c3RepNVsB54gI+JcZS+NLMzKG/ke
FqQGMhdBsRHa0AkJpqMtEn392k46ohROX/d2MvLzFJfXgPonx7h5+u/b1s0vNwNwKgCBUFX62WTG
/gLfOdyfxawTJ3OmgCvzLhMRTHvoCgnHdlDxL4peUFD9KQtHt3UsYwE7qXuMfPnwhJ9xZWhorNwo
HgURQXxzFUs5TPKKgIu63f64x7sdthHyvtoeVxOsiVCXwjlQlyLWM65t9Qhur0+kpJsCngJezChv
cNPumZyhdlgUbnDyZgKqAeZM5+Naue7eNyOMfdp/cA==
=FSbi
-----END PGP SIGNATURE-----

--------------CwLhzHl9MnPoPEtLRDewSF5q--

