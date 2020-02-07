Return-Path: <SRS0=0beg=33=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD40C2BA83
	for <xen-devel@archiver.kernel.org>; Fri,  7 Feb 2020 16:30:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC31E20720
	for <xen-devel@archiver.kernel.org>; Fri,  7 Feb 2020 16:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="tTZPyxa8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC31E20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j06WO-0006pm-Qi; Fri, 07 Feb 2020 16:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCN5=33=amazon.com=prvs=299200b1e=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j06WN-0006ph-EB
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 16:30:23 +0000
X-Inumbo-ID: 22ffb8c8-49c7-11ea-a759-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22ffb8c8-49c7-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581093023; x=1612629023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JhZXdvXeL9efaxbW6S1yzwOn1ONHKtSZs1rBWq4sW54=;
 b=tTZPyxa8ud8L+WZRF/u00sGq6s8e5sex8eg6x5kLLDJjE9bG1xc65J1C
 rgAKPDz9oOC0J/R2BGxsAWM5UDL7PV+I5TqQwqHZgDS7RkiKiLLrq8NOE
 JHMeoUD3NwG04pkRnuMQsc3lY1rBzZL+92mNvnPDK2XvKOT2PJVEr61fG g=;
IronPort-SDR: yA2hvgKIpaUYY/yCfOK0RRToT5cgmQ4FAhjuuzKzX0TJwp85TpQWvBLaIyoAI7Bi7Qrf6GAbbb
 4sfxaEJ3q7YA==
X-IronPort-AV: E=Sophos;i="5.70,414,1574121600"; d="scan'208";a="25078536"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 07 Feb 2020 16:30:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id BFE29A254F; Fri,  7 Feb 2020 16:30:06 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 7 Feb 2020 16:30:05 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 7 Feb 2020 16:30:04 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 7 Feb 2020 16:30:04 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Thread-Topic: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
Thread-Index: AQHV3c+Uml97/lHtTkGqVW/XjvUieqgP7BQA
Date: Fri, 7 Feb 2020 16:30:04 +0000
Message-ID: <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
In-Reply-To: <20200207155701.2781820-2-dwmw2@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
Content-ID: <EEF711AE47FCAE4D8D3F879A20A4FE25@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAyLTA3IGF0IDE1OjU3ICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQo+IA0KPiAuLi4N
Cj4gDQo+IEZpbmFsbHksIG1ha2UgZnJlZV94ZW5oZWFwX3BhZ2VzKCkgYW5kIGZyZWVfZG9taGVh
cF9wYWdlcygpIGNhbGwNCj4gdGhyb3VnaCB0byBpbml0X2hlYXBfcGFnZXMoKSBpbnN0ZWFkIG9m
IGRpcmVjdGx5IHRvIGZyZWVfaGVhcF9wYWdlcygpDQo+IGluIHRoZSBjYXNlIHdoZXJlIHBhZ2Vz
IGFyZSBiZWluZyBmcmVlIHdoaWNoIGhhdmUgbmV2ZXIgcGFzc2VkDQo+IHRocm91Z2gNCj4gaW5p
dF9oZWFwX3BhZ2VzKCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3
bXdAYW1hem9uLmNvLnVrPg0KDQpJZiBib3RoIGVuZCB1cCBjYWxsaW5nIGZyZWVfaGVhcF9wYWdl
cywgY2FuIHdlIGp1c3QgcHV0IHRoZSBjaGVjaw0KdGhlcmU/DQoNCkhvbmd5YW4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
