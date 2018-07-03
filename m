From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 04/10] x86: Add Intel Processor Trace
 MSRs and bit definitions
Date: Tue, 03 Jul 2018 06:00:05 -0600
Message-ID: <5B3B654502000078001D03FA@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-5-git-send-email-luwei.kang@intel.com>
 <5B34F45802000078001CEEB7@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E1680481C8@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E1680481C8@SHSMSX101.ccr.corp.intel.com>
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

Pj4+IE9uIDAzLjA3LjE4IGF0IDEyOjE4LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLWluZGV4LmgKPj4gPiArKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L21zci1pbmRleC5oCj4+ID4gQEAgLTU0OCw0ICs1NDgsNDEgQEAKPj4g
PiAgI2RlZmluZSBNU1JfUEtHQzlfSVJUTAkJCTB4MDAwMDA2MzQKPj4gPiAgI2RlZmluZSBNU1Jf
UEtHQzEwX0lSVEwJCQkweDAwMDAwNjM1Cj4+ID4KPj4gPiArLyogSW50ZWwgUFQgTVNScyAqLwo+
PiA+ICsjZGVmaW5lIE1TUl9JQTMyX1JUSVRfQ1RMCQkweDAwMDAwNTcwCj4+ID4gKyNkZWZpbmUg
UlRJVF9DVExfVFJBQ0VFTgkJKDFVTEwgPDwgMCkKPj4gPiArI2RlZmluZSBSVElUX0NUTF9DWUNF
TgkJCSgxVUxMIDw8IDEpCj4+ID4gKyNkZWZpbmUgUlRJVF9DVExfT1MJCQkoMVVMTCA8PCAyKQo+
PiA+ICsjZGVmaW5lIFJUSVRfQ1RMX1VTUgkJCSgxVUxMIDw8IDMpCj4+ID4gKyNkZWZpbmUgUlRJ
VF9DVExfUFdSX0VWVF9FTgkJKDFVTEwgPDwgNCkKPj4gPiArI2RlZmluZSBSVElUX0NUTF9GVVBf
T05fUFRXCQkoMVVMTCA8PCA1KQo+PiA+ICsjZGVmaW5lIFJUSVRfQ1RMX0ZBQlJJQ19FTgkJKDFV
TEwgPDwgNikKPj4gPiArI2RlZmluZSBSVElUX0NUTF9DUjNfRklMVEVSCQkoMVVMTCA8PCA3KQo+
PiA+ICsjZGVmaW5lIFJUSVRfQ1RMX1RPUEEJCQkoMVVMTCA8PCA4KQo+PiA+ICsjZGVmaW5lIFJU
SVRfQ1RMX01UQ19FTgkJCSgxVUxMIDw8IDkpCj4+ID4gKyNkZWZpbmUgUlRJVF9DVExfVFNDX0VO
CQkJKDFVTEwgPDwgMTApCj4+ID4gKyNkZWZpbmUgUlRJVF9DVExfRElTX1JFVEMJCSgxVUxMIDw8
IDExKQo+PiA+ICsjZGVmaW5lIFJUSVRfQ1RMX1BUV19FTgkJCSgxVUxMIDw8IDEyKQo+PiA+ICsj
ZGVmaW5lIFJUSVRfQ1RMX0JSQU5DSF9FTgkJKDFVTEwgPDwgMTMpCj4+ID4gKyNkZWZpbmUgUlRJ
VF9DVExfTVRDX0ZSRVFfT0ZGU0VUCTE0Cj4+ID4gKyNkZWZpbmUgUlRJVF9DVExfTVRDX0ZSRVEJ
CSgweDBmVUxMIDw8IFJUSVRfQ1RMX01UQ19GUkVRX09GRlNFVCkKPj4gCj4+IE5vIGR1cGxpY2F0
ZXMgbGlrZSB0aGVzZSBwbGVhc2UgLSB3aXRoIE1BU0tfRVhUUigpIC8gTUFTS19JTlNSKCkgaGF2
aW5nIGp1c3QgCj4gdGhlIG1hc2sgKGFuZCBubyBvZmZzZXQvc2hpZnQgdmFsdWUpIGlzIHN1ZmZp
Y2llbnQuCj4gCj4gT0ssIGdldCBpdC4gSSBqdXN0IG5lZWQgdG8gZGVmaW5lCj4gKyNkZWZpbmUg
UlRJVF9DVExfTVRDX0ZSRVEJCSgweDBmVUxMIDw8IFJUSVRfQ1RMX01UQ19GUkVRX09GRlNFVCkK
CiNkZWZpbmUgUlRJVF9DVExfTVRDX0ZSRVEJCSgweDBmVUxMIDw8IDE0KQoKeW91IG1lYW4sIEkg
YXNzdW1lPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
