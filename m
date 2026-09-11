Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE28DC79FA1
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:09:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415709.1644924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vNm-0004lj-3s; Fri, 11 Sep 2026 07:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415709.1644924; Fri, 11 Sep 2026 07:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vNm-0004lc-0k; Fri, 11 Sep 2026 07:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1415709;
 Fri, 11 Sep 2026 07:09:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x4vNk-0004lW-OY
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:09:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4vNi-007Uoh-FQ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:09:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3a8fe-bab6-0a2a0a5309dd-0a2a450ab600-44
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:09:06 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aa3a911-f2d2-0a2a450a0019-d155d033e182-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:09:05 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6a9a4dc8afeso878281a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 00:09:05 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966022298sm47069966b.17.2026.09.11.00.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 00:09:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:Autocrypt:Subject:From:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789110545; x=1789715345; darn=lists.xenproject.org;
        h=content-type:autocrypt:subject:from:to:content-language:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wvAa7sM/JXp+VCSXM2E78gB4EB4ZF+s29aq4VPOuIgc=;
        b=YpQMI9dACom4T53Y0P6XZXNgGAPIjav9h6WSftnssDSwX6TrCDnh1sJGxbcVsiUXiF
         UCteT293VpHJozm0vGnpakH1k/q8PDqd0+5+j8r1QCIM4CQUMojSxcZw6LH87fD1egYw
         EVMejuaO1UltyeFIUO0e607lJEmj+HBiFuyS02eTcv0I6YM36BY707iiZ/byyY4Rzs8A
         JasK/a3uyLMMrYJ8Y0E1TO467eVF+HD4zwFgTQSdyrP2ajDZG1JpKMPlnPl/HnwOUjWJ
         wsLLvPJGsRlwP57hwU7DYPEl6D0GpxR7rq/IYP6QPoZ9T8ZCY4BKiUNR6ZZSUVBT+iHk
         XCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110545; x=1789715345;
        h=content-type:autocrypt:subject:from:to:content-language:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wvAa7sM/JXp+VCSXM2E78gB4EB4ZF+s29aq4VPOuIgc=;
        b=AFBy2hvFTQCr1XNCbQBCXvI4t/llk/VgwNCV1S9eqVfSfivdeH3KsVeAV9XTRmFDCb
         bERqDX7nHoOIAc+Md2yIA0gRl5vx1isFBXh+zYvQZHiPMTvJT/KgIBJEUWS1HxE8J2/f
         eV1Zz6QoonmVz3IO84mQjfZWQOv3HMTduNXEB9vGWnS8FEIbwS4ufs9SRMLboywuno+e
         WSwUfJlwMdkd62I5avqS3QyHNzjdRaX3m+MKNc6TpkHT59/QnYUuqF1YLb/20CABMAKU
         Q9yGdcGmKtd1Z2Odz7ILRbwBuDNOGnd+Mhnd5OevJa9V3oXtK9DJJordIYqxRYs3dQbN
         0euw==
X-Gm-Message-State: AFuF++mgiRUn7yYa11QatoqhAJ/VCqpJ962edp7cT2/F4UGOQdJsGSok
	dqORFnmNYIXR+OjV1wU5e6byvWFGSvlGiog+LYKM1daXBW2EqI80Leb55EiwgmLtkgU1v97YnlS
	AXNaAxek=
X-Gm-Gg: AYBFou3U8bjF6db9F0a9zq3V/bmjY3ut+72L3YcTAwWBEvckfkjTvOn4DplCkgjlE37
	BGrOEb9R+OBGSs4HYxnv9F2jzkDJ/ZdyjCXDSEZ0lfXo1ibmSTEeBMx91W+OypcL0ddsvYFPK5A
	lnkzwL66sKJl2+fKTnQTpCS82+OJ/kBRHfgJkDB4d58f93iLZrvc1iT3me5HDEr9k4SKJrC45Gj
	chxEUzbaP+00Pf0wut1RWsMHIkzdWC3YGDfUMy8XC/8J+ixpIAXwnOCSk29zRhGQsefTs6E5A4X
	eEeLOAwVfJxvKmRNPEE00Z96ThhDqlmr7kiDLLocWaJ/NZaF1kZWEf7XPb7TUH4t5fwHTVixJpa
	PxzJhtdfK7pTNB3mVnZ+a2pEsc/XWY6KihB9M4VSdOdY6DqIK0qZnLoGbTWuhZXFzWIsz/xuJN8
	2U+fAOM298qlG1Amv0IeNzfyAD4CfzQTAz6NCBUc2rvVyLeW3xCI0YbsZQjwYIMRO3M8Y2y9AJ2
	ZraF0NjgH0tfcVrbpqIHEpLz4WSuUKeSVVb2tVNAAPgUfEcr6JWCc1BGsOCgZ7S9603O4SLz5k8
	fc6QBPuioUUeUuXb1ZGdymXT
X-Received: by 2002:a17:906:c14f:b0:c29:56d3:65a with SMTP id a640c23a62f3a-c29666d2d73mr111983866b.33.1789110545116;
        Fri, 11 Sep 2026 00:09:05 -0700 (PDT)
