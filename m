Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F2606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=nOjeHJru
Received: from list by lists.xenproject.org with outflank-mailman.1456807.1669908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJRoS-0003PK-Nc; Wed, 21 Oct 2026 08:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456807.1669908; Wed, 21 Oct 2026 08:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJRoS-0003PD-KR; Wed, 21 Oct 2026 08:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1456807;
 Wed, 21 Oct 2026 08:36:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f@swg.vates.tech>)
 id 1xJRoQ-0003P5-S4
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 08:36:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJRoP-0072Ui-LY
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 10:36:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f@swg.vates.tech>)
 id 6ad87997-bab6-0a2a0a5309dd-0a2a4507bbf6-0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 10:36:39 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f@swg.vates.tech>)
 id 6ad87996-b4ea-0a2a45070019-b9ff1c22b1b7-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 10:36:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15d9aee9c000f79f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 08:36:37 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3E6FB8050D;
 Wed, 21 Oct 2026 10:36:36 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=FQTrxWiSfZEV75zYaR1Sb7n3xsNIZ86HfzJH8VOlPAY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nOjeHJruB+7jbYROEAeGaQNpFABL/45XYASG314KVqTiUoV3J24GVInRqvuH+6sDqIyaL4Lec
 ZKkmQqkijT/xs8pn/+uALOEeyvtYVY7hl7cq5RMuY6gjDEYnQACS+sGuOLtC7NshvaAQu/05wiF
 nkr1dNLpuTX7/XGvYG06A7zHSXmDGYPPdc2abDSk4efjfalyz1k181js9i4Jm6fQkPRzPpiFrbG
 11hwGk/GROwtnCZuV7JvKOXgPpnZ4BumHX/OObw1U29nfo6876dByBpsrUjde4hHorFGiTqrBDA
 dHnD3I/7K34G6BTp3k+pZ3xEvYcfIlX5mMMhSMSlHkZQ==
X-Zone-Loop: 1d3cd2ccd68871385e2d5d46764634f7d4e39ee37c4c
x-campaign-type: default
x-transaction-id: f6f03b53-b66b-477c-b32c-5ab93bd8a7cb
x-swg-uid: 01-a135f7c7-6078-4a16-9501-b3cfda85988d
X-Mailer: Sweego
Message-ID:
 <1792571797.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f@vates.tech>
x-swg-bid: 1792571797.8631fc262581453bbf619ec5b2062170.1a15d9aee9c000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 21 Oct 2026 10:36:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: Don't swap the IVMD read and write
 permissions
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com
References: <20261020220821.3681692-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020220821.3681692-1-stefano.stabellini@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TRQmbTh4QmqHUI3MZAriA1Hr"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792571796393
X-purgate-ID: tlsNG-ef75cf/1792571799-370DDAE4-C34369EE/0/0
X-purgate-type: clean
X-purgate-size: 6505
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TRQmbTh4QmqHUI3MZAriA1Hr
Content-Type: multipart/mixed; boundary="------------GCvhsxvzdal0v8O15occTQbE";
 protected-headers="v1"; hp="clear"
Message-ID: <bb85407c-af7e-4f2b-a9e8-01a20ac66488@vates.tech>
Date: Wed, 21 Oct 2026 10:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: Don't swap the IVMD read and write
 permissions
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com
References: <20261020220821.3681692-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020220821.3681692-1-stefano.stabellini@amd.com>

