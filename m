Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D442CC5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 10:11:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396233.1634205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwzjd-0005YN-2v; Thu, 20 Aug 2026 10:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396233.1634205; Thu, 20 Aug 2026 10:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwzjd-0005YG-0O; Thu, 20 Aug 2026 10:10:57 +0000
Received: by outflank-mailman (input) for mailman id 1396233;
 Thu, 20 Aug 2026 10:10:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01ea6ee71000c4f3@swg.vates.tech>)
 id 1wwzjb-0005YA-6w
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 10:10:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwzja-003Y1A-K8
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:10:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01ea6ee71000c4f3@swg.vates.tech>)
 id 6a86d2a4-2eae-0a2a0a5409dd-0a2a4508a10e-32
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 12:10:54 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01ea6ee71000c4f3@swg.vates.tech>)
 id 6a86d2ad-f659-0a2a45080019-b9ff1c12a08d-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 12:10:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01ea6ee71000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 10:10:51 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 098BB83827;
 Thu, 20 Aug 2026 12:10:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=4qm5c9scI5k9QrGgDOXysqmxP7HMqR6dBOr7citWS2c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=REzRSqUwR3D48enDnfwZiQSPNoD9Bn7y8q2mRfqQ7MEqD32tXPzbWYfmwR+cufg2hV161/Jqi
 m54GCOcYew4FtC50JNhf1aHm++NUdGGV27uJBt2M5k/zQByCxQ6YRmiiaczrTSfSwM1qc8wbMmu
 oo4WmZH3ANiuZuCjIzIcGhyT4Yh15jBn74skKPpfvF06E37LE4tsKs8XJwhybRkFwEQJqT93Xks
 VhvoLrW8vZqyWy4ygeYdz/8wX/gOJDZel9dvm3mlmqu3KJJ2EZfS9qsQxwR8vArotIsB57NeC2x
 TlNWbxI+XcKknvnk3AmDvPwGNysSxasW8bHYW9mkDYIg==
X-Zone-Loop: 86596bae23cc853c6486b7a5ab5ca5bdd3317fa47225
x-campaign-type: default
x-transaction-id: b82c9f06-7a01-49c6-8e5b-d42ab2bc3da1
x-swg-uid: 01-a14080de-57a1-4062-b9e2-93e711107e14
X-Mailer: Sweego
Message-ID:
 <1787220651.8631fc262581453bbf619ec5b2062170.1a01ea6ee71000c4f3@vates.tech>
x-swg-bid: 1787220651.8631fc262581453bbf619ec5b2062170.1a01ea6ee71000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 20 Aug 2026 12:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 03/14] x86/domain: Defer domain iommu
 initialization.
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1763569135.git.teddy.astie@vates.tech>
 <c4a81e284ec202a34b8e983679dead4dc2ae248a.1763569135.git.teddy.astie@vates.tech>
 <4fed56c0-b8b1-408b-bc60-7a1afe05ffa2@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <4fed56c0-b8b1-408b-bc60-7a1afe05ffa2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4D01FwRuybd5lRXVN88F05Eb"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787220651142
X-purgate-ID: tlsNG-c1860d/1787220654-D477387B-F8BBB418/0/0
X-purgate-type: clean
X-purgate-size: 7437

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4D01FwRuybd5lRXVN88F05Eb
Content-Type: multipart/mixed; boundary="------------cr0n2RVqAuRFj7RSMvHdCIH9";
 protected-headers="v1"; hp="clear"
Message-ID: <e92e2be6-75b4-4021-9d06-166d7e4bab39@vates.tech>
Date: Thu, 20 Aug 2026 12:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 03/14] x86/domain: Defer domain iommu
 initialization.
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1763569135.git.teddy.astie@vates.tech>
 <c4a81e284ec202a34b8e983679dead4dc2ae248a.1763569135.git.teddy.astie@vates.tech>
 <4fed56c0-b8b1-408b-bc60-7a1afe05ffa2@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <4fed56c0-b8b1-408b-bc60-7a1afe05ffa2@suse.com>

