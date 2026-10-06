Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B799DCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 13:56:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441517.1659116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE5eN-0000hH-Ks; Tue, 06 Oct 2026 13:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441517.1659116; Tue, 06 Oct 2026 13:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE5eN-0000h9-He; Tue, 06 Oct 2026 13:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1441517;
 Tue, 06 Oct 2026 13:56:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xE5eL-0000h0-L1
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:56:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE5eK-009Xw4-Tl
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:56:08 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ac4fdf1-bab6-0a2a0a5309dd-0a2a4506c594-36
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 15:56:08 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ac4fdf8-195a-0a2a45060019-d1558036c82d-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 15:56:08 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4956869750eso5337895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 06:56:08 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17a0fc2e4sm68582055e9.3.2026.10.06.06.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 06:56:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1791294967; x=1791899767; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Dhuh/wtI0yX/Les8bDjamHrz/rhROiQMQkvk8Zx65o=;
        b=JIvSpl0O3CgdnS6stNsvCaYBrDY2D8fUXS5gpZGCHxT0cniaiGs8fTGZ4GA+RMldAx
         vPkzyCw1worWx2ydUFM4OPB0pdYVXFLj9J6hoFR7ADAWo9BusdT+cWUJYHPmtr/4GVj7
         FAh4YcNvgVq53Hms94clWq/SY19OubZ/i+fkVRMxkvQGIxiSoiD3jfHff97/HgQOhMeR
         1+PHPuxiTyMiK/oMkFQlm1TjdQDk7aOdGSUmMs/6KC4Ya6D9EJuqhtslLTF09OTxTkqT
         foC5ip5M92sbqO4NsXAizUJ17Hpnp7/cj4zGfRRAi1AYXusDW+vnWu1Olnn1KNv1Bxet
         HYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294967; x=1791899767;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dhuh/wtI0yX/Les8bDjamHrz/rhROiQMQkvk8Zx65o=;
        b=k16PHBwYMbZwVfCkKaqQGYqs6Q2kUmJAFZvAyiKf7aoteQOT0SFXdJzjbQgXsm/qM7
         rGkywQWDtvuTdEazDK0yKgoMWPNGCBoJarNML3FxbxirwNuILk4y9ocPNXck0IJGNJnR
         J9t34EaSH/sC89rXhjc2K1Tli7PC+rbHOQwgylPqB6ZQUqGpJn561Iwo9rm0SEWuzfPs
         pngxvYn4unmnZ40uX0EU7B0A2m4ttqxb/vkJHyWOLFNP2Op6LPJPTnVYbXL529A2q5HR
         f4iceLaXuzccS22ohWJ/spjMKrRN7y1tsOoJi8S0QLIZpSBLHQbbElN5JpoO0RZtXoVD
         Cp/A==
X-Forwarded-Encrypted: i=1; AKwUvBwv7/5BbpVvRJqeVQhjbO07jr8j8Uq7qKXViA60814yg6+OkHsPbzpphMp0MylNHWxVEyCpQMa7txY=@lists.xenproject.org
X-Gm-Message-State: AFuF++m2ICzqU/amDt28AMKQAusBOgW9eN4zIWkZ4qu8gN4DZBTO8eHf
	gPvMRtDXG6EekHIRYWWlbPRHgc5QbYLEo/S3UaucLdlePXf0zme4LFRXueg3wn16rCc=
X-Gm-Gg: AYBFou1CI44MJj1O4o9Wo8jvthY7R5Z8bNUqtAatER5+DYzrW/LtFuXwg3rGTHJEWOY
	OrbC+qucN7ZV+Y9QDw/m4yAgmN4Zq89VM0S0Vcl79DAh0IYM6rlwaySt6of2oeYEDdxRNsjpUl/
	qP2pgO4y2itlKIZRHGzux4t52joJXB70ZrmZPqBoqng1u9fdgzPWhzqZKzKytL2yprYLFEJtVnM
	s4O1g8F3P3h3GxoldbqUN7UOGOb2NorTo/vyfgcepCLQG5gW3/K+exfq7jpYNhkDPQWlelWbRnV
	ctX/to+RsA9jGjMH1iX41tMVWZ6zFzEsEKTP+xCjfOVB4LCM2Zhi2WKcS3WkI3qro0I9HBWqp4d
	HMPAlgbEyM/WFb3qQM3z2Fpp6LbSkczDsK2B9TPYEmbpT6Blcq5LjZgx1W1G/g/lvVHScnYBBPe
	J+ZpzTEhdR8OfWMLbToib4qIyNOwhCTvjOkleiyHH1fchUvTd3ANLqhXtyMPjCRDk9qu+Qqtx98
	iNGrCv1x8O7tHtBG1CLrsxLsegXUKUYrBX3iy2B2TbEtjtoywwAnZGDDY3/5Zesm7u6XXurXd5H
	zLqmX2AegmILDgVGkohQyCPQ
X-Received: by 2002:a05:600c:5492:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a17b4f297bmr27971755e9.3.1791294967343;
        Tue, 06 Oct 2026 06:56:07 -0700 (PDT)
Message-ID: <f073f438-7335-4d9f-9bba-c6df5ee1fa40@suse.com>
Date: Tue, 6 Oct 2026 15:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/scsifront: check for a NULL shadow entry on a backend
 response
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>
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
In-Reply-To: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nnH7S5YuLqUH0yIqtmqXntAT"
X-purgate-ID: tlsNG-16d1c6/1791294968-1F2C677B-772602FC/35/110847
X-purgate-type: clean
X-purgate-size: 7844

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nnH7S5YuLqUH0yIqtmqXntAT
Content-Type: multipart/mixed; boundary="------------0I6v6BijZSEvEjvGrfeccWKG";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Message-ID: <f073f438-7335-4d9f-9bba-c6df5ee1fa40@suse.com>
Subject: Re: [PATCH] xen/scsifront: check for a NULL shadow entry on a backend
 response
