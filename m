Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828C8CD98CF
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 15:15:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338382.1599410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ91Y-0000Ny-4Y; Mon, 15 Jun 2026 15:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338382.1599410; Mon, 15 Jun 2026 15:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ91Y-0000Nr-1z; Mon, 15 Jun 2026 15:14:52 +0000
Received: by outflank-mailman (input) for mailman id 1338382;
 Mon, 15 Jun 2026 15:14:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wZ91W-0000Nh-Nf
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:14:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ91W-006yOr-4X
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:14:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3016c7-e002-0a2a0a5209dd-0a2a45038fe6-30
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:14:49 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a3016e9-672d-0a2a45030019-d155d02fc823-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:14:49 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6913160c9ddso6458677a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:14:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-693c43a6d9csm3070699a12.13.2026.06.15.08.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 08:14:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781536489; x=1782141289; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B3sS3PLpEox/I90orKXtXi+fuwEPT4sqQMjXEhQJhEA=;
        b=ZOW37VQJjAJv0SNKLPs8WcCBVSAL5dz8FEknq1v3tEezqN/KzoIUHEpxx9iJthpi7U
         CjNbF97BEmXYwhXrodG8evZb+b66ip5SV6elfOtLCi7kGtbrL8xiaFENluNY0uJAaruj
         aR1eTOMT3WAZBeD6UA0JJzfvOETbDG3VYlI+5GDkTdH5UWQytHazwyX/UyAvaerftFW7
         3jm8gRXn0tLJeDde7JSMWKnvWYo7ffOZCSjk1V+svDlx+gVidLmsVStx5ApnA9OladyU
         Im3HXhK680PARaCdcNbVmgxiYgYYhTBFjg1D2wAdKbkgLjq31XiXehF6Ss7rtgbxN+Gg
         sI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536489; x=1782141289;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3sS3PLpEox/I90orKXtXi+fuwEPT4sqQMjXEhQJhEA=;
        b=JRdWQbufvLLUL/UwFje72pNGrxmQ30AyoE87fOZ/yFOhhmh2vyqwDRlwskH7Nx46CP
         9waNoiKq88NBD+JkVPAMmxx7LYdixhgJYMM8WiSohBTCgfPT1OT5tzvRda6sfGUGg1xs
         6ANm4gdYQ3O9Fd/F3E/op97pxhf5CwUiDOc7rZPBn8GRjbd783aDUuSITEk1f6Kmy/HF
         9R9au2lyezeDN8eaWj9gGqzJifiCTtOW9qWZNS9E3yv1Jv4uz+tOG5puwM9QjxVULga+
         xHdqO4h/qoU2l8xxE9pSqlndfDjK2W/T7WdV2zwltHhkQh45Jcn/A9h++ZKpZRBqqOkx
         Mteg==
X-Gm-Message-State: AOJu0Yxk+m7YBbn803S3QnZ4IRknxV775vv88sSa1a4iVztjKDMdBMvS
	F67SFXBltOz6t1/15U3vjQqIBsYUD2GX+iBITFdHtsHNJ5oEOhBbmLHLGghvMefAwHo=
X-Gm-Gg: Acq92OFhJG9jFUtqb0NjZR5yTL4gd4RfLsOfBr+GdycxKsA5F1cUcL1fOEoSXwy9VgR
	dG4FRId7FdlE+tdjBKwoJ6JtI2V0xwN4FgBfpTAjKjdocChnrGlUFUsE2D2lWDp3Wi+tZQ8bzMN
	v6uGcawTBYOGWAUEBFvl22O42NNp+Hoiltgjq1fKlKtwm8hCC6WX6yViILXjRBJFo6OmM+8sgwh
	KJ5zhkTMpo2Oc/WHB/6UmUreLa6JNf1/xY7SyvbMnnlS9fAiH2uDHVjhucx0jNmbbQ/we6JlOhd
	UhN3Mm+fASK2dyxjuQOcB+ShO1fb5O/yqEnOJS8W/2xcLtvPdYT5BfgToKGTg87V2CaTlkvCgqe
	cTP/Yj4/DsEozqkAGHfZlWoFdIDPFrPJMTQ7YWhf8z24nzL39KjoqpLjCw/avAjf8DYbt4LQCUL
	e9F24iYTiRumqUxsGintpl/eAbDJfAOuqYyZ8NrYPPlHYgm6Uq2zYixckb4U3quw3cE1yJcIwfz
	GpTFXCQ7/W+hTSTdGmPaSsnZpv5/GO4r8GBx8tm9znNmkeb2kxMNQ==
X-Received: by 2002:a05:6402:3588:b0:68f:cc95:ba5b with SMTP id 4fb4d7f45d1cf-693c6a8cf7cmr5170579a12.27.1781536489059;
        Mon, 15 Jun 2026 08:14:49 -0700 (PDT)
Message-ID: <a2c4253b-99ed-4dab-9f2b-1906f958522b@suse.com>
Date: Mon, 15 Jun 2026 17:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/scsiback: free the command tag on the TMR
 submit-failure path
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
 <20260611123046.2323342-3-michael.bommarito@gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <20260611123046.2323342-3-michael.bommarito@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------30fN0dc4b3OHkvjxlNkt3JWf"
X-purgate-ID: tlsNG-33051d/1781536489-42965938-194704F2/0/0
X-purgate-type: clean
X-purgate-size: 7854

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------30fN0dc4b3OHkvjxlNkt3JWf
Content-Type: multipart/mixed; boundary="------------JnwtXeAGP8AktzTMtTeWLuja";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <a2c4253b-99ed-4dab-9f2b-1906f958522b@suse.com>
Subject: Re: [PATCH 2/2] xen/scsiback: free the command tag on the TMR
 submit-failure path
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
 <20260611123046.2323342-3-michael.bommarito@gmail.com>
