Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B4AC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 11:49:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371618.1619101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woJoz-0006i9-SH; Mon, 27 Jul 2026 11:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371618.1619101; Mon, 27 Jul 2026 11:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woJoz-0006i2-OU; Mon, 27 Jul 2026 11:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1371618;
 Mon, 27 Jul 2026 11:48:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@swg.vates.tech>)
 id 1woJoz-0006hw-4d
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 11:48:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woJoy-001KPL-Dp
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 13:48:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@swg.vates.tech>)
 id 6a67458a-5cb7-0a2a0a5109dd-0a2a4502db7a-46
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 13:48:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@swg.vates.tech>)
 id 6a674593-6ca4-0a2a45020019-b9ff1c22a4c7-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 13:48:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fa367bc22000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Jul 2026 11:48:32 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 94EA481569;
 Mon, 27 Jul 2026 13:48:31 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=IY9Bg61VgQf5vyPeQAbWndTeziubbXY2OlS0b+laghg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OZ3bcJNKFNU8I2ff5/JyApX2qWPePLzq+Mrd+brUs65+NP4sbQ1QMItnz6Sc4dZd1oZvN+BfM
 eqwVTnY0v7jAC8KScnnyfgrsE28ecvse95kmAPgIOelK0SrdwQobPYII4mAkyRuFJwsWeataC7w
 krcsPf9/R+3hp0ioHSrFeks7AoOgEb6zpkX414VaJHwzv5algmkSoIVcdoyjw8baXdGOA6ts3xT
 ORqzrmyxatjK2n7dturkJKxS/mmaRh2NdBGW4lVo1JYOZCfCblkSYVXEeQAbqXriPvLVMZvPF4E
 Ic3xhng6pkAvMXfFsuu9U3DPA/UMTsai3kENrrddWAAQ==
X-Zone-Loop: c566117b47466f8989ccb4cfb693a610f2d429b90c93
x-campaign-type: default
x-transaction-id: 5d0b9851-7df6-4ed2-8de0-f7c73a6d725c
x-swg-uid: 01-fc1a42b0-3d00-4710-8724-24286bc5400f
X-Mailer: Sweego
Message-ID:
 <1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099@vates.tech>
x-swg-bid: 1785152912.8631fc262581453bbf619ec5b2062170.19fa367bc22000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 27 Jul 2026 13:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
To: Stephen Cheng <stephen.cheng@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20260727071709.196088-1-stephen.cheng@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260727071709.196088-1-stephen.cheng@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------01IDXJTFZiIPmT5HoVJ0a0VB"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785152911848
X-purgate-ID: tlsNG-720697/1785152916-30DC12AC-047FEE60/0/0
X-purgate-type: clean
X-purgate-size: 9001

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------01IDXJTFZiIPmT5HoVJ0a0VB
Content-Type: multipart/mixed; boundary="------------O0I4KPDkcgwLFnLV6VC5K873";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Stephen Cheng <stephen.cheng@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <66264f5c-415a-44fa-b9ac-46ea74f69193@vates.tech>
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
References: <20260727071709.196088-1-stephen.cheng@citrix.com>
In-Reply-To: <20260727071709.196088-1-stephen.cheng@citrix.com>

--------------O0I4KPDkcgwLFnLV6VC5K873
Content-Type: multipart/mixed; boundary="------------M6gVVtXI7zXs23Ks5gWUABGV"

