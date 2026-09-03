Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F022BC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 13:58:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407220.1640309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27wt-0000r2-LU; Thu, 03 Sep 2026 13:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407220.1640309; Thu, 03 Sep 2026 13:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27wt-0000qv-Hk; Thu, 03 Sep 2026 13:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1407220;
 Thu, 03 Sep 2026 13:57:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x27wr-0000qo-Oz
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:57:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x27wr-007hNK-5s
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:57:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a997cd8-8faa-0a2a0a5109dd-0a2a450bcaba-16
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:57:49 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a997cdd-b7e8-0a2a450b0019-d155d036ec1a-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:57:49 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-69fab5a852cso3819345a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 06:57:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a67f8becc5sm2525840a12.12.2026.09.03.06.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 06:57:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1788443869; x=1789048669; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8XdoND+SGbUOjjzkIc0os+FYw+5/1OImD36eeBD+emE=;
        b=MIom76zKW5wmpe9S17elF1oHveSTedwC70JcrwUG3bFIOdLa7dI9wJVrh+2usxwH3d
         i3pXBvtuVCR1TTFGJDFuR5bUy8U92c5dCEMeR+UZDNJz7qqv7MS+bSYmCye711jOj0LE
         YsoIYYONvNPDTIz+j2cgV34nPm8ukChvUoBUBhQG7OE3ziyfV/LWefhkKd/U9Ca7Fb7U
         Gb4429+FsUQLJQj0slFgx0L9BtFi8CiAxqzLftb2vSQmyyMIvyBvcJD7A7V/d//SHdAu
         splCOSijiSHv5M6gzddzUEah0gIqirKb63C1OHrpm+urMEQAM+r+KolWktsNEXrY9o9Z
         irRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443869; x=1789048669;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XdoND+SGbUOjjzkIc0os+FYw+5/1OImD36eeBD+emE=;
        b=FvvQhvzwPFprbCb9woogRIzM4dWrcmT/q+DaMSx+T9/z5sjPQ/on20kymE/v5KpLVg
         WwqUdr5v7XTlo/VoOYYHXVfDvTImVdyNN8u4mSgN3B4/H4RClU3HliqhU/hEGcsMaiKz
         GfywyB8JaYIkCwcjpl83NlBnEOlxclHSpxe387XXLL8OV1YXC50daFdCwTFQVEjwzSvG
         T417HsEwwGt9A/PAGXbQBLkXz/F6ILXw8AHE0ukMiJrpLxopiWyauvd1ud0z/qJHCrZu
         31GleKpnV9DKh0VMx/lDE+yjsTe9kBAdkGw92VLQOkMsXa0lYOaG7zEekrZQN+6JAEE6
         /wNA==
X-Forwarded-Encrypted: i=1; AKwUvBzi7MQmmIHi2P0/VAPHXSnEwG1PxAy23pVnWo26Evdjk+fceDFxT+HFI7ZyAjo498aAm/jfmrBJmUI=@lists.xenproject.org
X-Gm-Message-State: AFuF++lr0SBcwCQWpqVgaRkSpuVfF15FKMCYyMOvxhLe06tbk7kMPkag
	fxw6XVPeceFPR786tMPx7hSzgqUmTg5ujl+1/96oMLrY57ENNs3YtvDgFE030x3YauQ=
X-Gm-Gg: AYBFou0etF0u0wXVyRh1tZ+rPweJqZ/eIJKyRIBEb6Y6jYRNgt3HRfvn2kumjpjuSt7
	XaOQ5zt82FMTnvVwJvcN8W0Y6dM1DTowGCNW/beOhDv7flbGT7KL+t3C5xzyHdMMeADrjS/cZxX
	l2cGx5KCDmta91279C2+J/NWWM1Ht+3a6eZFcFIZrV4G74Cx8/k17lVplqlV0E69licxO7P8Je7
	GZi8baFl7bSVNlaSUrIRK19Jqf4vJpwJjzc03SYqM5sDpfmv30A5HcQHg83LD8eWShfJP5c8Ixj
	kv0tRbOfZ37MEmWIB5ZlozncH7OZ8QpR5h3sakjthA6FDNFOgyVHrNsRvjzEFOY0Ui9LUkv1iIB
	+hBHjREGESlKwVdSHQd4NMwaQzs6uAwRiqeQcK2qARwJoz9u6gUH2Ovdb7QZIp3M8U4/3ee39It
	9+JmW1yT2ipJW8b5ME2FKB19/zsDM0oASDY3fsypJn3F7XVF2P4SmUX/1jplK8XgtXcqj+Q22Gw
	TRehXWq0i1p3hHBdp9jRgAE0JH5ItDSHvQUIKeMp++Ic8+Td5/srrTHMYwM2tT1yl3WRe9Oy/BQ
	+0cQqFJlQhRTZw==