Message-ID: <d6171f9f-5904-4f0e-87ae-a513bc913160@suse.com>
Date: Fri, 11 Sep 2026 09:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Build failure on staging for Qemu
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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZdswLQpMYivhkurHlULaWpJ7"
X-purgate-ID: tlsNG-4011c0/1789110545-520C1CFC-AA0D643A/0/0
X-purgate-type: clean
X-purgate-size: 9385

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZdswLQpMYivhkurHlULaWpJ7
Content-Type: multipart/mixed; boundary="------------03DhA7zW4mUGJNwIJbWjaYGY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <d6171f9f-5904-4f0e-87ae-a513bc913160@suse.com>
Subject: Build failure on staging for Qemu

--------------03DhA7zW4mUGJNwIJbWjaYGY
Content-Type: multipart/mixed; boundary="------------R0xn0IRN0TZEM2KQ3TSfao1s"

--------------R0xn0IRN0TZEM2KQ3TSfao1s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSdtIHNlZWluZyB0aGUgZm9sbG93aW5nIFFlbXUgKGZyb20gcWVtdS14ZW4uZ2l0KSBidWls
ZCBmYWlsdXJlIG9uIHN0YWdpbmc6DQoNCls2MzQvMjczMl0gQ29tcGlsaW5nIEMgb2JqZWN0
IGxpYnFlbXV1dGlsLmEucC91dGlsX2xvZy5jLm8NCkZBSUxFRDogW2NvZGU9MV0gbGlicWVt
dXV0aWwuYS5wL3V0aWxfbG9nLmMubw0KY2MgLW02NCAtSWxpYnFlbXV1dGlsLmEucCAtSS4g
LUkuLi9xZW11LXhlbi1kaXItcmVtb3RlIA0KLUlzdWJwcm9qZWN0cy9saWJ2aG9zdC11c2Vy
IC1JLi4vcWVtdS14ZW4tZGlyLXJlbW90ZS9zdWJwcm9qZWN0cy9saWJ2aG9zdC11c2VyIA0K
LUlxYXBpIC1JdHJhY2UgLUl1aSAtSXVpL3NoYWRlciAtSS91c3IvaW5jbHVkZS9nbGliLTIu
MCANCi1JL3Vzci9saWI2NC9nbGliLTIuMC9pbmNsdWRlIC1JL3Vzci9pbmNsdWRlL2xpYm1v
dW50IC1JL3Vzci9pbmNsdWRlL2Jsa2lkIA0KLUkvdXNyL2luY2x1ZGUvZ2lvLXVuaXgtMi4w
IC1mZGlhZ25vc3RpY3MtY29sb3I9YXV0byAtV2FsbCAtV2ludmFsaWQtcGNoIC1XZXJyb3Ig
DQotc3RkPWdudTExIC1PMCAtZyAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLVdlbXB0eS1i
b2R5IC1XZW5kaWYtbGFiZWxzIA0KLVdleHBhbnNpb24tdG8tZGVmaW5lZCAtV2Zvcm1hdC1z
ZWN1cml0eSAtV2Zvcm1hdC15MmsgLVdpZ25vcmVkLXF1YWxpZmllcnMgDQotV2ltcGxpY2l0
LWZhbGx0aHJvdWdoPTIgLVdpbml0LXNlbGYgLVdtaXNzaW5nLWZvcm1hdC1hdHRyaWJ1dGUg
DQotV21pc3NpbmctcHJvdG90eXBlcyAtV25lc3RlZC1leHRlcm5zIC1Xb2xkLXN0eWxlLWRl
Y2xhcmF0aW9uIA0KLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3JlZHVuZGFudC1kZWNscyAt
V3NoYWRvdz1sb2NhbCAtV3N0cmljdC1wcm90b3R5cGVzIA0KLVd0eXBlLWxpbWl0cyAtV3Vu
ZGVmIC1XdmxhIC1Xd3JpdGUtc3RyaW5ncyAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1X
bm8tcHNhYmkgDQotV25vLXNoaWZ0LW5lZ2F0aXZlLXZhbHVlIC1pc3lzdGVtIA0KL2hvbWUv
Z3Jvc3MveGVuL3Vuc3RhYmxlL3Rvb2xzL3FlbXUteGVuLWRpci1yZW1vdGUvbGludXgtaGVh
ZGVycyAtaXN5c3RlbSANCmxpbnV4LWhlYWRlcnMgLWlxdW90ZSAuIC1pcXVvdGUgDQovaG9t
ZS9ncm9zcy94ZW4vdW5zdGFibGUvdG9vbHMvcWVtdS14ZW4tZGlyLXJlbW90ZSAtaXF1b3Rl
IA0KL2hvbWUvZ3Jvc3MveGVuL3Vuc3RhYmxlL3Rvb2xzL3FlbXUteGVuLWRpci1yZW1vdGUv
aW5jbHVkZSAtaXF1b3RlIA0KL2hvbWUvZ3Jvc3MveGVuL3Vuc3RhYmxlL3Rvb2xzL3FlbXUt
eGVuLWRpci1yZW1vdGUvaG9zdC9pbmNsdWRlL3g4Nl82NCAtaXF1b3RlIA0KL2hvbWUvZ3Jv
c3MveGVuL3Vuc3RhYmxlL3Rvb2xzL3FlbXUteGVuLWRpci1yZW1vdGUvaG9zdC9pbmNsdWRl
L2dlbmVyaWMgLWlxdW90ZSANCi9ob21lL2dyb3NzL3hlbi91bnN0YWJsZS90b29scy9xZW11
LXhlbi1kaXItcmVtb3RlL3RjZy9pMzg2IC1wdGhyZWFkIC1tc3NlMiANCi1tY3gxNiAtRF9H
TlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAN
Ci1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLWZ0cml2aWFsLWF1
dG8tdmFyLWluaXQ9emVybyANCi1memVyby1jYWxsLXVzZWQtcmVncz11c2VkLWdwciAtRFhD
X1dBTlRfQ09NUEFUX0VWVENITl9BUEk9MSANCi1EWENfV0FOVF9DT01QQVRfR05UVEFCX0FQ
ST0xIC1EWENfV0FOVF9DT01QQVRfTUFQX0ZPUkVJR05fQVBJPTEgDQotRFhDX1dBTlRfQ09N
UEFUX0RFVklDRU1PREVMX0FQST0xIC1mUElFIC1NRCAtTVEgbGlicWVtdXV0aWwuYS5wL3V0
aWxfbG9nLmMubyANCi1NRiBsaWJxZW11dXRpbC5hLnAvdXRpbF9sb2cuYy5vLmQgLW8gbGli
cWVtdXV0aWwuYS5wL3V0aWxfbG9nLmMubyAtYyANCi4uL3FlbXUteGVuLWRpci1yZW1vdGUv
dXRpbC9sb2cuYw0KLi4vcWVtdS14ZW4tZGlyLXJlbW90ZS91dGlsL2xvZy5jOiBJbiBmdW5j
dGlvbiDigJh2YWxpZF9maWxlbmFtZV90ZW1wbGF0ZeKAmToNCi4uL3FlbXUteGVuLWRpci1y
ZW1vdGUvdXRpbC9sb2cuYzoxODg6MjQ6IGVycm9yOiBpbml0aWFsaXphdGlvbiBkaXNjYXJk
cyDigJhjb25zdOKAmSANCnF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1X
ZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdDQogICAxODggfCAgICAgICAgIGNoYXIgKnBp
ZHN0ciA9IHN0cnN0cihmaWxlbmFtZSwgIiUiKTsNCiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+DQpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVy
cm9ycw0KbmluamE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVkLg0KbWFrZTog
KioqIFtNYWtlZmlsZToxNjg6IHJ1bi1uaW5qYV0gRXJyb3IgMQ0KbWFrZVsxXTogKioqIFtN
YWtlZmlsZToxNTc6IHN1YmRpci1hbGwtcWVtdS14ZW4tZGlyXSBFcnJvciAyDQptYWtlWzFd
OiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvZ3Jvc3MveGVuL3Vuc3RhYmxlL3Rvb2xzJw0K
bWFrZTogKioqIFsvaG9tZS9ncm9zcy94ZW4vdW5zdGFibGUvdG9vbHMvLi4vdG9vbHMvUnVs
ZXMubWs6MTkzOiBzdWJkaXJzLWFsbF0gDQpFcnJvciAyDQoNCkknbSB1c2luZyBnY2MgdmVy
c2lvbiAxNi4yLjAgZnJvbSBvcGVuU1VTRSBUdW1ibGV3ZWVkLg0KDQoNCkp1ZXJnZW4NCg==

