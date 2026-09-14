Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C358C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 09:39:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420625.1646887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x639S-0007Hc-7m; Mon, 14 Sep 2026 09:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420625.1646887; Mon, 14 Sep 2026 09:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x639S-0007HV-51; Mon, 14 Sep 2026 09:39:02 +0000
Received: by outflank-mailman (input) for mailman id 1420625;
 Mon, 14 Sep 2026 09:39:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x639Q-0007Gg-GB
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:39:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x639P-009Hhx-Ba
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:38:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa7c09b-e002-0a2a0a5209dd-0a2a4509cfb0-34
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:38:59 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa7bf86-be1a-0a2a45090019-d155dd2ce50f-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 11:33:58 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso2069915f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 02:33:58 -0700 (PDT)
Received: from [172.18.88.57] ([185.104.138.120])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb32e7f5sm25435042f8f.9.2026.09.14.02.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:33:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789378438; x=1789983238; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uu4VpEywB5kyiFTIqw8Hg2kpjb2ljJV1v1EjXssvCuw=;
        b=Fqb/4Iq/Xm/PqyeSrZm9IqqQ7UkybHbVJQGDsOs03GU+V1enCSY8EOO+j2ZbUVku3B
         5G4Lk6EMT9dPN0LnrXKc+OWdQ9n4P9NRpNLONAgnbrBUo00IlLYw/IzwPAADgCMgRUpm
         DRhpP6LQ9xEp0wxGeG3n7wXLqmpUgarGjeLcrOY/0am9H11V8lRT5XrHVGaIpOrd6qms
         uZMEjavK2oZhasaX0pjReYQazryeWSaHWoaFH6f3RcKAZdttIix7qOXBgznbpy4E10QS
         JLwmaV/3CjbLpLTh4dJcWZ9bTVDCTIXnKYMFlXPBkj1MAenC18imdf897TMKzMv/zDr3
         +zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378438; x=1789983238;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uu4VpEywB5kyiFTIqw8Hg2kpjb2ljJV1v1EjXssvCuw=;
        b=iQTT8sqdx0ZErdQRpXL876z+w/pzUU4nBydFw+TKadkkXGIbIJAdJjDGE1jBJN9KXL
         VT8FwQ1F6I3jwT7qLzPCCEK5JwX+0exT+my75kxltnUUQV7tLOIKDIcdTxni7NTHAwrw
         YSVxZZ+cxJR1eDMn8BjGWHjTHWuFOUjt7hShyZXYAgPi6El2JQYsqHrMSMTnaRMdwBOP
         +NROCe0ucSQryBDeiRf3HMISsSaVW5l9IIwjjT4RdlXM424T/MOsSMPP2jibNT44vfXO
         SyuTVAlwfEVOFPLCmpw0+rkvfyWo0HJmWyFG06PL+a+BlnnyTeBOpWnbH72y2t/HJhfz
         ulqg==
X-Forwarded-Encrypted: i=1; AKwUvBxLewG94DCxfrCWb9YeqAZKYQVEyYZa/Oib4k1s/qCvskvUYO3JYU21Y12ffhvLBzGdcV3D/+Pzn24=@lists.xenproject.org
X-Gm-Message-State: AFuF++kl/VigBCfBlj0gS9NxVcpS2BlVfTjNnGy17N2pp34CzJbT4BWZ
	l1CVPvis/dXe8bz5cd7mzioJCp9eXrwP5KOA+jK5g7qcrsVSneODUFc7z5iIRklXQMs=
X-Gm-Gg: AYBFou2Pg60wW+j+6iliEj+RMV5qZCVm1hwFAed98D28mhlsv9A0/HP2+uHm3hEyt8E
	8IVV43z2SvTD3IqBylFo7lmgNOKNiYS6PnVonowFdkOpS6mEHNDNuMPzYifVc4ELBgQUVIDAaXc
	MQIemj39h8qodEdVT/n89NO9fAKjE99PbAnZAwuLxoG3U/K0j/c9zEbJnG0p/fzixlxnIQdcXf/
	HxIYZZSg1WjiqBMINFAlqXlr7T9ml8iFhpBB2O2sOr0TmJ20aRjj6JxSp2vAI1S+2q2cAxtL0xb
	Kql69xZY62mZP1eKhWegVqwmLQp6x1CKoiaQNYRD8aCrQ9jS98G2p6F4ONYUSHBylqoAo+sLZZE
	mE7wdimWG7gmszvoyIpUdDE8jtBfzR05BiDsJ67bapzvdevQtx7L8Ch1jc3Bs8/wJUenESE9rpX
	aQ/JYh6dr5kRW9YEj1vJYLyIBr3B0+VoFUUC/DUFnqUY8MtEReWonKOs4+CabPgZhlUloh35K2N
	zDiW/mW
