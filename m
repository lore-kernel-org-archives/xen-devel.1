From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 7/7] add sleep,
 msleep and NOW() macros to time manager
Date: Tue, 17 Apr 2018 08:42:14 +0100
Message-ID: <20180417074214.awghqhilw5tc4sos@MacBook-Pro-de-Roger.local>
References: <20180410191701.17203-1-semelpaul@gmail.com>
 <20180410191701.17203-7-semelpaul@gmail.com>
 <20180413135544.a5ravjw6khgvm4i3@MacBook-Pro-de-Roger.local>
 <e096546f-f299-0a28-41ea-07c91dc25706@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/k2m=hg=citrix.com=prvs=63841d76d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f8LFt-0003ZB-Vp
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 07:42:22 +0000
Content-Disposition: inline
In-Reply-To: <e096546f-f299-0a28-41ea-07c91dc25706@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMTI6NDU6MTdQTSArMDIwMCwgUGF1bCBTZW1lbCB3cm90
ZToKPiBPbiAwNC8xMy8yMDE4IDAzOjU1IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
PiB0aG9zZSBhcmUgaGVscGZ1bCBtYWNybyB0byB1c2UgdGhlIHRpbWUgbWFuYWdlciBjb3JyZWN0
bHkKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgU2VtZWwgPHBoZW50ZXhAYW1hem9u
LmRlPgo+ID4gPiAtLS0KPiA+ID4gCj4gPiA+IE5vdGVzOgo+ID4gPiAgICAgIHY0Ogo+ID4gPiAg
ICAgIC0gbmV3IHBhdGNoIHZlcnNpb24KPiA+ID4gCj4gPiA+ICAgY29tbW9uL3RpbWUuYyAgICAg
IHwgMTAgKysrKysrKysrKwo+ID4gPiAgIGluY2x1ZGUveHRmL3RpbWUuaCB8IDEyICsrKysrKysr
KysrKwo+ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1lLmMgYi9jb21tb24vdGltZS5jCj4gPiA+IGluZGV4
IDc1MTVlYjAuLmUyNzc5YjkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2NvbW1vbi90aW1lLmMKPiA+ID4g
KysrIGIvY29tbW9uL3RpbWUuYwo+ID4gPiBAQCAtMTYzLDYgKzE2MywxNiBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgbXNwaW5fc2xlZXAodWludDY0X3QgdCkKPiA+ID4gICAgICAgbnNwaW5fc2xlZXAo
bnNlYyk7Cj4gPiA+ICAgfQo+ID4gPiArdm9pZCBzbGVlcCh1aW50NjRfdCB0KQo+ID4gPiArewo+
ID4gPiArICAgIHNwaW5fc2xlZXAodCk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3ZvaWQgbXNs
ZWVwKHVpbnQ2NF90IHQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgbXNwaW5fc2xlZXAodCk7Cj4gPiAK
PiA+IFdoeSBjYW4geW91IGp1c3QgY2FsbCBtc3Bpbl9zbGVlcCBtc2xlZXAgZGlyZWN0bHk/Cj4g
PiAKPiA+IFRoZSBzYW1lIGFwcGxpZXMgdG8gc3Bpbl9zbGVlcC4KPiA+IAo+ID4gQWxzbyBJIHdh
cyBleHBlY3RpbmcgdG8gc2VlIHNvbWUga2luZCBvZiB0ZXN0IGFwcGVhciBhdCB0aGUgZW5kIG9m
IHRoZQo+ID4gc2VyaWVzLiBZb3UgYXJlIGJhc2ljYWxseSBhZGRpbmcgYSBidW5jaCBvZiBkZWFk
IGNvZGUsIHNpbmNlIHRoZXJlJ3MKPiA+IG5vIHVzZXIgb2YgYW55IG9mIHRoZSBuZXdseSBpbnRy
b2R1Y2VkIGZ1bmN0aW9ucy4KPiAKPiBBY3R1YWxseSwgSSB3b24ndCBiZSBhYmxlIHRvIGFkZCBh
IHJlYWwgWFNBIHRlc3QgdXNpbmcgdGhpcyBmZWF0dXJlLiBBbnl3YXksCj4gSSBkbyB0aGluayB0
aGF0IGhhdmluZyB0aGUgc2xlZXAgZnVuY3Rpb25zIHdpbGwgYmUgcmVhbGx5IHVzZWZ1bCBpbiB0
aGUKPiBmdXR1cmUuCj4gQW55d2F5LCBJIHdhcyB0aGlua2luZyBhYm91dCBhZGRpbmcgYSB0ZXN0
IHRoYXQgaXMgY2FsbGluZyB0aGUgZ2V0dGltZW9mZGF5Cj4gZnVuY3Rpb24gb3Igc29tZXRoaW5n
IHNpbWlsYXIuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgaXQgPwoKWWVzLCBzZWUgbXkg
bGFzdCByZXBseSB0byAzLzcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
