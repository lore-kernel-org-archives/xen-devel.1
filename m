From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 04/10] x86: Add Intel Processor Trace
 MSRs and bit definitions
Date: Thu, 28 Jun 2018 08:44:40 -0600
Message-ID: <5B34F45802000078001CEEB7@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-5-git-send-email-luwei.kang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527686884-5917-5-git-send-email-luwei.kang@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDE1OjI3LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L21zci1pbmRleC5oCj4gQEAgLTU0OCw0ICs1NDgsNDEgQEAKPiAgI2RlZmluZSBN
U1JfUEtHQzlfSVJUTAkJCTB4MDAwMDA2MzQKPiAgI2RlZmluZSBNU1JfUEtHQzEwX0lSVEwJCQkw
eDAwMDAwNjM1Cj4gIAo+ICsvKiBJbnRlbCBQVCBNU1JzICovCj4gKyNkZWZpbmUgTVNSX0lBMzJf
UlRJVF9DVEwJCTB4MDAwMDA1NzAKPiArI2RlZmluZSBSVElUX0NUTF9UUkFDRUVOCQkoMVVMTCA8
PCAwKQo+ICsjZGVmaW5lIFJUSVRfQ1RMX0NZQ0VOCQkJKDFVTEwgPDwgMSkKPiArI2RlZmluZSBS
VElUX0NUTF9PUwkJCSgxVUxMIDw8IDIpCj4gKyNkZWZpbmUgUlRJVF9DVExfVVNSCQkJKDFVTEwg
PDwgMykKPiArI2RlZmluZSBSVElUX0NUTF9QV1JfRVZUX0VOCQkoMVVMTCA8PCA0KQo+ICsjZGVm
aW5lIFJUSVRfQ1RMX0ZVUF9PTl9QVFcJCSgxVUxMIDw8IDUpCj4gKyNkZWZpbmUgUlRJVF9DVExf
RkFCUklDX0VOCQkoMVVMTCA8PCA2KQo+ICsjZGVmaW5lIFJUSVRfQ1RMX0NSM19GSUxURVIJCSgx
VUxMIDw8IDcpCj4gKyNkZWZpbmUgUlRJVF9DVExfVE9QQQkJCSgxVUxMIDw8IDgpCj4gKyNkZWZp
bmUgUlRJVF9DVExfTVRDX0VOCQkJKDFVTEwgPDwgOSkKPiArI2RlZmluZSBSVElUX0NUTF9UU0Nf
RU4JCQkoMVVMTCA8PCAxMCkKPiArI2RlZmluZSBSVElUX0NUTF9ESVNfUkVUQwkJKDFVTEwgPDwg
MTEpCj4gKyNkZWZpbmUgUlRJVF9DVExfUFRXX0VOCQkJKDFVTEwgPDwgMTIpCj4gKyNkZWZpbmUg
UlRJVF9DVExfQlJBTkNIX0VOCQkoMVVMTCA8PCAxMykKPiArI2RlZmluZSBSVElUX0NUTF9NVENf
RlJFUV9PRkZTRVQJMTQKPiArI2RlZmluZSBSVElUX0NUTF9NVENfRlJFUQkJKDB4MGZVTEwgPDwg
UlRJVF9DVExfTVRDX0ZSRVFfT0ZGU0VUKQoKTm8gZHVwbGljYXRlcyBsaWtlIHRoZXNlIHBsZWFz
ZSAtIHdpdGggTUFTS19FWFRSKCkgLyBNQVNLX0lOU1IoKQpoYXZpbmcganVzdCB0aGUgbWFzayAo
YW5kIG5vIG9mZnNldC9zaGlmdCB2YWx1ZSkgaXMgc3VmZmljaWVudC4KCj4gKyNkZWZpbmUgUlRJ
VF9DVExfQUREUihuKQkJKDB4MGZVTEwgPDwgUlRJVF9DVExfQUREUl9PRkZTRVQobikpCj4gKyNk
ZWZpbmUgTVNSX0lBMzJfUlRJVF9TVEFUVVMJCTB4MDAwMDA1NzEKClBsZWFzZSBhZGQgYmxhbmsg
bGluZXMgYmV0d2VlbiBvbmUgTVNSIChhbmQgaXRzIGJpdHMpIGFuZCB0aGUgbmV4dCBvbmUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
