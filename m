Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C8CCC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446859.1662959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZGj-0000ta-Ri; Tue, 13 Oct 2026 09:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446859.1662959; Tue, 13 Oct 2026 09:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZGj-0000tT-OS; Tue, 13 Oct 2026 09:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1446859;
 Tue, 13 Oct 2026 09:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134b280a30008425@swg.vates.tech>)
 id 1xGZGi-0000tN-4s
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZGh-00Et7S-Gc
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:57:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134b280a30008425@swg.vates.tech>)
 id 6ace009b-8faa-0a2a0a5109dd-0a2a450cc04a-34
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:57:59 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134b280a30008425@swg.vates.tech>)
 id 6ace00a7-f479-0a2a450c0019-b9ff1c238bd3-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:57:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a134b280a30008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 09:57:56 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 150D281B76;
 Tue, 13 Oct 2026 11:57:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=tshKmaV+xywsb1zShKCMqcDk2ylft75PjoDWAgm3asU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=uG4TcqV4QWcxNUJ2n3RokwwMCej3/KshHAZ6Wa89naakpISvykSNNosAufMXufZ0+zKnECk+Q
 VasN+Laz0CXARVF/MS8ESpb6xsy3AQTtLL7ki6ckc1ZyGzbXK5segOlMu4gEG276kb08SKFj0Zm
 gEuDgvETMIkAT1cKo3NJL25Np2jy6DVjCsoUBxPwsWYQV8EbYy8OwySvh3dcS/nUhrR9Kus11VE
 JpGtD26HJxyjwpY0Om0yzAKxH0TdTifsdDbDJxqw0zSWW5EzI78L+3whG/o4YPFjC5c6aZttxlZ
 4csRXuTUuqJKFdlOI9ZS0pfDaFx2qJcAdmYhlP5dgWFQ==
X-Zone-Loop: 9f8855f2e7ae52dbc8872df14c2f14d5793caf492770
x-campaign-type: default
x-transaction-id: 1c77507a-33a2-45fb-a382-55bad6157cdc
x-swg-uid: 01-0e6dd9ed-dd8e-4dee-84dc-fa29366c6750
X-Mailer: Sweego
Message-ID:
 <1791885476.8631fc262581453bbf619ec5b2062170.1a134b280a30008425@vates.tech>
x-swg-bid: 1791885476.8631fc262581453bbf619ec5b2062170.1a134b280a30008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 13 Oct 2026 11:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace/vvmx: Correctly report TRC_HVM_NESTEDFLAG flag
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1791882665.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@vates.tech>
 <8b1e612d-395c-46ad-b327-2718dd9d83cb@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <8b1e612d-395c-46ad-b327-2718dd9d83cb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------X8Kr5Z5rxbTXfQI86Cxa6Atz"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791885475182
X-purgate-ID: tlsNG-d25034/1791885479-50B3DA5B-932B335C/0/0
X-purgate-type: clean
X-purgate-size: 7749

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------X8Kr5Z5rxbTXfQI86Cxa6Atz
Content-Type: multipart/mixed; boundary="------------g0CrHjBGwJyi0AFFeybRy0Or";
 protected-headers="v1"; hp="clear"
Message-ID: <fd405d4a-3af8-4167-9c59-e2b6e0509ca0@vates.tech>
Date: Tue, 13 Oct 2026 11:57:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace/vvmx: Correctly report TRC_HVM_NESTEDFLAG flag
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1791882665.8631fc262581453bbf619ec5b2062170.1a134879de70008d8d@vates.tech>
 <8b1e612d-395c-46ad-b327-2718dd9d83cb@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <8b1e612d-395c-46ad-b327-2718dd9d83cb@suse.com>