--------------GCvhsxvzdal0v8O15occTQbE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjEvMTAvMjAyNiDDoCAwMDoxMCwgU3RlZmFubyBTdGFiZWxsaW5pIGEgw6ljcml0wqA6
DQo+IFBlciB0aGUgSVZNRCBGbGFncyBkZWZpbml0aW9uLCBiaXQgMSBpcyBJUiBhbmQgYml0
IDIgaXMgSVcsIG1hdGNoaW5nDQo+IEFDUElfSVZNRF9SRUFEIGFuZCBBQ1BJX0lWTURfV1JJ
VEUuICBwYXJzZV9pdm1kX2Jsb2NrKCkgdGFrZXMgaXcgZnJvbQ0KPiB0aGUgZm9ybWVyIGFu
ZCBpciBmcm9tIHRoZSBsYXR0ZXIsIHNvIGEgdW5pdHkgcmFuZ2UgZmlybXdhcmUgZGVjbGFy
ZXMNCj4gcmVhZC1vbmx5IGlzIG1hcHBlZCB3cml0ZS1vbmx5LCBhbmQgdmljZSB2ZXJzYS4N
Cj4gDQo+IFJhbmdlcyB3aXRoIGJvdGggcGVybWlzc2lvbnMsIGluY2x1ZGluZyBYZW4ncyBv
d24sIGFyZSB1bmFmZmVjdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYyB8IDQgKystLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9hY3BpLmMNCj4gaW5kZXggNDY4ODkw
ODgyNC4uZmUzZGVlODcyYyAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2FjcGkuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfYWNwaS5jDQo+IEBAIC00MTQsOCArNDE0LDggQEAgc3RhdGljIGludCBfX2lu
aXQgcGFyc2VfaXZtZF9ibG9jayhjb25zdCBzdHJ1Y3QgYWNwaV9pdnJzX21lbW9yeSAqaXZt
ZF9ibG9jaykNCj4gICAgICAgICAgIGV4Y2x1c2lvbiA9IHRydWU7DQo+ICAgICAgIGVsc2Ug
aWYgKCBpdm1kX2Jsb2NrLT5oZWFkZXIuZmxhZ3MgJiBBQ1BJX0lWTURfVU5JVFkgKQ0KPiAg
ICAgICB7DQo+IC0gICAgICAgIGl3ID0gaXZtZF9ibG9jay0+aGVhZGVyLmZsYWdzICYgQUNQ
SV9JVk1EX1JFQUQ7DQo+IC0gICAgICAgIGlyID0gaXZtZF9ibG9jay0+aGVhZGVyLmZsYWdz
ICYgQUNQSV9JVk1EX1dSSVRFOw0KPiArICAgICAgICBpdyA9IGl2bWRfYmxvY2stPmhlYWRl
ci5mbGFncyAmIEFDUElfSVZNRF9XUklURTsNCj4gKyAgICAgICAgaXIgPSBpdm1kX2Jsb2Nr
LT5oZWFkZXIuZmxhZ3MgJiBBQ1BJX0lWTURfUkVBRDsNCj4gICAgICAgfQ0KPiAgICAgICBl
bHNlDQo+ICAgICAgIHsNCg0KVGhhdCBwcm9iYWJseSB3YW50cyBhIEZpeGVzOiBub3RlLg0K
Rml4ZXM6IGU5NDFhYmQ3Y2FiMSAoIkFDUEk6IGVsaW1pbmF0ZSBkdXBsaWNhdGUgSVZSUyBk
ZWZpbml0aW9ucyIpDQoNCldpdGggdGhhdCwNClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8
dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCg0KVGVkZHkNCg==

--------------GCvhsxvzdal0v8O15occTQbE--

--------------TRQmbTh4QmqHUI3MZAriA1Hr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrYeZEFAwAAAAAACgkQZg+p0QLLz9BK
eAwAkjj2WNaerM8QMpHxvOXUkY3ukEkiHBRARV6AsC2kkHMPy7ruxTsJmMTq8jFBAIod9PjK9BFn
jUZ3vwQO703bDtfgL5/f0XVA7r3LDWqH9AfCSn6NJyCKEP8PHbeKIUNf1JW86s/+F0vrwir8hwos
P6afzaYSUKOolDCfOhRsxjij55G9LZSAKOki+dou/+OMYTacOP1Z7tbRbWr3fT1z/YUoqxkQnmH/
tL0cWSiHO6vamT2OnoeQ8fkAY33VEN9f2Vh2HHMwi4NGYnF7S6PHWUhZK8QFuNE4+3uAlBRegvgC
01LODJsIzhdxffjaSQcjasZ6fsrt0Bmh7Rq/JeILpwg9LXbvdM61FlFL3e9n2OeWoFtmNty0WOKl
Y08xiyeYHB2KwlHdjt8XmOI4i6n7zPpplX20aYCW0M1usiIYiyE3A6gKr9Ebv1r0sum7B+WHOykJ
0fLu6Iegz7kUq0QRk/W/EEWSCsh2JHh+XuGp7KHpf8UzFBDtTt2+7tZgDdYF
=Ukpt
-----END PGP SIGNATURE-----

--------------TRQmbTh4QmqHUI3MZAriA1Hr--

