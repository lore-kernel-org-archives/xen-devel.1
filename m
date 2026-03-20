Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D971093179
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2026 06:36:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257799.1552070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3TTE-0000vC-QQ; Fri, 20 Mar 2026 06:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257799.1552070; Fri, 20 Mar 2026 06:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3TTE-0000v5-Mi; Fri, 20 Mar 2026 06:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1257799;
 Fri, 20 Mar 2026 06:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3TTC-0000uz-M6
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 06:36:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 205f2764-2427-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 07:36:29 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43a03cb1df9so1638154f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 23:36:29 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647120a1sm4074734f8f.30.2026.03.19.23.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 23:36:28 -0700 (PDT)
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
X-Inumbo-ID: 205f2764-2427-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773988588; x=1774593388; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tDsn7xJiPo4F4BtGGiAC/1EF3c7WImme0YET/Qtmb/o=;
        b=AI7r1lDwF7G2gRZUcy1noq6jzpc3cgZHko3ESkL3wwi1Wx0r38OHGlMQGbt2H/cavm
         eetnGYpHym0NBI/aIZhKeEVgSM5xhW3dkw8v3xwzeEXzlSZJzJYgbigFbM5lez2Ds6+s
         Nw6qmAWI8RuFeY6pYrjL0U9EmLe8o0vCWD7hmOYzoCDMzfJNDS80VkdCxziwwtflqKYK
         meKzBaYQlar3hP/CArJCJb08yyul3a5iyyziWr85xO171+ggfbsLkuzSqQOAItEt+iBH
         MBaA3W2VM6OjiYP63n1EvTS9BE874+LFYGasbgV4cpe2OBFIRWl0QS2tiUGi4Fo06kaz
         qy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773988588; x=1774593388;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDsn7xJiPo4F4BtGGiAC/1EF3c7WImme0YET/Qtmb/o=;
        b=asMvzGZcdV/Bm3bQ5xr4jzn39x0yZI1NmFKEgGi/++XHFhWSm+sxQJgP52StzEUdpL
         cXL/KVmxLAFsh/eQlOHZv1iGuIznIWkBch0rBiKOpCVPxsm6PeNsfBlmt35myBIfNzNK
         QmYiTH09eBPZut0LC+tKlUIcGd9NO2dJuus/KkiNEmK9knqgt3LpP4QNxrwEYPSFNZL0
         Y+/s9kgqduSzSGeMXGkA+lc2U7hHQWfI79VIyoxhXCvBwpHehjNrJG+rPuGfPuEA5iyU
         084kNAkeeGUk06xmd/kyeiI/9CEdEhE+lGwK/GOx0eMH7b+7/P+WiyTW08VUpkUeqWe1
         +L3w==
X-Gm-Message-State: AOJu0YzsXFCETyJsCWjy3nP0NHBR0ihk/nnmdb3a95RZeTM1Cd5UT16e
	R4hm/iwubDPqCnZ1D20dHrJ4382OLceEfXQY7NKNGoC6NRRGSDpL1p/bgsrl7XX4GmtI84eJUbN
	qHYAUSvs=
X-Gm-Gg: ATEYQzyLlsAYKYULayyJau3JrT3kJDnKm8QJ236kKC6XVC/m0iyCZZiDQWc+av5WKG4
	KKwaPoR2BjrEgh6lKTDrT/nM/JXCc8yi9MmlkM+Anw8bkd86dYhe/8aYEQytGO4gtr9noWvNPP4
	5C1ZDY/w2kdZ7HYCu+sfKr95eVr0MW4Nbk6/tqlleII+dys6f83a3u1CaQqHdQi4gybbZODFX4/
	vw/+omqA7xzzwRpYSuBCwXIvU+8+VlSzizFkvg3ffW5BJ/HcCj1WHS3Df/tXPwOpBrW0XLCJaZn
	i++A6AvoucpXUwa7lL0YzHh6Slj8nYt90PaIbWoE/Pn7Ci/rX73x42P5k8iKyCwPPwVYxV+ePhK
	Fbq4R9yaQ0qCKFPS8Yg/H7ajjDH82T9iEjeKdr7KGhfkoOCZEjBUyR6uROb3JQJ0Zzkfy71rgIz
	HNSA72+kdruu9iku+Yu4xiUi+5dmoG4p/zGoZbN99CrppKf3s2S3jOrSfN3yFCmRsvi2hG4Gnw1
	UjZzt4cQ4MXqjJg4zLpHs5xvEDNbKN0LDiaWCg+pYDiWNOKByEwwQ==