X-Received: by 2002:a5d:5e92:0:b0:486:f8c4:21e with SMTP id ffacd0b85a97d-48702b16c03mr1753853f8f.28.1789378438167;
        Mon, 14 Sep 2026 02:33:58 -0700 (PDT)
Message-ID: <6fc3aa29-f6b5-43fd-893c-f4cbab0b5c84@suse.com>
Date: Mon, 14 Sep 2026 11:33:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
To: Jan Beulich <jbeulich@suse.com>, Furkan Caliskan <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
 <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
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
In-Reply-To: <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vUVAImQAa0BvlNsfrJQYelW2"
X-purgate-ID: tlsNG-bad1c0/1789378438-BD2CC034-3F888E7A/35/110847
X-purgate-type: clean
X-purgate-size: 12169

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vUVAImQAa0BvlNsfrJQYelW2
Content-Type: multipart/mixed; boundary="------------ytxFuEYEwHjlgfcFg1t0EaZv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Furkan Caliskan <frn1furkan10@gmail.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, dfaggioli@suse.com,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 gwd@xenproject.org, enr0n@ubuntu.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
Message-ID: <6fc3aa29-f6b5-43fd-893c-f4cbab0b5c84@suse.com>
Subject: Re: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission
 control
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-2-frn1furkan10@gmail.com>
 <371537bb-7c12-4630-bb1f-57e301b1fbf2@suse.com>
 <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
In-Reply-To: <325f2b44-ea61-45e8-a681-c0bb08d5766a@suse.com>
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

--------------ytxFuEYEwHjlgfcFg1t0EaZv
Content-Type: multipart/mixed; boundary="------------QjaWK6xw88WW67Vw7FBJbQzo"

