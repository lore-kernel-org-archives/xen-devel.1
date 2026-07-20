Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF52C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:48:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366514.1616407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllXM-0001iv-T5; Mon, 20 Jul 2026 10:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366514.1616407; Mon, 20 Jul 2026 10:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllXM-0001io-Q5; Mon, 20 Jul 2026 10:47:52 +0000
Received: by outflank-mailman (input) for mailman id 1366514;
 Mon, 20 Jul 2026 10:47:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wllXL-0001hR-KT
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:47:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wllXL-006NBB-1I
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:47:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dfcc0-2eae-0a2a0a5409dd-0a2a4506c908-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:47:50 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dfcd6-195a-0a2a45060019-d1558032e8c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:47:50 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so8998465e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 03:47:50 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4955de8895dsm69288335e9.4.2026.07.20.03.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 03:47:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1784544470; x=1785149270; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4gX0EjmkLrcXray1607hCFGZQkumu3pqtQ6Lprww3bE=;
        b=VQ2pvI5QcuPgdxaJklHABdC+M0IbL1kewjmgFlVPn7t+6dn0/5A2NKbIMNwnKk4aPX
         adxqYwWA9GeIF9KPjTW3SIQqD+sfjYJzgf+jHPWnhqtQWAlpbSZUNu1qfjEScVxrgB+a
         Ke3Nu0PY291n8zGjLBcvyW+PbKVB4quXwGQ8+TpESLeK+ET0ZLaU5YAkXzdc5yzBv0aj
         B8GaUvW/uG3XToCAP8I7wJHuJW8ZjomLHMP6dj/1knqDnkE0JB78paJx+ckuFJmuaKqc
         Zw5IZuR4/WS5gGj1XEC0CAM1Lt6xZYQmOnCqZ6WdjPMG9A4/QSppJnSuc+J9NqTvCBlZ
         SpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544470; x=1785149270;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gX0EjmkLrcXray1607hCFGZQkumu3pqtQ6Lprww3bE=;
        b=E1iHH+dT99nlrIW0V3i4QEU295MTle+FJ62YdydhgAhvLUd58D0ncbfaL+29Q8CH9x
         pq5UwPgzofoc3zzXCGQswXhfTRCal58qeC8TC3ld5x21oB0LHzuAqQUjL9N1ro4Viwxc
         rhNTArcrIHiyK36hZ5a2RbJ9KUVEZDC8Q//vrsanNL+I6o22TvxO6eVnFXRnjb32mmwK
         RS+rUD96S62cA5LOZRPsmpr2slH0I8Nu36Aww/daqXEGpm1Nhbbq2XhRGQqcEyrRg22G
         3LC+11y5KMKIak0w8QKYToIhUxNMiJjV3X9VK1v8O3ks8xSV8ISmVjbA5AOHsuFqb/po
         4WeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3MxATxQ6TWnqKk6hWO5a4M2HoiqrNFbp2eJX/8h4KmhwfYX0qWN3jF28bOgpJu09/RL9y2gBdnJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6MmtRQHuTT9xYRUOtNJsJxOXCoPtHuMxG+QBmM2OzpN/bs4bZ
	Xt4wXKz6sxJq39eMsBeOuuufmZRKHAe5ObAcOhcE6bdShItMmaFB7OQwbT6+r0+PU34=
X-Gm-Gg: AfdE7ckRd9m0yXLQI4XewesL8iIJeuu+UE8/mmyPT2kEtWFZq7WUZs1o6wOPzlmdQS4
	rmE6OfYiuv08ReC/HOdnsr+gw+x5FoiAS+vTGN1X2Eikf3sqbIWXjEtLhCUZC31Z+QW8LCYnj56
	yDhVKNzOIzd4kKbvKY+4yEkArAYrj4SZ7Pv9vh0bM4CUj5kQhLxeaJHq4NYmPnJfpphVRph5G7P
	wWsm9QsILJYZIi+HDBUNTkaZE7S9TrrgfU1xNixuWVCNNSqPUOM7j/jAsiIsnDS4WHge2F2hFX/
	mfvqEosva6u3ailiPLJDlBCTuBtpDf3rz2Ht6zqnAI30B8Rm+oZhDSMCpf3Qu9L8SLwsHAMu4os
	V6HkEEowhPAb4Obo1mGMC/7xMZM6caFz43mS9C9JwpWJhSc8TkBaHXzgUG35v8Lq6iD0s3Vj13t
	bUvbyIHl/U8xqrBOkUBG+Ul7IzUYT45Myae1EE0S6SaMoeTQX5yPTlll82j+NPQ3YAARodB9veq
	3CZWWEYRgXjgRo7ui9EaarOi8OXACy7
