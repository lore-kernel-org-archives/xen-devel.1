Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A5BC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 12:07:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414534.1644312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dYf-0001R3-2y; Thu, 10 Sep 2026 12:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414534.1644312; Thu, 10 Sep 2026 12:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4dYf-0001Qw-0K; Thu, 10 Sep 2026 12:07:13 +0000
Received: by outflank-mailman (input) for mailman id 1414534;
 Thu, 10 Sep 2026 12:07:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x4dYd-0001Qq-Pw
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:07:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4dYd-00FcFb-2H
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:07:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa29d67-2eae-0a2a0a5409dd-0a2a45019e64-16
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:07:10 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa29d6e-5984-0a2a45010019-4a7de14caa1a-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:07:10 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48583cc7ab1so684142f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 05:07:10 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883959f0sm53898227f8f.10.2026.09.10.05.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 05:07:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1789042030; x=1789646830; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uR5i83eMjXsYpYXaYmvOHeQ3k+EShtormrniowLM1WU=;
        b=FPmEVs6J3HexqTnT1eRmQ9MYM6x2sNcnzD5kaJgiqhDo4F0qITsaSEKOS+OLZghXAs
         tf/pOOY6Y5ICwL+vixOcG4u3oKEjZrt37OVJBcK5WV9uhn94wv107vB35fCGH1ehyZS3
         v95bIK7FjTxseyZtFiOO7tdHFMhyX0XZRpqUMMxNlESPowcnpk1HsSNnb1mmB8NaUBKd
         c9pbisaFVBfSCtZI4uuYanVByEAckemNa4P39WQ4Z7qrGf4tUspxzR8qxTGOaBepVpp/
         WV0zXouzKeFVI1xhCSxMFRsCrSYh9CwmVpAz3KDEFF8jJ7trtVN3qkThIxLVmN3kHp8q
         XIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042030; x=1789646830;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uR5i83eMjXsYpYXaYmvOHeQ3k+EShtormrniowLM1WU=;
        b=jxieVK83QABlr8xUfQEmzbcQi/epQ4tu3y6TmdSUTN2g6WIw5hscd307maHUFlgJXi
         MVie2DP6wUkgqc1Zjrxg4atle9c72BDvBbvsDpS8hpHYaLgZM2aSSA+Ih+T2bfGL+XTR
         LtyFsqsQdm31TayqyFm4Oybk/y4gSbWQ6tUIUYtmvpeoVo67UGKcJNQgJqxuFG0HPjOh
         Dp+IRQmkCPqiZo+a7yl5nXr0pyCYJFdYAmDdONKWWYhuLMp9XyD/F2PgX94mkG5Ls0oS
         530Xis4zbXa++yND2A1CgzS1Nla3GG0TO2rqoonRzhpbAUiI3dMJRRPWGNVUomAo3N2p
         pB5w==
X-Forwarded-Encrypted: i=1; AKwUvBwhQm64ACgRPaed8WIk3LKKMKprmM/qwyZPN/Cp6CpSji0RT2m13An4IdJ10kpKO5fchFAOLdsOoD4=@lists.xenproject.org
X-Gm-Message-State: AFuF++mYBzAtLdjWFjj3YIdanmvL2bbI5jwTBPMYMQQil4MRxl5JtEai
	N5llI+mo1y3gEbIB0l1e2xrpvHUiJCZZq8lm7JvYltHD01E1w7y5QgTYhKC2hkQfGHM=
X-Gm-Gg: AYBFou1ep+BsUAFqRgIFLxadWUl6i8RcL3Qm4mCeGwLqQcEnpd5A82nqb++uZxCozSF
	QrUxzAibxzWjFgomom57of8j/O5szPMI89/THVHIHHliEsLPm0pXljrIJ7I1+4J0pQtf0zYtSjh
	jViNhcAFNS7GFzBbONBtfH/H08tkkIFonIw4e4rC0RUF5/gWyt5tWGzOkfCcJwsKuA+JW9DcCpo
	Gqd02Dc+y0SE7k+fZJ130YcA90BpXYPGfXxAe6KGu1Cnv9c4Ozq8KXlvPcpVl9y3qAb0saeDiJH
	JpfajUCO1ZNpEhwQz/uuG2O7JdycpL4kiEi4Jkz1/fyC1OY++uuhjEJyhu0+PnXPOEatSNrxQAC
	2pPQG/U8cZ9/25re4fZ+hZN7XdAEWm+HtBv09uPTEoQJoo/c8Ef4DKYZPvYm50qge/uWPbrKetb
	asEpy0bTpnB8ICLL7avglGJyE1TAgwOxXy0J6kEgfWK7b/FPEMyaIKDXJJqjMxSlNQx/80sLFlq
	iMyM59F2CWmhkIeAx6QnO+aYtRZU+KTh7SVJd/khsRXR6H8VMzzoZpYpJcgFvTv/8kH4vQ2kNtD
	iP4gB45/JF5khXuTglkZIH56