--------------g0CrHjBGwJyi0AFFeybRy0Or
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTMvMTAvMjAyNiDDoCAxMTo0MiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MTMuMTAuMjAyNiAxMTowOSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBDdXJyZW50bHkgYWxs
IFZNRVhJVHMgYXJlIHJlcG9ydGVkIGFzIGlmIGl0IG9jY3VyZWQgIm5vbi1uZXN0ZWQiLA0K
PiANCj4gTml0OiBzLyBpdCAvIHRoZXkgLw0KPiANCj4+IGV2ZW4gd2hlbiB0aGUgdkNQVSBp
cyBpbiAiZ3Vlc3QgbW9kZSIuIE1ha2luZyBkaXN0aW5ndWlzaGluZw0KPj4gIm5lc3RlZCB2
aXJ0IiBWTUVYSVQgdG8gcmVndWxhciBvbmVzIG11Y2ggaGFyZGVyLg0KPiANCj4gU2FtZSBm
b3IgZW50cmllcywgYXMgaXQgbG9va3MuDQo+IA0KPj4gRml4IHRoaXMgYnkgYWRkaW5nIFRS
Q19IVk1fTkVTVEVERkxBRyBmbGFnIHdoZW4gdGhlIGd1ZXN0IGlzIGluIGd1ZXN0DQo+PiBt
b2RlLCBtYXRjaGluZyB0aGUgc3ZtIGxvZ2ljLg0KPj4NCj4+IEZpeGVzOiA/Pz8gKD8/PykN
Cj4+IFNpZ25lZC1vZmYtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNo
Pg0KPj4gLS0tDQo+PiBJIGNhbid0IHJlYWxseSBmaW5kIHRoZSBjb21taXQgdGhhdCBpbnRy
b2R1Y2VkIHZWTVguIEJ1dCBJIGd1ZXNzIGl0DQo+PiB3b3VsZCBiZSB0aGUgY2FuZGlkYXRl
IGZvciB0aGUgZml4ZXMgdGFnLg0KPiANCj4gRm9yIHRoZSBleGl0IGFzcGVjdCBJJ2Qgc3Vn
Z2VzdCAzYmFmZDRhOTA5OTUgKCJOZXN0ZWQgVk1YOiBWTSBleGl0IGhhbmRsZXIgb2YNCj4g
bjItZ3Vlc3QiKS4gQ2hhbmdlcyB0byB2bXhfdm1lbnRlcl9oZWxwZXIoKSBjYW1lIGxhdGVy
LCBzbyBJJ2QgbGVhdmUgaXQgYXQNCj4gdGhhdC4NCj4gDQoNCkxvb2tzIGdvb2QgdG8gbWUu
DQoNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+PiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYw0KPj4gQEAgLTQyMDksOSArNDIwOSwxMyBAQCB2b2lk
IGFzbWxpbmthZ2Ugdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpy
ZWdzKQ0KPj4gICAgICAgX192bXJlYWQoVk1fRVhJVF9SRUFTT04sICZleGl0X3JlYXNvbik7
DQo+PiAgIA0KPj4gICAgICAgaWYgKCBodm1fbG9uZ19tb2RlX2FjdGl2ZSh2KSApDQo+PiAt
ICAgICAgICBUUkFDRV9USU1FKFRSQ19IVk1fVk1YX0VYSVQ2NCwgZXhpdF9yZWFzb24sIHJl
Z3MtPnJpcCwgcmVncy0+cmlwID4+IDMyKTsNCj4+ICsgICAgICAgIFRSQUNFX1RJTUUoVFJD
X0hWTV9WTVhfRVhJVDY0IHwNCj4+ICsgICAgICAgICAgICAgICAgICAgKG5lc3RlZGh2bV92
Y3B1X2luX2d1ZXN0bW9kZSh2KSA/IFRSQ19IVk1fTkVTVEVERkxBRyA6IDApLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICBleGl0X3JlYXNvbiwgcmVncy0+cmlwLCByZWdzLT5yaXAgPj4g
MzIpOw0KPj4gICAgICAgZWxzZQ0KPj4gLSAgICAgICAgVFJBQ0VfVElNRShUUkNfSFZNX1ZN
WF9FWElULCBleGl0X3JlYXNvbiwgcmVncy0+ZWlwKTsNCj4+ICsgICAgICAgIFRSQUNFX1RJ
TUUoVFJDX0hWTV9WTVhfRVhJVCB8DQo+PiArICAgICAgICAgICAgICAgICAgIChuZXN0ZWRo
dm1fdmNwdV9pbl9ndWVzdG1vZGUodikgPyBUUkNfSFZNX05FU1RFREZMQUcgOiAwKSwNCj4+
ICsgICAgICAgICAgICAgICAgICAgZXhpdF9yZWFzb24sIHJlZ3MtPmVpcCk7DQo+IA0KPiBT
Vk0gY29kZSB1c2VzIGEgbG9jYWwgYm9vbGVhbiB0byBhdm9pZCB0aGUgc2VwYXJhdGUgKGFu
ZCBub3cgYWxzbyByZXBlYXRlZCwNCj4gY29uc2lkZXJpbmcgdGhlIGxhdGVyIHVzZSkgbmVz
dGVkaHZtX3ZjcHVfaW5fZ3Vlc3Rtb2RlKCkgaW52b2NhdGlvbnMuIFRob3VnaHRzDQo+IHRv
d2FyZHMgaW50cm9kdWNpbmcgc3VjaCBhIGxvY2FsIGhlcmUgYXMgd2VsbD8gKEkgZG9uJ3Qg
cXVpdGUgdW5kZXJzdGFuZCB3aHkNCj4gdGhleSBhbHNvIHVzZSBuZXN0ZWRodm1fZW5hYmxl
ZCgpIHdoZW4gc2V0dGluZyB0aGF0IGJvb2xlYW46DQo+IG5lc3RlZGh2bV92Y3B1X2luX2d1
ZXN0bW9kZSgpIHdvdWxkIGJldHRlciByZXR1cm4gZmFsc2UgZm9yIGRvbWFpbnMgd2l0aA0K
PiBuZXN0ZWQgbm90IGVuYWJsZWQuKQ0KPiANCg0KTW9yZSBnZW5lcmFsbHksIHdlIGNhbiBj
b25zaWRlciBkb2luZyBhIGJpdCBvZiByZWZhY3RvcmluZyBhcm91bmQgDQpgbmVzdGVkaHZt
X3ZjcHVfaW5fZ3Vlc3Rtb2RlKClgIChsaWtlIG1ha2luZyBpdCBhIHN0YXRpYyBpbmxpbmUp
LCBhcyANCml0J3MganVzdCByZXR1cm5pbmcgYHZjcHVfbmVzdGVkaHZtKHYpLm52X2d1ZXN0
bW9kZWAsIGJ1dCBoaWRkZW4gYmVoaW5kIA0KYSBmdW5jdGlvbiBjYWxsIG9mIG5lc3RlZGh2
bS5jIHNvIGl0IGNhbid0IGlubGluZS4NCg0KPiBKYW4NCg0KVGVkZHkNCg==

