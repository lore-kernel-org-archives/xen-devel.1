Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C70AC44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:44:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364209.1615530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNJp-00047a-Ij; Thu, 16 Jul 2026 14:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364209.1615530; Thu, 16 Jul 2026 14:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkNJp-00047T-G6; Thu, 16 Jul 2026 14:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1364209;
 Thu, 16 Jul 2026 14:44:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wkNJo-00047L-Bk
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:44:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkNJn-006elS-5R
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:44:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a58ee21-5cb7-0a2a0a5109dd-0a2a4503da0c-48
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:44:07 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a58ee36-fae8-0a2a45030019-d155da2de8b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:44:06 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c167bda216fso327954066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 07:44:06 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1687171e7esm234372166b.22.2026.07.16.07.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 07:44:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1784213046; x=1784817846; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qU4UbXNQHSzmAawu9IUZ1dqcm80Sz+oPzir1mF0+hP0=;
        b=RQ0d0vSl3/kJepXeFkIkiO8fFlk0lsPucWvvTEMWVanU3m/BMDZnf8+9d4tXf51out
         PeBNkvfJas+78d4LO5F0jv2AEQjLSAIKwz981STUAxHNLooHnArxHJGhBLvkEGiAcNM0
         U+1z68GeTuXT0RxSTKNlIooQD2TIpB2+byvE2aMk/f7TykRl0HNcWR236yu8Fl5VGK01
         SqW4AazMLNFg3/EwxI3XhpHBQAt/QZ9do/coQtvdx2WPU1yiUANCmYogJWULiyCInrkl
         7y3xg5fooFLzKxfYzDEs5apNLIUJP3oUNLZWLGbjmkH4RyIXleOrHZ47m1lgtWppCRem
         Nfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213046; x=1784817846;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU4UbXNQHSzmAawu9IUZ1dqcm80Sz+oPzir1mF0+hP0=;
        b=WiP0SgFvKK8RDHlwAPwJZdahX5y/fHfu0ZnK2u5LcMSFecjvOICjWZktIkJkicYOAP
         ivh/8CKM4XTibbN9yQLatQf7ptLXJ017Fyg/wFcKCEnJ0TnNXCZ6txkWRAlU/s3maIh1
         QblGHqWHd4Wc0KzZGH2uDkWaJyzvdlHBQt/N0XS0+JbjcgZlsxQAu41G1FBu5cDDp9PK
         2E8Ad2y8GVVSm02Kk+3eiw8IjMMVmfhY76Rnhp7NhYFfmy09JXAqj+y5V7rtypHAFnOX
         ZSDqR6HRfQZGMZWky9wpFO49J372Ltyetmv81C1W6g6usLLCiKMl8/aPaVo4GnFxo0Kp
         amfg==
X-Forwarded-Encrypted: i=1; AHgh+Rqv7vUi0SVIYDZaR3nHFyJp8JVtglS+6z0SBF2EfZv+fdfmrsH7hXlX5RZ/4Tz7n8aSSC4msM7KoPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl9xoTgcY7deiz6M2suG/hay27HszMPGfY/+SR4QqdcXEqltgc
	Y4UMDDfNoJywAgu14nS+7Q76ACga52DVCjT3oUjnsXGYd4cAI3pniYjYqRt/bZHgAS6IiJHw0ez
	RZvSUt7U=
X-Gm-Gg: AfdE7ck9YdjQWbZBCcI+tTOQpe5Y71uyTAk8CoKfqPx7V3kM6n92rOKKYdGUacUzC1X
	7oRRfFMwVjIJTbbjqXowv4NDNZ4Ef+bAWmBzDS/23EAB8tQywbyY7JmECMIL1Sp0bNCWBi6Qm0I
	4XB2m87RqTLrmuPdqPNRGrvsGVQvca+Q83WIy0I43C2NEbl68z9swAUzGPXo3NJSaG9bhkny4BP
	1MzeFa/Qs3OdR5fltDhsZ9Lb7RTfFyaQDf8fla/Qg7pCVpNu27WWTEZa6IR2yERrTNT7P5k1BHe
	xAK65QvqjCuSUwCzHn0CLoQ80W5aiIs1vl1SvSW1gqsig1rb7uxfEhv84rCDjugLcGyYjYQLvKH
	IRqjgeZzdPlpqMmCtO/CwY53lOGL++q7/lKQnFLUzBrYLjPVIzCpEZsXsjXVExS7aEMQeNVtzfZ
	3AgJJazL9z6CCYGH8XmPDhAov1U4Bj8XMZsp00/9jWubOuzQDxbeKnFCh8r4q6bESQVPok15MZr
	SGLItym1qfVwmlZSWVhvoa/vTHtyYwB
