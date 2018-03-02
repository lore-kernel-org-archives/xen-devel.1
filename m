From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 14/16] xen/grant: Switch
 common/grant_table.c to use typesafe MFN
Date: Fri, 2 Mar 2018 15:59:32 +0000
Message-ID: <3345768a-a6be-812e-fb74-4f2e57665486@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-15-julien.grall@arm.com>
 <5A9981C102000078001ADEDA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9981C102000078001ADEDA@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDIvMDMvMTggMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIx
LjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBAQCAtODcy
LDcgKzg3OSw3IEBAIG1hcF9ncmFudF9yZWYoCj4+ICAgICAgIHN0cnVjdCBncmFudF90YWJsZSAq
bGd0LCAqcmd0Owo+PiAgICAgICBzdHJ1Y3QgdmNwdSAgICpsZWQ7Cj4+ICAgICAgIGdyYW50X2hh
bmRsZV90IGhhbmRsZTsKPj4gLSAgICB1bnNpZ25lZCBsb25nICBmcmFtZSA9IDA7Cj4+ICsgICAg
bWZuX3QgZnJhbWUgPSBfbWZuKDApOwo+IAo+IElmIHRoZSBpbml0aWFsaXplciBpcyBuZWVkZWQg
YXQgYWxsLCBJIHRoaW5rIGl0IHNob3VsZCBhZ2FpbiBiZWNvbWUKPiBJTlZBTElEX01GTi4gU2Ft
ZSBpbiBhIGZldyBvdGhlciBwbGFjZXMuCgpJIGRpZG4ndCBzd2l0Y2ggdG8gSU5WQUxJRF9NRk4g
YmVjYXVzZSBJIHdhc24ndCBzdXJlIGlmIHNvbWUgcGxhY2UgaW4gCnRoZSBjb2RlIHdoZXJlIHJl
bHlpbmcgb24gMC4gSWYgeW91IHRoaW5rIGl0IGlzIGZpbmUsIHRoZW4gSSBhbSBtb3JlIAp0aGFu
ayBoYXBweSB0byBzd2l0Y2ggdG8gSU5WQUxJRF9NRk4uCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2dyYW50X3RhYmxlLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ncmFu
dF90YWJsZS5oCj4+IEBAIC03Niw3ICs3Niw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50
IGdudHRhYl9kb20wX21heCh2b2lkKQo+PiAgICNkZWZpbmUgZ250dGFiX3N0YXR1c19nbWZuKGQs
IHQsIGkpICAgICAgICAgICAgICAgICAgICAgXAo+PiAgICAgICAobWZuX3RvX2dtZm4oZCwgZ250
dGFiX3N0YXR1c19tZm4odCwgaSkpKQo+PiAgIAo+PiAtI2RlZmluZSBnbnR0YWJfbWFya19kaXJ0
eShkLCBmKSBwYWdpbmdfbWFya19kaXJ0eSgoZCksIF9tZm4oZikpCj4+ICsjZGVmaW5lIGdudHRh
Yl9tYXJrX2RpcnR5KGQsIGYpIHBhZ2luZ19tYXJrX2RpcnR5KChkKSwgZikKPiAKPiBQbGVhc2Ug
dGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gZHJvcCB0aGUgc3RyYXkgcGFyZW50aGVzZXMK
PiBhcm91bmQgZC4KClN1cmUuCgo+IAo+IFdpdGggdGhlc2UgdGFrZW4gY2FyZSBvZiBhbmQgd2l0
aCBXZWkncyBSLWIKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