--------------g0CrHjBGwJyi0AFFeybRy0Or--

--------------X8Kr5Z5rxbTXfQI86Cxa6Atz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrOAKIFAwAAAAAACgkQZg+p0QLLz9BV
HQv8DhAklEiQ51UXIh/PvaDghqojsxUblcxyw4LCPhN/uX2OOQRGz4wy2Rkh9II8O6waeqpeLo8j
5TDsXI4+KslFnQcuDpGjo5mbLr14H4ZBdOiW+V8o46Yy/yaFApIdXdBrJf8TARbO4MJsf81xGCV7
bKyGHL9c3+ZjkE/eAqIGjvnhiVYxlDImbBdGagVTlNk0LYutdQEfQEhdSv6DEOCX8v3BtSNDpzw7
6ciRcXKdsVnaNWJTrdyMpuK+aWy/nWHM3nADPvi/EPCN22ipeBX9RJATLXnQ+AgkemLfWi8qHF8Y
fRtOCfKQOP4gjnbQUnVqLWgjKgzFDMCXZJae7MhukMkPchWWR3RTdWND1unnh09orVMKkHurNhRu
B9YBd3TcXlT1VHvD6gl9Zh5Uuby5EAx7/2l9r/bsf45QWLor6LYUXIfnAbC5wgNUvGLA1HGunH/E
sHmDqezSN3U4/eQqfZc1Xq5FPpuoLqPeO+Xx8kpGoqTai20W8Aq91MCN1Zdw
=veep
-----END PGP SIGNATURE-----

--------------X8Kr5Z5rxbTXfQI86Cxa6Atz--