X-Received: by 2002:a05:600c:4ed3:b0:495:63e6:5fb8 with SMTP id 5b1f17b1804b1-49563e6601bmr7624895e9.12.1784544470013;
        Mon, 20 Jul 2026 03:47:50 -0700 (PDT)
Message-ID: <b9de6773-b13d-4975-9484-60d5fefa270a@suse.com>
Date: Mon, 20 Jul 2026 12:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <f4b75c23400b1a9db44596a28ca9683dbf05d419.1784288688.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <f4b75c23400b1a9db44596a28ca9683dbf05d419.1784288688.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JRy70NMhedj41tKyGZXx701o"
X-purgate-ID: tlsNG-16d1c6/1784544470-F7CCD77B-F1B828CD/0/0
X-purgate-type: clean
X-purgate-size: 8818

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JRy70NMhedj41tKyGZXx701o
Content-Type: multipart/mixed; boundary="------------drgeVDw5p7DFtyiN08a48JEr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <b9de6773-b13d-4975-9484-60d5fefa270a@suse.com>
Subject: Re: [PATCH v2] xen/sched: rt: fix NULL cpupool dereference in
 move_repl_timer()
References: <f4b75c23400b1a9db44596a28ca9683dbf05d419.1784288688.git.oleksii_moisieiev@epam.com>
In-Reply-To: <f4b75c23400b1a9db44596a28ca9683dbf05d419.1784288688.git.oleksii_moisieiev@epam.com>

--------------drgeVDw5p7DFtyiN08a48JEr
Content-Type: multipart/mixed; boundary="------------lVUctXqyi6oiUoHaH9TCFrY0"