X-Received: by 2002:a05:6000:26c8:b0:437:75c1:5777 with SMTP id ffacd0b85a97d-43b64240095mr3042651f8f.16.1773988588455;
        Thu, 19 Mar 2026 23:36:28 -0700 (PDT)
Message-ID: <c44cca31-a45c-4bb2-a671-edffb1f93d3c@suse.com>
Date: Fri, 20 Mar 2026 07:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] tools/xenstored: implement the GET/SET_QUOTA
 commands
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-8-jgross@suse.com> <abgc1Azehzw_m9Ff@l14>
 <b0c02185-1ce0-416f-8bff-34b57de57e8f@suse.com> <abwog6TisFL9ZfeC@l14>
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
In-Reply-To: <abwog6TisFL9ZfeC@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rO1g9gkF50netA8tvUGtNy9m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rO1g9gkF50netA8tvUGtNy9m
Content-Type: multipart/mixed; boundary="------------cr374cSLXdQai08R5QOmU5oy";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <c44cca31-a45c-4bb2-a671-edffb1f93d3c@suse.com>
Subject: Re: [PATCH 07/11] tools/xenstored: implement the GET/SET_QUOTA
 commands
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-8-jgross@suse.com> <abgc1Azehzw_m9Ff@l14>
 <b0c02185-1ce0-416f-8bff-34b57de57e8f@suse.com> <abwog6TisFL9ZfeC@l14>
In-Reply-To: <abwog6TisFL9ZfeC@l14>

--------------cr374cSLXdQai08R5QOmU5oy
Content-Type: multipart/mixed; boundary="------------uvNNrT9vLBoWP9wEJIQwyX0G"

