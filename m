Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63162C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 08:45:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382033.1625444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrAln-0001AD-Qe; Tue, 04 Aug 2026 08:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382033.1625444; Tue, 04 Aug 2026 08:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrAln-0001A6-MO; Tue, 04 Aug 2026 08:45:07 +0000
Received: by outflank-mailman (input) for mailman id 1382033;
 Tue, 04 Aug 2026 08:45:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrAln-0001A0-18
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 08:45:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrAlm-00E1pE-4h
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 10:45:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a71a691-2eae-0a2a0a5409dd-0a2a4504ec10-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:45:05 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a71a691-b57f-0a2a45040019-d155d02ca540-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:45:05 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6a08a2b7e5bso1531887a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 01:45:05 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a0d0ed21aesm3184111a12.5.2026.08.04.01.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 01:45:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1785833105; x=1786437905; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iaU3/gpq/3H9J2szYrRVZY+0G842nsPIgdgjVJmjc6g=;
        b=IB7LSZDeQyhNCxoJZ0zsfv+t9ssHCXs8r1LqgyDKauvVJ1Q0TtcahKQnuGR+BMuqN7
         vGKe/iFphg7+WEbvVQLVDuti3kkhPMeYRxmlOKWNOZYNGbXm4hp3+1XlMJcJLhKXbh08
         Af/BtjcSD5Lxwax2JcjX2fNQ2tLryfKDZoJtdqvdQZFh48j85V/HR6VV0IYNckc0Mbuk
         waFeMwRW+5mXtP+fWBSdX2B/fcwc4EzikUda6jp4H15MARGqFE6NcKJxoKSA/sMbW8S/
         8M+xTTHCoRWz94Dve61yqFGfP6ugxsdZH6Xg0jr6SI6rtbJ6tVLM+CXvG6u/ElnaZwiU
         fCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833105; x=1786437905;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaU3/gpq/3H9J2szYrRVZY+0G842nsPIgdgjVJmjc6g=;
        b=hRaOP3z80UpKOIDO3/+g+URvi+0CMikCHCCuPS3ddybAmxA6ykau1AGcaFzrSpBoGX
         STN6D0DtfEIkeNe1Vni65hjnTqHNpM660AmrinXNRqzZBvxWMfk6Q1WPyEA6RhO2d/QH
         aRXKhCi2G6uidKQFMA4tzB60PqlKStOM9EpZmFgi3lDzmVBxtntfobyYTaOiGPiisOsK
         p5jrNZ5ECg85xCmRchZIkC+dV/BL+5KYxhIYiETAWmDVMmPGfWwJb7P385sL7D/v+2OC
         ezz/PvL3sHKccf1P5T2aBOPfWyyY+5MPee7GxaZA8jZ1VtmnUWUjTI1KP6oeoZfJ7AwG
         RKOg==
X-Gm-Message-State: AOJu0YyxWcj+JO+H48lH27K1Gtg1JclwRh/686RUv03t2nC5RP9ZdLbu
	mr0Vj6TBY/iVulp1JdO5iuGU3SyKiYPR37sB4oVlBIZrk63/VJXLswyxPo1jO2L7xoY=
X-Gm-Gg: AR+sD13G1ccHXpUf9AWGqt7dWBt1Tq7V6d87dKz8x1sddKpnMD6F0TsFYDFeGe35aWt
	HUiFqJot+hAJjwQghTu+f4u8p5esJMsL9vkeMKe+tqlew8bQ53g8XHdehbDpsOyH+tkSiuq7ESO
	7cTgzQyaESFNNV/qDrMvIZP9HfSYJwTz4XxbOdmTmKAQUCsTT+bMP7AaU7HWaeMxfsz+1JtkHfi
	5+/KE9WqRYtKeyt9Kob4ZMRH00/C5eLOfO5oUWFwofG4mlNKBVhviP+OGs2yUUVAKfXpndJ8B57
	EIJ8cYQidb11aUps83RF4RzGmVVJP9f00fQSH0i+VUnJ2Y83yLBsz91Rfs5JIK37dx9qP2EetVG
	nNqsEUaImO2PGR+RF5mQsrtYVB7ighUzz2k54bCih/3+m0QEb6pH1dRbLCZV0pdGqUh3F2V5+7q
	OjQydKWT1bOVoWUac2h/TzHtFwChsVY7wsTMsPWZn14DexwifcvpZGhVRn43a5mKsypadXp7ix/
	BtPh17mcW8FrTKvc8/xSheLpEJsnWfB8+fTIs4Iuq5aRxfRMIXuaPTGlfaBSpcIWVcNDrvmv2HP
	PnTcC2vJgYW0fSY=
X-Received: by 2002:a05:6402:11cb:b0:69e:14ab:5966 with SMTP id 4fb4d7f45d1cf-6a12319f03amr2901669a12.8.1785833105429;
        Tue, 04 Aug 2026 01:45:05 -0700 (PDT)