--------------M6gVVtXI7zXs23Ks5gWUABGV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjcvMDcvMjAyNiDDoCAwOToyMCwgU3RlcGhlbiBDaGVuZyBhIMOpY3JpdMKgOg0KPiBW
aXJ0dWFsIFZNTE9BRC9WTVNBVkUgbGV0cyBhbiBMMSBndWVzdCBleGVjdXRlIFZNTE9BRCBh
bmQgVk1TQVZFDQo+IHdpdGhvdXQgaW50ZXJjZXB0cy4gIFdpdGhvdXQgaXQsIFhlbiBoYXMg
dG8gbWFwIHRoZSBMMS1wcm92aWRlZCBWTUNCDQo+IGFuZCByZS1leGVjdXRlIGVhY2ggaW5z
dHJ1Y3Rpb24gaW4gTDAsIGNvbXBsaWNhdGluZyBzZWN1cml0eS1zZW5zaXRpdmUNCj4gc3Rh
dGUgaGFuZGxpbmcuDQo+IA0KPiBNYWtlIFZNU0FWRXZpcnQgYSBoYXJkIHJlcXVpcmVtZW50
IGZvciBuZXN0ZWQgU1ZNLiAgQWR2ZXJ0aXNlIGl0IHRvDQo+IEwxLCBlbmFibGUgaXQgd2hl
biBMMSBlbmFibGVzIFNWTSwgYW5kIHJlbW92ZSB0aGUgbmVzdGVkIFZNTE9BRC9WTVNBVkUN
Cj4gZW11bGF0aW9uIHBhdGguICBBbnkgcmVtYWluaW5nIGludGVyY2VwdCB0aGVyZWZvcmUg
Y29tZXMgZnJvbSBhIGd1ZXN0DQo+IHdoaWNoIGhhcyBub3QgZW5hYmxlZCBTVk0gYW5kIHJl
Y2VpdmVzICNVRC4NCj4gDQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC04
DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gQ2hlbmcgPHN0ZXBoZW4uY2hlbmdAY2l0cml4
LmNvbT4NCj4gLS0tDQo+ICAgZG9jcy9kZXNpZ25zL25lc3RlZC1zdm0tY3B1LWZlYXR1cmVz
Lm1kIHwgIDExICsrKw0KPiAgIHhlbi9hcmNoL3g4Ni9jcHUtcG9saWN5LmMgICAgICAgICAg
ICAgICB8ICAgMyArLQ0KPiAgIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jICAg
ICAgICB8ICAyNCArKysrLS0NCj4gICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAg
ICAgICAgICAgfCAxMDAgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgeGVuL2FyY2gv
eDg2L2h2bS9zdm0vc3ZtLmggICAgICAgICAgICAgIHwgICAyIC0NCj4gICA1IGZpbGVzIGNo
YW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RvY3MvZGVzaWducy9uZXN0ZWQtc3ZtLWNwdS1mZWF0dXJlcy5tZCBiL2RvY3Mv
ZGVzaWducy9uZXN0ZWQtc3ZtLWNwdS1mZWF0dXJlcy5tZA0KPiBpbmRleCBjZTE2OGU2OGUx
Li43OTg0ODBiMjU5IDEwMDY0NA0KPiAtLS0gYS9kb2NzL2Rlc2lnbnMvbmVzdGVkLXN2bS1j
cHUtZmVhdHVyZXMubWQNCj4gKysrIGIvZG9jcy9kZXNpZ25zL25lc3RlZC1zdm0tY3B1LWZl
YXR1cmVzLm1kDQo+IEBAIC0xMDksMyArMTA5LDE0IEBAIGxlYWYgODAwMDAwMEE6ZWR4DQo+
ICAgICBVc2luZyBpdCBpbiBMMCByZWR1Y2VzIHRoZSBjaGFuY2UgdGhhdCB3ZSdsbCBtYWtl
IHNvbWUgc29ydCBvZiBlcnJvcg0KPiAgICAgaW4gdGhlIGRlY29kZSBwYXRoLiAgQW5kIGlm
IGhhcmR3YXJlIHN1cHBvcnRzIGl0LCBpdCdzIGVhc3kgZW5vdWdoDQo+ICAgICB0byBwcm92
aWRlIHRvIHRoZSBMMS4NCj4gKw0KPiArLSAxNSBgVkxvYWRTYXZlYCAqVmlydHVhbCBWTUxP
QUQvVk1TQVZFKjogUmVxdWlyZSBmb3IgTDAsIHByb3ZpZGUgdG8gTDENCj4gKw0KPiArICBX
aXRob3V0IHRoaXMgZmVhdHVyZSBYZW4gaGFzIHRvIGludGVyY2VwdCB0aGUgTDEgaHlwZXJ2
aXNvcidzIFZNTE9BRA0KPiArICBhbmQgVk1TQVZFIGluc3RydWN0aW9ucyBhbmQgZW11bGF0
ZSB0aGVtIGJ5IHJlLWV4ZWN1dGluZyB0aGUgcmVhbA0KPiArICBpbnN0cnVjdGlvbiBvbiBh
IG1hcHBlZCBjb3B5IG9mIHRoZSBMMS1zdXBwbGllZCBWTUNCLiAgVGhhdCBwYXRoDQo+ICsg
IGhhbmRsZXMgYSBjb21wbGV4LCBzZWN1cml0eS1zZW5zaXRpdmUgc3Vic2V0IG9mIHN0YXRl
ICh0aGUgaGlkZGVuDQo+ICsgIHNlZ21lbnQgZGVzY3JpcHRvcnMgZm9yIEZTL0dTL1RSL0xE
VFIgcGx1cyB0aGUgU1lTQ0FMTC9TWVNFTlRFUg0KPiArICBNU1JzKSwgc28gb24gZmFpdGhm
dWxuZXNzIGdyb3VuZHMgd2UnZCBtdWNoIHJhdGhlciBsZXQgdGhlIGhhcmR3YXJlDQo+ICsg
IGRvIGl0LiAgV2hlbiBwcmVzZW50LCB0aGUgaW5zdHJ1Y3Rpb25zIGV4ZWN1dGUgbmF0aXZl
bHkgaW4gdGhlIGd1ZXN0DQo+ICsgIHdpdGhvdXQgYSAjVk1FWElULCB3aGljaCBpcyBib3Ro
IHNpbXBsZXIgYW5kIGZhc3Rlci4NCg0KSSdtIG5vdCBjb252aW5jZWQgbWFraW5nICJWTVNB
VkV2aXJ0IiBtYW5kYXRvcnkgaXMgYSBnb29kIGlkZWEsIGluIA0KcGFydGljdWxhciwgdGhl
cmUgaXMgYSBlcnJhdGEgKDE0NTQgLSBQcm9jZXNzb3IgTWF5IExvZyBVbmV4cGVjdGVkIExT
IA0KTUNFIEVycm9yIFdoZW4gRXhlY3V0aW5nIFZpcnR1YWxpemVkIFZNTE9BRCBvciBWaXJ0
dWFsaXplZCBWTVNBVkUpIG9uIA0KRmFtaWx5IDE5aCByZWdhcmRpbmcgdGhpcyBmZWF0dXJl
Lg0KDQpIYWQgeW91IGNvbnNpZGVyZWQgaW1wcm92aW5nIHRoZSBjdXJyZW50IGltcGxlbWVu
dGF0aW9uIG9mIHZpcnR1YWxpemVkIA0KVk1MT0FEL1ZNU0FWRSA/IEFJVUksIHRoZSB3YXkg
WGVuIGN1cnJlbnRseSBpbXBsZW1lbnRzIHRoaXMgaW5zdHJ1Y3Rpb24gDQooYnkgbWFwcGlu
ZyB0aGUgTDEgVk1DQiB0aGVuIGNhbGxpbmcgdm1sb2FkL3Ztc2F2ZSBvbiBpdCkgaXMgbW9y
ZSBvZiBhIA0KaW1wbGVtZW50YXRpb24gY2hvaWNlIHRoYW4gYSByZXF1aXJlbWVudC4NCg0K
QSBiZXR0ZXIgKGF0IGxlYXN0LCBsaWtlbHkgc2FmZXIpIHdheSB0byBlbXVsYXRlIHN1Y2gg
aW5zdHJ1Y3Rpb25zIChhbmQgDQpub3QgcmVseWluZyBvbiBWTVNBVkV2aXJ0KSB3b3VsZCBi
ZSB0byBjb3B5IHBhcnRzIG9mIEwxIFZNQ0IgZnJvbS90byBMMCANClZNQ0IgYW5kIGxldCBY
ZW4gcGVyZm9ybSB0aGUgYXBwcm9wcmlhdGUgdm1sb2FkL3Ztc2F2ZSBvbiBpdHMgb3duIFZN
Q0JzIA0KYXMgdXN1YWwuDQoNClRlZGR5DQo=
--------------M6gVVtXI7zXs23Ks5gWUABGV
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------M6gVVtXI7zXs23Ks5gWUABGV--

