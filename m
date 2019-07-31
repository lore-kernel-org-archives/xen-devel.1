Return-Path: <SRS0=nxqH=V4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F3BC433FF
	for <xen-devel@archiver.kernel.org>; Wed, 31 Jul 2019 13:54:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF91206A2
	for <xen-devel@archiver.kernel.org>; Wed, 31 Jul 2019 13:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF91206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsp39-0006ko-Ne; Wed, 31 Jul 2019 13:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X4wy=V4=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hsp38-0006kj-Nx
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:53:50 +0000
X-Inumbo-ID: 9cc15720-b39a-11e9-8524-879bbab952df
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9cc15720-b39a-11e9-8524-879bbab952df;
 Wed, 31 Jul 2019 13:53:46 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] xen/arm: platform: Add Raspberry Pi platform
Thread-Index: AQHVR5gxZUSIiWadR0Wl+dTl5FYzE6bku0vA
Date: Wed, 31 Jul 2019 13:55:12 +0000
Message-ID: <d502ff01019443ebb5f3edbaafd2671d@dornerworks.com>
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
 <2473fc46a8229bb2434a90a510136202e7479177.1564371527.git.stewart.hildebrand@dornerworks.com>
 <bca49f6e-7e01-f2d0-b309-9f0dccd70860@arm.com>
In-Reply-To: <bca49f6e-7e01-f2d0-b309-9f0dccd70860@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/arm: platform: Add Raspberry Pi
 platform
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkbmVzZGF5LCBKdWx5IDMxLCAyMDE5IDg6MDQgQU0sIEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+IHdyb3RlOg0KPkhpIFN0ZXdhcnQsDQoNCkhpIEp1bGllbg0KDQo+T24g
MjkvMDcvMjAxOSAxNDoxOSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPj4gVGhlIGF1eCBw
ZXJpcGhlcmFscyAodWFydDEsIHNwaTEsIGFuZCBzcGkyKSBzaGFyZSBhbiBJUlEgYW5kIGEgcGFn
ZSBvZg0KPj4gbWVtb3J5LiBGb3IgZGVidWdnaW5nLCBpdCBpcyBoZWxwZnVsIHRvIHVzZSB0aGUg
YXV4IFVBUlQgaW4gWGVuLiBJbg0KPj4gdGhpcyBjYXNlLCBYZW4gd291bGQgdHJ5IHRvIGFzc2ln
biBzcGkxIGFuZCBzcGkyIHRvIGRvbTAsIGJ1dCB0aGlzDQo+PiByZXN1bHRzIGluIGFuIGVycm9y
IHNpbmNlIHRoZSBzaGFyZWQgSVJRIHdhcyBhbHJlYWR5IGFzc2lnbmVkIHRvIFhlbi4NCj4+IEJs
YWNrbGlzdCBhdXggZGV2aWNlcyBvdGhlciB0aGFuIHRoZSBVQVJUIHRvIHByZXZlbnQgbWFwcGlu
ZyB0aGUgc2hhcmVkDQo+PiBJUlEgYW5kIG1lbW9yeSByYW5nZSB0byBkb20wLg0KPg0KPlJlYWRp
bmcgdGhlIGNvbW1pdCBtZXNzYWdlLCBpdCBpcyB1bmNsZWFyIHdoYXQncyB0aGUgaW1wYWN0IG9u
IGJsYWNrbGlzdCBzcGkxDQo+YW5kIHNwaTIuIENvdWxkIHlvdSBleHBhbmQgaXQ/DQoNClllcywg
Z29vZCB0aGlua2luZy4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIGZvbGxvd2luZyAodGhl
IGZpcnN0IHBhcmFncmFwaCBpcyB1bmNoYW5nZWQsIGp1c3QgY29waWVkIGZvciBjb21wbGV0ZW5l
c3MpOg0KDQoiVGhlIGF1eCBwZXJpcGhlcmFscyAodWFydDEsIHNwaTEsIGFuZCBzcGkyKSBzaGFy
ZSBhbiBJUlEgYW5kIGEgcGFnZSBvZg0KbWVtb3J5LiBGb3IgZGVidWdnaW5nLCBpdCBpcyBoZWxw
ZnVsIHRvIHVzZSB0aGUgYXV4IFVBUlQgaW4gWGVuLiBJbg0KdGhpcyBjYXNlLCBYZW4gd291bGQg
dHJ5IHRvIGFzc2lnbiBzcGkxIGFuZCBzcGkyIHRvIGRvbTAsIGJ1dCB0aGlzDQpyZXN1bHRzIGlu
IGFuIGVycm9yIHNpbmNlIHRoZSBzaGFyZWQgSVJRIHdhcyBhbHJlYWR5IGFzc2lnbmVkIHRvIFhl
bi4NCkJsYWNrbGlzdCBhdXggZGV2aWNlcyBvdGhlciB0aGFuIHRoZSBVQVJUIHRvIHByZXZlbnQg
bWFwcGluZyB0aGUgc2hhcmVkDQpJUlEgYW5kIG1lbW9yeSByYW5nZSB0byBkb20wLg0KDQpCbGFj
a2xpc3Rpbmcgc3BpMSBhbmQgc3BpMiB1bmZvcnR1bmF0ZWx5IG1ha2VzIHRob3NlIHBlcmlwaGVy
YWxzDQp1bmF2YWlsYWJsZSBmb3IgdXNlIGluIHRoZSBzeXN0ZW0uIEZ1dHVyZSB3b3JrIGNvdWxk
IGluY2x1ZGUgZm9yd2FyZGluZw0KdGhlIElSUSBmb3Igc3BpMSBhbmQgc3BpMiwgYW5kIHRyYXAg
YW5kIG1lZGlhdGUgYWNjZXNzIHRvIHRoZSBtZW1vcnkNCnJhbmdlIGZvciBzcGkxIGFuZCBzcGky
LiINCg0KV291bGQgeW91IGxpa2UgbWUgdG8gcmUtc2VuZCB0aGUgcGF0Y2gsIG9yIGNhbiB0aGUg
bWVzc2FnZSBiZSB1cGRhdGVkIG9uIGNvbW1pdD8NCg0KU3Rldw0KDQo+VGhlIHJlc3Qgb2YgdGhl
IHBhdGNoIGxvb2tzIGdvb2QuDQo+DQo+Q2hlZXJzLA0KPg0KPi0tDQo+SnVsaWVuIEdyYWxsDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
