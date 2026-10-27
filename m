Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AB606A329
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VZ2/RMoq
Received: from list by lists.xenproject.org with outflank-mailman.1462293.1673298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLjo2-0006l8-B5; Tue, 27 Oct 2026 16:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462293.1673298; Tue, 27 Oct 2026 16:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLjo2-0006l1-7h; Tue, 27 Oct 2026 16:13:46 +0000
Received: by outflank-mailman (input) for mailman id 1462293;
 Tue, 27 Oct 2026 16:13:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xLjo1-0006kv-9c
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 16:13:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLjo0-00H8XC-Mi
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 17:13:44 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ae0cdac-8faa-0a2a0a5109dd-0a2a4505d1da-30
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 17:13:43 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ae0cdb7-4cb1-0a2a45050019-d155d035d407-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 17:13:43 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6af9a9451daso120220a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:13:43 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b497ff5fddsm183154a12.2.2026.10.27.09.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 09:13:42 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793117623; x=1793722423; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mA1hqY03EkOXNfP+5Q1cRy5m3KVRfUK/vEk4Bk/8Tbs=;
        b=VZ2/RMoq0ivyzER4gLdtJL/CEFYGXhLVai/LHXY7iBMcelO6CnZwq92a5yJOlOAtxK
         LWdhRb3/R+ydM3M5jlPZQAnqV/b1UoPqR0cjxlyLBPi1Tewv3K0IP6/TiBPtaih/6mmD
         /cpLL2/LIjChdXq65fiPLRLJS5UXwPomRdRPbwO8jzXLqlnnbsUF7dJcjwp2plWGBFAX
         8WHAAJwlM1fTFrI7zbeoV2+PRuVZIWX8vcY0EAcy6WcBz5sPQy7WJR+gVAmJgfpLNI89
         UvSnMZi4kiLg8lFA0QHgdAeONW4kTIx/1Ezgg5NjjGvNpERDHhYClVHkc/XpKMlwiQ4l
         96UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117623; x=1793722423;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mA1hqY03EkOXNfP+5Q1cRy5m3KVRfUK/vEk4Bk/8Tbs=;
        b=HMb0VwoUtr1YMyUNAuQWIgt3QeSpyaRqCZ8ApkLJoFdX/ShQClgDMnfGX3ssPZA+GA
         QN5IUL11aX8GHs2tw/4ncyVvQBpcr0kGLLFS3bS+DmUE7wLTZLYYtDp26XykMinzI9Rg
         GqcD17hYOwC9fNJjV0PjEdQZ5wGyyVVmBwiHBNW1INUSQiOCmJtu3utTCG6riq62S4fN
         npAceZhPtQSLgHwPA8nFy5IbHJ/lLPKVU5a0uaCeIYjd2+aeXXYiaaGSK314SJxawT2P
         AwsmfAEQverU8pg0DU2XKOj6A2Cub7wYa+JaeiXQIVdhFgD7IEPxqPbFTA2pKB5ahoJJ
         imhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiRWPK6zWa3XS62Aeu9lhSS/6UDfNdn8/s75GvuPwbxc8YE4fpQhg5DXC8amqNtBb4dSkzYUI78GY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK0atcEtvlA5jSm/jJ7w74I5vERTnzTm5L8jXBjeHYmi0pCRnTR
	YbuAckK0iTbI0GCxPXv4xCeimNZP47k/hfYKYmF2D/CZL7gLnyYX+Wqf4AD5Lb56uQjpTMW3Sgc
	DGq4siJE=
X-Gm-Gg: AYBFou2Gm1Kli4nqdW/MCVozY7sP/mb2XAt5DEv0BnXtEGRyMArnF65TFEV680LfjMZ
	25OtTkjMuX/DMfIuSMFMJCC1mkQFR+KZ74XOjraChWBXGqUIB8CSsBFyMCQn0Ka9WVWVSX+Gdt9
	fYkGZGvLGiVS2HRBu0xqSdB+o5bmvmslskU1KnAbh1w0iEwZFNUdHiqgNVnWktnfvuJ4FvGT/WB
	S1bRW9YcteZawCdDMQtE2d/i3sDhePckU1/ATZ1BtOIPuVFRRPgmeUeXQb+dlkoJGFYgH7alaiP
	PkIB7Wtinp8ikP1AScEcM/Az7GeL7P20FpEtd7h8ZitHn4RkGUoauX3sMfeHKwi0V3oTsDB097z
	h3HM7HJfPGAclqCGy5eVi86IGM0HpPllMS4USak8neHyxT7pTr/1tSDNfAyZFyi6TBSNpDZ7BtB
	5PT6njY3YNETzEhsB9S9Ba3nP8cBtr9+L8lup6VNp7bu6nMb4fzwSRahAoYekapJ31BGJs3diWK
	ZjA7axSWlK90qOl/qtU8H1q9ks4K1aHDy5cde1BP2ySB5bqjQwZr2eWH4t9zUGIHCSTOlArnu1u
	mFwlJe6pIfZ2NST/k6ZN2xuOoXw8JkHBFBiY3ykD9SngsR/M4VMyz39cWrqoebQO5glnsDhJ0r2
	Kpv2YScr+t6Lmv278N8/mX5m6w6NJSIKTS8RkFU546UAYib8jT9hn0ks=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id 4fb4d7f45d1cf-6b442ff19aamr7654152a12.30.1793117623180;
        Tue, 27 Oct 2026 09:13:43 -0700 (PDT)
Message-ID: <959ff80d-2b77-46d3-8915-787dfc320203@suse.com>
Date: Tue, 27 Oct 2026 17:13:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: simplify and correct domain ID and CPU pool ID
 parsing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, msd-xenproject.org@msd.im