--------------cr0n2RVqAuRFj7RSMvHdCIH9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTkvMDgvMjAyNiDDoCAxNzoxMCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjAuMTEuMjAyNSAxMjowOSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBGb3IgdGhlIElPTU1V
IHJlZGVzaWduLCB0aGUgaW9tbXUgY29udGV4dCBwYWdldGFibGUgaXMgZGVmaW5lZCBvbmNl
IGR1cmluZw0KPj4gaW5pdGlhbGl6YXRpb24uIFdoZW4gcmV1c2luZyBQMk0gcGFnZXRhYmxl
LCB3ZSB3YW50IHRvIGVuc3VyZSB0aGF0IHRoaXMNCj4+IHBhZ2V0YWJsZSBpcyBwcm9wZXJs
eSBpbml0aWFsaXplZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5IFRlZGR5IEFzdGllIDx0ZWRk
eS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gIEZyb20gd2hhdCBpcyBzYWlkLCBJIGZvciBv
bmUgY2Fubm90IGRlZHVjZSB3aHkgdGhlIG1vdmUgaXMgKGEpIG5lY2Vzc2FyeSBhbmQNCj4g
KGIpIGNvcnJlY3QgLyBzYWZlIHRvIGRvLg0KPiANCj4gSmFuDQo+IA0KPj4gLS0tIGEveGVu
L2FyY2gveDg2L2RvbWFpbi5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4+
IEBAIC05MjcsOSArOTI3LDYgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9t
YWluICpkLA0KPj4gICAgICAgaWYgKCAocmMgPSBpbml0X2RvbWFpbl9pcnFfbWFwcGluZyhk
KSkgIT0gMCApDQo+PiAgICAgICAgICAgZ290byBmYWlsOw0KPj4gICANCj4+IC0gICAgaWYg
KCAocmMgPSBpb21tdV9kb21haW5faW5pdChkLCBjb25maWctPmlvbW11X29wdHMpKSAhPSAw
ICkNCj4+IC0gICAgICAgIGdvdG8gZmFpbDsNCj4+IC0NCj4+ICAgICAgIHBzcl9kb21haW5f
aW5pdChkKTsNCj4+ICAgDQo+PiAgICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQ0KPj4g
QEAgLTk0OCw2ICs5NDUsOSBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21h
aW4gKmQsDQo+PiAgICAgICBlbHNlDQo+PiAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7IC8qIE5vdCBIVk0gYW5kIG5vdCBQVj8gKi8NCj4+ICAgDQo+PiArICAgIGlmICggKHJj
ID0gaW9tbXVfZG9tYWluX2luaXQoZCwgY29uZmlnLT5pb21tdV9vcHRzKSkgIT0gMCApDQo+
PiArICAgICAgICBnb3RvIGZhaWw7DQo+PiArDQo+PiAgICAgICBpZiAoIChyYyA9IHRzY19z
ZXRfaW5mbyhkLCBYRU5fQ1BVSURfVFNDX01PREVfREVGQVVMVCwgMCwgMCwgMCkpICE9IDAg
KQ0KPj4gICAgICAgew0KPj4gICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiAN
Cg0KKGEpDQoNCkZvciBub3cgaW4gWGVuLCBpb21tdV9kb21haW5faW5pdCgpIGRvZXNuJ3Qg
Y3JlYXRlIG9yIHJldXNlIGFueSANCnBhZ2V0YWJsZSAoZm9yIGhhcF9wdF9zaGFyZSkgKnll
dCosIHRoaXMgaXMgZGVmZXJyZWQgdG8gDQpwZXItaW1wbGVtZW50YXRpb24gY29kZSB0aGF0
IGlzIGNhbGxlZCBtdWNoIGxhdGVyLg0KDQpUaGUgZW5kIGlkZWEgaXMgdG8gbW92ZSBzb21l
IG9mIHRoZSBwYWdldGFibGUgaW5pdGlhbGl6YXRpb24vdHJhY2tpbmcgdG8gDQppb21tdV9k
b21haW5faW5pdCgpICh0aGVuIHRvIGlvbW11X2NvbnRleHRfaW5pdCgpKSwgYnV0IGluIHRo
ZSANCmhhcF9wdF9zaGFyZSBjYXNlLCB0aGUgUDJNIG5lZWRzIHRvIGJlIGluaXRpYWxpemVk
IGZpcnN0IChlLmcgdGhyb3VnaCANCnBhZ2luZ19lbmFibGUpLg0KDQooYikNCg0KVGhlcmUg
aXMgbm8gZGVwZW5kZW5jeSBvZiBpb21tdV9kb21haW5faW5pdCgpIHRvIGJlIGNhbGxlZCBi
ZWZvcmUgDQpodm1fZG9tYWluX2luaXRpYWxpc2UoKS9wdl9kb21haW5faW5pdGlhbGlzZSgp
LiBJbiBwYXJ0aWN1bGFyLCB3ZSdyZSBub3QgDQphZGRpbmcgbmV3IHAybSBlbnRyaWVzIHRv
IHRoZSBndWVzdCB0aGF0IHdvdWxkIHJlcXVpcmUgSU9NTVUgbWFwcGluZ3MuDQoNClNvIEkg
ZG9uJ3Qgc2VlIGFueSBpc3N1ZSBtb3ZpbmcgdGhlIGNhbGwgbGF0ZXIuDQoNCkFJQSwgaXQn
cyBtb3N0bHkgcHJlcGFyYXRvcnkgcGF0Y2hlcyAodG8gYXZvaWQgbWFraW5nIHRoZSBuZXh0
IG9uZXMgbW9yZSANCmNvbXBsZXggdGhhbiB0aGV5IGFscmVhZHkgYXJlKTsgaXQncyBub3Qg
bmVjZXNzYXJpbHkgdXNlZnVsIG9uIGl0cyBvd24uDQoNClRlZGR5DQo=

--------------cr0n2RVqAuRFj7RSMvHdCIH9--

--------------4D01FwRuybd5lRXVN88F05Eb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqG0qoFAwAAAAAACgkQZg+p0QLLz9DQ
9Qv/Sap6WTImu6WRERId9yjur0naFGd+6P9WGDszUb+YyxpKO6L9KNJUckNrrHljxejkxz3CdJU+
0PKHbPje7mIpyWoaRivjBgMJPlMu8V0i5GuBc3kWzmrWAdWosUaF6OJ/l42rX8n3P1d8VMFPsyt8
OAs2BowZSANmPH8tJFdzQ9MjTSpwkMb/CxXg2cbsyi4Y92/ltqYJyY+v42tOYEy6+f2Vc6+VvUGE
9DYLDtWQqjMFtPF4ZUh8eXK1cDQq7SDIAwsmIFyrKoe9xQ+pMyduELasxy0Yaw7dHD+x7nT6fZg0
QqW0sf8S80CaImFul2BZh/zerMpz+IBHcFlCZnm4Ye89sR/+cZQrpGGJJThi+4/TR81GCe8B85Iz
PA/FFjozxcN6+w0jnn3B+PBbfi1qlutrlW8/TykcNocjFzlzpbgfKBPdyS/arsyUJ/0Q4jwjsECq
JM3rlpyiqn9Dv5bdt3Aote8Jd25F29A1jEUWxV2+tOroj7NefxSYS8Ut8tb1
=iB/S
-----END PGP SIGNATURE-----

--------------4D01FwRuybd5lRXVN88F05Eb--