X-Received: by 2002:a17:907:db15:b0:c16:6469:3f1b with SMTP id a640c23a62f3a-c16646943b8mr681108466b.41.1784213045657;
        Thu, 16 Jul 2026 07:44:05 -0700 (PDT)
Message-ID: <551a4c50-3fd7-4aa2-b39a-a3820771ef36@suse.com>
Date: Thu, 16 Jul 2026 16:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <38cc09ca49bb020d4b13ead36e4c9f04da2d00e5.1784211528.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <38cc09ca49bb020d4b13ead36e4c9f04da2d00e5.1784211528.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zrwVu63x8Q7zknahjVYyuM1w"
X-purgate-ID: tlsNG-33051d/1784213046-6F6C64E9-946DB7B3/0/0
X-purgate-type: clean
X-purgate-size: 8668

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zrwVu63x8Q7zknahjVYyuM1w
Content-Type: multipart/mixed; boundary="------------eM0gMXZJbelM0DsjrXnL90G0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <551a4c50-3fd7-4aa2-b39a-a3820771ef36@suse.com>
Subject: Re: [PATCH] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
References: <38cc09ca49bb020d4b13ead36e4c9f04da2d00e5.1784211528.git.oleksii_moisieiev@epam.com>
In-Reply-To: <38cc09ca49bb020d4b13ead36e4c9f04da2d00e5.1784211528.git.oleksii_moisieiev@epam.com>

--------------eM0gMXZJbelM0DsjrXnL90G0
Content-Type: multipart/mixed; boundary="------------jZI6gPQ5DdPlPrRJF6N8zyL8"