--------------O0I4KPDkcgwLFnLV6VC5K873--

--------------01IDXJTFZiIPmT5HoVJ0a0VB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpnRY8FAwAAAAAACgkQZg+p0QLLz9AJ
aAv8CmVWiwhtIJJuzp9q+locFhcVOSN8AhhLVehKZ80Q1agzMIAvB1JIucVLG+fS+LalErEggfM4
8TU28zsEicWMt5s4fgnFZsNMQkeiubGotro4SAMzYuyjyxJz8Ofh/THfy3xoLBqsS/OrT81GM4YG
SpVeo/UyOFVdFlbA0azkryCsxpIG1rFr0uRuYFwHCN3+AVhDWke6i06Do99v8sMGlmGvSDxmfIjL
ckJq5zKd+3WA6T9taxhfsFWec+aZeXaCef7f29ClkNb/ihe7jQwHeQ7U7ybf5d+0IKzJXovZtnOA
0x3D9s4N1E7EVkCapxeR6SIIAvQf+58/Nc1DkWhLfXkl664yCeD+fU06UGBtScLOn2UiO5qV8ZM8
EJPS0sIFYwZ60mEC9UHSjC3urQi9Pi4hsTC3Xi3vh3iN864V/KBVD25bKx+i2DjPkdFA6TQYzLbu
wZyle2sZJLW4vMGGkH5rzhKZrPpkubDVsv+UYSaYW7x5V4JwWhYh4KIMc3yL
=8kGS
-----END PGP SIGNATURE-----

--------------01IDXJTFZiIPmT5HoVJ0a0VB--

