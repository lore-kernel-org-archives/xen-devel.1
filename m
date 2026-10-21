Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8C606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=hkDrgJup
Received: from list by lists.xenproject.org with outflank-mailman.1456813.1669917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJS2Q-0006Sl-RI; Wed, 21 Oct 2026 08:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456813.1669917; Wed, 21 Oct 2026 08:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJS2Q-0006Se-O9; Wed, 21 Oct 2026 08:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1456813;
 Wed, 21 Oct 2026 08:51:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f@swg.vates.tech>)
 id 1xJS2P-0006SY-Dg
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 08:51:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJS2O-00G5WI-Ix
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 10:51:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f@swg.vates.tech>)
 id 6ad87cfa-2eae-0a2a0a5409dd-0a2a450cd376-2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 10:51:08 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f@swg.vates.tech>)
 id 6ad87cfb-f479-0a2a450c0019-b9ff1c228129-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 10:51:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15da83071000f79f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Oct 2026 08:51:05 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id DF0C98088C;
 Wed, 21 Oct 2026 10:51:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Lm0wp9YoupniqkJX+09pmQnXMjWXx5i/7HuzUmcvoKs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hkDrgJup+LfF2AK8XrXyYzGV1hHFzpSzdLInr9aqWl4Cw5PlZCijZBUgPdHLnUv0xTxD6+J86
 pSiqRSeQizeIFXG0ZRR6ULc2cROQtuQTpY3+BmPEM9fT+SyQhK6aDK6mJzvMVFRa+EV9+Zg/EN5
 cAkPVGi6TERtNRIUDJiohk1iATZEDLJIHI70cxy6hahB/tFpqa1yX9GznJgJUYfQp0mDZGTvvuC
 TpyXK+ZvwjsMAX2SrMdJPTOTUW+rNmbRuJX8wv8SAn71guch6QU7Aojcvk7wnAcWM5XRKrua+Vf
 vVGmK0Ydy/cZ6qRh9KtFfsafeRGZIFVADe8D6h1DPArw==
X-Zone-Loop: b6e9281e38efabe097c102a805cde208aec4fbc3cfbc
x-campaign-type: default
x-transaction-id: e3c00b40-dee8-4e62-aab6-7df71b79599a
x-swg-uid: 01-6850e34d-8a73-480f-9249-1fed2120ebfd
X-Mailer: Sweego
Message-ID:
 <1792572666.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f@vates.tech>
x-swg-bid: 1792572666.8631fc262581453bbf619ec5b2062170.1a15da83071000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 21 Oct 2026 10:51:04 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: Skip IO-APICs missing from the IVRS in
 shared IRT mode
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com
References: <20261020215941.3667346-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020215941.3667346-1-stefano.stabellini@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k01182ByWMU9bAS8EbtS6aFa"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792572665049
X-purgate-ID: tlsNG-d25034/1792572668-774D7A5B-E280A435/0/0
X-purgate-type: clean
X-purgate-size: 6333
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k01182ByWMU9bAS8EbtS6aFa
Content-Type: multipart/mixed; boundary="------------goLJC7ouf9FFdUoMF6sRJw00";
 protected-headers="v1"; hp="clear"
Message-ID: <2060aeab-f692-458d-ae4a-f7b2cc080ea1@vates.tech>
Date: Wed, 21 Oct 2026 10:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: Skip IO-APICs missing from the IVRS in
 shared IRT mode
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com
References: <20261020215941.3667346-1-stefano.stabellini@amd.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020215941.3667346-1-stefano.stabellini@amd.com>

