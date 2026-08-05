Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53FEC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 07:13:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382894.1626171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVol-0007dV-Eg; Wed, 05 Aug 2026 07:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382894.1626171; Wed, 05 Aug 2026 07:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVol-0007dO-Bu; Wed, 05 Aug 2026 07:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1382894;
 Wed, 05 Aug 2026 07:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrVok-0007dH-Gj
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 07:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrVoj-00H5sf-Hg
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:13:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a72e299-2eae-0a2a0a5409dd-0a2a4507bd98-8
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 09:13:33 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a72e29d-b4ea-0a2a45070019-d155d02db8e6-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 09:13:33 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-698ae09e356so788350a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 00:13:33 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a145c49044sm1419460a12.9.2026.08.05.00.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 00:13:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1785914013; x=1786518813; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=drHrC+qdqsi+PR/0lRsf/Ub+SUFkFlPx++QVFcFYlko=;
        b=DghiHlLh9toRgS1ioirUzAyrduOKQSQGfgEEjTdrPeuAXjqjvn/DmUKeadBWJGb+Yg
         yFbruMHZszkAHz1qAoVnrhVULJkUqT1UxqE7IfnQhS0Y4S85ddNYBdZyp1Ev1OW2c9td
         BFHQIXl0bemaS9UKxCw3DqzcPRQi4ru0jNMQOUf5u6R9/FCHu5Twkr1sEqja6eCzIECM
         Nt7yf1Ee3rs0mS1dpi3BznYsUwWnW7wPqTz6EJYcAxwoXe9g9D090hi3lPGVhJQLgTiU
         H4UN9xmHChpwOmHm0QFpYD4WkZb+0f176PI5Zm2xlwW/bRLlRf2ZFsPl8DPRRZ7LCOB3
         TS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785914013; x=1786518813;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drHrC+qdqsi+PR/0lRsf/Ub+SUFkFlPx++QVFcFYlko=;
        b=JESnQ44ZLGgwZ41/t9bzuNzUkFmD71eNY08gx+KxFS7BKrTGRW7e/imWGY/PDrU7Zx
         o2A2fvdfn4tbj1EtEzYjyEOYfvH0X0CG/Kli5ReTa0JK2wCd9prG5jIa9OZpzU6NeDQq
         Wl4YSeWiqQPOzAtteEqfcPg6ilZfMyMQNfX2j3nPbUS4ACJ61GV43UGox/Q+YFKgSwI2
         UOovGaULyKvogQwnwYqQQBAfEXNiW18D/sVnyKBKHym7Oi23A2P6i9ONSxKc3wTK5/L7
         2U6IyGn4lUs5emO0Qrf6F+Ht+MWpAyqh3KAN+1tkMa2P5imGAFP5+ocnaH8+2XWQNI0Z
         x1Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrWferFIRVN2GSNXxwNXY/xuZS6bM67NrwfNySOfbOCOZrxkiiwm3CRIR/BQhUXkTAbo189euteaVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrSuh2m+CnQTF8D5yFvVM/I0/jmB+0bMst8uRTDMDod9QdV7UI
	eycQDcJwCWb9bjNr+A6/kt1IFR3j1XxhhZCCibG3L/o9VlGWFfTXd+hvAt3nq94rM3g=
