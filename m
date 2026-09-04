Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE0CC79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 06:54:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407889.1640687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2NoW-0004eS-0j; Fri, 04 Sep 2026 06:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407889.1640687; Fri, 04 Sep 2026 06:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2NoV-0004eE-T2; Fri, 04 Sep 2026 06:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1407889;
 Fri, 04 Sep 2026 06:54:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x2NoT-0004e6-UX
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 06:54:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2NoT-00HCA8-BC
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:54:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a9a6af5-2eae-0a2a0a5409dd-0a2a4509e4a6-32
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 08:54:13 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a9a6b14-be1a-0a2a45090019-d155dd34c11a-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 08:54:13 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so375971f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 23:54:13 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885b405fsm4051633f8f.28.2026.09.03.23.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 23:54:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1788504852; x=1789109652; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JsNsCWHJbO8Mm+cYY3Miajoe3vfNXIcRTok2WECHH1o=;
        b=P/FOuo/vPkBrLfw13+hujzys9O2unj7rw9iuRK2X+hvmRFiiYU11mGJT4VrYm1wzW/
         msEXY1qesVRDK2oX3faXRK7wBKaK10o17G/A6CLQKT53kCI+fC3EHo/kAUuaAHFGViEx
         fb3vGx0AAZ2X6YtAIqF3zvATXIaCy/Fc1DCnYqNMTeos+UmBlxLjYnTIO6OKZi5u40Mf
         jl06EmWyIeUYrdL3VbiXBG8UhQWdeK4AODXJXHveoa4Fif41KfjAk75VQQm7lrR+xAbl
         /rXiuIawhscoyNm5S/L7kwgLD2lwGI6lv0baBHmOT1diwJvAN5bhHOuT24yScGKrwEM+
         EqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788504852; x=1789109652;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsNsCWHJbO8Mm+cYY3Miajoe3vfNXIcRTok2WECHH1o=;
        b=dTvfavKIukja7c2gJoAkGvq+mAxIKq3aRI+iP4+fFnyzqSGjXEQbRT28Y7qkFaB6wy
         9AoO78c4vSm8o3BWGfLTiSxemWxXhnR7CbYATrVV+mnRZ2TufD5axh74Ti5Cgenlt7EP
         U6GyMsdV/okdTU9Cfj0YXcnoahOjVpKoE/fKrjl4GcyIatd8dEd8SnFJENIvqWYP+ojb
         8uAsPyV7xVqe0BpnZJgy/10x2iKI/FVPU/RIzeF1nHH/st+X+RP5WFeBOrdQOmrhA6Xf
         U3Xf8dQwDwgpq0ArOaTREOMGAIyn2PX3DDmsNGjiu1/UhVfNofI2Ly01cQekXNvuwvGs
         +lyg==
X-Forwarded-Encrypted: i=1; AKwUvByb0IkeGHGW6FOAC6G0VLGQ2Ce6SQGWoQWRLLLNsHurAlAwXYpplWgsr9JXiSfnZxnaEpqOJHj1ac0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kfOVUscLUFCVqFSU9X/RQT1ca3IZQujFyIFkugjiWx3oF65P2n
	W/PK/Q6DOxQtuKLimmY+HBFjAv6dDWjOJiMq10kFCF8rN6G0fjJB30imUjtv5GyjKE8=
X-Gm-Gg: AYBFou0s8PE7IgYUQdvMHL25HammPBhDJJcPCIb84RtlCkyMGul08EAXo7hTw92qxiP
	DXaqYJfCKyxSpHaSuagPBsrXaEgtSeETd1ZgLyR6Zt7M9DCo1Hh30O6ultouZKOdRSE4K+CXveL
	z73rCbv7gvj5N6NltLOhFXqYW1iqteWeUBAAcilMtT9M0cmm6b2L3pK6ouyIZEuNehM8lrHlrd0
	Bt4yhdzpO8iWJGI4gcqwJgzA2GVGgERXLGp8aSgwf56Qht+MZs9HWrCQdy8usoyUzm8dNRSBOM1
	YSL6q3f2s989cPMl1e5NMMm599eVW0c7oj0zQq/QD5iNfOOwCd2dIxvmn4UFGOE1DcfYBzpBdmX
	/D7NYepF+OzLKRjM3X92M3xAQGM+dQOFJPGyeGMiSligkwBqABjaUWqHeBWNz2DSpgu7LEX8es/
	nkp5EeNCnF0q92/yJ5xtaMvn/GDwm37z6e26oDDoDmCTX8Wd0TsV+EPIDpcumUrt2wKhqbzy/lq
	Of76eVb5T2jaQzGUR/bYO3cDTp3QM06wFSsAgC1fuxASQhqkiDQ4vACQshUrYmtp2kvVW4cCvnr
	JEUrj51bKVJbrg==
