Return-Path: <SRS0=TJt3=KC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2CFC433ED
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 15:00:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF6C361400
	for <xen-devel@archiver.kernel.org>; Fri,  7 May 2021 15:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF6C361400
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.124059.234111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf1wt-0006UR-WF; Fri, 07 May 2021 14:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124059.234111; Fri, 07 May 2021 14:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf1wt-0006UK-TJ; Fri, 07 May 2021 14:59:27 +0000
Received: by outflank-mailman (input) for mailman id 124059;
 Fri, 07 May 2021 14:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK0J=KC=amazon.com=prvs=754d3a1f3=hongyxia@srs-us1.protection.inumbo.net>)
 id 1lf1ws-0006UE-SP
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 14:59:26 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d74a335-5171-42be-9093-763b573671ae;
 Fri, 07 May 2021 14:59:25 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 07 May 2021 14:59:16 +0000
Received: from EX13D39EUA001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id E2BB3A2591; Fri,  7 May 2021 14:59:14 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D39EUA001.ant.amazon.com (10.43.165.90) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 7 May 2021 14:59:14 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1497.015;
 Fri, 7 May 2021 14:59:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3d74a335-5171-42be-9093-763b573671ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1620399566; x=1651935566;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BqqMRIsOwJmULanbAJ47vyruUAfOqJsmS9xhTlGiscE=;
  b=GJAKXggzPAhhgfnWub58teKFZ1RVOhNtH8RLDN5OkRddtBssTZhtPxhE
   QsMTdBehz0U6g/nfbuZYO/tpyyO58ix+2Sh76ZxeQpUndApKMY2U/kj2f
   hPqaL8ZkOIR4P6hDzbVYZvVAGA7U+qDYj8AnZ8TWJaOSXf7uq1jBqC4Ug
   I=;
X-IronPort-AV: E=Sophos;i="5.82,281,1613433600"; 
   d="scan'208";a="133868623"
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "Gul, Mahircan"
	<mahgul@amazon.co.uk>, "paul@xen.org" <paul@xen.org>, "Ning, Raphael"
	<raphning@amazon.com>, "wl@xen.org" <wl@xen.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "Grall, Julien" <jgrall@amazon.co.uk>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC 1/2] docs/design: Add a design document for Live
 Update
Thread-Topic: [PATCH RFC 1/2] docs/design: Add a design document for Live
 Update
Thread-Index: AQHXQ1GL5yDA2hXTmkq1WsWucyAoqw==
Date: Fri, 7 May 2021 14:59:14 +0000
Message-ID: <28b31476e2044161f94bfd85d1d3c8b2f6dfb806.camel@amazon.com>
References: <20210506104259.16928-1-julien@xen.org>
	 <20210506104259.16928-2-julien@xen.org>
	 <f51b2ef6-3998-7371-cea9-502c5c9f8afa@suse.com>
	 <2a497e4c-d5a3-1da2-699e-1e31740a81f0@xen.org>
	 <324f10b9-2b1f-ec61-1816-44c960c285f8@suse.com>
