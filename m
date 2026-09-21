Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D96C982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 13:07:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427476.1650183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dkB-0007UP-4i; Mon, 21 Sep 2026 13:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427476.1650183; Mon, 21 Sep 2026 13:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dkB-0007UI-22; Mon, 21 Sep 2026 13:07:39 +0000
Received: by outflank-mailman (input) for mailman id 1427476;
 Mon, 21 Sep 2026 13:07:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x8dkA-0007SW-Eq
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:07:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dk9-001Gzs-RR
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:07:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ab12c12-8faa-0a2a0a5109dd-0a2a4508a708-16
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:07:37 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ab12c19-f659-0a2a45080019-4a7de48cbfd0-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:07:37 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f55eff0so439706866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 06:07:37 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a358ff8edsm309389866b.61.2026.09.21.06.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 06:07:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789996057; x=1790600857; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nbudeLwfAr9oq/ZGTRMn4oQtid64vUTUavDW3H+Cnak=;
        b=gMKNInVlqoUZ0OuuWYA4GS07s0Wlns3vWo1tpgRQA/DB22vUvu/ncARj+mkWeHvxyd
         gDE/exku6MNE0wEJZMdxUtO/4ziyCMq8wV/q7Keo9kFxhP3MfOPozDQkTjura5m6wEHi
         uiFSgk7+ik8bST8wPL6D++SWnBOgF1JMOjIejRtCqqdKLS+WSVNJdBD4F/kHwOd/Q7J/
         PlCcwgIJ1xRlC1bZiZ5hwFmFYYxDSq3b+12un81p8Sc0/hlWURqfEDL+zMAWHPCtjIzJ
         dczncI7vVfJTdpC6xHgFlKxuEPa/t4k7v0WdcZZ7alFaXJVjGWaYonuaCy8VVyVwZk8E
         HDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996057; x=1790600857;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbudeLwfAr9oq/ZGTRMn4oQtid64vUTUavDW3H+Cnak=;
        b=bScvtqFL6RgsTAjx6XX0R5q1Y7zmMsucZ9hBECd7360UbEHa2eCVvT1qt5mLDyy3nx
         aFEQnyzn4veAaQUwQaI3nDZ93EMVHMvjg6pWYmJG7capLbSKvoJQ2aA+oedxalWqb70x
         o+ZKcCmTAzAzdf8qktiWd2SLDeauTD+DaDarUkBbMbmxZpKTzEkik8KuhbuTalBoaHaR
         ISCKY0m4+kAb3N69H//y1FhZ3zD0Vjo5zuYDHmo24t8auFWI4v138uJLXoJf9/0Cf0Ua
         psBey52tjsdGxbqfwRMcJu9x7Xmkfs5CGU/3wHzZ2dNuDEqrDYpboD/aKsVMI0uNYIY5
         Yjiw==
X-Forwarded-Encrypted: i=1; AKwUvBy7UnlxKTzkVNzaMbRHfcewXi2ZQntVa0wsQtb4e+VU9eaByFWZbCZ80sZDCJbeNuEOdQMCwG8sS1A=@lists.xenproject.org
X-Gm-Message-State: AFuF++nOjVuvNzAK1+UD44l05Wi57Ls5PTUcvzOyADQQPI7dDc4AZZSa
	krTaAhlDlsmJO8gKfvjebi+ktFYkr9f/RAm08BBZ1JnplyLfi87pd+eGTsyDaqbMAeE=
X-Gm-Gg: AYBFou3tOKK6rXtpeuYqq0V5AocF8Jj4XafZF5n07qWLLljCOpaOA2DU651IrrgYGSW
	0Vn0R4i1ScO5o9noGx0BsN0xTgFikYPnUaLgJgzOX0E2/0FsLYLbf6DyCl0rFJA6Xj6xDNhZpsj
	Cb9Q6TR01w1cqSymsHot9k6D/KtB8EIVtv+90AHgwJ7nKCwRjgrEbdztZ9NsJRCAtWOONuumK5s
	RLm3VkY8sAWHU6ES71s3IzDCB6JLrLe6i1EaApxWoop+wAyutLL6rsnEpPQSpxCITb5Wo9nLYSk
	1EQHI5bMzjuc/mBlAh7Zi+XICWx93sMIzCe0YRXgDVNF1q4Ur7U93m81d56kOIJOnS8kW/Z6cqM
	5amxLXW+D0OUPjddEuCjT8QdFkjXVI9W3GThH9SmOxk7/KYZO/Q6mnO5Uwv9bSmDKnpIyJx2D8N
	vSabqK10JZAskKQOA0Gl7QYQv661eZt7sY1tmOmZP3/esXFsEz9eTZcG7eKRSEpjUAoGQ+bwnCj
	F/JGEvhW/At0Qd5lJDLup1VsEVMP3B9hln6vMDruWWd4QPF26PNScgkDwoPynu0uFJ5BiSQPX0Y
	c6iM6EVRIy5zxYfBomy/e1aEKsrRVS6XSoc=