References: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
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
In-Reply-To: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BAOQ7Prd09dvACa3qk5vOKfv"
X-purgate-ID: tlsNG-c201ff/1793117623-F56AD2A1-BAA2C807/35/110847
X-purgate-type: clean
X-purgate-size: 9119
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BAOQ7Prd09dvACa3qk5vOKfv
Content-Type: multipart/mixed; boundary="------------MNo1ULlcZYrmbkYP060bHSSI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, msd-xenproject.org@msd.im
Message-ID: <959ff80d-2b77-46d3-8915-787dfc320203@suse.com>
Subject: Re: [PATCH] libxl: simplify and correct domain ID and CPU pool ID
 parsing
References: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
In-Reply-To: <d2cbd116-875b-4441-9338-9788cd72e5dd@suse.com>
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

--------------MNo1ULlcZYrmbkYP060bHSSI
Content-Type: multipart/mixed; boundary="------------Wbah3hmEVLghQFgFJAJJnwqR"

--------------Wbah3hmEVLghQFgFJAJJnwqR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMTAuMjYgMTc6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBzdHJ0b3VsKCksIHdp
dGggYSByYWRpeCBvZiAxMCwgYWxyZWFkeSBndWFyYW50ZWVzIHRoYXQgdGhlIHN0cmluZyBw
YXJzZWQNCj4gY29uc2lzdHMgb2YganVzdCBkaWdpdHMgKGFuZCBsZWFkaW5nIHdoaXRlc3Bh
Y2UpLiBObyBuZWVkIHRvIGRvIHRoYXQgY2hlY2sNCj4gaW4gYWR2YW5jZS4gQWxsIHdoaWNo
IG5lZWRzIGRvaW5nIGlzIGEgY2hlY2sgZm9yIGEgbGVhZGluZyBkaWdpdCwgdG8NCj4gZXhj
bHVkZSB0aGUgY2FzZSBvZiBsZWFkaW5nIHdoaXRlc3BhY2UuDQo+IA0KPiBUaGlzIGluIHBh
cnRpY3VsYXIgYXZvaWRzIGEgZG9tYWluIElEIGFyZ3VtZW50IG9mICIiIHRvIGJlIG1pcy10
cmVhdGVkIGFzDQo+IGEgcmVmZXJlbmNlIHRvIERvbTAuDQo+IA0KPiBXaGlsZSBzaW1pbGFy
IG1pcy10cmVhdG1lbnQgaXNuJ3QgcHJlc2VudCB0aGVyZSwgZG8gdGhlIHNhbWUNCj4gc2lt
cGxpZmljYXRpb24gYWxzbyBpbiB0aGUgYWRqYWNlbnQgcXVhbGlmaWVyX3RvX2lkKCkuDQo+
IA0KPiBGaXhlczogZWY0OTZiODFmMDMzICgibGlieGw6IHBvc3Rwb25lIGJhY2tlbmQgbmFt
ZSByZXNvbHV0aW9uIikNCj4gUmVwb3J0ZWQtYnk6IE1zZCA8bXNkLXhlbnByb2plY3Qub3Jn
QG1zZC5pbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KPiAtLS0NCj4gVGhpcyByZXRhaW5zIHByaW9yIGJlaGF2aW9yIGFzIHRvIGxlYWRp
bmcgKGFuZCB0cmFpbGluZykgd2hpdGVzcGFjZSAobm9uZQ0KPiBwZXJtaXR0ZWQpLiBXaGV0
aGVyIHRoYXQncyBpbnRlbmRlZCBiZWhhdmlvciBJIGRvbid0IGtub3cuDQo+IA0KPiBUaGUg
ImVuZCAhPSAuLi4iIGNoZWNrcyBhcmUgbGlrZWx5IHBhcmFub2lhOiBJZiB0aGUgZmlyc3Qg
Y2hhcmFjdGVyIGlzIGENCj4gZGlnaXQgYXMgcGVyIGlzZGlnaXQoKSwgc3RydG91bCgpIHNo
b3VsZCBoYXZlIGNvbnN1bWVkIGl0Lg0KDQpJJ2QgZHJvcCB0aGUgdGVzdCwgYXMgaXQgcmVh
bGx5IGlzIHJlZHVuZGFudC4NCg0KV2l0aCBvciB3aXRob3V0IGRyb3BwaW5nIGl0Og0KDQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJn
ZW4NCg==
--------------Wbah3hmEVLghQFgFJAJJnwqR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Wbah3hmEVLghQFgFJAJJnwqR--

--------------MNo1ULlcZYrmbkYP060bHSSI--

--------------BAOQ7Prd09dvACa3qk5vOKfv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrgzbYFAwAAAAAACgkQsN6d1ii/Ey8X
Fgf8CJzDq8BWI4jVE222EltnffPeCBWE4udh5Wx8OfYJGUEKnXzpw9YLZaIEVVU6/D8aaQfKplPa
ElMa1XT9GyWfejSRG2ZJgdHUQlQrXKmiGWOXaAEDlpwXtWn9v9dTbmW2/4fxA4GO499wvQpo5nTk
LaBJk+ToeRkKAmfm+d1a/RLNxGJmePNYmtkFHAQc6QuLZR2ftiR98TYvnH4nIl3d/nxk3BnJRn26
+rcQfZdqRUW/ifqKdTNaMU24CC7u0PZv1I9WIr723Az0FyiKuX2l9xlgjJVp5oWKqT5Jqi9QMvrd
gHsFgXVh6tWLzGgJA9Y79WRDrVjV2vxJneWRWJwuug==
=mFxr
-----END PGP SIGNATURE-----

--------------BAOQ7Prd09dvACa3qk5vOKfv--

