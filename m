Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F1C4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:22:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366628.1616573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlot1-0007Ui-RW; Mon, 20 Jul 2026 14:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366628.1616573; Mon, 20 Jul 2026 14:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlot1-0007Ub-N2; Mon, 20 Jul 2026 14:22:27 +0000
Received: by outflank-mailman (input) for mailman id 1366628;
 Mon, 20 Jul 2026 14:22:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@swg.vates.tech>)
 id 1wlosz-0007U9-LB
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:22:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlosy-00G6nc-R7
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:22:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@swg.vates.tech>)
 id 6a5e2f14-e002-0a2a0a5209dd-0a2a4503c648-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:22:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@swg.vates.tech>)
 id 6a5e2f20-fae8-0a2a45030019-b9ff1c2293f7-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:22:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f7fe8058b000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Jul 2026 14:22:20 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3AF1782A84;
 Mon, 20 Jul 2026 16:22:19 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=XtsCqU7cC9FKRaGQnP6F0uLaWrZD7JUaj64f5N7e9Hc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Nk+30afo8znuCTV+B049yc7/MLEfVtbrOWr7wpC3zdl8v4gzwGFN38wKoo7ufrG/UXqzOj3cy
 a6SayNtVamgnfHcfaIr/luVYkqTV6SggdQJqKM65Rs9VK6torn4tdKhV4n5K5cuAdvaXRJQTTMP
 9EWI/Bz7nJTg2PByti5mGJzLLAU05e+rw4eYHTyOgOZGaMMCkHwpktjcZ4KnoJLGZE/SJd71sdY
 8/ZmuhiEj0M7m+l3MRSfEqXctMb21x+Kbfi/xg1VXKwbZ0ySil6LETXHPAPUoymD8N1WcM2oylm
 2TZsq772/W1D2rBNm6M/SMLrA84u6VRqQ5NWps/tCs4g==
X-Zone-Loop: a5be2578336758bbf3db7ed1a466ddb10981b3e383f2
x-campaign-type: default
x-transaction-id: 38131ac3-d93a-4849-9905-811409afa04a
x-swg-uid: 01-c8b7a654-b74d-45a3-b74f-09b86dfb2a77
X-Mailer: Sweego
Message-ID:
 <1784557340.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5@vates.tech>
x-swg-bid: 1784557340.8631fc262581453bbf619ec5b2062170.19f7fe8058b000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 20 Jul 2026 16:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20260720081833.4122182-1-jgross@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HdAzCir1xe0SIHnkZnQpzYoS"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784557339458
X-purgate-ID: tlsNG-33051d/1784557344-6EACC4E9-2274FA1C/0/0
X-purgate-type: clean
X-purgate-size: 8304

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HdAzCir1xe0SIHnkZnQpzYoS
Content-Type: multipart/mixed; boundary="------------FuewmTFnlbQwZDSILO4eB5zt";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <0b4df4cf-f587-4c78-b1f9-ac221d79428e@vates.tech>
Subject: Re: [PATCH v2 0/5] stubdom: remove grub-pv
References: <20260720081833.4122182-1-jgross@suse.com>
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
Autocrypt-Gossip: addr=jgross@suse.com; keydata=
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

--------------FuewmTFnlbQwZDSILO4eB5zt
Content-Type: multipart/mixed; boundary="------------HHZ3dAR4jeXV2fUAg51PbSFK"

