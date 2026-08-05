Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ECFC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:41:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383368.1626624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrawC-00036e-Cl; Wed, 05 Aug 2026 12:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383368.1626624; Wed, 05 Aug 2026 12:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrawC-00036X-94; Wed, 05 Aug 2026 12:41:36 +0000
Received: by outflank-mailman (input) for mailman id 1383368;
 Wed, 05 Aug 2026 12:41:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrawA-00036E-OR
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:41:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wraw9-003tJ0-TB
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:41:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a732f66-2eae-0a2a0a5409dd-0a2a4505a08c-36
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:41:33 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a732f7d-4cb1-0a2a45050019-d155da2ac5dd-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:41:33 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c1c24ec9525so159578466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:41:33 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2036461395sm103784666b.62.2026.08.05.05.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 05:41:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1785933693; x=1786538493; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0QaMmvum05DIEb1UosvTT9n8I5x15tm5IM4WzUyxoRw=;
        b=U9uNaUOkEi2Frt6B8MqqJE0Q6DKo4gh60p20aT/JWgPcj1pKEg6i17RzjmrDIpV+3/
         Vd9R82bvR/3llIub20ItSfz6fN4bOescDRmAlfmw6iljxCmJse3TIqpHVfxZruIe4EtZ
         B8VG6QmUtOFt6J/ItQquSfSaoEfY/FdVZ3jH2x0qGxOhc4K0NJnP4SYat/2W5s3JqE4V
         fdFhPo2ZM9Qx8OrD76nQEnB5SdOfpWB5A7QU7vzvGBP+MHWG+2Dt+4LemhexPSvyZfG9
         xhImJJ2zUjycHlW6Jf3LyyN+hr8vkctj2X8TTFUmGOOcXRGgbvm/PrHWrAKxXjZ+4umC
         Ji5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933693; x=1786538493;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QaMmvum05DIEb1UosvTT9n8I5x15tm5IM4WzUyxoRw=;
        b=FoIXTIPI7E6BGxsD10KFnGxUuPwKckXp0osKcmz19WSM7s5Q584al5St7uBRoXbe/d
         nqNQkotA07zZ8C0yFu3wfum1xiLdTZ9lo1qCV3vUzfuuUovyUMJ2I/CRVToEpbTItfB0
         Z039UmrIqVaCGxbi4QDYBe/ZC5ZHyHeBLhw0kHqKF8MpIIoqLaDUm981LCToJdOMi4Sg
         sObpiL8iPWXe8/ctN7avrk3Lo996YwSXspwfYJDXK4EPQ43PASW96wO4ZvVSPHgpjzRl
         NXDPSSv7T31nvk2tVMtDct1xurzk7ycd17sWsAbSqAs9ieUXrYTehboiyEnaSwDTjMrM
         kMcw==
X-Gm-Message-State: AOJu0Yz2S1guTNX2kSLGJEvOwAU75nJA5VV8rlIFRylal0NGQusNoLp4
	EE8FIIyDRLXdX9Go9tuvS6aExIzc8DLdi89j6LaM0LdnPo7kpMwZTbpqBZhTFTrInn0=
X-Gm-Gg: AR+sD1076gGms7LPqPbfD+4kAVG2uU50l83GMgT8fvW6DTEMdNBuN4b2f36k5oBShyo
	PLlkcBFMgVRDgCEF/q1XovhrEUuvtUD3/iRcI4/QTuVk66Bep/1wIp456JBlcr+OJpH+tMeTjkB
	JJ0wY4dNSeNp5tZhqUHLcv1IX1K2mItgYW+mvd//lMjXSyf73LrTZ9IAsTAFBnkfYhSCFir3Fwk
	yi1OdTUGFPWuPoyxHunsI/ra7h2KrgCMrRerWmh4oPhCZNhmzs0sQQSg8S0390veKK58rWMZZen
	regDIdMVqt4pt0QWGl8TUggzuIYMEMbMBW4y/Blvn14QZ+6W1oQIy5SWKs8I2sr3OB3La+bABFh
	OptizJoM6iOTkbaKQESIdgdyL5aUzg9bOWiCOK5YTj/BAoVrcL741h2hlI4uEwgjyrqlkZ0U8Ql
	JdinRmH94wTTtyQltKebK1M2DADUXE0oWppHfgNK5IrVBpTMhOkQokH3mDa5n0SHJ87JWt+PsJF
	J2UourL7vv7H9VDM/34zlMNOJh+3wT6hIlyFuUy3bpbex1ltJ/l/dlwi008+o3R/9tQA7PitDB1
	AxVwOMTBkW4jtec=