--------------jZI6gPQ5DdPlPrRJF6N8zyL8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDcuMjYgMTY6MjAsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBzY2hlZHVs
ZV9jcHVfcm0oKSBjbGVhcnMgdGhlIGNwdXBvb2wgcG9pbnRlciBvZiB0aGUgc2NoZWR1bGlu
Zw0KPiByZXNvdXJjZSBiZWZvcmUgY2FsbGluZyBzY2hlZF9kZWluaXRfcGRhdGEoKToNCj4g
DQo+ICAgICAgc3ItPmNwdXBvb2wgPSBOVUxMOw0KPiAgICAgIC4uLg0KPiAgICAgIHNjaGVk
X2RlaW5pdF9wZGF0YShkYXRhLT5vbGRfb3BzLCBkYXRhLT5wcHJpdl9vbGQsIGNwdSk7DQo+
IA0KPiBGb3IgUlREUywgcnRfZGVpbml0X3BkYXRhKCkgY2FsbHMgbW92ZV9yZXBsX3RpbWVy
KCkgd2hlbiB0aGUNCj4gcmVwbGVuaXNobWVudCB0aW1lciBsaXZlcyBvbiB0aGUgY3B1IGJl
aW5nIHJlbW92ZWQsIGFuZA0KPiBtb3ZlX3JlcGxfdGltZXIoKSBkZXJlZmVyZW5jZXMgZ2V0
X3NjaGVkX3JlcyhvbGRfY3B1KS0+Y3B1cG9vbA0KPiB3aXRob3V0IGNoZWNraW5nIGl0IGZv
ciBOVUxMLiBSZW1vdmluZyB0aGUgbGFzdCBwQ1BVIGZyb20gYW4gUlREUw0KPiBjcHVwb29s
IHRoZXJlZm9yZSBkZXJlZmVyZW5jZXMgTlVMTCArIDB4MTAgKHRoZSByZXNfdmFsaWQgbWVt
YmVyKQ0KPiBhbmQgcGFuaWNzOg0KPiANCj4gICAgICAoWEVOKSBEYXRhIEFib3J0IFRyYXAu
IFN5bmRyb21lPTB4MWMyODAwNQ0KPiAgICAgIChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBW
QSAweDEwIG9uIENQVTAgdmlhIFRUQlIgLi4uDQo+ICAgICAgKFhFTikgWGVuIGNhbGwgdHJh
Y2U6DQo+ICAgICAgKFhFTikgICAgWzwuLi4+XSBmaW5kX25leHRfYml0KzB4NzQvMHhhOCAo
UEMpDQo+ICAgICAgKFhFTikgICAgWzwuLi4+XSBydC5jI21vdmVfcmVwbF90aW1lcisweGI4
LzB4ZWMgKExSKQ0KPiAgICAgIChYRU4pDQo+ICAgICAgKFhFTikgUGFuaWMgb24gQ1BVIDA6
DQo+ICAgICAgKFhFTikgQ1BVMDogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0DQo+IA0K
PiBSZXByb2R1Y2VyLCBvbiBhbnkgaG9zdCB3aXRoIGF0IGxlYXN0IDIgcENQVXMgYW5kIFJU
RFMgY29tcGlsZWQgaW4NCj4gKG9ic2VydmVkIG9uIGFybTY0LCBidXQgdGhlIHBhdGggaXMg
Y29tbW9uIGNvZGUpOg0KPiANCj4gICAgICB4bCBjcHVwb29sLWNyZWF0ZSBuYW1lPSJ0ZXN0
IiBzY2hlZD0icnRkcyINCj4gICAgICB4bCBjcHVwb29sLWNwdS1yZW1vdmUgUG9vbC0wIDEN
Cj4gICAgICB4bCBjcHVwb29sLWNwdS1hZGQgdGVzdCAxDQo+ICAgICAgeGwgY3B1cG9vbC1j
cHUtcmVtb3ZlIHRlc3QgMQ0KPiANCj4gVGhlIGxhc3QgY29tbWFuZCBtb3ZlcyB0aGUgUlRE
UyByZXBsZW5pc2htZW50IHRpbWVyIHRvIGNwdTEgKGZpcnN0DQo+IGFuZCBvbmx5IGNwdSBv
ZiB0aGUgcG9vbCkgYW5kIHRoZW4gcmVtb3ZlcyBjcHUxLCBoaXR0aW5nIHRoZSBOVUxMDQo+
IGRlcmVmZXJlbmNlIGluIHRoZSBzY2hlZF9kZWluaXRfcGRhdGEoKSBjYWxsYmFjay4NCj4g
DQo+IFRyZWF0IGEgTlVMTCBjcHVwb29sIGxpa2UgYSBjcHVwb29sIHdpdGggbm8gcmVtYWlu
aW5nIHNjaGVkdWxpbmcNCj4gcmVzb3VyY2VzIGFuZCBraWxsIHRoZSB0aW1lciwgd2hpY2gg
aXMgdGhlIGludGVudCBvZiB0aGUgZXhpc3RpbmcNCj4gY29tbWVudCBpbiBtb3ZlX3JlcGxf
dGltZXIoKS4NCg0KSG1tLCBpcyB0aGlzIGNvcnJlY3Q/DQoNCldoYXQgaWYgdGhlcmUgYXJl
IDIgY3B1cyBpbiB0aGUgY3B1cG9vbCBhbmQgeW91IGFyZSBqdXN0IHJlbW92aW5nIHRoZQ0K
b25lIG93bmluZyB0aGUgdGltZXI/IFRoaXMgd291bGQga2lsbCB0aGUgdGltZXIgaW5zdGVh
ZCBvZiBtb3ZpbmcgaXQNCnRvIHRoZSBvdGhlciBjcHUgb2YgdGhlIGNwdXBvb2wuDQoNCkkg
Z3Vlc3MgdGhlIGNvcnJlY3QgZml4IHdvdWxkIGJlIHRvIGFkZCBhIGNwdXBvb2wgcG9pbnRl
ciB0byBzdHJ1Y3QNCnJ0X3ByaXZhdGUgYW5kIHVzZSB0aGF0IGluIG1vdmVfcmVwbF90aW1l
cigpLg0KDQoNCkp1ZXJnZW4NCg==
--------------jZI6gPQ5DdPlPrRJF6N8zyL8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------jZI6gPQ5DdPlPrRJF6N8zyL8--

--------------eM0gMXZJbelM0DsjrXnL90G0--

--------------zrwVu63x8Q7zknahjVYyuM1w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpY7jUFAwAAAAAACgkQsN6d1ii/Ey/P
3Qf/deBIBuhVPb1nNGKRc5nPHpGMPtG3aRI8vK/G86UhQdWN1YzBIoybweO+wQJ6XQuggqEel1+8
g7UQflVJpYUvR7fDzEaMQNWFshnpL5j/tc8Ew6pAQMIM5SI+0EcyfQheEMc7AMcH2MkmywMIDSP9
Qpm2ODBsZBU4Q5nwekNIWfC818b5c7bxSfyLS+/2YLp1JafYEVCTTUwaLhybSKaH0prDbvXOH3JJ
oM1qOGluIPiXpjJDhsamOjCkwicHv2A2oysRF2fBL4qM2SJTLdHg4YJKnL5TEwvxAlByljpZEdSQ
jRk/B3PQzf7nViczAKwiCpP3/JdaC5o20idBLs8R1A==
=asRG
-----END PGP SIGNATURE-----

--------------zrwVu63x8Q7zknahjVYyuM1w--

