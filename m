From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Mon, 5 Mar 2018 14:07:13 +0000
Message-ID: <725b3915-4258-4d5b-8063-a09a0bdb5575@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
 <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
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

SGksCgpPbiAwMi8wMy8xOCAxNTowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDIu
MTggYXQgMTU6MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvbW0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKPj4g
QEAgLTQwLDYgKzQwLDEwIEBAIGFzbSgiLmZpbGUgXCIiIF9fRklMRV9fICJcIiIpOwo+PiAgICNp
bmNsdWRlIDxhc20vbWVtX3NoYXJpbmcuaD4KPj4gICAjaW5jbHVkZSA8cHVibGljL21lbW9yeS5o
Pgo+PiAgIAo+PiArLyogT3ZlcnJpZGUgbWFjcm9zIGZyb20gYXNtL3BhZ2UuaCB0byBtYWtlIHRo
ZW0gd29yayB3aXRoIG1mbl90ICovCj4+ICsjdW5kZWYgcGFnZV90b19tZm4KPj4gKyNkZWZpbmUg
cGFnZV90b19tZm4ocGcpIF9tZm4oX19wYWdlX3RvX21mbihwZykpCj4gCj4gSSBjYW4ndCBzcG90
IHdoZXJlIHRoaXMgaXMgbmVlZGVkIGluIHRoaXMgZmlsZS4KPiAKPj4gQEAgLTIzNCw3ICsyMzgs
NyBAQCB2b2lkIHZ1bm1hcChjb25zdCB2b2lkICp2YSkKPj4gICAjaWZuZGVmIF9QQUdFX05PTkUK
Pj4gICAgICAgZGVzdHJveV94ZW5fbWFwcGluZ3MoYWRkciwgYWRkciArIFBBR0VfU0laRSAqIHBh
Z2VzKTsKPj4gICAjZWxzZSAvKiBBdm9pZCB0ZWFyaW5nIGRvd24gaW50ZXJtZWRpYXRlIHBhZ2Ug
dGFibGVzLiAqLwo+PiAtICAgIG1hcF9wYWdlc190b194ZW4oYWRkciwgMCwgcGFnZXMsIF9QQUdF
X05PTkUpOwo+PiArICAgIG1hcF9wYWdlc190b194ZW4oYWRkciwgX21mbigwKSwgcGFnZXMsIF9Q
QUdFX05PTkUpOwo+IAo+IElOVkFMSURfTUZOPwoKSSBjYW4gYnV0IHRoZW4gd2UgZW5kIHVwIHRv
IHRoZSBzYW1lIGNsdW1zaW5lc3MgYXMgeW91IG1lbnRpb24gaW4gIzguIFNvIAp3aGF0J3MgeW91
ciBwcmVmZXJlbmNlPwoKPiAKPiBBbHNvIHBsZWFzZSBhZ2FpbiBzZWUgYWJvdXQgdXNpbmcgUEZO
X0RPV04oKSBmb3Igc29tZSBvZiB0aGUKPiBzaXplcyBwYXNzZWQgdG8gdGhlIGZ1bmN0aW9uIGFz
IHlvdSB0b3VjaCB0aG9zZSBwbGFjZXMgYW55d2F5LgoKV2lsbCBkby4KCj4gCj4gSmFuCj4gCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