X-Received: by 2002:a17:907:934b:b0:c20:768:af62 with SMTP id a640c23a62f3a-c2039c6c8a2mr341458166b.22.1785933692951;
        Wed, 05 Aug 2026 05:41:32 -0700 (PDT)
Message-ID: <f0394e8a-1ac3-4aa9-bae2-af52380ff07a@suse.com>
Date: Wed, 5 Aug 2026 14:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
 <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
 <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
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
In-Reply-To: <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZRJM6pLxAC9zdk5WjgZzPb3j"
X-purgate-ID: tlsNG-c201ff/1785933693-F68B62A1-8C327E0F/0/0
X-purgate-type: clean
X-purgate-size: 10094

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZRJM6pLxAC9zdk5WjgZzPb3j
Content-Type: multipart/mixed; boundary="------------uvadjcU5bDKL9u0vra1EE0hE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <f0394e8a-1ac3-4aa9-bae2-af52380ff07a@suse.com>
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
 <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
 <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
In-Reply-To: <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>

--------------uvadjcU5bDKL9u0vra1EE0hE
Content-Type: multipart/mixed; boundary="------------yjwpHgik2wtI91TARDmFirUE"

--------------yjwpHgik2wtI91TARDmFirUE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTQ6MTUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IFtBZGRpbmcgYmFj
ayBpbiB4ZW4tZGV2ZWwsIHNpbmNlIHRoaXMgaXMgcmVsZXZhbnRdDQo+IA0KPiBPbiBXZWQs
IEF1ZyA1LCAyMDI2IGF0IDk6MTXigK9QTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5j
b20gDQo+IDxtYWlsdG86amdyb3NzQHN1c2UuY29tPj4gd3JvdGU6DQo+IA0KPiAgICAgT24g
MDQuMDguMjYgMTE6MzQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+ICAgICAgPiBPbiBUdWUs
IEF1ZyA0LCAyMDI2IGF0IDY6NDXigK9QTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5j
b20NCj4gICAgIDxtYWlsdG86amdyb3NzQHN1c2UuY29tPg0KPiAgICAgID4gPG1haWx0bzpq
Z3Jvc3NAc3VzZS5jb20gPG1haWx0bzpqZ3Jvc3NAc3VzZS5jb20+Pj4gd3JvdGU6DQo+ICAg
ICAgPg0KPiAgICAgID4NCj4gICAgICA+wqAgwqAgwqBQLlMuOiBHZW9yZ2UsIHdvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIHR1cm4gb2ZmIEhUTUwgbWFpbHMgd2hlbiBzZW5kaW5nIHRvDQo+
ICAgICAgPsKgIMKgIMKgIMKgIMKgIMKgIMKgeGVuLWRldmVsPw0KPiAgICAgID4NCj4gICAg
ICA+DQo+ICAgICAgPiBJIHNlZSBib3RoIGEgdGV4dC9wbGFpbiBwYXJ0IGFuZCBhIHRleHQv
aHRtbCBwYXJ0IGluIHRoZSBtYWlsIEkgc2VudDsNCj4gICAgIGlzbid0IHRoZQ0KPiAgICAg
ID4gcHJlc2VuY2Ugb2YgYSB0ZXh0L3BsYWluIHZlcnNpb24gc3VmZmljaWVudD8NCj4gICAg
ICA+DQo+ICAgICAgPiBPYnZpb3VzbHkgc2VuZGluZyBwYXRjaGVzIGlzIGEgZGlmZmVyZW50
IG1hdHRlcjsgYnV0IGZvciB0aGF0IEknbGwgYmUNCj4gICAgIHVzaW5nIGdpdC0NCj4gICAg
ICA+IHNlbmQtZW1haWwuDQo+IA0KPiAgICAgVGhpcyBpcyBhIHJlcGx5IHRvIHlvdXIgbWFp
bCB1c2luZyBUaHVuZGVyYmlyZCAod2hpY2ggSSBoYXZlIGNvbmZpZ3VyZWQgdG8gdXNlDQo+
ICAgICBwbGFpbiB0ZXh0IGZvcm1hdCBhcyB0aGUgZGVmYXVsdCwgaW4gb3JkZXIgdG8gY29t
cGx5IHdpdGggbW9zdCBtYWlsaW5nIGxpc3RzDQo+ICAgICBJJ20gdXNpbmcpLg0KPiANCj4g
ICAgIEkgZG9uJ3QgdGhpbmsgVGh1bmRlcmJpcmQgaXMgYW4gZXhvdGljIE1VQSwgYnV0IHBs
ZWFzZSBoYXZlIGEgbG9vayBob3cgaXQNCj4gICAgIHJlbmRlcmVkIHlvdXIgSFRNTCByZXBs
eSB0byBteSBvcmlnaW5hbCBtYWlsLiBJIGNhbid0IHNlZSBjbGVhcmx5IHdoaWNoIHBhcnQN
Cj4gICAgIHdhcyB3cml0dGVuIGJ5IG1lIG9yaWdpbmFsbHkgYW5kIHdhcyBjaXRlZCBieSB5
b3UgaW4gdGhpcyBtYWlsLg0KPiANCj4gDQo+IFRoYW5rcywgdGhpcyBpcyB3aGF0IEkgd2Fz
IGxvb2tpbmcgZm9yLg0KPiANCj4gQXR0YWNoZWQgaXMgdGhlIG1lc3NhZ2UgR21haWwgc2Vu
dC7CoCBBcyB5b3UgY2FuIHNlZSwgdGV4dC9wbGFpbiB1c2VzIG5vcm1hbCBgPmAgDQo+IGZv
ciBxdW90ZXMuDQo+IA0KPiBUaGF0IG1ha2VzIG1lIHRoaW5rIHRoYXQgdGhlIHByb2JsZW0g
aXMgaW4gVGh1bmRlcmJpcmQuIEl0IHNob3VsZCBlaXRoZXIgdGFrZSANCj4gdGhlIHRleHQv
cGxhbiBwYXJ0LCBhbmQgcmVwbHkgdG8gdGhhdCBhcyB0aG91Z2ggaXQgd2VyZSB0aGUgb25s
eSBwYXJ0IGl0IGhhZCANCj4gcmVjZWl2ZWQ7IG9yIGl0IHNob3VsZCB0YWtlIHRoZSBIVE1M
IHBhcnQsIGFuZCBjb252ZXJ0IHRoZSBxdW90ZXMgdG8gdGV4dCANCj4gcHJvcGVybHkuwqAg
UmVwbHlpbmcgaW4gSFRNTCBhbmQgdGhlbiByZW5kZXJpbmcgaXQgd2l0aCBvbmx5IHNwYWNl
IGluZGVudGF0aW9ucyANCj4gc2VlbXMgbGlrZSBhIGJ1Zy4NCj4gDQo+IFRodW5kZXJiaXJk
IGNlcnRhaW5seSBpc24ndCBleG90aWMsIGJ1dCBsYXN0IHRpbWUgSSB1c2VkIGl0IGl0IHdh
cyBkZWZpbml0ZWx5IA0KPiB1bmRlci1tYWludGFpbmVkLg0KPiANCj4gWW91J3JlIGFza2lu
ZyBldmVyeSBwZXJzb24gd2hvIHNlbmRzIGFuIGVtYWlsIHRvIHhlbi1kZXZlbCB0byByZW1l
bWJlciB0byB0YWtlIA0KPiBhbiBhY3Rpb24gYmVmb3JlIHNlbmRpbmcgdGhlIG1haWwgKG9y
IHRvIHNlbmQgKmFsbCogbWFpbCBhcyB0ZXh0L3BsYWluLCBldmVuIGlmIA0KPiBpdCdzIG5v
dCB0byB4ZW4tZGV2ZWwpLCBiZWNhdXNlIHlvdXIgTVVBIGlzbid0IGhhbmRsaW5nIHRoZSBz
dGFuZGFyZCBwcm9wZXJseS4gIA0KDQpBbmQgeW91IGFyZSBhc2tpbmcgZXZlcnkgVGh1bmRl
cmJpcmQgdXNlciB0byBsaXZlIHdpdGggYmFkIHRocmVhZGluZyBvciB0bw0KdXNlIGEgZGlm
ZmVyZW50IG1haWwgY2xpZW50Lg0KDQo+IElzIHRoYXQgcmVhbGx5IHJlYXNvbmFibGU/wqAg
Q291bGRuJ3QgeW91IHRlbGwgVGh1bmRlcmJpcmQgdG8gaWdub3JlIGh0bWwgYW5kIA0KPiBv
bmx5IHJlbmRlciB0ZXh0L3BsYWluPw0KDQpJIGRpZCBsb29rIGZvciBhIHNldHRpbmcgY29u
dHJvbGxpbmcgdGhhdCwgYnV0IGNvdWxkbid0IGZpbmQgYW55LiBJJ20gYWxyZWFkeQ0KdXNp
bmcgdG8gc2VuZCBwbGFpbiB0ZXh0IG9ubHkuIFRoZXJlIHNlZW1zIHRvIGJlIG5vIG9idmlv
dXMgY29udHJvbCB0byBwcmVmZXINCnRleHQgb3ZlciBodG1sIGluIGFsdGVybmF0aXZlIGJv
ZGllcy4NCg0KT24gTWF0cml4IHlvdSBzdGF0ZWQgeW91IGFyZSB1c2luZyB0aGUgc2FtZSBj
b25maWd1cmF0aW9uIGZvciBzZW5kaW5nIG1haWxzIHRvDQp4ZW4tZGV2ZWwgc2luY2UgMjAw
Ni4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgdHJ1ZSwgYXMgbW9zdCBtYWlscyBJJ3ZlIHJlY2Vp
dmVkDQpmcm9tIHlvdSB2aWEgeGVuLWRldmVsIGhhdmUgYmVlbiBzZW50IGZyb20geW91ciBD
aXRyaXggYWNjb3VudCwgYW5kIHRob3NlIHdlcmUNCmFsbCB0ZXh0LW9ubHkuDQoNCg0KSnVl
cmdlbg0K
--------------yjwpHgik2wtI91TARDmFirUE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------yjwpHgik2wtI91TARDmFirUE--

--------------uvadjcU5bDKL9u0vra1EE0hE--

--------------ZRJM6pLxAC9zdk5WjgZzPb3j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpzL3wFAwAAAAAACgkQsN6d1ii/Ey+N
0Qf+Oz+4knDaDZrFzTXvCPkf6w7xmSFDMubRRs8MfCp4BEZDgsOSHLHydn8dUR9kQg4FJiSicdJ5
RAXUTF2EBmlf0hhODc81xEWuY9rmipE3UUP2CMJi+C5CH4WY/tUl/ScyZ6NNBMSkxEfdp+t7nSsc
ayo1aSgP26D37Newtjn5j4IR53Wd9YqnyjMFfYSsKPkz/iBd3w3DudQUwp9fBYmKih8oSLgcl7yh
8stny+MkQKvQDs43OoMduNUUL2BOYLVAF+YJQQoAYTUpSZ2U9U4lXVlv3At0O+LWy7y5Z+y13zAc
C7swPP5I9E8J4QmIqw6TEDiPMbhJ77qfY7nW0kpMXA==
=OSNP
-----END PGP SIGNATURE-----

--------------ZRJM6pLxAC9zdk5WjgZzPb3j--