--------------lVUctXqyi6oiUoHaH9TCFrY0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjYgMTM6NDUsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBzY2hlZHVs
ZV9jcHVfcm0oKSBjbGVhcnMgdGhlIGNwdXBvb2wgcG9pbnRlciBvZiB0aGUgc2NoZWR1bGlu
Zw0KPiByZXNvdXJjZSBiZWZvcmUgY2FsbGluZyBzY2hlZF9kZWluaXRfcGRhdGEoKToNCj4g
DQo+ICAgICAgc3ItPmNwdXBvb2wgPSBOVUxMOw0KPiAgICAgIC4uLg0KPiAgICAgIHNjaGVk
X2RlaW5pdF9wZGF0YShkYXRhLT5vbGRfb3BzLCBkYXRhLT5wcHJpdl9vbGQsIGNwdSk7DQo+
IA0KPiBGb3IgUlREUywgcnRfZGVpbml0X3BkYXRhKCkgY2FsbHMgbW92ZV9yZXBsX3RpbWVy
KCkgd2hlbiB0aGUNCj4gcmVwbGVuaXNobWVudCB0aW1lciBsaXZlcyBvbiB0aGUgY3B1IGJl
aW5nIHJlbW92ZWQsIGFuZA0KPiBtb3ZlX3JlcGxfdGltZXIoKSBkZXJlZmVyZW5jZXMgZ2V0
X3NjaGVkX3JlcyhvbGRfY3B1KS0+Y3B1cG9vbA0KPiB3aXRob3V0IGNoZWNraW5nIGl0IGZv
ciBOVUxMLiBSZW1vdmluZyBhIHBDUFUgb3duaW5nIHRoZSB0aW1lciBmcm9tDQo+IGFuIFJU
RFMgY3B1cG9vbCB0aGVyZWZvcmUgZGVyZWZlcmVuY2VzIE5VTEwgKyAweDEwICh0aGUgcmVz
X3ZhbGlkDQo+IG1lbWJlcikgYW5kIHBhbmljczoNCj4gDQo+ICAgICAgKFhFTikgRGF0YSBB
Ym9ydCBUcmFwLiBTeW5kcm9tZT0weDFjMjgwMDUNCj4gICAgICAoWEVOKSBXYWxraW5nIEh5
cGVydmlzb3IgVkEgMHgxMCBvbiBDUFUwIHZpYSBUVEJSIC4uLg0KPiAgICAgIChYRU4pIFhl
biBjYWxsIHRyYWNlOg0KPiAgICAgIChYRU4pICAgIFs8Li4uPl0gZmluZF9uZXh0X2JpdCsw
eDc0LzB4YTggKFBDKQ0KPiAgICAgIChYRU4pICAgIFs8Li4uPl0gcnQuYyNtb3ZlX3JlcGxf
dGltZXIrMHhiOC8weGVjIChMUikNCj4gICAgICAoWEVOKQ0KPiAgICAgIChYRU4pIFBhbmlj
IG9uIENQVSAwOg0KPiAgICAgIChYRU4pIENQVTA6IFVuZXhwZWN0ZWQgVHJhcDogRGF0YSBB
Ym9ydA0KPiANCj4gUmVwcm9kdWNlciwgb24gYW55IGhvc3Qgd2l0aCBhdCBsZWFzdCAyIHBD
UFVzIGFuZCBSVERTIGNvbXBpbGVkIGluDQo+IChvYnNlcnZlZCBvbiBhcm02NCwgYnV0IHRo
ZSBwYXRoIGlzIGNvbW1vbiBjb2RlKToNCj4gDQo+ICAgICAgeGwgY3B1cG9vbC1jcmVhdGUg
bmFtZT0idGVzdCIgc2NoZWQ9InJ0ZHMiDQo+ICAgICAgeGwgY3B1cG9vbC1jcHUtcmVtb3Zl
IFBvb2wtMCAxDQo+ICAgICAgeGwgY3B1cG9vbC1jcHUtYWRkIHRlc3QgMQ0KPiAgICAgIHhs
IGNwdXBvb2wtY3B1LXJlbW92ZSB0ZXN0IDENCj4gDQo+IFRoZSBsYXN0IGNvbW1hbmQgbW92
ZXMgdGhlIFJURFMgcmVwbGVuaXNobWVudCB0aW1lciB0byBjcHUxIChmaXJzdA0KPiBhbmQg
b25seSBjcHUgb2YgdGhlIHBvb2wpIGFuZCB0aGVuIHJlbW92ZXMgY3B1MSwgaGl0dGluZyB0
aGUgTlVMTA0KPiBkZXJlZmVyZW5jZSBpbiB0aGUgc2NoZWRfZGVpbml0X3BkYXRhKCkgY2Fs
bGJhY2suDQo+IA0KPiBVc2UgdGhlIGNwdXBvb2wgYmFjay1wb2ludGVyIG9mIHRoZSBzY2hl
ZHVsZXIgaW5zdGVhZCBvZiB0aGUgb25lIG9mDQo+IHRoZSBzY2hlZHVsaW5nIHJlc291cmNl
LiBJdCBpcyBzZXQgYnkgY3B1cG9vbF9jcmVhdGUoKSBiZWZvcmUgYW55DQo+IHBDUFUgY2Fu
IGJlIGFzc2lnbmVkIHRvIHRoZSBwb29sIGFuZCBzdGF5cyB2YWxpZCBmb3IgdGhlIHdob2xl
DQo+IGxpZmV0aW1lIG9mIHRoZSBzY2hlZHVsZXIsIHNvIGl0IGlzIHN0aWxsIGF2YWlsYWJs
ZSB3aGVuDQo+IHJ0X2RlaW5pdF9wZGF0YSgpIHJ1bnMuIE90aGVyIHNjaGVkdWxlcnMgYWxy
ZWFkeSByZWx5IG9uIGl0IHRoZSBzYW1lDQo+IHdheSwgZS5nLiBjcmVkaXQyIGluIGNwdV9h
ZGRfdG9fcnVucXVldWUoKS4NCj4gDQo+IEZpeGVzOiBiNmY1MzM0YWVhY2EgKCJzY2hlZDog
Zml4IGNwdSBvZmZsaW5pbmcgd2l0aCBjb3JlIHNjaGVkdWxpbmciKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9tb2lzaWVpZXZAZXBhbS5jb20+DQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJn
ZW4NCg==
--------------lVUctXqyi6oiUoHaH9TCFrY0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lVUctXqyi6oiUoHaH9TCFrY0--

--------------drgeVDw5p7DFtyiN08a48JEr--

--------------JRy70NMhedj41tKyGZXx701o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpd/NQFAwAAAAAACgkQsN6d1ii/Ey+q
xAf/VsYk4XHc3ZIg2LfmuX1pwWJjv6q37yAOvwkzjpJp0e3yLcXdU3rhGZWCWzD9Duipp/2g/ptZ
L5L9RQ1mNbxy3FPW4Hed4Lbg8OJQF4o70TuIYmFmh5xNE5WD/mfJJig5dDAiMl6ysg61WIwLptQE
Ygas1zY9CyMwqORJQKGbV9+1zCGfQDpIGVhsu+WqPAZwtDgkLmrhI+uoAZMo45SGXPfLFk3d2qIe
QSHIxwzr7NCQyN7TPJw2EFsuXRY3SUwpkQxLTCVrKqAWLBdUt1ybBtswOCIgIaJHr2TD/n4B/Gz2
QWVwpe0CnFdbDX65DiTojgDh//aGcTSlM6DczwuEXA==
=kIKF
-----END PGP SIGNATURE-----

--------------JRy70NMhedj41tKyGZXx701o--