Message-ID: <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
Date: Tue, 4 Aug 2026 10:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux PV domU with >1 vCPU never resumes after xl save/restore
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
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
In-Reply-To: <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WVRzwMQeY23S5wu1WdvhUDd2"
X-purgate-ID: tlsNG-ebf023/1785833105-516D2B50-64075477/0/0
X-purgate-type: clean
X-purgate-size: 8837

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WVRzwMQeY23S5wu1WdvhUDd2
Content-Type: multipart/mixed; boundary="------------pa0cUgpdHzoVvd7rAPNWfrwC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
Subject: Re: Linux PV domU with >1 vCPU never resumes after xl save/restore
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
In-Reply-To: <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
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

--------------pa0cUgpdHzoVvd7rAPNWfrwC
Content-Type: multipart/mixed; boundary="------------WTP03W800uCAC6gjMvuPYlYZ"

--------------WTP03W800uCAC6gjMvuPYlYZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjYgMTA6MDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wOC4yMDI2
IDA4OjEyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gU2F2aW5nIGFuZCByZXN0b3Jpbmcg
YSBtdWx0aS12Y3B1IFBWIGd1ZXN0IGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGJyb2tlbiBpbg0K
Pj4gTGludXggZm9yIHNvbWUgdGltZSAob2JzZXJ2ZWQgNi42LjU2IGFuZCA2LjEyLjg2KS4g
IFJlcG9ydCBiZWxvdyBmcm9tDQo+PiBDbGF1ZGUgRmFibGU7IEkndmUgaW5kZXBlbmRlbnRs
eSB2ZXJpZmllZCB0aGUgYmVoYXZpb3Igb24gdmFuaWxsYSBMaW51eA0KPj4gNi42LjU2LiAg
Q2xhdWRlIHNlZW1zIHRvIHRoaW5rIGl0J3MgYSBidWcgaW4gTGludXguDQo+IA0KPiBKdXN0
IHRvIGRvdWJsZSBjaGVjaywgYXMgdGhlcmUgd2FzIGEgY3J1Y2lhbCBmaXggdGhlcmUgcmVj
ZW50bHk6IFRoaXMgaXMgd2l0aA0KPiBhIFhlbiBpbmNsdWRpbmcgYmVkYmMxN2Q4NDA3ICgi
eDg2L2RvbWN0bDogcmVzdG9yZSBhbGwgcmVnaXN0ZXJzIGluDQo+IGFyY2hfe2dldCxzZXR9
X2luZm9fZ3Vlc3QoKSIpPw0KDQpUaGFua3MgZm9yIGJyaW5naW5nIHRoaXMgdXAuDQoNCkkg
anVzdCB3YW50ZWQgdG8gc3RhcnQgaW52ZXN0aWdhdGlvbiwgYXMgeGwgc2F2ZS9yZXN0b3Jl
IGRpZG4ndCB3b3JrIGZvciBtZQ0KZWl0aGVyIHVzaW5nIGFuIHVwc3RyZWFtIDcuMSBrZXJu
ZWwuDQoNClVzaW5nIGFuIHVwLXRvLWRhdGUgWGVuIG1hZGUgdGhlIGRpZmZlcmVuY2UgKEkg
aGFkIGEgb25lIG1vbnRoIG9sZCBYZW4gb24gbXkNCnRlc3Qgc3lzdGVtIGZvciB0aGUgaW5p
dGlhbCB0ZXN0KS4NCg0KDQpKdWVyZ2VuDQoNClAuUy46IEdlb3JnZSwgd291bGQgaXQgYmUg
cG9zc2libGUgdG8gdHVybiBvZmYgSFRNTCBtYWlscyB3aGVuIHNlbmRpbmcgdG8NCiAgICAg
ICB4ZW4tZGV2ZWw/DQo=
--------------WTP03W800uCAC6gjMvuPYlYZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WTP03W800uCAC6gjMvuPYlYZ--

--------------pa0cUgpdHzoVvd7rAPNWfrwC--

--------------WVRzwMQeY23S5wu1WdvhUDd2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpxppAFAwAAAAAACgkQsN6d1ii/Ey8y
2gf9G2gLNc5IG8tJ5It/UYmwD3CJz+8fX1u5OgApne08uKg7Jms0cBlNyaVpN5eegCEUV8XRfRUs
Avz1BpSJ2yKeTEoV7Tsk+B75wwsVZOd7cSf7J9c9EQA3RzROfq41boOl5H2vSKlrpWhhyxQvIPgD
TOHX4yrTnaxXNuRIKBxEt4LpQ+I5cKeSvAd9Zy+S/tddoUo690OjiyGCfYeMIIeF+Qrg1+6E2BqF
LmyalCNQoS01ZjPScAeNKkArgsWsm70n2F50HLsWFtQCvHytKZ1vVgDKQc8zb7a4EpPz0RZQ11dA
GUvBosyR/gxFzkVnZK3yey0XeTsx+8vKPS5UrdxAHA==
=LQ7a
-----END PGP SIGNATURE-----

--------------WVRzwMQeY23S5wu1WdvhUDd2--