References: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>
In-Reply-To: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>

--------------0I6v6BijZSEvEjvGrfeccWKG
Content-Type: multipart/mixed; boundary="------------HscB0pQhO6alWtKX55NS0MMB"

--------------HscB0pQhO6alWtKX55NS0MMB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjYgMTQ6MzUsIFllaHllb25nIExlZSB3cm90ZToNCj4gc2NzaWZyb250X2Rv
X3Jlc3BvbnNlKCkgdmFsaWRhdGVzIHRoZSBycWlkIGluIGEgYmFja2VuZCByZXNwb25zZSBh
Z2FpbnN0DQo+IFZTQ1NJSUZfTUFYX1JFUVMgYmVmb3JlIHVzaW5nIGl0IHRvIGluZGV4IGlu
Zm8tPnNoYWRvd1tdLCBidXQgdGhlbg0KPiBkZXJlZmVyZW5jZXMgdGhlIGVudHJ5IHRvIHRl
c3QgLT5pbmZsaWdodCB3aXRob3V0IGNoZWNraW5nIHRoYXQgdGhlIHNsb3QNCj4gaXMgcG9w
dWxhdGVkLiAgU2hhZG93IHNsb3RzIGFyZSBOVUxMIGJlZm9yZSBhIGNvbW1hbmQgaXMgc3Vi
bWl0dGVkICh0aGUNCj4gaG9zdCBwcml2YXRlIGFyZWEgaXMgemVyb2VkIGF0IGFsbG9jYXRp
b24pIGFuZCBhcmUgcmVzZXQgdG8gTlVMTCBpbg0KPiBfc2NzaWZyb250X3B1dF9ycWlkKCkg
b25jZSBhIHJlcXVlc3QgY29tcGxldGVzLCBzbyBhbiBpbi1yYW5nZSBycWlkIHRoYXQNCj4g
ZG9lcyBub3QgY29ycmVzcG9uZCB0byBhbiBvdXRzdGFuZGluZyByZXF1ZXN0IG1ha2VzIHRo
ZSBmcm9udGVuZA0KPiBkZXJlZmVyZW5jZSBhIE5VTEwgcG9pbnRlci4NCj4gDQo+IEEgbWFs
aWNpb3VzIG9yIGJ1Z2d5IGJhY2tlbmQgY2FuIHRodXMgY3Jhc2ggdGhlIGd1ZXN0IGJ5IHJl
dHVybmluZyBhDQo+IHJlc3BvbnNlIHdob3NlIHJxaWQgaXMgaW4gcmFuZ2UgYnV0IG5vdCBp
biBmbGlnaHQgLS0gZm9yIGV4YW1wbGUgYQ0KPiBzcHVyaW91cyByZXNwb25zZSBiZWZvcmUg
YW55IGNvbW1hbmQgaGFzIGJlZW4gaXNzdWVkLCBvciBhIGR1cGxpY2F0ZSBvZg0KPiBvbmUg
YWxyZWFkeSBjb21wbGV0ZWQuICBUaGUgcmluZyBoYXMgb25seSBWU0NTSUlGX01BWF9SRVFT
ICgxNikgc2xvdHMsIHNvDQo+IGJlZm9yZSB0aGUgZmlyc3QgY29tbWFuZCBldmVyeSBpbi1y
YW5nZSBycWlkIHNlbGVjdHMgYSBOVUxMIHNsb3QuDQo+IA0KPiBSZWplY3QgYSByZXNwb25z
ZSB3aG9zZSBzaGFkb3cgc2xvdCBpcyBub3QgcG9wdWxhdGVkLg0KPiANCj4gRml4ZXM6IDZk
MWMyZjQ4ZjNmYyAoInhlbi9zY3NpZnJvbnQ6IGhhcmRlbiBkcml2ZXIgYWdhaW5zdCBtYWxp
Y2lvdXMgYmFja2VuZCIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25l
ZC1vZmYtYnk6IFllaHllb25nIExlZSA8eWhsZWVAaXNzbGFiLmtvcmVhLmFjLmtyPg0KDQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJn
ZW4NCg==
--------------HscB0pQhO6alWtKX55NS0MMB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HscB0pQhO6alWtKX55NS0MMB--

--------------0I6v6BijZSEvEjvGrfeccWKG--

--------------nnH7S5YuLqUH0yIqtmqXntAT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrE/fYFAwAAAAAACgkQsN6d1ii/Ey8M
DQgAn67Our2fo1bMCOV5O+3w37AmRu4L3TTxvToURAAHydJz7TJ3hqBD5FlZhLmX6LdxqaLWYwMO
MS3mwgAUtulFRhkwVDuMs63dXLlRNgw0m9426pAPQ3lMva/tjoFsdST2KP0LXwIFspRvsX4dCVHy
DlCGLpEeC40ybm7reCHJJBQshsVra+9Jxyer73TGy0vJgVs6qnrjQ1VnzbufezWmAK3Ovzy3Tj3v
egMCT2rqTVWsBqXH+2GdbtR+XttYuxwnsYTnDSw5XMMAKECUC9ULqx+K3/Gexxl0lZFNCp9gG8vu
xUl/Xqi6SXmtsnr03S4XoWbeHAnhlFgFiBiPkKcNlg==
=UJPI
-----END PGP SIGNATURE-----

--------------nnH7S5YuLqUH0yIqtmqXntAT--