--------------R0xn0IRN0TZEM2KQ3TSfao1s
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------R0xn0IRN0TZEM2KQ3TSfao1s--

--------------03DhA7zW4mUGJNwIJbWjaYGY--

--------------ZdswLQpMYivhkurHlULaWpJ7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqjqRAFAwAAAAAACgkQsN6d1ii/Ey+p
rAf/eCX1jKSabfwpvfVmlxykj5Rsh51C6Ch0OCfX8DkM7x/aQclyhE9m+wrFi6LAgnZGCH8X5UDA
S8eRbbPTft1gErQ4rxa8M7rCijBycuJ5NLoPLygyt8g0WaI06+EmizQhQh8aiIn4BVz3n3LcACkx
7ecPeF4HoSqK2t1QEVHJStHbd/GJWvGn8cpxAUNEfbZBAyvxUBIfJ7n7sjEIaaRQUMiFm36U5LjO
ohlT067y48lcQ0+1qBFwfxABfICea7zS+1Gzp36rws/GHM+9DmmmmKBj90xFMZIOi7VS9IcuGBnJ
oe7N7FYOFDYKrAW4X0Xuz3BMCcqM8g2ejjfbI2IITA==
=uBtb
-----END PGP SIGNATURE-----

--------------ZdswLQpMYivhkurHlULaWpJ7--