--------------HHZ3dAR4jeXV2fUAg51PbSFK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDcvMjAyNiDDoCAxMDoyMCwgSnVlcmdlbiBHcm9zcyBhIMOpY3JpdMKgOg0KPiBU
aGUgZ3J1Yi1wdiBzdHViZG9tcyAoMzItIGFuZCA2NC1iaXQpIGFyZSBkaXNhYmxlZCBieSBk
ZWZhdWx0IHNpbmNlDQo+IHNldmVyYWwgeWVhcnMgbm93Lg0KPiANCj4gUmVtb3ZlIHRoZW0g
aW4gb3JkZXIgdG8gZW5hYmxlIHJlbW92aW5nIHF1aXRlIHNvbWUgbW9yZSBjb2RlIGZyb20g
WGVuLg0KPiBJbiBjYXNlIHNvbWVvbmUgaXMgcmVhbGx5IGRlcGVuZGluZyBvbiBncnViLXB2
LCB0aGV5IGNhbiBlYXNpbHkgdGFrZSBpdA0KPiBmcm9tIGFuIG9sZGVyIFhlbiBidWlsZCwg
YXMgdGhlcmUgaXMgbm8gWGVuIHZlcnNpb24gZGVwZW5kZW5jeSBpbg0KPiBncnViLXB2IChh
IHZlcnNpb24gYnVpbHQgMyB5ZWFycyBhZ28gaGFzIGJlZW4gdGVzdGVkIHRvIHN0aWxsIHdv
cmsNCj4gd2l0aCBjdXJyZW50IDQuMjMgc3RhZ2luZyBYZW4pLg0KPiANCj4gTm90ZSB0aGF0
IGFmdGVyIHRoaXMgc2VyaWVzIGhhcyBiZWVuIGNvbW1pdHRlZCwgc29tZSBhZGRpdGlvbmFs
DQo+IGNsZWFudXAgaXMgcG9zc2libGUgYnkgcmVtb3Zpbmcgc3R1YmRvbSBsaWJwY2kgYW5k
IHpsaWIgc3VwcG9ydCwgYnV0DQo+IHRoaXMgd2lsbCByZXF1aXJlIGEgbW9kaWZpY2F0aW9u
IG9mIE1pbmktT1MgZGVwZW5kaW5nIG9uIHRoZXNlIHBhdGNoZXMuDQo+IA0KPiBDaGFuZ2Vz
IGluIFYyOg0KPiAtIG1vdmVkIG9uZSBodW5rIGZyb20gcGF0Y2ggMiB0byBwYXRjaCAxDQo+
IA0KPiBKdWVyZ2VuIEdyb3NzICg1KToNCj4gICAgc3R1YmRvbTogcmVtb3ZlIHN1cHBvcnQg
Zm9yIGdydWItcHYNCj4gICAgc3R1YmRvbTogcmVtb3ZlIHN1cHBvcnQgZm9yIGJ1aWxkaW5n
IGluIDMyLWJpdCBtb2RlDQo+ICAgIHN0dWJkb206IHJlbW92ZSBidWlsZGluZyBvZiBsaWJ4
ZW5ndWVzdCBhbmQgbGlieGVuY3RybA0KPiAgICBkb2NzOiByZW1vdmUgc3RhbGUgc3R1YmRv
bSBlbnRyaWVzIGZyb20gc3R1YmRvbS50eHQNCj4gICAgdG9vbHMvbGlieGVuZ3Vlc3Q6IHJl
bW92ZSBNaW5pLU9TIHNwZWNpZmljIHBhcnRzDQo+IA0KDQpXZSBwcm9iYWJseSB3YW50IHRv
IGFkZCBhIGNoYW5nZWxvZyBub3RlIHRvIHN0YXRlIHRoYXQgdGhpcyBoYXMgYmVlbiANCnJl
bW92ZWQ7IEZlZG9yYSBhdCBsZWFzdCBzdGlsbCBidWlsZHMgdGhpcyBjb21wb25lbnQuDQoN
ClRlZGR5DQo=
--------------HHZ3dAR4jeXV2fUAg51PbSFK
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------HHZ3dAR4jeXV2fUAg51PbSFK--

--------------FuewmTFnlbQwZDSILO4eB5zt--

--------------HdAzCir1xe0SIHnkZnQpzYoS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpeLxoFAwAAAAAACgkQZg+p0QLLz9CO
tgwAmi92WmZUhjtAkiJOoSYQ9s0AANOZ7WVnFYA9/twz8Rp2H5yjy/F77a0te+N9Q1O2pMVVqX5l
fx8ObMVhiHQC/iAtVxkv8bEIDLzQA2XbbhvIoKmzgogK6A7m96jl1IwXnfL0FFThq8rlbkl534s+
dQk3a6VjWW7zxiUF0OqYaeXTtQImkW/pd7fXF4lXgXfO7CcMWQA7s4wiwS6WK6/AjoU6HDxBDhj9
l1rS4sJbz7gkDmwnR+MU077VUJ7HzKuJPJ98SdoROG0qhZ4jq+xFFjS9iPJ2TcqVEVZFRyc7CDes
nnjc8mShiJvlCAPUhFQv3/ZfXUne0uRTJIGTuD8bp1T7H/bVRTpcwwEJGY/L6ofq8oXhS851QLZH
ARlWW/gA9oCgqmLz5jQJH1gvjoVCjevYYxOZ0Gsw84duai4ceb+UfCWo3YFWYM7vcEi2zJws0I9D
VqiuqYzu5QsufzrRk9F+Jgm2kFwuBMJxWwkXztHroOIhUcS0dLMwvMulr6Im
=djeV
-----END PGP SIGNATURE-----

--------------HdAzCir1xe0SIHnkZnQpzYoS--