X-Received: by 2002:a05:6402:3218:b0:6a1:2400:baea with SMTP id 4fb4d7f45d1cf-6a6829af69bmr9690773a12.10.1788443868423;
        Thu, 03 Sep 2026 06:57:48 -0700 (PDT)
Message-ID: <0faf5aa7-5e4e-4b50-b1d7-1d27896c2b2b@suse.com>
Date: Thu, 3 Sep 2026 15:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] sched/core: avoid use of "current" in initializer
 lists
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
 <873b8735-e425-4f4f-bfb3-851a6c52f9f1@suse.com>
 <8860838a-464a-438f-be40-86dde6908c91@suse.com>
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
In-Reply-To: <8860838a-464a-438f-be40-86dde6908c91@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wx3AHn0WTa5qsqnkrXSKebzo"
X-purgate-ID: tlsNG-42698a/1788443869-A94C39EA-79AA97B3/0/0
X-purgate-type: clean
X-purgate-size: 11026

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wx3AHn0WTa5qsqnkrXSKebzo
Content-Type: multipart/mixed; boundary="------------LrI1AHfmQ0lAH0MryBvkKpAg";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <0faf5aa7-5e4e-4b50-b1d7-1d27896c2b2b@suse.com>
Subject: Re: [PATCH 3/4] sched/core: avoid use of "current" in initializer
 lists
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
 <873b8735-e425-4f4f-bfb3-851a6c52f9f1@suse.com>
 <8860838a-464a-438f-be40-86dde6908c91@suse.com>
In-Reply-To: <8860838a-464a-438f-be40-86dde6908c91@suse.com>
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

--------------LrI1AHfmQ0lAH0MryBvkKpAg
Content-Type: multipart/mixed; boundary="------------BkzxtpuMdZ3x5ZK0y55pNylE"

