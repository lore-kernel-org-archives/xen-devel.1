From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: introduce a new variable to
 control container user
Date: Tue, 25 Sep 2018 15:12:47 +0100
Message-ID: <20180925141247.wmv2sv3wew5c2kt2@zion.uk.xensource.com>
References: <20180924161829.8676-1-wei.liu2@citrix.com>
 <20180924184112.cf3sgm64yl6s6oiz@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t6ko=mh=citrix.com=prvs=799860c23=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g4oDB-00050z-Eh
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 14:21:13 +0000
Content-Disposition: inline
In-Reply-To: <20180924184112.cf3sgm64yl6s6oiz@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMDE6NDE6MTJQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMDU6MTg6MjlQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFNvbWV0aW1lcyBpdCBpcyBoYW5keSB0byBjcmVhdGUgYSBjb250YWluZXIg
YW5kIHBsYXkgYXMgcm9vdCB3aXRoIGl0cwo+ID4gc2V0dXAgbWFudWFsbHkuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICBh
dXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplIHwgOCArKysrKysrLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUgYi9hdXRvbWF0aW9uL3NjcmlwdHMv
Y29udGFpbmVyaXplCj4gPiBpbmRleCBiZjlhZjU4OWE4Li5lYTNjNzM3OGFhIDEwMDc1NQo+ID4g
LS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQo+ID4gKysrIGIvYXV0b21hdGlv
bi9zY3JpcHRzL2NvbnRhaW5lcml6ZQo+ID4gQEAgLTIzLDYgKzIzLDEyIEBAIGNhc2UgIl8ke0NP
TlRBSU5FUn0iIGluCj4gPiAgICAgIF9zdHJldGNofF8pIENPTlRBSU5FUj0iJHtCQVNFfS9kZWJp
YW46c3RyZXRjaCIgOzsKPiA+ICBlc2FjCj4gPiAgCj4gPiArIyBVc2UgdGhpcyB2YXJpYWJsZSB0
byBjb250cm9sIHdoZWh0ZXIgcm9vdCBzaG91bGQgYmUgdXNlZAo+ID4gK2Nhc2UgIl8ke0NPTlRB
SU5FUl9ST09UfSIgaW4KPiA+ICsgICAgXzEpICAgdXNlcmFyZz0gOzsKPiA+ICsgICAgXzB8Xykg
dXNlcmFyZz0iLXUgJChpZCAtdSkiIDs7Cj4gPiArZXNhYwo+IAo+IEhvdyB3b3VsZCB5b3UgZmVl
bCBhYm91dCBDT05UQUlORVJfVUlEMCBpbnN0ZWFkPyBJIGp1c3QgZmVhciB0aGF0ICJST09UIgo+
IGhhcyBxdWl0ZSBhIGZldyBtZWFuaW5ncy4gZS5nIHRvcCBvZiB0aGUgZmlsZXN5c3RlbT8gVGhl
IHdvcmtpbmcgZGlyCj4gaW5zaWRlIG9mIHRoZSBjb250YWluZXI/CgpDT05UQUlORVJfVUlEMCBp
cyBmaW5lLgoKPiAKPiBNaW5kIGRvY3VtZW50aW5nIHRoaXMgaW4gYXV0b21hdGlvbi9idWlsZC9S
RUFETUUubWQgPyBJIHNob3VsZCBsaWtlbHkKPiBtb3ZlIHBhcnQgb2YgdGhpcyBmaWxlIHRoYXQg
ZGVzY3JpYmVzIHRoZSB2YXJpYWJsZXMgdXAgYSBkaXJlY3RvcnkuCgpXaWxsIGRvLgoKV2VpLgoK
PiAKPiAtLQo+IERvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
