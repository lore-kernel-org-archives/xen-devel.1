From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Wed, 30 May 2018 02:13:30 -0600
Message-ID: <5B0E5D2A02000078001C6DC6@prv1-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <5B0D627702000078001C6A9E@prv1-mh.provo.novell.com>
 <20180530035607.000071e0@gmail.com> <20180530044749.00006c68@gmail.com>
 <20180530143230.0000602b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ai2o=ir=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fNwEi-0001EY-Nn
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 08:13:36 +0000
In-Reply-To: <20180530143230.0000602b@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDA2OjMyLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9u
IFdlZCwgMzAgTWF5IDIwMTggMDM6NTY6MDcgKzEwMDAKPj5BbGV4ZXkgRyA8eDE5MTd4QGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+Pk9uIFR1ZSwgMjkgTWF5IDIwMTggMDg6MjM6NTEgLTA2MDAKPj4+
IkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4gIAo+Pj4+Pj4+IE9u
IDEyLjAzLjE4IGF0IDE5OjMzLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6ICAgICAgCj4+Pj4+
IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9jb25maWcuaAo+Pj4+PiArKysgYi90b29s
cy9maXJtd2FyZS9odm1sb2FkZXIvY29uZmlnLmgKPj4+Pj4gQEAgLTUzLDEwICs1MywxNCBAQCBl
eHRlcm4gdWludDhfdCBpb2FwaWNfdmVyc2lvbjsKPj4+Pj4gICNkZWZpbmUgUENJX0lTQV9ERVZG
TiAgICAgICAweDA4ICAgIC8qIGRldiAxLCBmbiAwICovCj4+Pj4+ICAjZGVmaW5lIFBDSV9JU0Ff
SVJRX01BU0sgICAgMHgwYzIwVSAvKiBJU0EgSVJRcyA1LDEwLDExIGFyZSBQQ0kgY29ubmVjdGVk
ICovCj4+Pj4+ICAjZGVmaW5lIFBDSV9JQ0g5X0xQQ19ERVZGTiAgMHhmOCAgICAvKiBkZXYgMzEs
IGZuIDAgKi8KPj4+Pj4gKyNkZWZpbmUgUENJX01DSF9ERVZGTiAgICAgICAwICAgICAgIC8qIGJ1
cyAwLCBkZXYgMCwgZnVuYyAwICovICAgICAgCj4+Pj4KPj4+Pkp1c3QgTUNIIGlzIGxpYWJsZSB0
byBiZWNvbWUgYW1iaWd1b3VzIGluIHRoZSBmdXR1cmUuIFBlcmhhcHMgUENJX1EzNV9NQ0hfREVW
Rk4/ICAgIAo+Pj4KPj4+QWdyZWUsIFBDSV9RMzVfTUNIX0RFVkZOIGlzIG1vcmUgZXhwbGljaXQu
Cj4gCj4gT24gdGhlIG90aGVyIHRob3VnaHQsIHdlIGNhbiByZXVzZSBvbmUgTUNIIEJERiAjZGVm
aW5lIGZvciBtdWx0aXBsZQo+IGVtdWxhdGVkIGNoaXBzZXRzLCBub3QganVzdCBmb3Igc29tZXRo
aW5nIGNvbXBsZXRlbHkgZGlzdGluY3QgdG8gUTM1Cj4gYnV0IGV2ZW4gZm9yIHRob3NlIHdoaWNo
IG1vc3RseSByZXF1aXJlIG1lcmVseSBjaGFuZ2luZyBQQ0kgRElEcyAobGlrZQo+IFAzNSBldGMu
KSBTbyBpbiB0aGlzIGNhc2UgcHJvZHVjaW5nIG11bHRpcGxlICNkZWZpbmVzIGxpa2UKPiBQQ0lf
e1F8UHxHfTM1X01DSF9ERVZGTiBmb3IgdGhlIHNhbWUgQkRGIDA6MC4wIG1pZ2h0IGJlIGV4Y2Vz
c2l2ZS4KPiAKPiBQQ0lfSUNIOV9MUENfREVWRk4gY2FuIGJlIGFjdHVhbGx5IHJldXNlZCB0b28s
IGl0cyBCREYgbG9jYXRpb24KPiBzdXJ2aXZlZCBtYW55IGNoaXBzZXQgZ2VuZXJhdGlvbnMgc28g
aXRzICNkZWZpbmUgY2FuIGJlIHNoYXJlZCBhcyB3ZWxsCj4gKHRob3VnaCByZW5hbWVkIHRvIHNv
bWV0aGluZyBsaWtlIFBDSV9MUENfQlJJREdFX0RFVkZOKS4KClBDSV94MzVfTUNIX0RFVkZOIHRo
ZW4sIHdpdGggYSBicmllZiBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHg/CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
