From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 41/74] xen/pvh: do not mark the low
 1MB as IO mem
Date: Mon, 8 Jan 2018 10:37:40 +0000
Message-ID: <20180108103740.c6mmjd6vgp2a2d6s@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-42-wei.liu2@citrix.com>
 <5A535649020000780019C0C7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q3al=ed=citrix.com=prvs=539ca8c7b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYUoT-0000hF-Um
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:37:53 +0000
Content-Disposition: inline
In-Reply-To: <5A535649020000780019C0C7@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMDgsIDIwMTggYXQgMDM6MzA6MTdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtMjg4LDggKzI4OSwxMiBAQCB2b2lkIF9faW5pdCBhcmNoX2luaXRfbWVtb3J5
KHZvaWQpCj4gPiAgICAgIGRvbV9jb3cgPSBkb21haW5fY3JlYXRlKERPTUlEX0NPVywgRE9NQ1JG
X2R1bW15LCAwLCBOVUxMKTsKPiA+ICAgICAgQlVHX09OKElTX0VSUihkb21fY293KSk7Cj4gPiAg
Cj4gPiAtICAgIC8qIEZpcnN0IDFNQiBvZiBSQU0gaXMgaGlzdG9yaWNhbGx5IG1hcmtlZCBhcyBJ
L08uICovCj4gPiAtICAgIGZvciAoIGkgPSAwOyBpIDwgMHgxMDA7IGkrKyApCj4gPiArICAgIC8q
Cj4gPiArICAgICAqIEZpcnN0IDFNQiBvZiBSQU0gaXMgaGlzdG9yaWNhbGx5IG1hcmtlZCBhcyBJ
L08uICBJZiB3ZSBib290ZWQgUFZILAo+ID4gKyAgICAgKiByZWNsYWltIHRoZSBzcGFjZS4gIEly
cmVzcGVjdGl2ZSwgbGVhdmUgTUZOIDAgYXMgc3BlY2lhbCBmb3IgdGhlIHNha2UKPiA+ICsgICAg
ICogb2YgMCBiZWluZyBhIHZlcnkgY29tbW9uIGRlZmF1bHQgdmFsdWUuCj4gPiArICAgICAqLwo+
ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IChwdmhfYm9vdCA/IDEgOiAweDEwMCk7IGkrKyApCj4g
PiAgICAgICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KG1mbl90b19wYWdlKF9tZm4oaSkp
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb21faW8sIFhFTlNIQVJF
X3dyaXRhYmxlKTsKPiAKPiBJIGNhbiBzZWUgdGhpcyBiZWluZyB2YWxpZCBhcyBsb25nIGFzIHRo
ZXJlJ3Mgbm8gZmlybXdhcmUuIFdoYXQKPiBkb2Vzbid0IGJlY29tZSBjbGVhciBmcm9tIG5laXRo
ZXIgdGhlIGRlc2NyaXB0aW9uIG5vciB0aGUKPiBjb21tZW50IGlzIHdoZXRoZXIgdGhpcyBpcyBh
IG5lY2Vzc2FyeSBjaGFuZ2UsIG9yIGp1c3QgYW4KPiBvcHRpbWl6YXRpb24gdG8gYXZvaWQgd2Fz
dGluZyB0aGVzZSAyNTUgcGFnZXMuCgpJdCdzIGp1c3QgYW4gb3B0aW1pemF0aW9uIHRvIG5vdCB3
YXN0ZSB0aGUgbG93IDFNaUIuIFRoZSBzaGltIHdpbGwKd29yayBlcXVhbGx5IHdlbGwgd2l0aG91
dCB0aGlzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
