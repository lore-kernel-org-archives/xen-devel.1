From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Mon, 05 Mar 2018 07:39:40 -0700
Message-ID: <5A9D64BC02000078001AE95C@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
 <5A99768F02000078001ADDEA@prv-mh.provo.novell.com>
 <725b3915-4258-4d5b-8063-a09a0bdb5575@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <725b3915-4258-4d5b-8063-a09a0bdb5575@arm.com>
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

Pj4+IE9uIDA1LjAzLjE4IGF0IDE1OjA3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAyLzAzLzE4IDE1OjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjEuMDIuMTgg
YXQgMTU6MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYveDg2XzY0L21tLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+Pj4g
QEAgLTQwLDYgKzQwLDEwIEBAIGFzbSgiLmZpbGUgXCIiIF9fRklMRV9fICJcIiIpOwo+Pj4gICAj
aW5jbHVkZSA8YXNtL21lbV9zaGFyaW5nLmg+Cj4+PiAgICNpbmNsdWRlIDxwdWJsaWMvbWVtb3J5
Lmg+Cj4+PiAgIAo+Pj4gKy8qIE92ZXJyaWRlIG1hY3JvcyBmcm9tIGFzbS9wYWdlLmggdG8gbWFr
ZSB0aGVtIHdvcmsgd2l0aCBtZm5fdCAqLwo+Pj4gKyN1bmRlZiBwYWdlX3RvX21mbgo+Pj4gKyNk
ZWZpbmUgcGFnZV90b19tZm4ocGcpIF9tZm4oX19wYWdlX3RvX21mbihwZykpCj4+IAo+PiBJIGNh
bid0IHNwb3Qgd2hlcmUgdGhpcyBpcyBuZWVkZWQgaW4gdGhpcyBmaWxlLgo+PiAKPj4+IEBAIC0y
MzQsNyArMjM4LDcgQEAgdm9pZCB2dW5tYXAoY29uc3Qgdm9pZCAqdmEpCj4+PiAgICNpZm5kZWYg
X1BBR0VfTk9ORQo+Pj4gICAgICAgZGVzdHJveV94ZW5fbWFwcGluZ3MoYWRkciwgYWRkciArIFBB
R0VfU0laRSAqIHBhZ2VzKTsKPj4+ICAgI2Vsc2UgLyogQXZvaWQgdGVhcmluZyBkb3duIGludGVy
bWVkaWF0ZSBwYWdlIHRhYmxlcy4gKi8KPj4+IC0gICAgbWFwX3BhZ2VzX3RvX3hlbihhZGRyLCAw
LCBwYWdlcywgX1BBR0VfTk9ORSk7Cj4+PiArICAgIG1hcF9wYWdlc190b194ZW4oYWRkciwgX21m
bigwKSwgcGFnZXMsIF9QQUdFX05PTkUpOwo+PiAKPj4gSU5WQUxJRF9NRk4/Cj4gCj4gSSBjYW4g
YnV0IHRoZW4gd2UgZW5kIHVwIHRvIHRoZSBzYW1lIGNsdW1zaW5lc3MgYXMgeW91IG1lbnRpb24g
aW4gIzguIFNvIAo+IHdoYXQncyB5b3VyIHByZWZlcmVuY2U/CgpNeSBwcmVmZXJlbmNlIGlzIHRv
IHNraXAgdGhlIGluY3JlbWVudHMgZm9yIElOVkFMSURfTUZOIGluIHBhdGNoIDguClNpbmNlIHlv
dSBkb24ndCB3YW50IHRvIGRvIHRoYXQsIEkgZ3Vlc3Mgd2UnbGwgaGF2ZSB0byBsaXZlIHdpdGgg
emVybwpiZWluZyB1c2VkIGV2ZXJ5d2hlcmUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
