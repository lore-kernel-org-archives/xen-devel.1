From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Thu, 15 Mar 2018 16:50:12 +0000
Message-ID: <27393b66-afdd-154b-0998-1492ca5c0346@citrix.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-11-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTQvMjAxOCAwNjoyMCBQTSwganVsaWVuLmdyYWxsQGFybS5jb20gd3JvdGU6Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vdm1hcC5jIGIveGVuL2NvbW1vbi92bWFwLmMKPiBpbmRleCAx
MTc4NWZmYjBhLi4wNGY1ZGIzODZkIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vdm1hcC5jCj4g
KysrIGIveGVuL2NvbW1vbi92bWFwLmMKPiBAQCAtOSw2ICs5LDEwIEBACj4gICNpbmNsdWRlIDx4
ZW4vdm1hcC5oPgo+ICAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KPiAgCj4gKy8qIE92ZXJyaWRlIG1h
Y3JvcyBmcm9tIGFzbS9wYWdlLmggdG8gbWFrZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwo+ICsj
dW5kZWYgcGFnZV90b19tZm4KPiArI2RlZmluZSBwYWdlX3RvX21mbihwZykgX21mbihfX3BhZ2Vf
dG9fbWZuKHBnKSkKPiArCj4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sodm1fbG9jayk7Cj4gIHN0
YXRpYyB2b2lkICpfX3JlYWRfbW9zdGx5IHZtX2Jhc2VbVk1BUF9SRUdJT05fTlJdOwo+ICAjZGVm
aW5lIHZtX2JpdG1hcCh4KSAoKHVuc2lnbmVkIGxvbmcgKil2bV9iYXNlW3hdKQo+IEBAIC0yMDgs
NyArMjEyLDcgQEAgdm9pZCAqX192bWFwKGNvbnN0IG1mbl90ICptZm4sIHVuc2lnbmVkIGludCBn
cmFudWxhcml0eSwKPiAgCj4gICAgICBmb3IgKCA7IHZhICYmIG5yLS07ICsrbWZuLCBjdXIgKz0g
UEFHRV9TSVpFICogZ3JhbnVsYXJpdHkgKQo+ICAgICAgewo+IC0gICAgICAgIGlmICggbWFwX3Bh
Z2VzX3RvX3hlbihjdXIsIG1mbl94KCptZm4pLCBncmFudWxhcml0eSwgZmxhZ3MpICkKPiArICAg
ICAgICBpZiAoIG1hcF9wYWdlc190b194ZW4oY3VyLCAqbWZuLCBncmFudWxhcml0eSwgZmxhZ3Mp
ICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIHZ1bm1hcCh2YSk7Cj4gICAgICAgICAgICAg
IHZhID0gTlVMTDsKPiBAQCAtMjM0LDcgKzIzOCw3IEBAIHZvaWQgdnVubWFwKGNvbnN0IHZvaWQg
KnZhKQo+ICAjaWZuZGVmIF9QQUdFX05PTkUKPiAgICAgIGRlc3Ryb3lfeGVuX21hcHBpbmdzKGFk
ZHIsIGFkZHIgKyBQQUdFX1NJWkUgKiBwYWdlcyk7Cj4gICNlbHNlIC8qIEF2b2lkIHRlYXJpbmcg
ZG93biBpbnRlcm1lZGlhdGUgcGFnZSB0YWJsZXMuICovCj4gLSAgICBtYXBfcGFnZXNfdG9feGVu
KGFkZHIsIDAsIHBhZ2VzLCBfUEFHRV9OT05FKTsKPiArICAgIG1hcF9wYWdlc190b194ZW4oYWRk
ciwgSU5WQUxJRF9NRk4sIHBhZ2VzLCBfUEFHRV9OT05FKTsKClRoaXMgaXMgYSBiaXQgb2YgYSBu
aXQtcGljaywgYnV0IHNob3VsZG4ndCBzb21ldGhpbmcgbGlrZSB0aGlzIGhhdmUgZ29uZQppbiBw
YXRjaCA4PwoKRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdvb2QuCgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
