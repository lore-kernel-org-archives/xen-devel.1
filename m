From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [RFC 03/16] vgic: move pause_flags check out of
 vgic spinlock
Date: Wed, 28 Nov 2018 22:02:57 +0000
Message-ID: <3301b614-853b-ecdf-c79c-246f35635325@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-4-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=83fl=oh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gS7vB-0004o4-3C
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 22:03:01 +0000
In-Reply-To: <1543440731-21947-4-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Content-ID: <02E793EDCBA4144CB6BBA4D5A9F883E6@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDI4LzExLzIwMTggMjE6MzEsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IEZyb206IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+DQo+IA0KPiBQYXVzZV9mbGFncyBp
cyBub3QgcmVsYXRlZCB0byB2Z2ljIHNwaW5sb2NrLCBzbyByZWR1Y2UgY29kZQ0KPiB1bmRlciBs
b2NrLg0KDQpXZWxsIHRlY2huaWNhbGx5IHRoaXMgY29kZSBpcyBwbGFpbiB3cm9uZy4uLiBJZiB5
b3UgcmVjZWl2ZSBhbiBpbnRlcnJ1cHQgDQpyb3V0ZWQgdG8gYSB2Q1BVIGRvd24sIHRoZW4geW91
IHdpbGwgZW5kIHVwIGxvc2luZyB0aGUgaW50ZXJydXB0IGZvcmV2ZXIuDQoNClNvIHJhdGhlciB0
aGFuIG1vdmluZyBpdCwgd2UgbmVlZCB0byBtYWtlIHRoZSB2R0lDIGhhbmRsaW5nIHByb3Blcmx5
IA0KaW50ZXJydXB0IHJvdXRlZCB0byBhbiBvZmZsaW5lL2luZXhpc3RpbmcgdkNQVS4gSWYgSSBh
bSBub3QgbWlzdGFrZW4sIA0KdGhlIHNwZWNzIHNheXMgdGhhdCB0aGV5IHNob3VsZCBiZSBxdWV1
ZWQgdW50aWwgdGhleSBhcmUgcm91dGVkIHRvIA0KYW5vdGhlciB2Q1BVIG9yIHRoZSB2Q1BVIGNv
bWVzIHVwLg0KDQpDaGVlcnMsDQoNCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