--------------BkzxtpuMdZ3x5ZK0y55pNylE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDkuMjYgMTU6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wOS4yMDI2
IDE1OjI2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDMuMDkuMjYgMTM6NTMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEBAIC0xOTE0LDYgKzE5MTQsOCBAQCB0eXBlZGVmIGxv
bmcgcmV0X3Q7DQo+Pj4gICAgDQo+Pj4gICAgcmV0X3QgZG9fc2NoZWRfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4gICAgew0KPj4+ICsgICAg
Y29uc3Qgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Ow0KPj4+ICsgICAgc3RydWN0IGRv
bWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47DQo+Pj4gICAgICAgIHJldF90IHJldCA9IDA7
DQo+Pj4gICAgDQo+Pj4gICAgICAgIHN3aXRjaCAoIGNtZCApDQo+Pj4gQEAgLTE5MzgsOSAr
MTk0MCw5IEBAIHJldF90IGRvX3NjaGVkX29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU4NCj4+
PiAgICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZzY2hlZF9zaHV0ZG93biwgYXJn
LCAxKSApDQo+Pj4gICAgICAgICAgICAgICAgYnJlYWs7DQo+Pj4gICAgDQo+Pj4gLSAgICAg
ICAgVFJBQ0VfVElNRShUUkNfU0NIRURfU0hVVERPV04sIGN1cnJlbnQtPmRvbWFpbi0+ZG9t
YWluX2lkLA0KPj4+IC0gICAgICAgICAgICAgICAgICAgY3VycmVudC0+dmNwdV9pZCwgc2No
ZWRfc2h1dGRvd24ucmVhc29uKTsNCj4+PiAtICAgICAgICByZXQgPSBkb21haW5fc2h1dGRv
d24oY3VycmVudC0+ZG9tYWluLCAodTgpc2NoZWRfc2h1dGRvd24ucmVhc29uKTsNCj4+PiAr
ICAgICAgICBUUkFDRV9USU1FKFRSQ19TQ0hFRF9TSFVURE9XTiwgY3VycmQtPmRvbWFpbl9p
ZCwgY3Vyci0+dmNwdV9pZCwNCj4+PiArICAgICAgICAgICAgICAgICAgIHNjaGVkX3NodXRk
b3duLnJlYXNvbik7DQo+Pj4gKyAgICAgICAgcmV0ID0gZG9tYWluX3NodXRkb3duKGN1cnJk
LCBzY2hlZF9zaHV0ZG93bi5yZWFzb24pOw0KPj4+ICAgIA0KPj4+ICAgICAgICAgICAgYnJl
YWs7DQo+Pj4gICAgICAgIH0NCj4+PiBAQCAtMTk0OCwxOSArMTk1MCwxOCBAQCByZXRfdCBk
b19zY2hlZF9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFODQo+Pj4gICAgICAgIGNhc2UgU0NI
RURPUF9zaHV0ZG93bl9jb2RlOg0KPj4+ICAgICAgICB7DQo+Pj4gICAgICAgICAgICBzdHJ1
Y3Qgc2NoZWRfc2h1dGRvd24gc2NoZWRfc2h1dGRvd247DQo+Pj4gLSAgICAgICAgc3RydWN0
IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4+PiAgICANCj4+PiAgICAgICAgICAg
IHJldCA9IC1FRkFVTFQ7DQo+Pj4gICAgICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgm
c2NoZWRfc2h1dGRvd24sIGFyZywgMSkgKQ0KPj4+ICAgICAgICAgICAgICAgIGJyZWFrOw0K
Pj4+ICAgIA0KPj4+IC0gICAgICAgIFRSQUNFX1RJTUUoVFJDX1NDSEVEX1NIVVRET1dOX0NP
REUsIGQtPmRvbWFpbl9pZCwgY3VycmVudC0+dmNwdV9pZCwNCj4+PiArICAgICAgICBUUkFD
RV9USU1FKFRSQ19TQ0hFRF9TSFVURE9XTl9DT0RFLCBjdXJyZC0+ZG9tYWluX2lkLCBjdXJy
LT52Y3B1X2lkLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICBzY2hlZF9zaHV0ZG93bi5y
ZWFzb24pOw0KPj4+ICAgIA0KPj4+IC0gICAgICAgIHNwaW5fbG9jaygmZC0+c2h1dGRvd25f
bG9jayk7DQo+Pj4gLSAgICAgICAgaWYgKCBkLT5zaHV0ZG93bl9jb2RlID09IFNIVVRET1dO
X0NPREVfSU5WQUxJRCApDQo+Pj4gLSAgICAgICAgICAgIGQtPnNodXRkb3duX2NvZGUgPSAo
dTgpc2NoZWRfc2h1dGRvd24ucmVhc29uOw0KPj4+IC0gICAgICAgIHNwaW5fdW5sb2NrKCZk
LT5zaHV0ZG93bl9sb2NrKTsNCj4+PiArICAgICAgICBzcGluX2xvY2soJmN1cnJkLT5zaHV0
ZG93bl9sb2NrKTsNCj4+PiArICAgICAgICBpZiAoIGN1cnJkLT5zaHV0ZG93bl9jb2RlID09
IFNIVVRET1dOX0NPREVfSU5WQUxJRCApDQo+Pj4gKyAgICAgICAgICAgIGN1cnJkLT5zaHV0
ZG93bl9jb2RlID0gKHVpbnQ4X3Qpc2NoZWRfc2h1dGRvd24ucmVhc29uOw0KPj4+ICsgICAg
ICAgIHNwaW5fdW5sb2NrKCZjdXJyZC0+c2h1dGRvd25fbG9jayk7DQo+Pj4gICAgDQo+Pj4g
ICAgICAgICAgICByZXQgPSAwOw0KPj4+ICAgICAgICAgICAgYnJlYWs7DQo+Pg0KPj4gV2hh
dCBhYm91dCB0aGUgdXNlIG9mIGN1cnJlbnQgaW4gU0NIRURPUF93YXRjaGRvZyBhbmQgU0NI
RURPUF9waW5fb3ZlcnJpZGUNCj4+IGhhbmRsaW5nPw0KPiANCj4gSSBjYW4gY2hhbmdlIHRo
b3NlIHRvbyBpZiB0aGF0J3Mgd2FudGVkLCBhbHNvIHRoZSBvbmUgaW4gU0NIRURPUF9yZW1v
dGVfc2h1dGRvd24NCj4gaGFuZGxpbmcgdGhlbi4NCg0KSSdkIHByZWZlciB0aGF0Lg0KDQoN
Ckp1ZXJnZW4NCg==
--------------BkzxtpuMdZ3x5ZK0y55pNylE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------BkzxtpuMdZ3x5ZK0y55pNylE--

--------------LrI1AHfmQ0lAH0MryBvkKpAg--

--------------wx3AHn0WTa5qsqnkrXSKebzo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqZfNsFAwAAAAAACgkQsN6d1ii/Ey+/
mQgAnhcgT5AdGD2K+ZlJFzGHzRZyyeQJ1B+JbBPp2eXjbZw07a+rN3jaGY/EtsyNfEkdzoc+zdgU
HFHORNUc7LXbyoIWYl6bEkG4xJUWABTceFtOrt7BkKL6EtPEMs7J/3e6u7Ww4NSDtvqh9YHtIOjl
QEoDnwzWnDEFHpToV4LQ4vdY4tKYacC7ZL/HGLAJ5Pznk8yyY4TjaeaqJ6BHy79rkOKQEIIdMv+p
6ECMfcoWnPzgC6NhA3dE0vl1OSPsXJ+rnn9gq/sFuW2MgspMVZyoc8BTf86SOwbFkG1xdp+xsTPE
tTOdi68Jm32Zve+lBlKGolyBx0MOrfFl+fM0/oJlEA==
=K1d8
-----END PGP SIGNATURE-----

--------------wx3AHn0WTa5qsqnkrXSKebzo--

