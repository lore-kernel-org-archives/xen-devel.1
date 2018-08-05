From: Karel Hendrych <k+centosvirt@karlos.cz>
Subject: Re: libvirtd hang on CentOS6 after latest updates
Date: Sun, 5 Aug 2018 09:24:58 +0200
Message-ID: <507a993a-b082-371c-0fb7-2e6bf52d03da@karlos.cz>
References: <7e0dd5bb-cd78-6f6c-810c-766060da29bf@karlos.cz>
 <a4725ddd-6ec4-8e44-2d67-6d91dd809a62@suse.com>
 <CAFLBxZbiGrK8uwpuxY4SmALm17au7uHEH7fy0OyN7y4-kP94qw@mail.gmail.com>
 <8d51c1cc-f2d4-5037-396b-5b2c033c744c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wjz8=ku=karlos.cz=k+centosvirt@srs-us1.protection.inumbo.net>)
 id 1fmDPY-0005rF-CD
 for xen-devel@lists.xenproject.org; Sun, 05 Aug 2018 07:25:11 +0000
In-Reply-To: <8d51c1cc-f2d4-5037-396b-5b2c033c744c@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jim Fehlig <jfehlig@suse.com>, George Dunlap <dunlapg@umich.edu>, "Michal Kevicky, MJCH" <michal.kevicky@mjch.sk>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

VGhhbmtzLCBMb29waW5nIGluIE1pY2hhbCAoaW1wYWN0ZWQgYnkgdGhlIHNhbWUgbWF0dGVyKSB0
byBmb2xsb3cgdXAgCmhlcmUuIEkndmUgbWlncmF0ZWQgaW4gdGhlIG1lYW50aW1lIHRvIDQuOCBh
bmQgdG8geGwgdG9vbHMuCgpLYXJlbAoKT24gMjUuNy4yMDE4IDE4OjU4LCBKaW0gRmVobGlnIHdy
b3RlOgo+IE9uIDA3LzI1LzIwMTggMTA6MTcgQU0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9u
IFdlZCwgSnVsIDI1LCAyMDE4IGF0IDQ6NDIgUE0sIEppbSBGZWhsaWcgPGpmZWhsaWdAc3VzZS5j
b20+IHdyb3RlOgo+Pj4gT24gMDcvMjIvMjAxOCAwNDowMyBQTSwgS2FyZWwgSGVuZHJ5Y2ggd3Jv
dGU6Cj4+Pj4KPj4+PiBIaSwgSSBhbSBzZWVpbmcgZnJlcXVlbnQgbGlidmlydGQgaGFuZ3MgKGNs
aWVudHMgbm90IHJlc3BvbmRpbmcpIGFmdGVyCj4+Pj4gbGFzdCBDZW50T1M2LVhlbiB1cGRhdGUg
Ogo+Pj4KPj4+Cj4+PiB4ZW4tZGV2ZWwgaXMgbm90IHRoZSBiZXN0IHBsYWNlIHRvIHNlZWsgaGVs
cCB3aXRoIGRvd25zdHJlYW0gaXNzdWVzLAo+Pj4gcGFydGljdWxhcmx5IGxpYnZpcnQgb25lcyA6
LSkuIFlvdSB3b3VsZCBoYXZlIGJldHRlciBsdWNrIGNvbnRhY3RpbmcgdGhlCj4+PiBDZW50T1M2
IG1haW50YWluZXJzLgo+Pgo+PiBJbiB0aGlzIGNhc2UsIGl0IGxvb2tzIHZlcnkgbXVjaCBsaWtl
IHRoZXkncmUgc3VpbmcgdGhlIFZpcnQgU0lHCj4+IGJpbmFyaWVzLCB3aGljaCBhcmUgcHJldHR5
IGNsb3NlIHRvIGJlaW5nIHN0cmFpZ2h0LXVwIHBhY2tpbmcgb2YgdGhlCj4+IHVwc3RyZWFtIHRh
cmJhbGxzLCBhbmQgdGhlIG1haW50YWluZXJzIHdvdWxkIGJlIEFudGhvbnkgJiBJLsKgIEFuZCBJ
IGF0Cj4+IGxlYXN0IGtub3cgdmVyeSBsaXR0bGUgYWJvdXQgbGlidmlydC7CoCBJZiBLYXJlbCBo
YWQgcG9zdGVkIHRoaXMgb24KPj4gY2VudG9zLWRldmVsLCBJIHdvdWxkIGFsbW9zdCBjZXJ0YWlu
bHkgaGF2ZSBlbmRlZCB1cCBhc2tpbmcgaGltIHRvCj4+IHJlcG9zdCB0byB4ZW4tZGV2ZWwgYW55
d2F5LCBhdCB3aGljaCBwb2ludCBJIHdvdWxkIGhhdmUgY2MnZCB5b3UuIDotKQo+IAo+IEhlaCwg
b2sgOi0pLgo+IAo+PiBEb2VzIHRoZSBlcnJvciByaW5nIGFueSBiZWxscz8KPiAKPiBUaGUgdWRl
diBtZXNzYWdlcyBhcmUgJ2RlYnVnJyBsZXZlbCAobm90IGZhdGFsKSBhbmQgdW5yZWxhdGVkIElN
Ty4gSXQgCj4gd291bGQgYmUgYmVzdCB0byBhdHRhY2ggZ2RiIHRvIHRoZSBsaWJ2aXJ0ZCBwcm9j
ZXNzIGFuZCBnZXQgYSBiYWNrdHJhY2UgCj4gb2YgYWxsIHRocmVhZHMuCj4gCj4gUmVnYXJkcywK
PiBKaW0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