X-Received: by 2002:a17:907:948a:b0:c25:68c2:7b94 with SMTP id a640c23a62f3a-c2a156595dcmr885996666b.8.1789996057145;
        Mon, 21 Sep 2026 06:07:37 -0700 (PDT)
Message-ID: <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com>
Date: Mon, 21 Sep 2026 15:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>
References: <aq6_Cebyee8IHN8p@end>
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
In-Reply-To: <aq6_Cebyee8IHN8p@end>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T0Q9AglYbuwjn9X0Cp79imCv"
X-purgate-ID: tlsNG-c1860d/1789996057-CD94A87B-40D73CAE/35/110847
X-purgate-type: clean
X-purgate-size: 10300

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T0Q9AglYbuwjn9X0Cp79imCv
Content-Type: multipart/mixed; boundary="------------uXWrswsV74pQfI2mCP07Ag2V";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
References: <aq6_Cebyee8IHN8p@end>
In-Reply-To: <aq6_Cebyee8IHN8p@end>
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

--------------uXWrswsV74pQfI2mCP07Ag2V
Content-Type: multipart/mixed; boundary="------------ULdRt57aM0dnajw0JzDvTfsX"

--------------ULdRt57aM0dnajw0JzDvTfsX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDkuMjYgMTg6NTcsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiBJIGhhdmUgc3VibWl0dGVkIHRoZSBwY2l1dGlscyBNaW5pT1MgcG9ydCB0byB1cHN0
cmVhbSAod2hpY2ggSSBzaG91bGQNCj4gcHJvYmFibHkgaGF2ZSBkb25lIDE4IHllYXJzIGFn
byA6KQ0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL3BjaXV0aWxzL3BjaXV0aWxzL3B1bGwv
MjM1DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wY2l1dGlscy9wY2l1dGlscy9wdWxsLzIzNg0K
PiANCj4gSmFuIEJldWxpY2gsIGxlIG1lci4gMTkgYW/Du3QgMjAyNiAwODo0MDozNyArMDIw
MCwgYSBlY3JpdDoNCj4+IE9uIDE4LjA4LjIwMjYgMjM6NDIsIFNhbXVlbCBUaGliYXVsdCB3
cm90ZToNCj4+PiBKw7xyZ2VuIEdyb8OfLCBsZSBtYXIuIDE4IGFvw7t0IDIwMjYgMDc6NDM6
MzQgKzAyMDAsIGEgZWNyaXQ6DQo+Pj4+IE9uIDE3LjA4LjI2IDE4OjM3LCBTYW11ZWwgVGhp
YmF1bHQgd3JvdGU6DQo+Pj4+PiBKdWVyZ2VuIEdyb3NzLCBsZSBsdW4uIDE3IGFvw7t0IDIw
MjYgMTA6MjQ6MDIgKzAyMDAsIGEgZWNyaXQ6DQo+Pj4+IFdoYXQgYWJvdXQgYWRkaW5nIGEg
Y29tbWVudCB0byB0aGUgc3R1YmRvbSBNYWtlZmlsZSBpbiBhIHNlcGFyYXRlIHBhdGNoLCBs
aWtlOg0KPj4+Pg0KPj4+PiAjIHBjaXV0aWxzIHN1cHBvcnQgaGFzIGJlZW4gcmVtb3ZlZCB3
aXRoIGNvbW1pdCA8Y29tbWl0LWlkPiwgcmV2ZXJ0IHRoYXQgcGF0Y2gNCj4+Pj4gIyBpbiBj
YXNlIGl0IGlzIG5lZWRlZCBhZ2Fpbi4NCj4+Pj4NCj4+Pj4gSSB0aGluayB0aGlzIHdvdWxk
IGJlIHByZWZlcmFibGUgb3ZlciB1bnVzZWQgYW5kIHByb2JhYmx5IGJpdC1yb3R0ZW4gY29k
ZSBpbg0KPj4+PiB0aGUgcmVwb3NpdG9yeS4NCj4gDQo+IFdlIGNhbiBwb2ludCBwZW9wbGUg
dG8gcGNpdXRpbHMgdGhyb3VnaCBzdWNoIGEgY29tbWVudC4NCj4gDQo+IErDvHJnZW4gR3Jv
w58sIGxlIG1lci4gMTkgYW/Du3QgMjAyNiAwOToxMjowMCArMDIwMCwgYSBlY3JpdDoNCj4+
IE9uIDE4LjA4LjI2IDIzOjQyLCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+Pj4gSSBkb24n
dCBzZWUgd2h5IGl0IHdvdWxkIGJlIGJpdC1yb3R0ZW4sIHNpbmNlIHRoZSBwY2l1dGlscyB2
ZXJzaW9uIGluDQo+Pj4gdXNlZCBpcyBmaXhlZCwgaXQncyBhIGxpYnJhcnkgdGhhdCBoYXMg
YSBxdWl0ZSBzdGFibGUgQVBJLCBhbmQgdGhlIHBjaQ0KPj4+IHhlbiBpbnRlcmZhY2UgaXMg
c3VwcG9zZWQgdG8ga2VlcCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KPj4NCj4+IFRoZW4g
SSdkIHJhdGhlciBhZGQgaXQgdG8gTWluaS1PUyAocHJvYmFibHkgYmVoaW5kIGFub3RoZXIg
Q09ORklHIG9wdGlvbikgdGhhbg0KPj4gaGF2aW5nIGl0IGluIHRoZSBYZW4gdHJlZS4NCj4g
DQo+IE1tbSwgYnV0IGhvdz8gV2UgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gcHVsbCB0aGUgd2hv
bGUgcGNpdXRpbHMgYnVpbGQgaW50bw0KPiBtaW5pLW9zIDopDQoNClRCSCwgSSBkb24ndCBz
ZWUgd2h5IHRoZSB3aG9sZSBNaW5pLU9TIHNwZWNpZmljIHN0dWJkb20gbWF6ZSBzaG91bGQg
YmUgaW4gdGhlDQpYZW4gcmVwb3NpdG9yeS4gVGhpbmtpbmcgYWJvdXQgdGhlIGhvb3BzIEkg
aGFkIHRvIGp1bXAgdGhyb3VnaCBmb3IgZG9pbmcgc29tZQ0Kb2YgdGhlIE1pbmktT1MgY2xl
YW51cHMgKGVzcGVjaWFsbHkgcmVnYXJkaW5nIGNvbmZpZyBvcHRpb25zKSwgaGF2aW5nIGFs
bCBvZg0KdGhlIHN0dWJkb20gc3R1ZmYgaW4gTWluaS1PUyBvciBhbiBleHRyYSByZXBvc2l0
b3J5IHdvdWxkIHByb2JhYmx5IGJlIGNsZWFuZXIuDQoNClRoaXMgaXMgdHJ1ZSBlc3BlY2lh
bGx5IG5vdywgYXMgbm9uZSBvZiB0aGUgc3R1YmRvbSByZW1haW5zIHJlYWxseSBkZXBlbmQg
b24NCnRoZSBYZW4gdmVyc2lvbiBhbnkgbG9uZ2VyIChhcGFydCBmcm9tIHRoZSByZXF1aXJl
bWVudCB0byB1c2UgYSBmYWlybHkgbmV3DQpYZW4pLg0KDQpPVE9IIGJlZm9yZSBtb3Zpbmcg
c3R1YmRvbSB0byBNaW5pLU9TLCBVTklLUkFGVCBzZWVtcyB0byBiZSBhIHZhbGlkIGFsdGVy
bmF0aXZlLg0KDQoNCkp1ZXJnZW4NCg==
--------------ULdRt57aM0dnajw0JzDvTfsX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ULdRt57aM0dnajw0JzDvTfsX--

--------------uXWrswsV74pQfI2mCP07Ag2V--

--------------T0Q9AglYbuwjn9X0Cp79imCv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqxLBgFAwAAAAAACgkQsN6d1ii/Ey8U
Rwf/SVdGsCtZjGZ7wyYcLHmhac5kCtjgS/pjRDllMNZo9i00L31KlJtTb4vZeJkkRaVV5pqdat0W
x1tHVyhMA6VzpPWxXA2yJSCXrN3LWi4tqBdF4mTdatZq+wG4/6BO7CuQMS/lVk5IQsQHbX9Nx1Tj
QJIiojsTcJtkWCGMi/xwuIaZwOwCfPptSMWe0q89zXnPy2usFm+QfMQ/JfEgqpisxtWwHdJT3nPg
TQW4qOGmg6R69A876oCgR0sO4dn49drN+u+pvRFWuTMAA4UpHNk2VvnwJtyrIlstGk+AlgCgpUQI
MxgxmJ/np2t8yhZL5gvTT7WXCkXwk2qRpmz9rGerRw==
=6o/a
-----END PGP SIGNATURE-----

--------------T0Q9AglYbuwjn9X0Cp79imCv--