X-Received: by 2002:a5d:5f47:0:b0:484:3a16:cc58 with SMTP id ffacd0b85a97d-4858707f11fmr5051536f8f.2.1788504852398;
        Thu, 03 Sep 2026 23:54:12 -0700 (PDT)
Message-ID: <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
Date: Fri, 4 Sep 2026 08:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
 <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
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
In-Reply-To: <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c8xz0CP6dvxU0eGMx6iKhJMi"
X-purgate-ID: tlsNG-bad1c0/1788504853-FC212034-F1426F9A/0/0
X-purgate-type: clean
X-purgate-size: 13955

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c8xz0CP6dvxU0eGMx6iKhJMi
Content-Type: multipart/mixed; boundary="------------qRpM8NKCVLpROhh30HFCOzTk";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
 <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
In-Reply-To: <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
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

--------------qRpM8NKCVLpROhh30HFCOzTk
Content-Type: multipart/mixed; boundary="------------5ayzHQqzWdEiCqQXkI0hB6w2"

--------------5ayzHQqzWdEiCqQXkI0hB6w2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDkuMjYgMDg6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wOS4yMDI2
IDAwOjM1LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gT24gVGh1LCBTZXAgMywgMjAyNiBh
dCA1OjEx4oCvUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+
Pg0KPj4+IE9uIDAyLjA5LjIwMjYgMTE6NDMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4+
IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+Pg0K
Pj4+PiBDdXJyZW50bHksIHVwZGF0ZV94ZW5fc2xvdF9pbl9mdWxsX2dkdCgpIHVzZXMgdGhl
IHN0YXNoZWQgZGlyZWN0LW1hcA0KPj4+PiBwb2ludGVyIGluIGQtPmFyY2gucHYuZ2R0X2xk
dF9sMXRhYiB0byB1cGRhdGUgdGhlIGluY29taW5nIHZjcHUncw0KPj4+PiBwYWdlIHRhYmxl
cyB3aXRoIFhlbidzIEdEVCwgYnkgd3JpdGluZyBhIHN0YXNoZWQgcGVyLWNwdSBjb3B5IG9m
IGENCj4+Pj4gcHJlLWJha2VkIEwxIGVudHJ5IChlaXRoZXIgNjQtYml0IG9yIGNvbXBhdCB2
ZXJzaW9uKS4NCj4+Pj4NCj4+Pj4gU3dpdGNoIHRoaXMgdG8gdXNpbmcgcG9wdWxhdGVfcGVy
ZG9tYWluX21hcHBpbmcoKSwgd2hpY2ggZG9lc24ndCByZWx5DQo+Pj4+IG9uIHRoZSBzdGFz
aGVkIGFkZHJlc3Mgb2YgdGhlIGwxIHBhZ2UgaW4gdGhlIGRpcmVjdCBtYXAuICBSYXRoZXIg
dGhhbg0KPj4+PiBhbHNvIHN0YXNoaW5nIGEgcHJlLWJha2VkIHZhbHVlIGZvciB0aGUgcGF5
bG9hZCwgY29tcHV0ZSB0aGUgbWZuIGZyb20NCj4+Pj4gdGhlIHBlci1jcHUgR0RUIHBvaW50
ZXIgYXQgdXNlOiB0aGUgY29udmVyc2lvbiBpcyBhIGhhbmRmdWwgb2YgY3ljbGVzDQo+Pj4+
IG9uIGEgcGF0aCBjb3N0aW5nIHRob3VzYW5kcywgYW5kIGNvbXB1dGluZyBhdCB1c2UgcmVt
b3ZlcyB0aGUNCj4+Pj4gcGFyYWxsZWwgeyxjb21wYXRffWdkdF9sMWUgYm9va2tlZXBpbmcg
YWxvbmcgd2l0aCBpdHMgYm9vdC1vcmRlcmluZw0KPj4+PiBjb25zdHJhaW50ICh0aGUgY2Fj
aGVkIHZhbHVlIGNvdWxkIG9ubHkgYmUgZ2VuZXJhdGVkIGFmdGVyIFhlbidzDQo+Pj4+IHBo
eXNpY2FsIHJlbG9jYXRpb24sIGFuZCBoYWQgdG8gYmUgaW4gcGxhY2UgYmVmb3JlIHRoZSBm
aXJzdCBjb250ZXh0DQo+Pj4+IHN3aXRjaDsgYSB1c2UtdGltZSBsb29rdXAgaXMgY29ycmVj
dCBieSBjb25zdHJ1Y3Rpb24pLiAgVGhlIGZsYWdzIG9uDQo+Pj4+IHRoZSBmaW5hbCBtYXBw
aW5nIGFyZSBpZGVudGljYWwuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+PiBBc3Npc3RlZC1ieTogQ2xh
dWRlIENvZGU6Y2xhdWRlLWZhYmxlLTUsIENsYXVkZSBDb2RlOmNsYXVkZS1vcHVzLTQtOA0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnd2RAeGVucHJvamVjdC5vcmc+
DQo+Pj4+IC0tLQ0KPj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+PiAtIERyb3AgdGhlIHssY29t
cGF0X31nZHRfbWZuIGNhY2hpbmcgZW50aXJlbHkgKHN1Z2dlc3RlZCBieSBBbmRyZXcNCj4+
Pj4gICAgIENvb3Blcik6IGNvbXB1dGUgdmlydF90b19tZm4oKSBmcm9tIHRoZSBwZXItY3B1
IEdEVCBwb2ludGVyIGF0IHVzZS4NCj4+Pj4gICAgIFRoZSBQRFggbG9va3VwIGJlaGluZCBp
dCBtZWFzdXJlcyB+NS0xMCBjeWNsZXMgd2FybSBhZ2FpbnN0IGENCj4+Pj4gICAgIH4xLDUw
MC1jeWNsZSBjb250ZXh0IHN3aXRjaCwgYW5kIHRoaXMgcmVtb3ZlcyB0aGUgZG91YmxlDQo+
Pj4+ICAgICBib29ra2VlcGluZyBhbmQgdGhlIGFmdGVyLXJlbG9jYXRpb24gY2FjaGluZyBj
b25zdHJhaW50LiAgVGhlDQo+Pj4+ICAgICBjYWNoZWQtTUZOIGFzc2VydGlvbiBnb2VzIHdp
dGggdGhlIGNhY2hlOiBhIHVzZS10aW1lIGNvbXB1dGF0aW9uDQo+Pj4+ICAgICBmcm9tIGEg
bGl2ZSBwb2ludGVyIG5lZWRzIG5vIHN0YWxlbmVzcyBjaGVjay4NCj4+Pg0KPj4+IFRoaXMg
bG9va3MgdG8gY29udHJhZGljdCB3aGF0IDU2NGQyNjE2ODdjMCAoIng4Ni9jdHh0LXN3aXRj
aDogRG9jdW1lbnQNCj4+PiBhbmQgaW1wcm92ZSBHRFQgaGFuZGxpbmciKSB1c2VkIGFzIGp1
c3RpZmljYXRpb24gdG8gcHV0IGluIHBsYWNlIHRoZQ0KPj4+IGNhY2hpbmcuIEFsc28gQ2Mt
aW5nIErDvHJnZW4sIHdobyBhbHNvIHdhcyBpbnZvbHZlZCB0aGVyZSwgZm9yIHBvc3NpYmxl
DQo+Pj4gZnVydGhlciBpbnNpZ2h0Lg0KPj4+DQo+Pj4gRnVuY3Rpb25hbGx5IHRoZSBjaGFu
Z2UgbG9va3Mgb2theSB0byBtZSwgYnV0IHRoZSBhYm92ZSB3aWxsIG5lZWQNCj4+PiBzb3J0
aW5nLCBhdCB0aGUgdmVyeSBsZWFzdCBieSBzcGVjaWZpY2FsbHkgZGlzY3Vzc2luZyB3aHkg
ZWZmZWN0aXZlbHkNCj4+PiB1bmRvaW5nIHRoYXQgZWFybGllciBjaGFuZ2UgaXMgb2theS4N
Cj4+DQo+PiBTbyBsb29raW5nIGJhY2sgYXQgdGhlIHRocmVhZCwgSsO8cmdlbiBtZWFzdXJl
ZCBhIDE0JSBpbXByb3ZlbWVudCBmb3INCj4+IHNvbWV0aGluZyB0aGF0IG1pZ2h0IGJlIGRl
c2NyaWJlZCBhcyBhIG1pY3JvYmVuY2htYXJrIGJlZm9yZSBhbmQgYWZ0ZXINCj4+IHRoZSBw
YXRjaCAoYSBiZW5jaG1hcmsgcHVycG9zZWx5IHRyeWluZyB0byBzZXQgdXAgYW4gdW51c3Vh
bCBzY2VuYXJpbw0KPj4gdG8gbWF4aW1pemUgdGhlIGVmZmVjdCBvZiBjb250ZXh0IHN3aXRj
aCBvdmVyaGVhZCwgbm90IG9uZSB0bw0KPj4gcmVwcmVzZW50IGEgdHlwaWNhbCB3b3JrZmxv
dykuICBCdXQgYXJlIHRoZSBudW1iZXJzIHJlYWxseSBwbGF1c2libGU/DQo+PiBFdmVuIGF0
IGFuIGltcGxhdXNpYmxlIDEwMGsgc3dpdGNoZXMvcyBhY3Jvc3MgdGhlIGJveCwgc2F2aW5n
IDEwMA0KPj4gY3ljbGVzIHBlciBzd2l0Y2ggaXMgYWJvdXQgMC4wNCUgb2YgZWlnaHQgMyBH
SHogY29yZXMuDQo+Pg0KPj4gQXQgYW55IHJhdGUsIHdlJ3JlIGFscmVhZHkgYWRkaW5nIHNl
dmVyYWwgbWFwL3VubWFwIG9wZXJhdGlvbnMsIGFuZA0KPj4gYWJvdXQgdG8gYWRkIHNldmVy
YWwgbW9yZS4gIEtlZXBpbmcgdGhlIFBURSBjYWNoaW5nIHdvdWxkIHJlcXVpcmUNCj4+IGFk
ZGluZyBhIHNlcGFyYXRlIHBhdGggdGhhdCBjYW4gd3JpdGUganVzdCBQVEVzLCB3aGljaCB0
aGVuIHdpbGwNCj4+IHBvdGVudGlhbGx5IGZ1cnRoZXIgY29tcGxpY2F0aW9uIGZ1dHVyZSBw
YXRocyB3aGVyZSB3ZSBuZWVkIHRvIG1ha2UNCj4+IHN1cmUgd2UgaGFuZGxlIGJvdGggZG9t
YWluLXdpZGUgcGVyZG9tYWluIGFyZWFzIGFuZCBwZXItdmNwdSBhcmVhcy4NCj4+IElmIGl0
IHdlcmUgZWFzeSBJIHdvdWxkIGFscmVhZHkgaGF2ZSBiZWVuIGtlZXBpbmcgaXQuDQo+Pg0K
Pj4gSSdkIGJlIGluY2xpbmVkIHRvIHNheTogU2luY2Ugd2UncmUgZ29pbmcgdG8gYmUgYWRk
aW5nIG1vcmUNCj4+IHBvcHVsYXRlX3BlcmRvbWFpbl9tYXBwaW5nKCkgY2FsbHMgYW55d2F5
LCBsZXQncyBkbyBpdCB0aGUgc2ltcGxlDQo+PiBjb3JyZWN0IHdheSBmaXJzdDsgYW5kIHRo
ZW4gZXhwbG9yZSB0aGUgaWRlYSBvZiBzdGFzaGluZyBtZm5zIG9mDQo+PiBmcmVxdWVudGx5
LW1hcHBlZCBMMXMgKHJhdGhlciB0aGFuIGhhdmluZyB0byB3YWxrIEwzIC0+IEwyIC0+IEwx
KTsgYW5kDQo+PiBhdCB0aGF0IHRpbWUgbG9vayBpbnRvIHN0YXNoaW5nIGJha2VkIGwxZXMg
dG8gYXZvaWQgY29udmVyc2lvbnMuDQo+IA0KPiBQZXJoYXBzOyBJJ2QgbGlrZSB0byBoYXZl
IErDvHJnZW4ncyBhbmQvb3IgQW5kcmV3J3MgaW5wdXQgaGVyZSwgdGhvdWdoLg0KDQpBdCB0
aGF0IHRpbWUgSSBpbXBsZW1lbnRlZCBjb3JlIHNjaGVkdWxpbmcgaW4gWGVuLiBJIG5vdGlj
ZWQgdGhhdCB2ZXJ5DQpzdWJ0bGUgY2hhbmdlcyBpbiB0aGUgY29udGV4dCBzd2l0Y2ggcGF0
aCBjb3VsZCByZXN1bHQgaW4gdW5leHBlY3RlZCBsYXJnZQ0KcGVyZm9ybWFuY2UgZGlmZmVy
ZW5jZXMuIEFzIEkgaGFkIHRoZSBwZXJmb3JtYW5jZSB0ZXN0IGZvciBteSBwdXJwb3NlDQph
bHJlYWR5IHNldCB1cCwgSSB1c2VkIGl0IGZvciBBbmRyZXcncyBwYXRjaCAod2hpY2ggd2Fz
IGEgcmVzdWx0IG9mIG15DQpjb250ZXh0IHN3aXRjaCBwYXRoIHBlcmZvcm1hbmNlIGZpbmRp
bmdzKSBhbmQgcmVhbGx5IGRpZCBtZWFzdXJlIHRoZQ0KaW1wcmVzc2l2ZSBlZmZlY3Qgb2Yg
aXQuDQoNCk5vdGUgdGhhdCB5b3UgY2FuJ3Qgb25seSBjb3VudCBpbnN0cnVjdGlvbnMsIG9m
dGVuIGNhY2hlIGVmZmVjdHMgYW5kDQpicmFuY2ggcHJlZGljdGlvbnMgYXJlIGRvbWluYXRp
bmcgdGhlIHBlcmZvcm1hbmNlLg0KDQoNCkp1ZXJnZW4NCg==
--------------5ayzHQqzWdEiCqQXkI0hB6w2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------5ayzHQqzWdEiCqQXkI0hB6w2--

--------------qRpM8NKCVLpROhh30HFCOzTk--

--------------c8xz0CP6dvxU0eGMx6iKhJMi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqaaxMFAwAAAAAACgkQsN6d1ii/Ey92
mwf/bLCwEUDyWwT7cGDfnkrDVy1UC5bBPNToUf2PltO48pdZNfqlgXEnLY8gGzW7SYTrOPEVCrDH
5jw4B7xB0Wq7ZbfhiVMGx2rTUYSNGPXXS7hNSGj5Df5ffdGGMds6a48Ot0FXkkokJwv43c9aS7Ap
xxG0uKX01hGr/GxNLPgV0yd2ZbMFOgf9Ba9cQGXeCprzSZu8ZUCfcfnTW/pi9zqJA3yClI0MnayM
TXAh3oOD2JdniXwNVajIYL64MOeEjFv0MaNxyUZEtBWNuWI5y435v/AA/TqKjoE8wE7/PiDz4nhC
oVmqnU7HWcQ1pSR/o9YICJVjh1xt6JLzzq0wAhJBIw==
=NUt+
-----END PGP SIGNATURE-----

--------------c8xz0CP6dvxU0eGMx6iKhJMi--

