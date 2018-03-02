From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Fri, 02 Mar 2018 08:06:39 -0700
Message-ID: <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-11-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Shane Wang <shane.wang@intel.com>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZf
NjQvbW0uYwo+IEBAIC00MCw2ICs0MCwxMCBAQCBhc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIi
KTsKPiAgI2luY2x1ZGUgPGFzbS9tZW1fc2hhcmluZy5oPgo+ICAjaW5jbHVkZSA8cHVibGljL21l
bW9yeS5oPgo+ICAKPiArLyogT3ZlcnJpZGUgbWFjcm9zIGZyb20gYXNtL3BhZ2UuaCB0byBtYWtl
IHRoZW0gd29yayB3aXRoIG1mbl90ICovCj4gKyN1bmRlZiBwYWdlX3RvX21mbgo+ICsjZGVmaW5l
IHBhZ2VfdG9fbWZuKHBnKSBfbWZuKF9fcGFnZV90b19tZm4ocGcpKQoKSSBjYW4ndCBzcG90IHdo
ZXJlIHRoaXMgaXMgbmVlZGVkIGluIHRoaXMgZmlsZS4KCj4gQEAgLTIzNCw3ICsyMzgsNyBAQCB2
b2lkIHZ1bm1hcChjb25zdCB2b2lkICp2YSkKPiAgI2lmbmRlZiBfUEFHRV9OT05FCj4gICAgICBk
ZXN0cm95X3hlbl9tYXBwaW5ncyhhZGRyLCBhZGRyICsgUEFHRV9TSVpFICogcGFnZXMpOwo+ICAj
ZWxzZSAvKiBBdm9pZCB0ZWFyaW5nIGRvd24gaW50ZXJtZWRpYXRlIHBhZ2UgdGFibGVzLiAqLwo+
IC0gICAgbWFwX3BhZ2VzX3RvX3hlbihhZGRyLCAwLCBwYWdlcywgX1BBR0VfTk9ORSk7Cj4gKyAg
ICBtYXBfcGFnZXNfdG9feGVuKGFkZHIsIF9tZm4oMCksIHBhZ2VzLCBfUEFHRV9OT05FKTsKCklO
VkFMSURfTUZOPwoKQWxzbyBwbGVhc2UgYWdhaW4gc2VlIGFib3V0IHVzaW5nIFBGTl9ET1dOKCkg
Zm9yIHNvbWUgb2YgdGhlCnNpemVzIHBhc3NlZCB0byB0aGUgZnVuY3Rpb24gYXMgeW91IHRvdWNo
IHRob3NlIHBsYWNlcyBhbnl3YXkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
