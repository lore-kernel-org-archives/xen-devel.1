From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Mon, 5 Mar 2018 14:44:29 +0000
Message-ID: <a0230380-c06b-f6fa-5bf2-a5a38097e0fc@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
 <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
 <725b3915-4258-4d5b-8063-a09a0bdb5575@arm.com>
 <5A9D64BC02000078001AE95C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9D64BC02000078001AE95C@prv-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNS8wMy8xOCAxNDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDUuMDMu
MTggYXQgMTU6MDcsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDAyLzAzLzE4
IDE1OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZf
NjQvbW0uYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+Pj4+IEBAIC00MCw2
ICs0MCwxMCBAQCBhc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKPj4+PiAgICAjaW5jbHVk
ZSA8YXNtL21lbV9zaGFyaW5nLmg+Cj4+Pj4gICAgI2luY2x1ZGUgPHB1YmxpYy9tZW1vcnkuaD4K
Pj4+PiAgICAKPj4+PiArLyogT3ZlcnJpZGUgbWFjcm9zIGZyb20gYXNtL3BhZ2UuaCB0byBtYWtl
IHRoZW0gd29yayB3aXRoIG1mbl90ICovCj4+Pj4gKyN1bmRlZiBwYWdlX3RvX21mbgo+Pj4+ICsj
ZGVmaW5lIHBhZ2VfdG9fbWZuKHBnKSBfbWZuKF9fcGFnZV90b19tZm4ocGcpKQo+Pj4KPj4+IEkg
Y2FuJ3Qgc3BvdCB3aGVyZSB0aGlzIGlzIG5lZWRlZCBpbiB0aGlzIGZpbGUuCj4+Pgo+Pj4+IEBA
IC0yMzQsNyArMjM4LDcgQEAgdm9pZCB2dW5tYXAoY29uc3Qgdm9pZCAqdmEpCj4+Pj4gICAgI2lm
bmRlZiBfUEFHRV9OT05FCj4+Pj4gICAgICAgIGRlc3Ryb3lfeGVuX21hcHBpbmdzKGFkZHIsIGFk
ZHIgKyBQQUdFX1NJWkUgKiBwYWdlcyk7Cj4+Pj4gICAgI2Vsc2UgLyogQXZvaWQgdGVhcmluZyBk
b3duIGludGVybWVkaWF0ZSBwYWdlIHRhYmxlcy4gKi8KPj4+PiAtICAgIG1hcF9wYWdlc190b194
ZW4oYWRkciwgMCwgcGFnZXMsIF9QQUdFX05PTkUpOwo+Pj4+ICsgICAgbWFwX3BhZ2VzX3RvX3hl
bihhZGRyLCBfbWZuKDApLCBwYWdlcywgX1BBR0VfTk9ORSk7Cj4+Pgo+Pj4gSU5WQUxJRF9NRk4/
Cj4+Cj4+IEkgY2FuIGJ1dCB0aGVuIHdlIGVuZCB1cCB0byB0aGUgc2FtZSBjbHVtc2luZXNzIGFz
IHlvdSBtZW50aW9uIGluICM4LiBTbwo+PiB3aGF0J3MgeW91ciBwcmVmZXJlbmNlPwo+IAo+IE15
IHByZWZlcmVuY2UgaXMgdG8gc2tpcCB0aGUgaW5jcmVtZW50cyBmb3IgSU5WQUxJRF9NRk4gaW4g
cGF0Y2ggOC4KPiBTaW5jZSB5b3UgZG9uJ3Qgd2FudCB0byBkbyB0aGF0LCBJIGd1ZXNzIHdlJ2xs
IGhhdmUgdG8gbGl2ZSB3aXRoIHplcm8KPiBiZWluZyB1c2VkIGV2ZXJ5d2hlcmUuCgpJdCBpcyBu
b3QgdGhhdCBJIGRvbid0IHdhbnQuIEkgZG9uJ3QgaGF2ZSBhbnkgeDg2IHNldHVwIGFuZCBub3Qg
dGhhdCAKY29uZmlkZW50IHRvIHByb3ZpZGUgYSBjaGFuZ2UgYmlnZ2VyIHRoYW4gc3dpdGNoIGZy
b20gcGxhaW4gdW5zaWduZWQgaW50IAp0byB0eXBlc2FmZSBhbmQgbGlnaHQgY2xlYW4tdXAuCgpJ
IGNhbiBwcm92aWRlIGEgcGF0Y2ggaWYgeW91IHJlYWxseSB3YW50LiBCdXQgbGlrZWx5IGl0IGlz
IGdvaW5nIHRvIGJlIApxdWlja2VyIGZvciB5b3UgdG8gd3JpdGUgaXQuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
