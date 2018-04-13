From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 7/7] add sleep,
 msleep and NOW() macros to time manager
Date: Fri, 13 Apr 2018 14:55:44 +0100
Message-ID: <20180413135544.a5ravjw6khgvm4i3@MacBook-Pro-de-Roger.local>
References: <20180410191701.17203-1-semelpaul@gmail.com>
 <20180410191701.17203-7-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aili=hc=citrix.com=prvs=63401f18f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f6zBA-0000jR-CV
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 13:55:52 +0000
Content-Disposition: inline
In-Reply-To: <20180410191701.17203-7-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: xen-devel@lists.xenproject.org, Paul Semel <phentex@amazon.de>, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDk6MTc6MDFQTSArMDIwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiB0aG9zZSBhcmUgaGVscGZ1bCBtYWNybyB0byB1c2UgdGhlIHRpbWUgbWFuYWdlciBjb3Jy
ZWN0bHkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4K
PiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjQ6Cj4gICAgIC0gbmV3IHBhdGNoIHZlcnNpb24KPiAK
PiAgY29tbW9uL3RpbWUuYyAgICAgIHwgMTAgKysrKysrKysrKwo+ICBpbmNsdWRlL3h0Zi90aW1l
LmggfCAxMiArKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1lLmMgYi9jb21tb24vdGltZS5jCj4gaW5kZXgg
NzUxNWViMC4uZTI3NzliOSAxMDA2NDQKPiAtLS0gYS9jb21tb24vdGltZS5jCj4gKysrIGIvY29t
bW9uL3RpbWUuYwo+IEBAIC0xNjMsNiArMTYzLDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtc3Bp
bl9zbGVlcCh1aW50NjRfdCB0KQo+ICAgICAgbnNwaW5fc2xlZXAobnNlYyk7Cj4gIH0KPiAgCj4g
K3ZvaWQgc2xlZXAodWludDY0X3QgdCkKPiArewo+ICsgICAgc3Bpbl9zbGVlcCh0KTsKPiArfQo+
ICsKPiArdm9pZCBtc2xlZXAodWludDY0X3QgdCkKPiArewo+ICsgICAgbXNwaW5fc2xlZXAodCk7
CgpXaHkgY2FuIHlvdSBqdXN0IGNhbGwgbXNwaW5fc2xlZXAgbXNsZWVwIGRpcmVjdGx5PwoKVGhl
IHNhbWUgYXBwbGllcyB0byBzcGluX3NsZWVwLgoKQWxzbyBJIHdhcyBleHBlY3RpbmcgdG8gc2Vl
IHNvbWUga2luZCBvZiB0ZXN0IGFwcGVhciBhdCB0aGUgZW5kIG9mIHRoZQpzZXJpZXMuIFlvdSBh
cmUgYmFzaWNhbGx5IGFkZGluZyBhIGJ1bmNoIG9mIGRlYWQgY29kZSwgc2luY2UgdGhlcmUncwpu
byB1c2VyIG9mIGFueSBvZiB0aGUgbmV3bHkgaW50cm9kdWNlZCBmdW5jdGlvbnMuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