--------------goLJC7ouf9FFdUoMF6sRJw00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjEvMTAvMjAyNiDDoCAwMDowMiwgU3RlZmFubyBTdGFiZWxsaW5pIGEgw6ljcml0wqA6
DQo+IFdoZW4gYW4gSU8tQVBJQyB3aXRoIGVudHJpZXMgaXNuJ3QgZGVzY3JpYmVkIGJ5IHRo
ZSBJVlJTLA0KPiBpb2FwaWNfaWRfdG9faW5kZXgoKSByZXR1cm5zIE1BWF9JT19BUElDUy4g
IFdpdGggcGVyLWRldmljZSBpbnRlcnJ1cHQNCj4gcmVtYXBwaW5nIHRhYmxlcyB0aGlzIGlz
IGZhdGFsLCBidXQgaW4gc2hhcmVkIG1vZGUgcGFyc2VfaXZyc190YWJsZSgpDQo+IG9ubHkg
bG9ncyBpdCBhbmQgdGhlbiB1c2VzIE1BWF9JT19BUElDUyBhcyBhbiBpbmRleCwgcmVhZGlu
ZyBhbmQgd3JpdGluZw0KPiBvbmUgcGFzdCB0aGUgZW5kIG9mIGlvYXBpY19zYmRmW10uDQo+
IA0KPiBTa2lwIHN1Y2ggYW4gSU8tQVBJQyBpbnN0ZWFkLiAgSXQgaXMgbGVmdCB3aXRob3V0
IGludGVycnVwdCByZW1hcHBpbmcsDQo+IHdoaWNoIGlzIHdoYXQgdGhlIHJlc3Qgb2YgdGhl
IGNvZGUgYWxyZWFkeSBhc3N1bWVzIGZvciBhbiBJTy1BUElDIHdpdGgNCj4gbm8gaW5kZXgu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3Rh
YmVsbGluaUBhbWQuY29tPg0KPiAtLS0NCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfYWNwaS5jIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2FjcGkuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9hY3BpLmMN
Cj4gaW5kZXggMzlhZTYzNzk1OS4uNDY4ODkwODgyNCAxMDA2NDQNCj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYw0KPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfYWNwaS5jDQo+IEBAIC0xMTMyLDYgKzExMzIsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBwYXJzZV9pdnJzX3RhYmxlKHN0cnVjdCBh
Y3BpX3RhYmxlX2hlYWRlciAqdGFibGUpDQo+ICAgICAgICAgICAgICAgICAgICAgIElPX0FQ
SUNfSUQoYXBpYykpOw0KPiAgICAgICAgICAgICAgIGlmICggYW1kX2lvbW11X3BlcmRldl9p
bnRyZW1hcCApDQo+ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5YSU87DQo+ICsgICAg
ICAgICAgICBjb250aW51ZTsNCj4gICAgICAgICAgIH0NCj4gICANCj4gICAgICAgICAgIC8q
IFNCIElPLUFQSUMgaXMgYWx3YXlzIG9uIHRoaXMgZGV2aWNlIGluIEFNRCBzeXN0ZW1zLiAq
Lw0KDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+
DQoNClRlZGR5DQo=

--------------goLJC7ouf9FFdUoMF6sRJw00--

--------------k01182ByWMU9bAS8EbtS6aFa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrYfPgFAwAAAAAACgkQZg+p0QLLz9A8
Dgv8DDSsxntORH7jzmdnqC/1cv10TLAYrdiUWL0F/9zj/xsJT3nuA93xRMr/5CmD7jsbx2/0C5tA
BlH6ulxcB0mlLhVivGEHjPV1KzHgFzkbvOFCItpXFr7k14V8jSJZeWTF0QhbcIyNjsgEX68r33qH
aOcH1Ljs2Bmy0VGaa5J9IT+yGaqkUF30UqBHurCn4wGbow+0vb7PlXZB7tvFRueSGiuADE+C73Uy
E7RgXZDqrzMw4f5UYnf9EOVAzY9TTEnbgJ9gXvWVowXzSKsOhyOMtgzQe68P712SblW1wmU+A9lO
4Af/UnXzLCFMQ1Ui0nk/2uauvE86KMLbOUakbv6IEFwL6EWDmc7OD7WLja6yMM8fptxrF2GsFK14
+k9OYsGl4+J1Qb/89qBOXw85zPvTn70/iVDvDvKsEpswI6vD0Yu0yuO+MFysAnvIj8vhPZZZTinp
urSSf6Bb4R0PbWmLD9Linn+/Ppf/x6nRShHMb1BwlGcqhlHDURJS/AiXVz3B
=Q9sK
-----END PGP SIGNATURE-----

--------------k01182ByWMU9bAS8EbtS6aFa--