X-Received: by 2002:a05:6000:1843:b0:486:e5f7:89ca with SMTP id ffacd0b85a97d-486e5f78c38mr2174233f8f.8.1789042030203;
        Thu, 10 Sep 2026 05:07:10 -0700 (PDT)
Message-ID: <0a3a6648-0d39-4be7-a023-df987349a868@suse.com>
Date: Thu, 10 Sep 2026 14:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 3/4] sched/core: avoid use of "current" in
 initializer lists
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <1ba6f97e-4745-4b12-bc80-dffebcadf576@suse.com>
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
In-Reply-To: <1ba6f97e-4745-4b12-bc80-dffebcadf576@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6cqDHa8o5OrjeRF87LSKar2z"
X-purgate-ID: tlsNG-d62444/1789042030-1FA6E757-AD845260/0/0
X-purgate-type: clean
X-purgate-size: 8719

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6cqDHa8o5OrjeRF87LSKar2z
Content-Type: multipart/mixed; boundary="------------1SsaH6TXlm4O7Oujjqh0l8GZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <0a3a6648-0d39-4be7-a023-df987349a868@suse.com>
Subject: Re: [PATCH v1.1 3/4] sched/core: avoid use of "current" in
 initializer lists
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <1ba6f97e-4745-4b12-bc80-dffebcadf576@suse.com>
In-Reply-To: <1ba6f97e-4745-4b12-bc80-dffebcadf576@suse.com>
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

--------------1SsaH6TXlm4O7Oujjqh0l8GZ
Content-Type: multipart/mixed; boundary="------------plegfYMHycpUqiEAlPAmR0RX"

--------------plegfYMHycpUqiEAlPAmR0RX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDkuMjYgMTQ6MjEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUUkFDRV9USU1FKCkg
dXNlcyBhbiBpbml0aWFsaXplciBsaXN0IGFuZCBoZW5jZSBpcyBjb3ZlcmVkIGJ5IE1pc3Jh
IEM6MjAxMg0KPiBydWxlIDEzLjEgKCJJbml0aWFsaXplciBsaXN0cyBzaGFsbCBub3QgY29u
dGFpbiBwZXJzaXN0ZW50IHNpZGUgZWZmZWN0cyIpLg0KPiBVc2UgaW50ZXJtZWRpYXRlIHZh
cmlhYmxlcyB0byBhZGRyZXNzIHRoaXMuDQo+IA0KPiBJbiB2Y3B1X3lpZWxkKCkgdGFrZSB0
aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIHRoZSBleGlzdGluZyB2YXJpYWJsZSB3aGljaA0K
PiBiZXR0ZXIgd291bGQgaGF2ZSBiZWVuIHVzZWQgYWxyZWFkeSBiZWZvcmUuDQo+IA0KPiBJ
biBkb19zY2hlZF9vcCgpIGV4dGVuZCB0aGUgc2NvcGUgb2YgYW5kIHJlbmFtZSBhbiBleGlz
dGluZyB2YXJpYWJsZS4gVXNlDQo+IGJvdGggdmFyaWFibGVzIHRocm91Z2hvdXQgdGhlIGZ1
bmN0aW9uLiBBbHNvIGRyb3AgYSBwb2ludGxlc3MgKGFuZA0KPiBzbGlnaHRseSBtYWxmb3Jt
ZWQsIHN0eWxlLXdpc2UpIGNhc3QgdGhlcmUsIGFuZCBhZGp1c3QgdG8gb3RoZXIgb25lIHRv
IGJ5DQo+IHN0eWxlIGNvbmZvcm1hbnQuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
bnRlbmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------plegfYMHycpUqiEAlPAmR0RX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------plegfYMHycpUqiEAlPAmR0RX--

--------------1SsaH6TXlm4O7Oujjqh0l8GZ--

--------------6cqDHa8o5OrjeRF87LSKar2z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqinW0FAwAAAAAACgkQsN6d1ii/Ey8j
CAf/bZ2WNhp1D8Z+rqS1WIgpmTjYL3mYnYvH7O4nYW19IF8TEpBNoHWQ/pkfv6eLdqu0L1P7hB7k
XEnz1TRCeUTpTW3vnmpy6dNcEQV5QAAis3g1tpYhj063a8MIlYQL1RahTEcTy7X+It/DfSITm1jm
R0GCfxYe9Vr9Rbkpuk7AdP3wpwbFYaqlil2lvYokibBqo9eQ5or3whMytysoX/SdDL2zBaPko71+
3x56YxFQ7pfxQ3q5AfpyDsCUt2hChpJxdTWPeljmkFFycFL/3UkSOwwPgwTRocgm8XoIjCzA2CBV
UhxmNBjMHzaCMf3eUQ3pa0pbJ7LPe3COao8xoJ6OOg==
=OB1x
-----END PGP SIGNATURE-----

--------------6cqDHa8o5OrjeRF87LSKar2z--

