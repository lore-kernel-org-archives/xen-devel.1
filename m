Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B42CC982CD
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 06:39:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423695.1648647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x75lt-0006jE-MA; Thu, 17 Sep 2026 06:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423695.1648647; Thu, 17 Sep 2026 06:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x75lt-0006j7-JF; Thu, 17 Sep 2026 06:39:01 +0000
Received: by outflank-mailman (input) for mailman id 1423695;
 Thu, 17 Sep 2026 06:39:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x75ls-0006j1-GK
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 06:39:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x75lr-0005me-PA
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 08:38:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aab8af7-2eae-0a2a0a5409dd-0a2a4503e78c-32
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 08:38:59 +0200
Received: from [74.125.225.91] (helo=mail-wr2-f27.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aab8b03-fae8-0a2a45030019-4a7de15b80be-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 08:38:59 +0200
Received: by mail-wr2-f27.google.com with SMTP id
 ffacd0b85a97d-4843796e373so249001f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 23:38:59 -0700 (PDT)
Received: from [10.59.1.64] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf3494dsm12056011f8f.28.2026.09.16.23.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 23:38:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1789627139; x=1790231939; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ktheWUwpwG5PoeERgvM5/E/d83cgmcpzEL2QKfm5nmo=;
        b=KBRrmDp1hq2R4QOqLno7JMiH6A6rhv2AVpGQIVpIVUuZYglUmQAncClGSIxGmnROMH
         LeXNkESDPE5XjtEZpjzibtJV5A5jASn6vEYMuLFM5OE1hzEZ4nFqji0SdRs6ge20fg0h
         Bu6PP8H1+zLJznVYvAwh1pFzy4zJOIxe1k32YTvq5h4VVfJMCRKdNfF7/e/n6vK48Prz
         hinN6KCRBnUULKcftN65p4qbNWQbq8MHE30J9eyAVYBezW+LVybOWMR0qc3EhP82NWO0
         7eOayTi8NWPf4xQQ9Vp0dI6L0zIT5SDOmO3H0MgJeAScfEfHrkM9Y85OC1d9DjRcKxIF
         3FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627139; x=1790231939;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktheWUwpwG5PoeERgvM5/E/d83cgmcpzEL2QKfm5nmo=;
        b=cpPGt+y1LRdnVDBbakRfLSgOXiIP8VmEaAtxQZenITZgnSFfj+XblTAk/BrusNhjR1
         bXIqEDKrVaATi6VAftO4tlwP6rU6o0pCk/tTShih7+x8lITBarg7xxrW345XTu4Hzinx
         g/jNLDlNV+tFNQzW8OyMWfd7DQyRtG9O3VIOxnbn4689t1osaacmlTAAP+8LxtaV1mZM
         HawHqViNrRuHMutouFhKtjRYaqkVOqxg7hTWv+/LHkENwq87ci2xOvmw7YUhdV1XGAhe
         JhQ4fJZh5LcdPhkYZgOCSuh8nDm7Sia1SWkZN7L21c/bQvD3zkCvFlY9XeJZxLNlry6n
         6fhw==
X-Forwarded-Encrypted: i=1; AKwUvBxG3Q3zbxFd5RGzrAmY3scaHpPEzMGaFxlYYax14f7GvuJ7ByRrlkUUAOjlAd8bJg+HAFqlrUzSwj8=@lists.xenproject.org
X-Gm-Message-State: AFuF++nUiUkN6g8TIpWkZxAMp7qXbs/GwN9MGJ4itEAhQEacKyJNoNrw
	/LF1hUzrNLwQCUKtvwMtL3AEhEGLnGXc3PSBewtVxhxV2x3Uq0mTBsQETrD3DSj1LOn3S3w5eeN
	1j2Ds
X-Gm-Gg: AYBFou2mYO/U5F0lpVtcBoXvZJBhz+snb7gE019TQJoKi5hxwIAhbrknOEknfNy2HdZ
	TnTJzPrIY/UeLO121O6nwc0TS5PB3yfNntSixTk103w//k1hbbi8T39qhhoHQc43s8yYce5a8xK
	XKTFNKnVg8nLbrBD2Atl6tzDkfii2RpHM2umEVu54rmTdH23A78YoqsnFBwG+aBIwcMCuzu5ctz
	c0edipT5hxozyUPT7ygEwbVJ6kpyS7G3aWpbUj5DUwoAtvHcZSHa8L4UsfmxrNXOz1ZfkUVkMhi
	Aswo8hhst29YeuovMZTZWrOgNG2MSxtPaWnUfp+FOCzc0X1ERZvkaQLNncU8q9nI805ecB4Yvdm
	SVS6nWchybKkwAiNVM4hSAYsQTCR4f6chojs1nr1dXeoziXsihokGWQJFo47plyPe5eo2UQ/SVo
	KYk0luNGC/v6W+z+kokoxxH6TzRMqhzpE0zHjkMDv9EZead07gpj4gUi9uI+rQf+Y=
X-Received: by 2002:a05:6000:2c06:b0:487:57a:a9bf with SMTP id ffacd0b85a97d-4870cf39f0fmr6745443f8f.18.1789627139036;
        Wed, 16 Sep 2026 23:38:59 -0700 (PDT)
Message-ID: <66290300-a861-4318-bb2c-e0c4cdcf3ab9@suse.com>
Date: Thu, 17 Sep 2026 08:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix comment typo in xen.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ruslan Vagner <rusya92266@gmail.com>, xen-devel@lists.xenproject.org
References: <CAF9RqJ439Cm0x9zzruXS5Dnz+5RgsAcJ0Q-gLQLpyTzWFF2ADw@mail.gmail.com>
 <ebbcd162-889d-4bfd-bb9a-fcdace9ee6ac@citrix.com>
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
In-Reply-To: <ebbcd162-889d-4bfd-bb9a-fcdace9ee6ac@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OToTj9qXtG023NoWepGW6A58"
X-purgate-ID: tlsNG-33051d/1789627139-752854E9-500C7532/35/110847
X-purgate-type: clean
X-purgate-size: 8469

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OToTj9qXtG023NoWepGW6A58
Content-Type: multipart/mixed; boundary="------------alx37pDTXRJQwtu0P3KUYAj6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ruslan Vagner <rusya92266@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <66290300-a861-4318-bb2c-e0c4cdcf3ab9@suse.com>
Subject: Re: [PATCH] xen: fix comment typo in xen.h
References: <CAF9RqJ439Cm0x9zzruXS5Dnz+5RgsAcJ0Q-gLQLpyTzWFF2ADw@mail.gmail.com>
 <ebbcd162-889d-4bfd-bb9a-fcdace9ee6ac@citrix.com>
In-Reply-To: <ebbcd162-889d-4bfd-bb9a-fcdace9ee6ac@citrix.com>

--------------alx37pDTXRJQwtu0P3KUYAj6
Content-Type: multipart/mixed; boundary="------------eDPzX0VN6fj0A0FCyeeHKgYo"

--------------eDPzX0VN6fj0A0FCyeeHKgYo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDkuMjYgMTQ6MDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE1LzA5LzIw
MjYgMjo1NiBwbSwgUnVzbGFuIFZhZ25lciB3cm90ZToNCj4+IEZpeCB0aGUgc3BlbGxpbmcg
aW4gY29tbWVudHMuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFJ1c2xhbiBWYWduZXIgPHJ1c3lhOTIyNjZAZ21haWwuY29tPg0KPj4gLS0tDQo+PiAg
IGluY2x1ZGUveGVuL2ludGVyZmFjZS94ZW4uaCB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUveGVuL2ludGVyZmFjZS94ZW4uaCBiL2luY2x1ZGUveGVuL2ludGVyZmFjZS94
ZW4uaA0KPj4gaW5kZXggNDBjOTc5M2U5ODgwLi5mOWFjYjIxODc1Y2YgMTAwNjQ0DQo+PiAt
LS0gYS9pbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVuLmgNCj4+ICsrKyBiL2luY2x1ZGUveGVu
L2ludGVyZmFjZS94ZW4uaA0KPj4gQEAgLTk0LDcgKzk0LDcgQEANCj4+ICAgI2RlZmluZSBW
SVJRX1hFTk9QUk9GICAgNyAgLyogVi4gWGVuT3Byb2ZpbGUgaW50ZXJydXB0OiBuZXcgc2Ft
cGxlIGF2YWlsYWJsZSAqLw0KPj4gICAjZGVmaW5lIFZJUlFfQ09OX1JJTkcgICA4ICAvKiBH
LiAoRE9NMCkgQnl0ZXMgcmVjZWl2ZWQgb24gY29uc29sZSAgICAgICAgICAgICovDQo+PiAg
ICNkZWZpbmUgVklSUV9QQ1BVX1NUQVRFIDkgIC8qIEcuIChET00wKSBQQ1BVIHN0YXRlIGNo
YW5nZWQgICAgICAgICAgICAgICAgICAgKi8NCj4+IC0jZGVmaW5lIFZJUlFfTUVNX0VWRU5U
ICAxMCAvKiBHLiAoRE9NMCkgQSBtZW1vcnkgZXZlbnQgaGFzIG9jY3VyZWQgICAgICAgICAg
ICovDQo+PiArI2RlZmluZSBWSVJRX01FTV9FVkVOVCAgMTAgLyogRy4gKERPTTApIEEgbWVt
b3J5IGV2ZW50IGhhcyBvY2N1cnJlZA0KPj4gICAgICAgICAgKi8NCj4+ICAgI2RlZmluZSBW
SVJRX1hDX1JFU0VSVkVEIDExIC8qIEcuIFJlc2VydmVkIGZvciBYZW5DbGllbnQgICAgICAg
ICAgICAgICAgICAgICAqLw0KPj4gICAjZGVmaW5lIFZJUlFfRU5PTUVNICAgICAxMiAvKiBH
LiAoRE9NMCkgTG93IG9uIGhlYXAgbWVtb3J5ICAgICAgICovDQo+PiAgICNkZWZpbmUgVklS
UV9YRU5QTVUgICAgIDEzICAvKiBQTUMgaW50ZXJydXB0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKi8NCj4gDQo+IFRoZSBjaGFuZ2UgaXMgZmluZSwgYnV0IHRoZSBlbWFp
bCBpcyB3aGl0ZXNwYWNlIGNvcnJ1cHRlZCwgd2l0aCB0aGUNCj4gY2xvc2luZyAqLyBtb3Zl
ZCBvbnRvIHRoZSBuZXh0IGxpbmUuDQo+IA0KPiBJIGNhbiBmaXggdGhpcyB1cCBvbiBjb21t
aXQsIGJ1dCB5b3Ugd2lsbCB3YW50IHRvIGRvdWJsZSBjaGVjayB5b3VyDQo+IGVtYWlsIGNv
bmZpZ3VyYXRpb24gYmVmb3JlIHNlbmRpbmcgZnVydGhlciBwYXRjaGVzLg0KPiANCj4gQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkFu
ZHJldywgeW91IGFyZSBhd2FyZSB0aGF0IHRoaXMgaXMgYSBMaW51eCBrZXJuZWwgcGF0Y2g/
DQoNCmp1c3Qgc2F5aW5nLi4uDQoNClJ1c2xhbiwgeW91IHNob3VsZCBzZW5kIGtlcm5lbCBw
YXRjaGVzIHdpdGggdGhlIHJlbGF0ZWQgbWFpbnRhaW5lciAoaW4gdGhpcyBjYXNlDQptZSkg
YWRkZWQgYXMgQ2M6DQoNCkFzIHRoaXMgaGVhZGVyIGZpbGUgaXMgYSBzbGlnaHRseSBtb2Rp
ZmllZCBjb3B5IG9mIHRoZSByZWxhdGVkIGhlYWRlciBvZiB0aGUgWGVuDQpoeXBlcnZpc29y
IHByb2plY3QsIGEgc2ltaWxhciBwYXRjaCBtaWdodCBiZSB3YW50ZWQgZm9yIFhlbiwgdG9v
Lg0KDQpUaGF0IHNhaWQsDQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------eDPzX0VN6fj0A0FCyeeHKgYo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------eDPzX0VN6fj0A0FCyeeHKgYo--

--------------alx37pDTXRJQwtu0P3KUYAj6--

--------------OToTj9qXtG023NoWepGW6A58
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqriwIFAwAAAAAACgkQsN6d1ii/Ey80
VQf/f+ZKtYheFgiw/rKJrq4AtX5D8wuwEAlT2u/0TF/zxhx42vaAAkmMYN9R8tq5AyQE9UHtBvcc
CLMiyi5uK2D62+BZougYIx/mhdaY4QTWHZsEeKR7OY7SR2HoaLzJuZfzHYvUnY2D1aHQMmwLGgqL
ERTIyuHgqAFPr2KPns9EVyyfmV3Ou5v9FiJ6AnNOmJ2qsOMmv1JyU1G/pqnTSKk3GvkVDPfH00uT
KSnccT61Te3TpONyDyKtskJGIss+hbIebdTz8rifeEwnZICAlsAoPJEDgKDeMru5Ld0C4AsHPfo+
Bi9iaBuX/MbMAXVoVv2mirQLcsC7EflwcQNsvy8Klg==
=Zjnm
-----END PGP SIGNATURE-----

--------------OToTj9qXtG023NoWepGW6A58--

