From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/amd: don't set pv_post_outb_hook when
 !CONFIG_PV
Date: Thu, 8 Nov 2018 15:38:28 +0000
Message-ID: <20181108153828.zuqwpohzilq2ayme@zion.uk.xensource.com>
References: <20181108145809.12232-1-wei.liu2@citrix.com>
 <5BE4578B02000078001F9BF8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKmO8-0006ZC-Oi
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:38:32 +0000
Content-Disposition: inline
In-Reply-To: <5BE4578B02000078001F9BF8@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6MzQ6MzVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDE1OjU4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvY3B1L2FtZC5jCj4gPiBAQCAtNjMxLDcgKzYzMSw5IEBAIHN0YXRpYyB2b2lkIGluaXRfYW1k
KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKPiA+ICAJY2FzZSAweGYgLi4uIDB4MTc6Cj4gPiAgCQlk
aXNhYmxlX2MxZShOVUxMKTsKPiA+ICAJCWlmIChhY3BpX3NtaV9jbWQgJiYgKGFjcGlfZW5hYmxl
X3ZhbHVlIHwgYWNwaV9kaXNhYmxlX3ZhbHVlKSkgewo+ID4gKyNpZmRlZiBDT05GSUdfUFYKPiA+
ICAJCQlwdl9wb3N0X291dGJfaG9vayA9IGFtZF9jaGVja19kaXNhYmxlX2MxZTsKPiA+ICsjZW5k
aWYKPiA+ICAJCQlhbWRfYWNwaV9jMWVfcXVpcmsgPSB0cnVlOwo+ID4gIAkJfQo+ID4gIAkJYnJl
YWs7Cj4gCj4gSG1tLCBJIHdvdWxkIGhhdmUgaG9wZWQgZm9yIHRoaXMgdG8gZ2V0IHByb3Blcmx5
IGNsZWFuZWQgdXAsCj4gYXMgb3V0bGluZWQgaW4gdGhhdCBvdGhlciB0aHJlYWQsIGlmIHlvdSBh
bHJlYWR5IHRvdWNoIGl0LiBBbnl3YXksCj4gSSBzZWUgeW91J3ZlIGdvdCB0aGUgbmVjZXNzYXJ5
IGFja3MsIHNvIHRoZSBzdWJzZXF1ZW50Cj4gY2xlYW51cCBwYXRjaCB3aWxsIGp1c3QgaGF2ZSB0
byBkZWxldGUgdHdvIG1vcmUgbGluZXMuCgpEbyB5b3UgbWVhbiB0byBzd2l0Y2ggUFYgdG8gdXNl
IHRoZSBzYW1lIG1lY2hhbmlzbSBhcyBIVk0/IEkgZG9uJ3QgaGF2ZQphIG1hY2hpbmUgdG8gdGVz
dCB0aGlzIGNvZGUgcGF0aCBhdCB0aGUgbW9tZW50LCBzbyBpdCB3aWxsIG5lZWQgdG8gd2FpdAph
IGJpdC4gSW4gdGhlIG1lYW4gdGltZSBJIHdvdWxkIGxpa2UgdG8gdGljayBvbmUgb2YgdGhlIGJp
ZyB3b3JrIGl0ZW1zCm9mZiBvZiBteSBsaXN0LgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
