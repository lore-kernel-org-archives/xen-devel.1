Return-Path: <SRS0=o/65=3Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1BEC2D0B1
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 14:34:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 168582084E
	for <xen-devel@archiver.kernel.org>; Tue,  4 Feb 2020 14:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 168582084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyzHY-00044F-Qd; Tue, 04 Feb 2020 14:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H7xx=3Y=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iyzHX-00044A-Fd
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 14:34:27 +0000
X-Inumbo-ID: 715df0de-475b-11ea-ad98-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 715df0de-475b-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 14:34:26 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [XEN PATCH] Check zone before merging adjacent
 blocks in heap
Thread-Index: AQHV22fO30viIyNC4kSP2VPP3x/WhKgLGRRw
Date: Tue, 4 Feb 2020 14:35:25 +0000
Message-ID: <781b2f4032304f57b1f34568e264911f@dornerworks.com>
References: <20200204143010.5117-1-stewart.hildebrand@dornerworks.com>
In-Reply-To: <20200204143010.5117-1-stewart.hildebrand@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.130]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH] Check zone before merging adjacent
 blocks in heap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlc2RheSwgRmVicnVhcnkgNCwgMjAyMCA5OjMwIEFNLCBTdGV3YXJ0IEhpbGRlYnJhbmQg
d3JvdGU6DQo+ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMNCj5pbmRleCA5NzkwMmQ0MmMxLi43ZDM5ZGQ1YmUwIDEwMDY0NA0KPi0t
LSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+KysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMNCj5AQCAtMTQ2Miw2ICsxNDYyLDcgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2VzKA0K
PiAgICAgICAgICAgICBpZiAoICFtZm5fdmFsaWQocGFnZV90b19tZm4ocHJlZGVjZXNzb3IpKSB8
fA0KPiAgICAgICAgICAgICAgICAgICFwYWdlX3N0YXRlX2lzKHByZWRlY2Vzc29yLCBmcmVlKSB8
fA0KPiAgICAgICAgICAgICAgICAgIChQRk5fT1JERVIocHJlZGVjZXNzb3IpICE9IG9yZGVyKSB8
fA0KPisgICAgICAgICAgICAgICAgIChwYWdlX3RvX3pvbmUocGctbWFzaykgIT0gem9uZSkgfHwN
Cg0KSXQgc2VlbXMgaXQgd291bGQgYmUgbW9yZSBjb25zaXN0ZW50IHdpdGggdGhlIHN1cnJvdW5k
aW5nIGNvZGUgd2UgZGlkIHMvcGctbWFzay9wcmVkZWNlc3Nvci8NCg0KPiAgICAgICAgICAgICAg
ICAgIChwaHlzX3RvX25pZChwYWdlX3RvX21hZGRyKHByZWRlY2Vzc29yKSkgIT0gbm9kZSkgKQ0K
PiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+DQo+QEAgLTE0ODUsNiArMTQ4Niw3IEBAIHN0YXRp
YyB2b2lkIGZyZWVfaGVhcF9wYWdlcygNCj4gICAgICAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKHBh
Z2VfdG9fbWZuKHN1Y2Nlc3NvcikpIHx8DQo+ICAgICAgICAgICAgICAgICAgIXBhZ2Vfc3RhdGVf
aXMoc3VjY2Vzc29yLCBmcmVlKSB8fA0KPiAgICAgICAgICAgICAgICAgIChQRk5fT1JERVIoc3Vj
Y2Vzc29yKSAhPSBvcmRlcikgfHwNCj4rICAgICAgICAgICAgICAgICAocGFnZV90b196b25lKHBn
K21hc2spICE9IHpvbmUpIHx8DQoNClNpbWlsYXJseSwgcy9wZyttYXNrL3N1Y2Nlc3Nvci8NCg0K
PiAgICAgICAgICAgICAgICAgIChwaHlzX3RvX25pZChwYWdlX3RvX21hZGRyKHN1Y2Nlc3Nvcikp
ICE9IG5vZGUpICkNCj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPg0KPi0tDQo+Mi4yNS4wDQo+
DQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj5Y
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
