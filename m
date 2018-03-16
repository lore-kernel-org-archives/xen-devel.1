From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 45/45] ARM: VGIC: wire new VGIC(-v2)
 files into Xen build system
Date: Fri, 16 Mar 2018 09:34:05 -0600
Message-ID: <5AABF1FD02000078001B2E58@prv-mh.provo.novell.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-46-andre.przywara@linaro.org>
 <5AABAF2A02000078001B2A6C@prv-mh.provo.novell.com>
 <ff913871-5d38-30c0-11d5-3321fa494e96@linaro.org>
 <5AABB94702000078001B2B61@prv-mh.provo.novell.com>
 <7e9c1373-302a-0f7e-d47d-a9cf448caf1a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewrN0-0007Fm-Dz
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 15:34:14 +0000
In-Reply-To: <7e9c1373-302a-0f7e-d47d-a9cf448caf1a@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE2OjEzLCA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4gd3Jv
dGU6Cj4gSGksCj4gCj4gT24gMTYvMDMvMTggMTE6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
PiBPbiAxNi4wMy4xOCBhdCAxMjoxMCwgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+Pj4gT24gMTYvMDMvMTggMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDE1
LjAzLjE4IGF0IDIxOjMwLCA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Pj4+
IC0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUKPj4+Pj4gKysrIGIveGVuL2NvbW1vbi9NYWtlZmls
ZQo+Pj4+PiBAQCAtMTksNiArMTksNyBAQCBvYmoteSArPSBrZXloYW5kbGVyLm8KPj4+Pj4gIG9i
ai0kKENPTkZJR19LRVhFQykgKz0ga2V4ZWMubwo+Pj4+PiAgb2JqLSQoQ09ORklHX0tFWEVDKSAr
PSBraW1hZ2Uubwo+Pj4+PiAgb2JqLXkgKz0gbGliLm8KPj4+Pj4gK29iai15ICs9IGxpc3Rfc29y
dC5vCj4+Pj4KPj4+PiBXaHkgaGVyZSByYXRoZXIgdGhhbiBpbiBwYXRjaCAxNz8gQW5kIHdoeSBh
bHNvIGZvciB4ODY/IEkgdGhpbmsgeW91Cj4+Pj4gd2FudCBhIHByb21wdGxlc3MgS2NvbmZpZyBv
cHRpb24gdGhhdCBhbiBhcmNoIGNhbiBzZWxlY3QgaWYgaXQgbmVlZHMKPj4+PiB0aGlzIGNvZGUs
IHVubGVzcyBvciB1bnRpbCBjb21tb24gY29kZSBtYWtlcyB1c2Ugb2YgaXQuCj4+Pgo+Pj4gWWVh
aCwgSSBoYWQgb2JqLSQoQ09ORklHX05FV19WR0lDKSBiZWZvcmUsIGJ1dCBKdWxpZW4gZGlzbGlr
ZWQgaXQuCj4+PiBQcm9tcHRsZXNzIEtjb25maWcgc291bmRzIGdvb2QgdG8gbWUuCj4+IAo+PiBB
bmQgbm90ZSBJJ20gbm90IGFza2luZyBmb3IgYSBWR0lDIG9wdGlvbiwgYnV0IGZvciBhIExJU1Rf
U09SVCBvbmUuCj4gCj4gWWVhaCwgSSBnb3QgdGhhdCA7LSkKPiBDT05GSUdfTElTVF9TT1JUIG9y
IENPTkZJR19IQVNfTElTVF9TT1JUPwoKVGhlIGZvcm1lciAob3IgQ09ORklHX05FRURTX0xJU1Rf
U09SVCBvciBDT05GSUdfV0FOVF9MSVNUX1NPUlQpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