X-Gm-Gg: AR+sD12gJXUGVK8rgIuLonF0a1cFjEGga3TVUQUX9kUtFtkq715cdRFgjYscZ0DS3+w
	aCPmJHK0xrDmPmy10T/UG1xbGs1Q/6IuZwgDkU6j18FrAI8exjgorMtPsymNaame8OsB+B1f4b+
	rAWlGAu6BWB4wtndZAvL+a9E8zJ2oEX6ry37W8sh5bEG6s9H9H2tFv6Lp4AWg/Y565C+7RrOLfs
	mYXr14fW/qo+Swytb8BMqnV7kZbDrrjNKJ61Kiqsv3Dke3pTL0cE0+FFV7iJr3L0F80z/rdfVpa
	wjZhcSkMptNW3oYTb4V3xkGIzII273UIQ1Qa2Ot7SI9eVB8I9c0cvwyFo5aWIcV1ylokjD5RNGj
	nYMzhcKMH4MK7fFeZbpIB91gb67VqK8JnBPLZVWgP3Hz8eqUfboberGxUQTjmmXnXLG+z8Nyjrm
	lPy0RTx/g1CzflExrJ+dZfhU4o8lBQ/TF/ntD+dI0Greh7KGpL5VQaOXn4GJcDjSCOTSXXREfTW
	EzJz/nrob64A0PujWai31jBJNCIffg8ZR9B9tCPRo7GXKlkdgsnqXuwSEtk01faJfD7AlvNaDt3
	7eNigp4kThbi+ZGCcpTUPfJUVg==
X-Received: by 2002:a05:6402:1586:b0:6a0:a4be:6ed0 with SMTP id 4fb4d7f45d1cf-6a14f14c601mr2107256a12.17.1785914012808;
        Wed, 05 Aug 2026 00:13:32 -0700 (PDT)
Message-ID: <931b763d-2ee6-4fbf-9222-c5b75f35ec47@suse.com>
Date: Wed, 5 Aug 2026 09:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] 9p/xen: fix refcount leak in p9_xen_response() on wrong
 tag
To: Stefano Stabellini <sstabellini@kernel.org>,
 Yifei Gao <gyf161023@gmail.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, v9fs@lists.linux.dev,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260804213550.3409638-1-gyf161023@gmail.com>
 <ebcebd30-68e2-1650-f0e6-b69e4239619c@kernel.org>
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
In-Reply-To: <ebcebd30-68e2-1650-f0e6-b69e4239619c@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8si6pc96wSFhwkSY5O2H0kme"
X-purgate-ID: tlsNG-ef75cf/1785914013-35EC6AE4-85C07DC9/0/0
X-purgate-type: clean
X-purgate-size: 7753

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8si6pc96wSFhwkSY5O2H0kme
Content-Type: multipart/mixed; boundary="------------VvTq5HqiTdsegQZQBXC4lBJZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Yifei Gao <gyf161023@gmail.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, v9fs@lists.linux.dev,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <931b763d-2ee6-4fbf-9222-c5b75f35ec47@suse.com>
Subject: Re: [PATCH] 9p/xen: fix refcount leak in p9_xen_response() on wrong
 tag
References: <20260804213550.3409638-1-gyf161023@gmail.com>
 <ebcebd30-68e2-1650-f0e6-b69e4239619c@kernel.org>
In-Reply-To: <ebcebd30-68e2-1650-f0e6-b69e4239619c@kernel.org>

--------------VvTq5HqiTdsegQZQBXC4lBJZ
Content-Type: multipart/mixed; boundary="------------292XJsm8x0UioVDewQdpX8cO"

