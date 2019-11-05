Return-Path: <SRS0=K4eM=Y5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C040AC5DF60
	for <xen-devel@archiver.kernel.org>; Tue,  5 Nov 2019 15:31:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95EF120650
	for <xen-devel@archiver.kernel.org>; Tue,  5 Nov 2019 15:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95EF120650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0nu-0007dG-0x; Tue, 05 Nov 2019 15:31:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C/+H=Y5=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iS0ns-0007dB-MQ
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:31:32 +0000
X-Inumbo-ID: 574444ee-ffe1-11e9-984a-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 574444ee-ffe1-11e9-984a-bc764e2007e4;
 Tue, 05 Nov 2019 15:31:31 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Wei Liu <wl@xen.org>
Thread-Topic: [XEN PATCH v2] MAINTAINERS: ARINC 653 scheduler maintainer
 updates
Thread-Index: AQHVk+rveZ//t8DeZUmOhx16unerLKd8s55w
Date: Tue, 5 Nov 2019 15:31:36 +0000
Message-ID: <b8d77647141745e49853f1bcb1cd1be6@dornerworks.com>
References: <20191105135152.5168-1-stewart.hildebrand@dornerworks.com>
 <20191105150841.hfww7mjahmibrhym@debian>
In-Reply-To: <20191105150841.hfww7mjahmibrhym@debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.254]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v2] MAINTAINERS: ARINC 653 scheduler
 maintainer updates
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Josh Whitehead <Josh.Whitehead@dornerworks.com>, Jan
 Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlc2RheSwgTm92ZW1iZXIgNSwgMjAxOSAxMDowOSBBTSwgV2VpIExpdSB3cm90ZToKPk9u
IFR1ZSwgTm92IDA1LCAyMDE5IGF0IDA4OjUxOjUyQU0gLTA1MDAsIFN0ZXdhcnQgSGlsZGVicmFu
ZCB3cm90ZToKPj4gQWRkIERvcm5lcldvcmtzIGludGVybmFsIGxpc3QuIFRoaXMgd2lsbCBmb3J3
YXJkIHRvIHJlbGV2YW50IHBlb3BsZQo+PiB3aXRoaW4gRG9ybmVyV29ya3MuCj4+Cj4+IEFkZCBt
eXNlbGYgdG8gTUFJTlRBSU5FUlMgZm9yIEFSSU5DNjUzIHNjaGVkdWxlci4KPj4KPj4gUmVtb3Zl
IFJvYmJpZSBmcm9tIE1BSU5UQUlORVJTIGZvciBBUklOQzY1MyBzY2hlZHVsZXIuCj4+Cj4KPk1p
c3NpbmcgU29CIGhlcmUuCj4KPk5vIG5lZWQgdG8gcmVzZW5kLiBUaGUgZm9sbG93aW5nIGNhbiBi
ZSBhZGRlZCB3aGlsZSBjb21taXR0aW5nOgo+Cj4gIFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGls
ZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPgo+TGV0IG1lIGtu
b3cgd2hhdCB5b3UgdGhpbmsuCgpZZXMsIHNvcnJ5IGFib3V0IHRoYXQuIFBsZWFzZSBnbyBhaGVh
ZCBhbmQgYWRkIGl0LgoKU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0
LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
