Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9584C56203
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 09:32:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384465.1627415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wruSG-0007St-S7; Thu, 06 Aug 2026 09:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384465.1627415; Thu, 06 Aug 2026 09:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wruSG-0007Sm-On; Thu, 06 Aug 2026 09:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1384465;
 Thu, 06 Aug 2026 09:31:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd66a3fd5000e099@swg.vates.tech>)
 id 1wruSF-0007Sg-0H
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 09:31:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wruSD-00F3hd-SX
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 11:31:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd66a3fd5000e099@swg.vates.tech>)
 id 6a74547e-e002-0a2a0a5209dd-0a2a4501ddde-46
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 11:31:57 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd66a3fd5000e099@swg.vates.tech>)
 id 6a74548c-5984-0a2a45010019-b9ff1c238c9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 11:31:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fd66a3fd5000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Aug 2026 09:31:55 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7341280143;
 Thu,  6 Aug 2026 11:31:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=H1/fDbtueoAwVW3NxBpCSNwTTB+L6V1ifVuLniu1eT0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lRkORnFdwoF3/T8ot2U0iQSVIAPMq407z+wV9lvfVRbARHPNBoDpMUSDMvqFwSyAljBV39ErJ
 6lVLdY3l9IcHEpc5ILwwPv1IWm1JxPjRmBjvFrl34GPdBP97M2sTcCjWNQnNTulADrtomg2NaEQ
 NpP9zqYf8vAabQ7V6vMv68VUdUs1DSpJuBJa6NjeFub5BIRvmgJ0h/6C3/sPgKeVAELE/PhZQ5Q
 AEQSS46KY5qI4DBK0H2iH4MR/bh18Z0j94EpVmC01LK89X/n9nElV5WepvpNoNbWNSeClxEYDUb
 a45WJnehuCSPK7u1CHsHcc5c8NfGFoB162atyOqEFgQA==
X-Zone-Loop: 6287a73f1fb7823a2cc539e32ecfd4b93bb4fd248b5d
x-campaign-type: default
x-transaction-id: 658cb477-1178-4c71-b777-d4b628fef0ed
x-swg-uid: 01-34470f5a-29de-496a-aa18-199d4b415288
X-Mailer: Sweego
Message-ID:
 <1786008715.8631fc262581453bbf619ec5b2062170.19fd66a3fd5000e099@vates.tech>
x-swg-bid: 1786008715.8631fc262581453bbf619ec5b2062170.19fd66a3fd5000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 6 Aug 2026 11:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: mandatory update VMCB nextrip for soft
 interrupts
To: Chunjie Zhu <chunjie.zhu@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org
References: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RQ0cKYyiZfxQAjq0mGLb0A08"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786008714614
X-purgate-ID: tlsNG-d62444/1786008717-BFE68757-CF656530/0/0
X-purgate-type: clean
X-purgate-size: 6615

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RQ0cKYyiZfxQAjq0mGLb0A08
Content-Type: multipart/mixed; boundary="------------2ihUYEGYZ0TyVk9YM9E0oq6X";
 protected-headers="v1"; hp="clear"
Message-ID: <37659b5a-486e-48e0-b4a4-1ff4819598b1@vates.tech>
Date: Thu, 6 Aug 2026 11:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: mandatory update VMCB nextrip for soft
 interrupts
To: Chunjie Zhu <chunjie.zhu@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org
References: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260806031732.10242-1-chunjie.zhu@citrix.com>