--------------QjaWK6xw88WW67Vw7FBJbQzo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDkuMjYgMTE6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4wOS4yMDI2
IDExOjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjYuMDguMjYgMDY6NTcsIEZ1
cmthbiBDYWxpc2thbiB3cm90ZToNCj4+PiBAQCAtNjM1LDYgKzY1Niw1NCBAQCByZXBscV9y
ZWluc2VydChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBydF91bml0ICpz
dmMpDQo+Pj4gICAgICAgICAgICBzZXRfdGltZXIoJnJ0X3ByaXYob3BzKS0+cmVwbF90aW1l
ciwgcmVhcm1fc3ZjLT5jdXJfZGVhZGxpbmUpOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiAr
LyoNCj4+PiArICogYnVkZ2V0IDw8IFJURFNfVVRJTF9TSElGVCBjYW4ndCBvdmVyZmxvdzog
cnRfdmFsaWRhdGVfcGFyYW1zKCkNCj4+PiArICogY2FwcyBidWRnZXQgYXQgUlREU19NQVhf
QlVER0VULiBwZXJpb2QgPT0gMCBtZWFucyAibm8NCj4+PiArICogcmVzZXJ2YXRpb24iIChh
IHVuaXQgYmVpbmcgcmVtb3ZlZCksIG5vdCBhbiBlcnJvci4NCj4+PiArICovDQo+Pj4gK3N0
YXRpYyB1aW50NjRfdA0KPj4+ICtydF91bml0X3V0aWxpemF0aW9uKHNfdGltZV90IHBlcmlv
ZCwgc190aW1lX3QgYnVkZ2V0KQ0KPj4+ICt7DQo+Pj4gKyAgICBpZiAoIHBlcmlvZCA8PSAw
ICkNCj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+PiArDQo+Pj4gKyAgICByZXR1cm4gKCh1
aW50NjRfdClidWRnZXQgPDwgUlREU19VVElMX1NISUZUKSAvICh1aW50NjRfdClwZXJpb2Q7
DQo+Pj4gK30NCj4+PiArDQo+Pj4gKy8qDQo+Pj4gKyAqIFV0aWxpemF0aW9uIGNhcGFjaXR5
IG9mIHRoZSBjcHVwb29sIGRvbWFpbiBkIHJlc2lkZXMgaW4uDQo+Pj4gKyAqLw0KPj4+ICtz
dGF0aWMgdWludDY0X3QNCj4+PiArcnRfdXRpbGl6YXRpb25fY2FwKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpDQo+Pj4gK3sNCj4+PiArICAgIHVuc2lnbmVkIGludCBjcHVzID0gY3B1bWFz
a193ZWlnaHQoY3B1cG9vbF9kb21haW5fbWFzdGVyX2NwdW1hc2soZCkpOw0KPj4+ICsNCj4+
PiArICAgIHJldHVybiAodWludDY0X3QpY3B1cyAqIFJURFNfVVRJTF9TQ0FMRSAqIFJURFNf
VVRJTF9DQVBfUENUIC8gMTAwOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICsvKg0KPj4+ICsgKiBS
ZXBsYWNlcyBhIHVuaXQncyByZXNlcnZhdGlvbiBhbmQgdXBkYXRlcyBwcnYtPnV0aWxpemF0
aW9uDQo+Pj4gKyAqIHRvIG1hdGNoLiBHcm93dGggdGhhdCB3b3VsZCBwdXNoIHV0aWxpemF0
aW9uIG92ZXIgdGhlDQo+Pj4gKyAqIGNwdXBvb2wncyBjYXAgaXMgcmVmdXNlZC4gUmVtb3Zp
bmcgYSB1bml0IG9yIHNocmlua2luZw0KPj4+ICsgKiBhIHVuaXQncyByZXNlcnZhdGlvbiBh
bHdheXMgc3VjY2VlZC4NCj4+PiArICovDQo+Pj4gK3N0YXRpYyBpbnQNCj4+PiArcnRfYWRt
aXNzaW9uX3Rlc3Qoc3RydWN0IHJ0X3ByaXZhdGUgKnBydiwgY29uc3Qgc3RydWN0IGRvbWFp
biAqZCwNCj4+PiArCQkgICBzX3RpbWVfdCBvbGRfcGVyaW9kLCBzX3RpbWVfdCBvbGRfYnVk
Z2V0LA0KPj4+ICsJCSAgIHNfdGltZV90IG5ld19wZXJpb2QsIHNfdGltZV90IG5ld19idWRn
ZXQpDQo+Pg0KPj4gSSB0aGluayB0aGUgZnVuY3Rpb24gbmFtZSBpc24ndCBhcHByb3ByaWF0
ZS4gVGhlIGZ1bmN0aW9uIGRvZXNuJ3QgdGVzdCBvbmx5LCBpdA0KPj4gaXMgc2V0dGluZyB0
aGUgdXRpbGl6YXRpb24sIHRvby4NCj4+DQo+PiBXaGF0IGFib3V0IHJ0X3RyeV9zZXRfdXRp
bGl6YXRpb24oKSBpbnN0ZWFkPyBBbmQgbWFrZSB0aGUgcmV0dXJuIHR5cGUgYm9vbA0KPj4g
KHRydWUgb24gc3VjY2VzcykuDQo+Pg0KPj4+ICt7DQo+Pj4gKyAgICB1aW50NjRfdCBvbGRf
dXRpbCA9IHJ0X3VuaXRfdXRpbGl6YXRpb24ob2xkX3BlcmlvZCwgb2xkX2J1ZGdldCk7DQo+
Pj4gKyAgICB1aW50NjRfdCBuZXdfdXRpbCA9IHJ0X3VuaXRfdXRpbGl6YXRpb24obmV3X3Bl
cmlvZCwgbmV3X2J1ZGdldCk7DQo+Pj4gKyAgICB1aW50NjRfdCB0b3RhbCAgICA9IHBydi0+
dXRpbGl6YXRpb24gLSBvbGRfdXRpbCArIG5ld191dGlsOw0KPj4+ICsNCj4+PiArICAgIGlm
ICggbmV3X3V0aWwgPiBvbGRfdXRpbCAmJiB0b3RhbCA+IHJ0X3V0aWxpemF0aW9uX2NhcChk
KSApDQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4gKw0KPj4+ICsgICAgcHJ2
LT51dGlsaXphdGlvbiA9IHRvdGFsOw0KPj4+ICsNCj4+PiArICAgIHJldHVybiAwOw0KPj4+
ICt9DQo+Pj4gKw0KPj4+ICAgIC8qDQo+Pj4gICAgICogUGljayBhIHZhbGlkIHJlc291cmNl
IGZvciB0aGUgdW5pdCB2Yw0KPj4+ICAgICAqIFZhbGlkIHJlc291cmNlIG9mIGFuIHVuaXQg
aXMgaW50ZXNlY3Rpb24gb2YgdW5pdCdzIGFmZmluaXR5DQo+Pj4gQEAgLTg5Miw4ICs5ODMs
MTkgQEAgcnRfYWxsb2NfdWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgdm9pZCAqZGQpDQo+Pj4gICAgc3RhdGljIHZvaWQgY2Zf
Y2hlY2sNCj4+PiAgICBydF9mcmVlX3VkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9w
cywgdm9pZCAqcHJpdikNCj4+PiAgICB7DQo+Pj4gKyAgICBzdHJ1Y3QgcnRfcHJpdmF0ZSAq
cHJ2ID0gcnRfcHJpdihvcHMpOw0KPj4+ICAgICAgICBzdHJ1Y3QgcnRfdW5pdCAqc3ZjID0g
cHJpdjsNCj4+PiAgICANCj4+PiArICAgIGlmICggc3ZjICYmICFpc19pZGxlX3VuaXQoc3Zj
LT51bml0KSApDQo+Pj4gKyAgICB7DQo+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsNCj4+PiArDQo+Pj4gKyAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBydi0+bG9jaywg
ZmxhZ3MpOw0KPj4+ICsgICAgICAgIHJ0X2FkbWlzc2lvbl90ZXN0KHBydiwgc3ZjLT51bml0
LT5kb21haW4sDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN2Yy0+cGVyaW9k
LCBzdmMtPmJ1ZGdldCwgMCwgMCk7DQo+Pg0KPj4gVGhpcyB1c2UgY2FzZSBjbGVhcmx5IHNo
b3dzIHlvdSBhcmUgbm90IG9ubHkgdGVzdGluZy4gOi0pDQo+IA0KPiBZZXQgYXQgdGhlIHNh
bWUgdGltZSBpZ25vcmluZyBwb3NzaWJsZSBlcnJvcnMuDQoNCkkgZG9uJ3Qgc2VlIGhvdyB0
aGlzIGNvdWxkIGhhcHBlbiwgYXMgbmV3X3BlcmlvZCBhbmQgbmV3X2J1ZGdldCBhcmUgYm90
aCAwIGhlcmUuDQoNCg0KSnVlcmdlbg0K
--------------QjaWK6xw88WW67Vw7FBJbQzo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------QjaWK6xw88WW67Vw7FBJbQzo--

--------------ytxFuEYEwHjlgfcFg1t0EaZv--

--------------vUVAImQAa0BvlNsfrJQYelW2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqnv38FAwAAAAAACgkQsN6d1ii/Ey/y
vQf/aiOSUiAEk/b7FiYYj6FFVqjnAd38Py7rwAKMM+Eu6PCAB1kKkC4Fvvd2Xpob89/83Z6nX/Nu
1uv4Lkqz/KJrOgz1FUNDP0faY4h+/zC/AdEfG5zQX7fyWZREIP7QSlMMFbrWdT9XyhXjrxegbqpO
aOGEoUjEbv76AsQLI2J+Lual2IoolMMwbfsYsoiAxM6+BhqxkBchAm7ry5HkgI+yF2rRAsQJNUAs
MrcFCX5epuHs2g3irNtslX8fNtP1GKLaGf9XctvPa2Uq9bQohDxFhC4cQllwLjBWTpECP+lutuui
KLegivvj5OG2lpjOTwLT0/gVpSJvZeh8DOMA1oEQ7A==
=7ER3
-----END PGP SIGNATURE-----

--------------vUVAImQAa0BvlNsfrJQYelW2--

