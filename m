Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E914C432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 16:09:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22CD5215A5
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 16:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="of9ZBTMb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22CD5215A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaipY-00060q-9v; Fri, 29 Nov 2019 16:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iaipW-00060h-Gc
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 16:09:14 +0000
X-Inumbo-ID: 95dd5ce2-12c2-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95dd5ce2-12c2-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575043754; x=1606579754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vY3yNMWl4XxQ52Yeor3pYOFSHJJULyJ7C6zSK/m4n5c=;
 b=of9ZBTMbGXnSVTtc4e4PX5s4zw2XL8sVrj46+9Ln7NBRThOuufR9iHZm
 PK+ytev3iQkuZJPFxU8EaVAAo8xvu6JB86wEPr3lbAOFUxcFk2wKlfrYu
 SCFsGyl8sWsylwMK2OOE0qWB0B5Yel/5MH3zcIfxpCi/zp+jrjWQUPo3H 8=;
IronPort-SDR: 2urBnlx6vJFe4PyaljmGlh5Eq0qnF4U/v9BYgul+T5A8y+NZySfdY8CEwS8wDSZsKleKRG5Qxb
 3dJ9FoBMDjgw==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; 
   d="scan'208";a="2195830"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Nov 2019 16:09:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id C3443282274; Fri, 29 Nov 2019 16:08:58 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 16:08:57 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 16:08:57 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 29 Nov 2019 16:08:57 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2 1/2] xen/xenbus: reference count registered modules
Thread-Index: AQHVprryE0ZNGXJKYUWnOWAGzywoqqeiTuoAgAABo6A=
Date: Fri, 29 Nov 2019 16:08:56 +0000
Message-ID: <42cc372e0ada4267bdf4038a0202d95d@EX13D32EUC003.ant.amazon.com>
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-2-pdurrant@amazon.com>
 <599c254c-035b-33a0-9f32-866ffe644ad5@suse.com>
In-Reply-To: <599c254c-035b-33a0-9f32-866ffe644ad5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/xenbus: reference count
 registered modules
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IE5vdmVtYmVyIDIwMTkgMTY6MDENCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IEJvcmlzDQo+IE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+OyBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS8yXSB4ZW4veGVuYnVzOiByZWZlcmVuY2UgY291bnQgcmVnaXN0ZXJlZCBtb2R1bGVzDQo+IA0K
PiBPbiAyOS4xMS4yMDE5IDE0OjQzLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gVG8gcHJldmVu
dCBhIG1vZHVsZSBiZWluZyByZW1vdmVkIHdoaWxzdCBhdHRhY2hlZCB0byBhIGZyb250ZW5kLCBh
bmQNCj4gDQo+IFdoeSBvbmx5IGZyb250ZW5kPw0KPiANCg0KVHJ1ZS4gT3JpZ2luYWxseSB0aGlz
IHdhcyBvbmx5IGludGVuZGVkIGZvciBiYWNrZW5kcywgYnV0IEkgZ3Vlc3MgdGhpcyBzaG91bGQg
bm93IGJlICdvdGhlcmVuZCcgb3Igc29tZSBlcXVpdmFsZW50IGZvcm0gb2Ygd29yZHMuDQoNCj4g
PiBoZW5jZSB4ZW5idXMgY2FsbGluZyBpbnRvIHBvdGVudGlhbGx5IGludmFsaWQgdGV4dCwgdGFr
ZSBhIHJlZmVyZW5jZSBvbg0KPiA+IHRoZSBtb2R1bGUgYmVmb3JlIGNhbGxpbmcgdGhlIHByb2Jl
KCkgbWV0aG9kIChkcm9wcGluZyBpdCBpZg0KPiB1bnN1Y2Nlc3NmdWwpDQo+ID4gYW5kIGRyb3Ag
dGhlIHJlZmVyZW5jZSBhZnRlciByZXR1cm5pbmcgZnJvbSB0aGUgcmVtb3ZlKCkgbWV0aG9kLg0K
PiA+DQo+ID4gTk9URTogVGhpcyBhbGxvd3MgdGhlIGFkLWhvYyByZWZlcmVuY2UgY291bnRpbmcg
aW4geGVuLW5ldGJhY2sgdG8gYmUNCj4gPiAgICAgICByZW1vdmVkLiBUaGlzIHdpbGwgYmUgZG9u
ZSBpbiBhIHN1YnNlcXVlbnQgcGF0Y2guDQo+ID4NCj4gPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4NCj4gPiAtLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMv
eGVuYnVzX3Byb2JlLmMNCj4gPiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2Jl
LmMNCj4gPiBAQCAtMjMyLDkgKzIzMiwxMSBAQCBpbnQgeGVuYnVzX2Rldl9wcm9iZShzdHJ1Y3Qg
ZGV2aWNlICpfZGV2KQ0KPiA+ICAJCXJldHVybiBlcnI7DQo+ID4gIAl9DQo+ID4NCj4gPiArCV9f
bW9kdWxlX2dldChkcnYtPmRyaXZlci5vd25lcik7DQo+IA0KPiBJIGd1ZXNzIHlvdSByZWFsbHkg
d2FudCB0cnlfbW9kdWxlX2dldCgpIGFuZCBkZWFsIHdpdGggaXQgcmV0dXJuaW5nDQo+IGZhbHNl
Lg0KPiANCg0KUGVyaGFwcywgeWVzLg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