In-Reply-To: <324f10b9-2b1f-ec61-1816-44c960c285f8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.160.119]
Content-Type: text/plain; charset="utf-8"
Content-ID: <98995F9367FD964BBC9A84C0B10B47D8@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gRnJpLCAyMDIxLTA1LTA3IGF0IDE0OjE1ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMDcuMDUuMjAyMSAxMzo0NCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KWy4uLl0NCj4gPiANCj4g
PiBJdCBpcyBhIGtub3duIGNvbnZlbmllbnQgcGxhY2UuIEl0IG1heSBiZSBkaWZmaWN1bHQgdG8g
ZmluZCBhDQo+ID4gc2ltaWxhciANCj4gPiBzcG90IG9uIGhvc3QgdGhhdCBoYXZlIGJlZW4gbG9u
Zy1ydW5uaW5nLg0KPiANCj4gSSdtIG5vdCBjb252aW5jZWQ6IElmIGl0IHdhcyBwbGFjZWQgaW4g
dGhlIGtleGVjIGFyZWEgYXQgYSAyTWINCj4gYm91bmRhcnksIGl0IGNvdWxkIGp1c3QgcnVuIGZy
b20gdGhlcmUuIElmIHRoZSBrZXhlYyBhcmVhIGlzDQo+IGxhcmdlIGVub3VnaCwgdGhpcyB3b3Vs
ZCB3b3JrIGFueSBudW1iZXIgb2YgdGltZXMgKGFzIG9jY3VwaWVkDQo+IHJhbmdlcyBiZWNvbWUg
YXZhaWxhYmxlIGFnYWluIHdoZW4gdGhlIG5leHQgTFUgY3ljbGUgZW5kcykuDQoNClRvIG1ha2Ug
c3VyZSB0aGUgbmV4dCBYZW4gY2FuIGJlIGxvYWRlZCBhbmQgcnVuIGFueXdoZXJlIGluIGNhc2Ug
a2V4ZWMNCmNhbm5vdCBmaW5kIGxhcmdlIGVub3VnaCBtZW1vcnkgdW5kZXIgNEcsIHdlIG5lZWQg
dG86DQoNCjEuIHRlYWNoIGtleGVjIHRvIGxvYWQgdGhlIHdob2xlIGltYWdlIGNvbnRpZ3VvdXNs
eS4gQXQgdGhlIG1vbWVudA0Ka2V4ZWMgcHJlcGFyZXMgc2NhdHRlcmVkIDRLIHBhZ2VzIHdoaWNo
IGFyZSBub3QgcnVubmFibGUgdW50aWwgdGhleSBhcmUNCmNvcGllZCB0byBhIGNvbnRpZ3VvdXMg
ZGVzdGluYXRpb24uIChXaGF0IGlmIGl0IGNhbid0IGZpbmQgYSBjb250aWd1b3VzDQpyYW5nZT8p
DQoNCjIuIHRlYWNoIFhlbiB0aGF0IGl0IGNhbiBiZSBqdW1wZWQgaW50byB3aXRoIHNvbWUgZXhp
c3RpbmcgcGFnZSB0YWJsZXMNCndoaWNoIHBvaW50IHRvIGl0c2VsZiBhYm92ZSA0Ry4gV2UgY2Fu
J3QgZG8gcmVhbC9wcm90ZWN0ZWQgbW9kZSBlbnRyeQ0KYmVjYXVzZSBpdCBuZWVkcyB0byBzdGFy
dCBiZWxvdyA0RyBwaHlzaWNhbGx5LiBNYXliZSBhIG1vZGlmaWVkIHZlcnNpb24NCm9mIHRoZSBF
RkkgZW50cnkgcGF0aCAobXkgZmFtaWxpYXJpdHkgd2l0aCBYZW4gRUZJIGVudHJ5IGlzIGxpbWl0
ZWQpPw0KDQozLiByZXdyaXRlIGFsbCB0aGUgZWFybHkgYm9vdCBiaXRzIHRoYXQgYXNzdW1lIFhl
biBpcyB1bmRlciA0RyBhbmQgaXRzDQpidW5kbGVkIHBhZ2UgdGFibGVzIGZvciBiZWxvdyA0Ry4N
Cg0KVGhlc2UgYXJlIHRoZSBvYnN0YWNsZXMgb2ZmIHRoZSB0b3Agb2YgbXkgaGVhZC4gU28gSSB0
aGluayB0aGVyZSBpcyBubw0KZnVuZGFtZW50YWwgcmVhc29uIHdoeSB3ZSBoYXZlIHRvIHBsYWNl
IFhlbiAjMiB3aGVyZSBYZW4gIzEgd2FzLCBidXQNCmRvaW5nIHNvIGlzIGEgbWFzc2l2ZSByZWR1
Y3Rpb24gb2YgcGFpbiB3aGljaCBhbGxvd3MgdXMgdG8gcmV1c2UgbXVjaA0Kb2YgdGhlIGV4aXN0
aW5nIFhlbiBjb2RlLg0KDQpNYXliZSwgdGhpcyBwYXJ0IGRvZXMgbm90IGhhdmUgdG8gYmUgcGFy
dCBvZiB0aGUgQUJJIGFuZCB3ZSBqdXN0DQpzdWdnZXN0IHRoaXMgYXMgb25lIHdheSBvZiBsb2Fk
aW5nIHRoZSBuZXh0IFhlbiB0byBjb3BlIHdpdGggZ3Jvd3RoPw0KVGhpcyBpcyB0aGUgYmVzdCB3
YXkgSSBjYW4gdGhpbmsgb2YgKGxvYWRpbmcgWGVuIHdoZXJlIGl0IHdhcyBhbmQNCmV4cGFuZCBp
bnRvIHRoZSByZXNlcnZlZCBib290bWVtIGlmIG5lZWRlZCkgdGhhdCBkb2VzIG5vdCBuZWVkIHRv
DQpyZXdyaXRlIGEgbG90IG9mIGVhcmx5IGJvb3QgY29kZSBhbmQgY2FuIHByZXR0eSBtdWNoIGd1
YXJhbnRlZSBzdWNjZXNzDQpldmVuIGlmIG1lbW9yeSBpcyB0aWdodCBhbmQgZnJhZ21lbnRlZC4N
Cg0KSG9uZ3lhbg0K