--------------2ihUYEGYZ0TyVk9YM9E0oq6X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDYvMDgvMjAyNiDDoCAwNToxNywgQ2h1bmppZSBaaHUgYSDDqWNyaXTCoDoNCj4gU2ln
bmVkLW9mZi1ieTogQ2h1bmppZSBaaHUgPGNodW5qaWUuemh1QGNpdHJpeC5jb20+DQo+IC0t
LQ0KPiAgIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jIHwgOSArKysrKysrKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMgYi94
ZW4vYXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYw0KPiBpbmRleCBiMDYxMjRjMmM5ZWQu
LjgxNTcxM2I4YjUwNiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVz
dGVkc3ZtLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMNCj4g
QEAgLTQ0OSw3ICs0NDksMTQgQEAgc3RhdGljIGludCBuc3ZtX3ZtY2JfcHJlcGFyZTR2bXJ1
bihzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+ICAgICAg
IG4ydm1jYi0+dmlydF9leHQuYnl0ZXMgPQ0KPiAgICAgICAgICAgbjF2bWNiLT52aXJ0X2V4
dC5ieXRlcyB8IG5zX3ZtY2ItPnZpcnRfZXh0LmJ5dGVzOw0KPiAgIA0KPiAtICAgIC8qIE5l
eHRSSVAgLSBvbmx5IGV2YWx1YXRlZCBvbiAjVk1FWElULiAqLw0KPiArICAgIC8qIG5leHRf
cmlwIGlzIGNvbnN1bWVkIG9uIFZNUlVOIGFzIHRoZSByZXR1cm4gYWRkcmVzcyBwdXNoZWQg
b24gdGhlDQo+ICsgICAgICogc3RhY2vCt2ZvcsK3aW5qZWN0ZWTCt3NvZnTCt2V4Y2VwdGlv
bnMvaW50ZXJydXB0cy4gVGhpcyBhc3NpZ25tZW50DQo+ICsgICAgICogc3RhdGVtZW50IG11
c3QgYmUgZW5mb3JjZWQsIG90aGVyd2lzZSwgaXQgbWlnaHQgY2F1c2UgdmNwdSB3ZWRnZS4N
Cj4gKyAgICAgKg0KDQpXZWxsLCBpdCdzIG1vcmUgdGhhdCBucmlwIHNlbWFudGljcyByZXF1
aXJlcyBucmlwIHRvIGJlIHByb3Blcmx5IA0KY29uZmlndXJlZCBpbiB0aGUgdm1jYi4gVGhh
dCBsb29rcyBsaWtlIGEgbWlzc2luZyBwaWVjZSwgYnV0IHdlIG1heSANCnN0aWxsIHdhbnQg
dG8ga2VlcCBzb21lIGluZm9ybWF0aW9ucyBhYm91dCB3aGF0IGhhcHBlbnMgb24gdGhlICNW
TUVYSVQgc2lkZS4NCg0KPiArICAgICAqIEFQTSBWb2wuMiBFdmVudCBJbmplY3Rpb24gZG9l
cyBub3Qgc3BlY2lmaWVzIHdoYXQgaGFwcGVucyBpZiBORVhUUklQDQo+ICsgICAgICogaG9s
ZHMgYW4gaW52YWxpZC9nYXJiYWdlIHZhbHVlLg0KDQpUbyBtZSwgaXQncyBzaW1pbGFyIHRv
IHNldHRpbmcgUklQIGRpcmVjdGx5IHRvIGEgYm9ndXMgdmFsdWUuIG5yaXAgaXMgDQpqdXN0
IGEgIm5leHQgaW5zdHJ1Y3Rpb24gcmlwIiBiYXNpY2FsbHkgKHdydCBldmVudCBpbmplY3Rp
b24sIC4uLikuDQoNCj4gKyAgICAgKi8NCj4gKyAgICBuMnZtY2ItPm5leHRyaXAgPSBuc192
bWNiLT5uZXh0cmlwOw0KPiAgIA0KPiAgICAgICAvKg0KPiAgICAgICAgKiBWTUNCIFNhdmUg
U3RhdGUgQXJlYQ0KDQpUZWRkeQ0K

--------------2ihUYEGYZ0TyVk9YM9E0oq6X--

--------------RQ0cKYyiZfxQAjq0mGLb0A08
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmp0VIkFAwAAAAAACgkQZg+p0QLLz9D1
OAv8CTskpTSydVdROIYyIF8Mf17Yj/Tqg8xy9XWovx3ENaMf77enPEB4WK8cj7Ch9oPR25s9HNtO
oruWr9d94kW+EsroKP3TvcVlhX6zV0T5lst0it2c7HSHgiPc1oWhNigRbOQzbIhlCw9mBUJ968sc
28APvzUunNizul5VQ2YIuaGanELbW67ZEJxR8ueMotQPnJAJgpoUAESDdAD3AlqV+q5TtTqpTZWJ
uJX06Pq4IfL8FPlhlGLedQhxImhGHYJplIJX5AvN6TiNpWEZmQUQlKVLFiLPZJchRYH1VXBclt5h
1Wxulj3fEH2tL981/Oe6ySG4RHHbrY5IFdWVumMW53ePKWSCRR97Z45uF9EBDbIjJNao7oenSDF+
GSM2cnM3yvM9oAjROtNxTI6J9S+M4WN+ZmvG/ziyiRsMBrG+viWeG8CK4gbhOZG+RCoPGLcGClKL
qeePJ4Aou0FbyadIMH0JJR5dJZhVJs6pp1cqD44IjilzBf7AFEiQK2QYD4W2
=mrhF
-----END PGP SIGNATURE-----

--------------RQ0cKYyiZfxQAjq0mGLb0A08--

