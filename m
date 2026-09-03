Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D5C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 13:26:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407168.1640273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27SL-0002zp-JT; Thu, 03 Sep 2026 13:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407168.1640273; Thu, 03 Sep 2026 13:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27SL-0002zi-Gq; Thu, 03 Sep 2026 13:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1407168;
 Thu, 03 Sep 2026 13:26:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x27SK-0002zc-64
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:26:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x27SJ-00FAeG-4i
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:26:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a997569-8faa-0a2a0a5109dd-0a2a4504ecc8-24
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:26:15 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a997576-b57f-0a2a45040019-d155da30a9c7-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:26:15 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so187541466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 06:26:15 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c25f41ebab0sm102888866b.47.2026.09.03.06.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 06:26:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1788441974; x=1789046774; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7BrbMtXhaTTrPbAHQ/5eQD6nXEyZDrBEvHrkx9jVTU4=;
        b=Va9gN3+K7b0EMkATV4cZifG8zIKs26qlvHJ8RwwdJAM1hibR8ZxlBBH3NrOIjW6Mby
         R13Muin6fir/2vJ2zgXDzYwr6yEhX0JNKZKpbx1+m542gnKgi+NZ6CXOOfspyl8K3IJp
         KIEcZZ045hMhmnyiL7LE9Kd64DCR0ePWYmOMISbc3CDZMZkGfr3PVJoebCSA4fdwvBlJ
         ovWmfLA92EkuSYZW7m5p0p630yPom7nM9gPlYmMxYprv6ANClUqc6gWyRnQPs1fNA2+v
         Q31613ZFtdg26643gSjEnVAnft1yFv1e4kCyg77TVRSufEmlCFHoszyAGMwj+z5SqJNq
         D/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441974; x=1789046774;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BrbMtXhaTTrPbAHQ/5eQD6nXEyZDrBEvHrkx9jVTU4=;
        b=skp8/L9oTKEKoDRAfZ1GSqRlCIpX/cl24DPEpVC8DTCp0bnW9F/s198DhLKb8Gj5GX
         J+EUFlSrIws/SEpLO8GI1/YES1G1aBkkmP6TVdER6Qw3LyOkrDOWRlQyXM85KFo+xSXq
         5vAlXgOvmE9QD0wlQWaaj4js5e0/Oe4S8F4DCoNYsT3g6EqZGFus5PsQm8gyc9EemXJ1
         sKDTM7RHN4aiIZIwa9hWYbGjubfd1vblDDmNvyTLS3aQcac+93u70mqhjPww1K4BloDC
         DI3yi3ICB0DTwT/+I8046ftKb/Hd+lKmtR8xY4/BkFjRtO9D/M84Ra+hbgUp4VkQZ3sU
         0+4g==
X-Forwarded-Encrypted: i=1; AKwUvBw5Ov68cT3Tyv9z/GnERvaWev0EufzI20Thv0lZP9pjEaASXUOstXtpSM4es6dMWEkSeAVgcloxLvE=@lists.xenproject.org
X-Gm-Message-State: AFuF++nZ95eJfTB9xuEh7IOAK1Whk7DZLF/PW9YP/8kS9lNJvyuK0rxS
	6phakqY6FB9PmYNelVlKdCmXk5OQkmJZ2BS455ATZ9ZCxQe5sGxAhn6IMClvPx8LN2OhuSeUEvs
	VpKoOG2A=
X-Gm-Gg: AYBFou32P/YefBQQAc2V93z5+azjumlhtbRYdoaluZ9aM6XXhdLgAcP3qppmAcHKbq2
	Kd5Wxv/gFjl/GgOvuPiCvp+74tsC+fbIWRm/LCSipwPStJ1jwBx4YxmdNLQ05PzffrkMyudj1LM
	OJZ5WKsCZdseiny1WMIaTcDZI+MwCqZuJvqkLuWQwlXE6e5bApJ9IvNYQBQtqAm71ix8yhhyDA7
	KyifPBNu9q5b6F3texNxqzFGlQ1DJk0onvdZOKM4AHgaZppniEUf5RgW5g6zVkoiPLqHShrX77X
	2XbyG4kSZUHs2J1DJPq84dtE5g4xOPS1gFZK9Df9oeHnuwh9szgMBZvU5uoSLgHTnjreKSzkSxC
	DbWqytFr62Wnk0Iw4Aiz/qNKp11VDmOJMb7iJK4FhB1dtkIbW8AF/gQgJ+fNYQMGZOhoLdQw/tP
	yYFbkshwaDSm/9yM063aEaLsvEnjSLDtBiVJtiknewGjzgx1rCCqod5i6hUgQ82/ohXG3YUKPjp
	EsEySjGkgUvowuLJUfn3Bkp69tAp3GtQP+Zwj7M1R8Gu0c+WM+zI9uFzMm8qk7LhfksKL/ZLBiO
	mdpf1GgGfQ==