In-Reply-To: <20260611123046.2323342-3-michael.bommarito@gmail.com>

--------------JnwtXeAGP8AktzTMtTeWLuja
Content-Type: multipart/mixed; boundary="------------Lx4hjADfd9WcEZaF3yim000E"

--------------Lx4hjADfd9WcEZaF3yim000E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDYuMjYgMTQ6MzAsIE1pY2hhZWwgQm9tbWFyaXRvIHdyb3RlOg0KPiBzY3NpYmFj
a19kZXZpY2VfYWN0aW9uKCkgb2J0YWlucyBhIGNvbW1hbmQgdGFnIGluDQo+IHNjc2liYWNr
X2dldF9wZW5kX3JlcSgpIGFuZCBzdWJtaXRzIGEgdGFzay1tYW5hZ2VtZW50IHJlcXVlc3Qg
d2l0aA0KPiB0YXJnZXRfc3VibWl0X3RtcigpLiBXaGVuIHRhcmdldF9zdWJtaXRfdG1yKCkg
ZmFpbHMgaXQgcmV0dXJucyA8IDANCj4gYW5kIHNjc2liYWNrIGp1bXBzIHRvIHRoZSBlcnI6
IGxhYmVsLCB3aGljaCBzZW5kcyBhIHJlc3BvbnNlIGJ1dA0KPiBmcmVlcyBub3RoaW5nLCBs
ZWFraW5nIHRoZSB0YWcuDQo+IA0KPiBJbXBhY3Q6IGEgcHZTQ1NJIGd1ZXN0IGNhbiBsZWFr
IHRoZSBjb21tYW5kIHRhZ3Mgb2YgYSBMVU4ncw0KPiBzZXNzaW9uLCBzdG9wcGluZyB0aGUg
TFVOLCBieSBpc3N1aW5nIFZTQ1NJSUZfQUNUX1NDU0lfQUJPUlQgb3INCj4gUkVTRVQgcmVx
dWVzdHMgd2hlbmV2ZXIgdGFyZ2V0X3N1Ym1pdF90bXIoKSBmYWlscy4NCj4gDQo+IHRyYW5z
cG9ydF9nZW5lcmljX2ZyZWVfY21kKCkgY2Fubm90IGJlIHVzZWQgaGVyZS4gQnkgdGhlIHRp
bWUNCj4gdGFyZ2V0X3N1Ym1pdF90bXIoKSByZXR1cm5zIGFuIGVycm9yIGl0IGhhcyBhbHJl
YWR5IHJ1bg0KPiBfX3RhcmdldF9pbml0X2NtZCgpIChzbyBzZV9jbWQtPmNtZF9rcmVmIGlz
IG9uZSwgbm90IHplcm8pLCBhbmQgb24NCj4gaXRzIHRhcmdldF9nZXRfc2Vzc19jbWQoKSBl
cnJvciBwYXRoIGl0IGhhcyBmcmVlZCBzZV9jbWQtPnNlX3Rtcl9yZXENCj4gdmlhIGNvcmVf
dG1yX3JlbGVhc2VfcmVxKCkgd2hpbGUgbGVhdmluZyBTQ0ZfU0NTSV9UTVJfQ0RCIHNldCBh
bmQNCj4gdGhlIHBvaW50ZXIgZGFuZ2xpbmcuIExldHRpbmcgdGhlIGNvbW1hbmQgcmVsZWFz
ZSBydW4NCj4gdGFyZ2V0X2ZyZWVfY21kX21lbSgpIHdvdWxkIHRoZW4gZG91YmxlLWZyZWUg
c2VfdG1yX3JlcS4NCj4gDQo+IFVzZSB0aGUgc2FtZSBoZWxwZXIsIHdoaWNoIHJldHVybnMg
anVzdCB0aGUgdGFnLCBvbiB0aGlzIHBhdGggdG9vLg0KPiANCj4gRml4ZXM6IDJkYmNkZjMz
ZGJmNiAoInhlbi1zY3NpYmFjazogQ29udmVydCB0byBwZXJjcHVfaWRhIHRhZyBhbGxvY2F0
aW9uIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQXNzaXN0ZWQtYnk6IENs
YXVkZTpjbGF1ZGUtb3B1cy00LTgNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBCb21tYXJp
dG8gPG1pY2hhZWwuYm9tbWFyaXRvQGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------Lx4hjADfd9WcEZaF3yim000E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Lx4hjADfd9WcEZaF3yim000E--

--------------JnwtXeAGP8AktzTMtTeWLuja--

--------------30fN0dc4b3OHkvjxlNkt3JWf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmowFugFAwAAAAAACgkQsN6d1ii/Ey/u
1QgAgMgugck5RFkPC7QeBaJ0LIT21B2fLVOBow5S7PSnFm6QhyL3zdSMJbufs0wxNTf286qDaqXy
7ncVw63W4hvoOY0hkJQwGEqOB3JCJ+sK1recDIoFTLP3FEHHjVaWbXnlz1IZFEidgvzlgs0s1ZLW
dF0wVrA1G5PXNixuoENucei6EiDC8lqFxFxEbBbby/1ZOi2yWjb5yycjWE5rFf8L+atKcPY24Mzg
2E8/IRPNNFdaNPm2wFxh709znikGqTzzVTB10xD1s693wAwgInz4jyDvEDDGW2WZM9Diux/WatzF
TBM0r3yfrZpWFpEHIeMUQ4mNXGRbalbyc/6zQ327Bw==
=y292
-----END PGP SIGNATURE-----

--------------30fN0dc4b3OHkvjxlNkt3JWf--