--------------uvNNrT9vLBoWP9wEJIQwyX0G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMTc6NDcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBNb24sIE1h
ciAxNiwgMjAyNiBhdCAwNDoyNzo0M1BNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMTYuMDMuMjYgMTY6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIFRo
dSwgTWFyIDA1LCAyMDI2IGF0IDAyOjUyOjA0UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+ICsJCWlmIChuX3BhcnMgPT0gMSkgew0KPj4+PiArCQkJcXVvdGEgPSBxdW90
YXM7DQo+Pj4+ICsJCQluYW1lID0gdmVjWzBdOw0KPj4+PiArCQl9IGVsc2Ugew0KPj4+PiAr
CQkJZG9taWQgPSBhdG9pKHZlY1swXSk7DQo+Pj4NCj4+PiBTaGFsbCB3ZSBjaGVjayB0aGF0
IHZlY1swXSBhY3R1YWxseSBjb250YWluIGEgcGxhdXNpYmxlIGRvbWlkPyAoQW4NCj4+PiBp
bnRlZ2VyIGJldHdlZW4gMC4uNjU1MzUpLiBSaWdodCBub3csIHRoaXMgYWNjZXB0IGV2ZXJ5
dGhpbmcsIGFuZCB3b3VsZA0KPj4+IHJldHVybiAwIGlmIHRoZXJlJ3Mgbm90IGEgc2luZ2xl
IGRpZ2l0Lg0KPj4NCj4+IEkgaGF2ZSBmb2xsb3dlZCB0aGUgcGF0dGVybiB1c2VkIGluIG90
aGVyIHBsYWNlcyB3aGVyZSBhIGRvbWlkIGlzIGV4cGVjdGVkLg0KPj4NCj4+IEluIHRoZSBl
bmQgbm90aGluZyB3aWxsIHJlYWxseSBicmVhay4NCj4gDQo+IE9uIHRoZSBkYWVtb24sIG5v
LCBub3QgcmVhbGx5Lg0KPiANCj4+IEFueSBpbnRlZ2VyIG5vdCBiZWluZyBhIGRvbWlkIHdp
bGwgcmVzdWx0IGluIEVOT0VOVCwgd2hpbGUgdGhlIGNhc2Ugb2Ygbm90DQo+PiBhIGRpZ2l0
IGlzIGEgYnVnIGluIHByaXZpbGVnZWQgc29mdHdhcmUgKGRvbWlkcyBjYW4gYmUgc3BlY2lm
aWVkIGJ5IGRvbTANCj4+IG9ubHkpLg0KPiANCj4gSXQgd291bGQgYmUgYSBidWcsIGluZGVl
ZCwgYnV0IHhlbnN0b3JlZCBjYW4gaGVscCB0ZWxsaW5nIGV4YWN0bHkgd2hlcmUNCj4gdGhl
cmUncyBhIGJ1ZywgaW5zdGVhZCBvZiBpZ25vcmluZyBpdCBhbmQgY2Fycnktb24uIFdlbGws
IGp1c3QgcmV0dXJuDQo+IEVJTlZBTCB3aGVuIHNvbWV0aGluZyBvdGhlciB0aGFuIGEgbnVt
YmVyIGlzIGZvdW5kLiBZb3UgZG8gdGhhdCBmb3INCj4gcXVvdGEsIHdoeSBub3QgZm9yIGRv
bWlkIGFzIHdlbGw/DQo+IA0KPiBUaGF0IGNhbiBhbHNvIGhlbHAgd2hlbiB0aGUgZGFlbW9u
IGlzIHJlcGxhY2UgYnkgYSBkaWZmZXJlbnQNCj4gaW1wbGVtZW50YXRpb24gdGhhdCBhY3R1
YWxseSBkbyB0aGUgY2hlY2tzLiAod2VsbCBpdCB3b3VsZCBoZWxwIGZpbmRpbmcNCj4gYnVn
IGluIHRoZSBjbGllbnQgZWFybGllcikNCg0KSSBoYXZlIGFkZGVkIGFub3RoZXIgcGF0Y2gg
aW50cm9kdWNpbmcgYSBkb21pZCBwYXJzZXIgYW5kIHVzaW5nIGl0IHdoZXJlDQpuZWVkZWQu
DQoNCg0KSnVlcmdlbg0K
--------------uvNNrT9vLBoWP9wEJIQwyX0G
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------uvNNrT9vLBoWP9wEJIQwyX0G--

--------------cr374cSLXdQai08R5QOmU5oy--

--------------rO1g9gkF50netA8tvUGtNy9m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm86usFAwAAAAAACgkQsN6d1ii/Ey/x
mAf8CsVstjU3DA6rHWRaUgMizlQ302iN/pOS7ObaVQgiXUT9bAYc8x0yygUsMAV3ZkL3E4tprzK6
MtNf9Wsgkm3bUd6rITxvzmhq2LEXZgk8M2h/u7l0awqp7+SVoO8MsdHnFfyDOkbvdIQUKaifaUGR
bfBjdOkEAxqBv6ThOwtVCn9l4lJhSRCsv0BfxUUYpNDVL+b0t/DsOnoLqXmYV91uQytEG234+a4y
b8U08vLR4z/nXUb6e3x+hsKmcHHMpZ8XBXU4xc6I35XkjExonsULaBMpuzbj/ihFaPX/0boJVPH4
z4Or2D6oMJS92dcc+NOAY7bjRwxFMyFOrVDe22gUMA==
=p3wM
-----END PGP SIGNATURE-----

--------------rO1g9gkF50netA8tvUGtNy9m--