X-Received: by 2002:a17:906:f58c:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c25f8158bd1mr179749166b.18.1788441974392;
        Thu, 03 Sep 2026 06:26:14 -0700 (PDT)
Message-ID: <873b8735-e425-4f4f-bfb3-851a6c52f9f1@suse.com>
Date: Thu, 3 Sep 2026 15:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] sched/core: avoid use of "current" in initializer
 lists
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
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
In-Reply-To: <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XXNbN5WEj2u055dOVKi9tNzY"
X-purgate-ID: tlsNG-ebf023/1788441975-C06DAB50-E291E8C4/0/0
X-purgate-type: clean
X-purgate-size: 12956

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XXNbN5WEj2u055dOVKi9tNzY
Content-Type: multipart/mixed; boundary="------------wWCgCj4xFw0GLjlcL4lVtL3f";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <873b8735-e425-4f4f-bfb3-851a6c52f9f1@suse.com>
Subject: Re: [PATCH 3/4] sched/core: avoid use of "current" in initializer
 lists
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
In-Reply-To: <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
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

--------------wWCgCj4xFw0GLjlcL4lVtL3f
Content-Type: multipart/mixed; boundary="------------MGeXDCz6XsrCoSPcdhIfnAF0"

--------------MGeXDCz6XsrCoSPcdhIfnAF0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDkuMjYgMTM6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUUkFDRV9USU1FKCkg
dXNlcyBhbiBpbml0aWFsaXplciBsaXN0IGFuZCBoZW5jZSBpcyBjb3ZlcmVkIGJ5IE1pc3Jh
IEM6MjAxMg0KPiBydWxlIDEzLjEgKCJJbml0aWFsaXplciBsaXN0cyBzaGFsbCBub3QgY29u
dGFpbiBwZXJzaXN0ZW50IHNpZGUgZWZmZWN0cyIpLg0KPiBVc2UgaW50ZXJtZWRpYXRlIHZh
cmlhYmxlcyB0byBhZGRyZXNzIHRoaXMuDQo+IA0KPiBJbiB2Y3B1X3lpZWxkKCkgdGFrZSB0
aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIHRoZSBleGlzdGluZyB2YXJpYWJsZSB3aGljaA0K
PiBiZXR0ZXIgd291bGQgaGF2ZSBiZWVuIHVzZWQgYWxyZWFkeSBiZWZvcmUuDQo+IA0KPiBJ
biBkb19zY2hlZF9vcCgpIGV4dGVuZCB0aGUgc2NvcGUgb2YgYW5kIHJlbmFtZSBhbiBleGlz
dGluZyB2YXJpYWJsZS4gQWxzbw0KPiBkcm9wIGEgcG9pbnRsZXNzIChhbmQgc2xpZ2h0bHkg
bWFsZm9ybWVkLCBzdHlsZS13aXNlKSBjYXN0IHRoZXJlLCBhbmQNCj4gYWRqdXN0IHRvIG90
aGVyIG9uZSB0byBieSBzdHlsZSBjb25mb3JtYW50Lg0KPiANCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBOb3RlIHRoYXQgdGhlIHZpb2xhdGlvbnMgcHJl
c2VudGx5IGFyZSByZXBvcnRlZCBvbmx5IGZvciBBcm0uIFNpbWlsYXINCj4gaXNzdWVzIHdv
dWxkIGV4aXN0IG9uIHg4NiBpbiBDbGFuZyBidWlsZHMsIGFmYWljdC4NCj4gDQo+IC0tLSBh
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29y
ZS5jDQo+IEBAIC0xNTMxLDIwICsxNTMxLDIwIEBAIHN0YXRpYyBsb25nIGRvX3BvbGwoY29u
c3Qgc3RydWN0IHNjaGVkX3ANCj4gICAvKiBWb2x1bnRhcmlseSB5aWVsZCB0aGUgcHJvY2Vz
c29yIGZvciB0aGlzIGFsbG9jYXRpb24uICovDQo+ICAgbG9uZyB2Y3B1X3lpZWxkKHZvaWQp
DQo+ICAgew0KPiAtICAgIHN0cnVjdCB2Y3B1ICogdj1jdXJyZW50Ow0KPiArICAgIHN0cnVj
dCB2Y3B1ICpjdXJyID0gY3VycmVudDsNCj4gICAgICAgc3BpbmxvY2tfdCAqbG9jazsNCj4g
ICANCj4gICAgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOw0KPiAgIA0K
PiAtICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOw0K
PiAtICAgIHNjaGVkX3lpZWxkKHZjcHVfc2NoZWR1bGVyKHYpLCB2LT5zY2hlZF91bml0KTsN
Cj4gLSAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdi0+c2NoZWRfdW5pdCk7
DQo+ICsgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEoY3Vyci0+c2NoZWRfdW5p
dCk7DQo+ICsgICAgc2NoZWRfeWllbGQodmNwdV9zY2hlZHVsZXIoY3VyciksIGN1cnItPnNj
aGVkX3VuaXQpOw0KPiArICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCBjdXJy
LT5zY2hlZF91bml0KTsNCj4gICANCj4gICAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9y
ZXNfcmN1bG9jayk7DQo+ICAgDQo+ICAgICAgIFNDSEVEX1NUQVRfQ1JBTksodmNwdV95aWVs
ZCk7DQo+ICAgDQo+IC0gICAgVFJBQ0VfVElNRShUUkNfU0NIRURfWUlFTEQsIGN1cnJlbnQt
PmRvbWFpbi0+ZG9tYWluX2lkLCBjdXJyZW50LT52Y3B1X2lkKTsNCj4gKyAgICBUUkFDRV9U
SU1FKFRSQ19TQ0hFRF9ZSUVMRCwgY3Vyci0+ZG9tYWluLT5kb21haW5faWQsIGN1cnItPnZj
cHVfaWQpOw0KPiAgICAgICByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpOw0KPiAg
ICAgICByZXR1cm4gMDsNCj4gICB9DQo+IEBAIC0xOTE0LDYgKzE5MTQsOCBAQCB0eXBlZGVm
IGxvbmcgcmV0X3Q7DQo+ICAgDQo+ICAgcmV0X3QgZG9fc2NoZWRfb3AoaW50IGNtZCwgWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+ICAgew0KPiArICAgIGNvbnN0IHN0
cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsNCj4gKyAgICBzdHJ1Y3QgZG9tYWluICpjdXJy
ZCA9IGN1cnItPmRvbWFpbjsNCj4gICAgICAgcmV0X3QgcmV0ID0gMDsNCj4gICANCj4gICAg
ICAgc3dpdGNoICggY21kICkNCj4gQEAgLTE5MzgsOSArMTk0MCw5IEBAIHJldF90IGRvX3Nj
aGVkX29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU4NCj4gICAgICAgICAgIGlmICggY29weV9m
cm9tX2d1ZXN0KCZzY2hlZF9zaHV0ZG93biwgYXJnLCAxKSApDQo+ICAgICAgICAgICAgICAg
YnJlYWs7DQo+ICAgDQo+IC0gICAgICAgIFRSQUNFX1RJTUUoVFJDX1NDSEVEX1NIVVRET1dO
LCBjdXJyZW50LT5kb21haW4tPmRvbWFpbl9pZCwNCj4gLSAgICAgICAgICAgICAgICAgICBj
dXJyZW50LT52Y3B1X2lkLCBzY2hlZF9zaHV0ZG93bi5yZWFzb24pOw0KPiAtICAgICAgICBy
ZXQgPSBkb21haW5fc2h1dGRvd24oY3VycmVudC0+ZG9tYWluLCAodTgpc2NoZWRfc2h1dGRv
d24ucmVhc29uKTsNCj4gKyAgICAgICAgVFJBQ0VfVElNRShUUkNfU0NIRURfU0hVVERPV04s
IGN1cnJkLT5kb21haW5faWQsIGN1cnItPnZjcHVfaWQsDQo+ICsgICAgICAgICAgICAgICAg
ICAgc2NoZWRfc2h1dGRvd24ucmVhc29uKTsNCj4gKyAgICAgICAgcmV0ID0gZG9tYWluX3No
dXRkb3duKGN1cnJkLCBzY2hlZF9zaHV0ZG93bi5yZWFzb24pOw0KPiAgIA0KPiAgICAgICAg
ICAgYnJlYWs7DQo+ICAgICAgIH0NCj4gQEAgLTE5NDgsMTkgKzE5NTAsMTggQEAgcmV0X3Qg
ZG9fc2NoZWRfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTg0KPiAgICAgICBjYXNlIFNDSEVE
T1Bfc2h1dGRvd25fY29kZToNCj4gICAgICAgew0KPiAgICAgICAgICAgc3RydWN0IHNjaGVk
X3NodXRkb3duIHNjaGVkX3NodXRkb3duOw0KPiAtICAgICAgICBzdHJ1Y3QgZG9tYWluICpk
ID0gY3VycmVudC0+ZG9tYWluOw0KPiAgIA0KPiAgICAgICAgICAgcmV0ID0gLUVGQVVMVDsN
Cj4gICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZzY2hlZF9zaHV0ZG93biwgYXJn
LCAxKSApDQo+ICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgDQo+IC0gICAgICAgIFRSQUNF
X1RJTUUoVFJDX1NDSEVEX1NIVVRET1dOX0NPREUsIGQtPmRvbWFpbl9pZCwgY3VycmVudC0+
dmNwdV9pZCwNCj4gKyAgICAgICAgVFJBQ0VfVElNRShUUkNfU0NIRURfU0hVVERPV05fQ09E
RSwgY3VycmQtPmRvbWFpbl9pZCwgY3Vyci0+dmNwdV9pZCwNCj4gICAgICAgICAgICAgICAg
ICAgICAgc2NoZWRfc2h1dGRvd24ucmVhc29uKTsNCj4gICANCj4gLSAgICAgICAgc3Bpbl9s
b2NrKCZkLT5zaHV0ZG93bl9sb2NrKTsNCj4gLSAgICAgICAgaWYgKCBkLT5zaHV0ZG93bl9j
b2RlID09IFNIVVRET1dOX0NPREVfSU5WQUxJRCApDQo+IC0gICAgICAgICAgICBkLT5zaHV0
ZG93bl9jb2RlID0gKHU4KXNjaGVkX3NodXRkb3duLnJlYXNvbjsNCj4gLSAgICAgICAgc3Bp
bl91bmxvY2soJmQtPnNodXRkb3duX2xvY2spOw0KPiArICAgICAgICBzcGluX2xvY2soJmN1
cnJkLT5zaHV0ZG93bl9sb2NrKTsNCj4gKyAgICAgICAgaWYgKCBjdXJyZC0+c2h1dGRvd25f
Y29kZSA9PSBTSFVURE9XTl9DT0RFX0lOVkFMSUQgKQ0KPiArICAgICAgICAgICAgY3VycmQt
PnNodXRkb3duX2NvZGUgPSAodWludDhfdClzY2hlZF9zaHV0ZG93bi5yZWFzb247DQo+ICsg
ICAgICAgIHNwaW5fdW5sb2NrKCZjdXJyZC0+c2h1dGRvd25fbG9jayk7DQo+ICAgDQo+ICAg
ICAgICAgICByZXQgPSAwOw0KPiAgICAgICAgICAgYnJlYWs7DQo+IA0KDQpXaGF0IGFib3V0
IHRoZSB1c2Ugb2YgY3VycmVudCBpbiBTQ0hFRE9QX3dhdGNoZG9nIGFuZCBTQ0hFRE9QX3Bp
bl9vdmVycmlkZQ0KaGFuZGxpbmc/DQoNCg0KSnVlcmdlbg0K
--------------MGeXDCz6XsrCoSPcdhIfnAF0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MGeXDCz6XsrCoSPcdhIfnAF0--

--------------wWCgCj4xFw0GLjlcL4lVtL3f--

--------------XXNbN5WEj2u055dOVKi9tNzY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqZdXUFAwAAAAAACgkQsN6d1ii/Ey/C
xwf/X+uJJ78c58anrU3RN0ygOVJYvomJvrGUZ33hS8ap3r0iuXqB4CH+IAIB7Qtu7tRYZjuMdDCH
eOfJWiTQJtstph7IE2hjFuxQsrzkd84G5yJCU1yAfowsYLb40cL/mWkV0DdKP8Kne3FHMcvnaFnL
L8m0CsuIQjuzHW3X6vbtLXLEUSyqC6ZpGFkwKcJMlXUi7Mqr8G1yyJwvecq8dIWN6VAqR7bFZlJT
UhMw0ZL3kvbksX41Ag8kG2CgLkR0dHIqnGgnrmYr7gjQ0ukJ3yMJmJJZaK9SU2Ht4udvIzKhcpMQ
yUy2E2Ml3HPqkVmBc4YF67fRYEkU9K0bjGZWza2KwA==
=eNl/
-----END PGP SIGNATURE-----

--------------XXNbN5WEj2u055dOVKi9tNzY--