--------------292XJsm8x0UioVDewQdpX8cO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMDI6MDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVHVl
LCA0IEF1ZyAyMDI2LCBZaWZlaSBHYW8gd3JvdGU6DQo+PiBwOV94ZW5fcmVzcG9uc2UoKSBs
b29rcyB1cCB0aGUgcmVxdWVzdCBmb3IgYW4gaW5jb21pbmcgcmVwbHkgd2l0aA0KPj4gcDlf
dGFnX2xvb2t1cCgpLCB3aGljaCB0YWtlcyBhIHJlZmVyZW5jZSBvbiB0aGUgcmV0dXJuZWQg
cDlfcmVxX3QuIFdoZW4NCj4+IHRoZSB0YWcgZG9lcyBub3QgcmVzb2x2ZSB0byBhIHJlcXVl
c3QgaW4gUkVRX1NUQVRVU19TRU5ULCB0aGUgZnVuY3Rpb24NCj4+IHdhcm5zIGFuZCBjb250
aW51ZXMgdGhlIGxvb3Agd2l0aG91dCBkcm9wcGluZyB0aGF0IHJlZmVyZW5jZSwgcGVybWFu
ZW50bHkNCj4+IGxlYWtpbmcgdGhlIHA5X3JlcV90IGFuZCBpdHMgbXNpemUgYnVmZmVycy4g
VGhlIHJlcGx5IGhlYWRlciwgaW5jbHVkaW5nDQo+PiB0aGUgdGFnLCBpcyBzdXBwbGllZCBi
eSB0aGUgYmFja2VuZCwgc28gYSBtYWxpY2lvdXMgb3IgYnVnZ3kgOVAgYmFja2VuZA0KPj4g
Y2FuIGxlYWsga2VybmVsIG1lbW9yeSBvbiBldmVyeSBjcmFmdGVkIHJlc3BvbnNlLg0KPiAN
Cj4gTW9zdCBiYWNrZW5kIGFyZSB0cnVzdGVkLCBpbmNsdWRpbmcgdGhpcy4gU28gSSB3b3Vs
ZCBhdm9pZCAibWFsaWNpb3VzIi4NCg0KTm8sIEkgdGhpbmsgdGhpcyBpcyBmaW5lLg0KDQpF
c3BlY2lhbGx5IHdpdGggZHJpdmVyIGRvbWFpbnMgbWFsaWNpb3VzIGJhY2tlbmRzIGFyZSBh
IHRoaW5nLiBUaGV5IHNob3VsZA0Kb25seSBiZSBjYXBhYmxlIHRvIGRlbGl2ZXIgd3Jvbmcg
b3Igbm8gZGF0YSB0byB0aGUgZnJvbnRlbmQsIGJ1dCBpZGVhbGx5DQp0aGUgZnJvbnRlbmQg
c2hvdWxkIG5vdCB0cnVzdCB0aGUgYmFja2VuZC4NCg0KQW55IHdvcmsgdG93YXJkcyB0aGF0
IGdvYWwgaXMgdG8gYmUgc3VwcG9ydGVkIElNSE8sIGFuZCB0aGVyZSBhcmUgYWxyZWFkeQ0K
ZnJvbnRlbmRzIGxpc3RlZCBpbiBYZW4ncyBzdXBwb3J0IHN0YXRlbWVudCBmb2xsb3dpbmcg
dGhpcyBydWxlLCBzbyBhbnkNCnZpb2xhdGlvbiBvZiB0aGF0IHByaW5jaXBsZSBpbiB0aG9z
ZSBmcm9udGVuZHMgd2lsbCBiZSByZWdhcmRlZCB0byBiZSBhDQpzZWN1cml0eSBpc3N1ZSB3
b3J0aCBhbiBYU0EuDQoNCg0KSnVlcmdlbg0K
--------------292XJsm8x0UioVDewQdpX8cO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------292XJsm8x0UioVDewQdpX8cO--

--------------VvTq5HqiTdsegQZQBXC4lBJZ--

--------------8si6pc96wSFhwkSY5O2H0kme
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpy4pwFAwAAAAAACgkQsN6d1ii/Ey+H
KggAg6nytSOOYq8z0ItP8CPzGV2WeFi552GEXsho0t5VEJrJrI24Ujyyy954xFTbzaXtOHsU8fTJ
+URN3WaLFrA8LEz0IzTnDjNdR4sXwJT0QVuBlCzSo/XOKzQXR1xnZVk6rfS2rTy6v0caigYk2MlX
yYU3nUCUsR3IQJYAIY7E6PEM9MGAr9Xk6Vhv8iJHk2twCq5cXqfwSTQowOtgCI9T0HQufnz1wy7Q
cbxZfpclY4ahGtES2b/+saK8J54DPMFr2cwKJ5svBREmlL6o9YO7LWASnFdo9d7MEcP+mWXRq0hl
ZXBWLiXuEZW643jzUprYwwrrojFXqrubr9OIRM+3wA==
=DfBT
-----END PGP SIGNATURE-----

--------------8si6pc96wSFhwkSY5O2H0kme--

