From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH] tools/ocaml: Release the global lock before
 invoking block syscalls
Date: Mon, 8 Oct 2018 07:58:18 +0000
Message-ID: <A062A4B6-57AD-41B6-9648-7FC34A7FDEAB@citrix.com>
References: <20181008031014.8485-1-yang.qian@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvom=mu=citrix.com=prvs=812615989=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1g9QQn-0001bU-GV
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 07:58:21 +0000
In-Reply-To: <20181008031014.8485-1-yang.qian@citrix.com>
Content-Language: en-US
Content-ID: <E6F8C087AB007D49858A751D675A704C@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yang Qian <krizex@gmail.com>
Cc: Yang Qian <yang.qian@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gOCBPY3QgMjAxOCwgYXQgMDQ6MTAsIFlhbmcgUWlhbiA8a3JpemV4QGdtYWlsLmNv
bT4gd3JvdGU6DQo+IA0KPiBGdW5jdGlvbnMgcmVsYXRlZCB3aXRoIGV2ZW50IGNoYW5uZWwgYXJl
IHBhcmFsbGVsaXphYmxlLCBzbyByZWxlYXNlIGdsb2JhbA0KPiBsb2NrIGJlZm9yZSBpbnZva2lu
ZyBDIGZ1bmN0aW9uIHdoaWNoIHdpbGwgZmluYWxseSBjYWxsIGJsb2NrIHN5c2NhbGxzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBRaWFuIDx5YW5nLnFpYW5AY2l0cml4LmNvbT4NCj4gLS0t
DQo+IHRvb2xzL29jYW1sL2xpYnMvZXZlbnRjaG4veGVuZXZlbnRjaG5fc3R1YnMuYyB8IDMwICsr
KysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCg0KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlz
dGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCg0KRnJvbSBhbiBPQ2FtbCBwb2ludCBvZiB2aWV3IHRo
aXMgaXMgbG9va2luZyBnb29kLiBCdXQgSSB3b3VsZCBsaWtlIHRvIGhlYXIgZnJvbSBkZXZlbG9w
ZXJzIHVuZGVyc3RhbmRpbmcgZXZlbnQgY2hhbm5lbHMgdGhhdCB0aGlzIGlzIGluZGVlZCBzYWZl
IHRvIGRvLg0KDQrigJQgQ2hyaXN0aWFuDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
