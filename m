Return-Path: <SRS0=Jf0I=ZJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D24C432C3
	for <xen-devel@archiver.kernel.org>; Sun, 17 Nov 2019 22:31:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC04320729
	for <xen-devel@archiver.kernel.org>; Sun, 17 Nov 2019 22:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC04320729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWT52-0007W7-L1; Sun, 17 Nov 2019 22:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iuzj=ZJ=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iWT51-0007W2-D1
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2019 22:31:39 +0000
X-Inumbo-ID: 03fc108e-098a-11ea-b678-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 03fc108e-098a-11ea-b678-bc764e2007e4;
 Sun, 17 Nov 2019 22:31:38 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] arm/vtimer: Physical timer emulation and the
 physical counter
Thread-Index: AQHVmyJ4TtFeJ37t2ki3nDfvDkReu6eP88iA
Date: Sun, 17 Nov 2019 22:32:38 +0000
Message-ID: <76094c14e54b4a0e9ca539797636f060@dornerworks.com>
References: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
In-Reply-To: <410bf860-09f3-de37-49dc-683cf5f74ced@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.198]
MIME-Version: 1.0
Subject: Re: [Xen-devel] arm/vtimer: Physical timer emulation and the
 physical counter
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
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q0MnaW5nIEp1bGllbidzIG5ldyBlbWFpbCBhZGRyZXNzDQoNCk9uIFRodXJzZGF5LCBOb3ZlbWJl
ciAxNCwgMjAxOSAyOjMzIFBNLCBKZWZmIEt1YmFzY2lrIHdyb3RlOg0KPkhlbGxvLA0KPg0KPkkn
bSB3b3JraW5nIG9uIGEgcG9ydCBvZiBhIFJUT1MgKFJURU1TKSB0byBYZW4gb24gQVJNLCBhbmQg
Y2FtZSBhY3Jvc3MgYW4NCj5pbnRlcmVzdGluZyBmaW5kaW5nIGluIGhvdyBYZW4gZW11bGF0ZXMg
dGhlIHBoeXNpY2FsIHRpbWVyIG9uIEFSTS4NCj4NCj5JbiB0ZXN0aW5nIGRpZmZlcmVudCBjb25m
aWd1cmF0aW9ucyBvZiB0aGUgcG9ydCwgSSBoYXZlIHRoZSBSVE9TIGNvbmZpZ3VyZWQgdG8NCj51
c2UgdGhlIEFSTSBnZW5lcmljIHBoeXNpY2FsIHRpbWVyLiBUaGUgZHJpdmVyIG9wZXJhdGVzIHRo
ZSBwaHlzaWNhbCB0aW1lciBpbg0KPnRoZSAiQ29tcGFyZVZpZXciIG1vZGUsIHdoZXJlIHRoZSB0
aW1lciBjb25kaXRpb24gaXMgbWV0IHdoZW4gdGhlIHBoeXNpY2FsDQo+Y291bnRlciByZWFjaGVz
IHRoZSBwcm9ncmFtbWVkIENvbXBhcmVWYWx1ZS4NCj4NCj5UaGUgZHJpdmVyIGluaXRpYWxpemVz
IHRoZSBwaHlzaWNhbCB0aW1lciBieSBmaXJzdCByZWFkaW5nIHRoZSBwaHlzaWNhbCBjb3VudGVy
DQo+cmVnaXN0ZXIgQ05UUENULCBhZGRpbmcgdGhlIHN5c3RpY2sgaW50ZXJ2YWwsIGFuZCB0aGVu
IHdyaXRpbmcgdGhlIHJlc3VsdCB0byB0aGUNCj5Db21wYXJlVmFsdWUgcmVnaXN0ZXIgQ05UUF9D
VkFMLiBUaGlzIGFwcGVhcnMgdG8gYmUgdmFsaWQgYmVoYXZpb3IgYmFzZWQgb24gbXkNCj51bmRl
cnN0YW5kaW5nIG9mIHRoZSBBUk1WOCBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCwgc2lu
Y2UgdGhlIHBoeXNpY2FsDQo+dGltZXIgIm9mZnNldCIgaXMgc3BlY2lmaWVkIHRvIGJlIHplcm8u
DQo+DQo+WGVuIHdpbGwgdHJhcCBhY2Nlc3NlcyB0byB0aGUgcGh5c2ljYWwgdGltZXIgcmVnaXN0
ZXJzIC0gQ05UUF9DVEwsIENOVFBfQ1ZBTCwNCj5hbmQgQ05UUF9UVkFMLCB3aGljaCBoYXBwZW5z
IGluIHhlbi9hcmNoL2FybS92dGltZXIuYy4gWGVuIHdpbGwgYWRkIG9yIHJlbW92ZSBhbg0KPm9m
ZnNldCBwaHlzX3RpbWVyX2Jhc2Uub2Zmc2V0IHdoZW4gcmVhZGluZyBvciB3cml0aW5nIHRvIHRo
ZSBDTlRQX0NWQUwvQ05UUF9UVkFMDQo+cmVnaXN0ZXJzLiBUaGlzIG9mZnNldCBpcyBkZXRlcm1p
bmVkIHdoZW4gdGhlIHZ0aW1lciBpcyBpbml0aWFsaXplZCBvbiBndWVzdA0KPmNyZWF0aW9uLg0K
Pg0KPkhvd2V2ZXIsIFhlbiBkb2VzIG5vdCB0cmFwIGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgY291
bnRlciByZWdpc3RlciBDTlRQQ1QuIFRoaXMNCj5tZWFucyB0aGUgZ3Vlc3QgaGFzIGRpcmVjdCBh
Y2Nlc3MgdG8gdGhlIHJlZ2lzdGVyLiBJdCBhbHNvIG1lYW5zIHRoZSBvZmZzZXQgaXMNCj5ub3Qg
YXBwbGllZCBoZXJlLiBJIGJlbGlldmUgdGhpcyBpcyBhIHByb2JsZW0sIGJlY2F1c2UgdGhlIHBo
eXNpY2FsIHRpbWVyIGlzIG5vDQo+bG9uZ2VyIGNvbnNpc3RlbnQgd2l0aCB0aGUgcGh5c2ljYWwg
Y291bnRlciBmcm9tIHRoZSBndWVzdCdzIHBlcnNwZWN0aXZlIC0gdGhlcmUNCj5pcyBhIG5vbi16
ZXJvLCB1bmtub3duIG9mZnNldCBiZXR3ZWVuIHRoZSB0d28uDQo+DQo+VGhpcyB3YXMgYSBwcm9i
bGVtIGZvciB0aGUgUlRPUywgc2luY2UgaXQgd2FzIHJlYWRpbmcgdGhlIHBoeXNpY2FsIGNvdW50
ZXINCj5yZWdpc3RlciAoWGVuIGRvZXMgbm90IGFwcGx5IGFuIG9mZnNldCksIGFkZGluZyBzb21l
IGludGVydmFsLCBhbmQgdGhlbiBzZXR0aW5nDQo+dGhlIENvbXBhcmVWYWx1ZSByZWdpc3RlciAo
WGVuIGFwcGxpZXMgdGhlIG9mZnNldCksIHJlc3VsdGluZyBpbiBhIGxvbmcgZGVsYXkNCj5iZWZv
cmUgdGhlIHRpbWVyIGV4cGlyZXMuDQo+DQo+SSB3YXMgYWJsZSB0byBmaXggdGhpcyBieSBhZGRp
bmcgY29kZSBpbiBYZW4gdG8gdHJhcCBhY2Nlc3MgdG8gQ05UUENUIGFuZA0KPmFwcGx5aW5nIHRo
ZSBvZmZzZXQgLSBJIGNhbiBzdWJtaXQgdGhlIHBhdGNoIGlmIHRoZXJlIGlzIGludGVyZXN0LiBI
b3dldmVyLCBJDQo+d2FzIGN1cmlvdXMgaWYgdGhlcmUgd2FzIGFuIHJlYXNvbiBmb3Igbm90IHRy
YXBwaW5nLyBlbXVsYXRpbmcgYWNjZXNzIHRvIHRoZQ0KPnBoeXNpY2FsIGNvdW50ZXIgcmVnaXN0
ZXIgYW5kIGFwcGx5aW5nIHRoZSBvZmZzZXQ/DQo+DQo+U2luY2VyZWx5LA0KPkplZmYgS3ViYXNj
aWsNCj4NCj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
Plhlbi1kZXZlbCBtYWlsaW5nIGxpc3QNCj5YZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcN
Cj5odHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
