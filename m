Return-Path: <SRS0=qQdQ=2N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58B6C2D0C0
	for <xen-devel@archiver.kernel.org>; Mon, 23 Dec 2019 14:12:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A365C20709
	for <xen-devel@archiver.kernel.org>; Mon, 23 Dec 2019 14:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="b8fFE7D2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A365C20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijORU-0001Aw-2f; Mon, 23 Dec 2019 14:12:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htmo=2N=amazon.com=prvs=2537494bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijORS-0001Ar-4I
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 14:12:14 +0000
X-Inumbo-ID: 36cd7f82-258e-11ea-96db-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36cd7f82-258e-11ea-96db-12813bfff9fa;
 Mon, 23 Dec 2019 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577110333; x=1608646333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t7JxXa4JGWTNqUVpF/MmzNFRyiuApD3X49Yzkd2bZhw=;
 b=b8fFE7D2U/t5zhhujlkSlrB15LxjHw2astRosU66dgTJBuTND1bCSPBZ
 oK5haEkorU9wZnUfb6/Ef59mN2H2rCD6eyltyEKcVsSnJpTmQR02q3QR6
 q1lswj4dXwPHU3PGlRNRiCpeYy/etctNv+845wA33orQUZjRb+zYq0MUL s=;
IronPort-SDR: 657CoVGzEJ5sAR5eCjQnW2vdcFX/WgGvDJ/mFrt+rgFj49zaivFIAo4/Q3UnDYv6OsJ74FhOha
 Ot7v3u5kIrNg==
X-IronPort-AV: E=Sophos;i="5.69,347,1571702400"; d="scan'208";a="16558083"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Dec 2019 14:12:01 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id C96AAA07C8; Mon, 23 Dec 2019 14:12:00 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 23 Dec 2019 14:11:59 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 14:11:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 23 Dec 2019 14:11:58 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] MAINTAINERS: put hyperv-tlfs.h under
 viridian maintainership
Thread-Index: AQHVuZA1MXHBU7bv+E2exWX4w2w/UKfHwpsA
Date: Mon, 23 Dec 2019 14:11:58 +0000
Message-ID: <33399aeb7c994a54bb110a9834fe6ed4@EX13D32EUC003.ant.amazon.com>
References: <20191223125143.30381-1-wl@xen.org>
In-Reply-To: <20191223125143.30381-1-wl@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: put hyperv-tlfs.h under
 viridian maintainership
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyMyBEZWNlbWJlciAyMDE5IDEyOjUyDQo+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlz
dCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0KPiBDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNl
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4N
Cj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIXSBNQUlOVEFJTkVSUzogcHV0IGh5cGVydi10
bGZzLmggdW5kZXIgdmlyaWRpYW4NCj4gbWFpbnRhaW5lcnNoaXANCj4gDQo+IFN1Z2dlc3RlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPg0KDQpBY2tlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+
DQoNCj4gLS0tDQo+ICBNQUlOVEFJTkVSUyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0K
PiBpbmRleCAwMTJjODQ3ZWJkLi5lYWVhNDYyMGUyIDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVS
Uw0KPiArKysgYi9NQUlOVEFJTkVSUw0KPiBAQCAtNTE2LDYgKzUxNiw3IEBAIE06CVBhdWwgRHVy
cmFudCA8cGF1bEB4ZW4ub3JnPg0KPiAgUzoJU3VwcG9ydGVkDQo+ICBGOgl4ZW4vYXJjaC94ODYv
aHZtL3ZpcmlkaWFuLw0KPiAgRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaA0K
PiArRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oDQo+IA0KPiAgWEVO
VFJBQ0UNCj4gIE06CUdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4N
Cj4gLS0NCj4gMi4yMC4xDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
