From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 19/28] x86/vioapic: extend
 vioapic_get_vector() to support remapping format RTE
Date: Mon, 12 Feb 2018 15:01:27 +0000
Message-ID: <20180212150127.gyomyv6pwfxd53wp@MacBook-Pro-de-Roger.local>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
 <1510899755-40237-20-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1510899755-40237-20-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Lan Tianyu <tianyu.lan@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgMDI6MjI6MjZQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gV2hlbiBJT0FQSUMgUlRFIGlzIGluIHJlbWFwcGluZyBmb3JtYXQsIGl0IGRvZXNuJ3QgY29u
dGFpbiB0aGUgdmVjdG9yIG9mCj4gaW50ZXJydXB0LiBGb3IgdGhpcyBjYXNlLCB0aGUgUlRFIGNv
bnRhaW5zIGFuIGluZGV4IG9mIGludGVycnVwdCByZW1hcHBpbmcKPiB0YWJsZSB3aGVyZSB0aGUg
dmVjdG9yIG9mIGludGVycnVwdCBpcyBzdG9yZWQuIFRoaXMgcGF0Y2hzIGdldHMgdGhlIHZlY3Rv
cgo+IHRocm91Z2ggYSB2SU9NTVUgaW50ZXJmYWNlLgoKSSB0aGluayB0aGlzIHNob3VsZCBiZSBt
ZXJnZWQgd2l0aCB0aGUgcHJldmlvdXMgcGF0Y2guCgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2Fv
IDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGFuIFRpYW55dSA8dGlhbnl1
LmxhbkBpbnRlbC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vdmlvYXBpYy5jIHwgMTQg
KysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMgYi94
ZW4vYXJjaC94ODYvaHZtL3Zpb2FwaWMuYwo+IGluZGV4IDBmMjBlM2YuLjhiMzRiMjEgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3Zpb2FwaWMuYwo+IEBAIC01NjAsMTEgKzU2MCwyMyBAQCBpbnQgdmlvYXBpY19nZXRfdmVj
dG9yKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBnc2kpCj4gIHsKPiAgICAg
IHVuc2lnbmVkIGludCBwaW47Cj4gICAgICBjb25zdCBzdHJ1Y3QgaHZtX3Zpb2FwaWMgKnZpb2Fw
aWMgPSBnc2lfdmlvYXBpYyhkLCBnc2ksICZwaW4pOwo+ICsgICAgc3RydWN0IGFyY2hfaXJxX3Jl
bWFwcGluZ19yZXF1ZXN0IHJlcXVlc3Q7Cj4gIAo+ICAgICAgaWYgKCAhdmlvYXBpYyApCj4gICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0gICAgcmV0dXJuIHZpb2FwaWMtPnJlZGlydGJs
W3Bpbl0uZmllbGRzLnZlY3RvcjsKPiArICAgIGlycV9yZXF1ZXN0X2lvYXBpY19maWxsKCZyZXF1
ZXN0LCB2aW9hcGljLT5pZCwgdmlvYXBpYy0+cmVkaXJ0YmxbcGluXS5iaXRzKTsKPiArICAgIGlm
ICggdmlvbW11X2NoZWNrX2lycV9yZW1hcHBpbmcodmlvYXBpYy0+ZG9tYWluLCAmcmVxdWVzdCkg
KQo+ICsgICAgewo+ICsgICAgICAgIHN0cnVjdCBhcmNoX2lycV9yZW1hcHBpbmdfaW5mbyBpbmZv
Owo+ICsKPiArICAgICAgICByZXR1cm4gdW5saWtlbHkodmlvbW11X2dldF9pcnFfaW5mbyh2aW9h
cGljLT5kb21haW4sICZyZXF1ZXN0LCAmaW5mbykpCj4gKyAgICAgICAgICAgICAgICAgICA/IDog
aW5mby52ZWN0b3I7Cj4gKyAgICB9Cj4gKyAgICBlbHNlCj4gKyAgICB7Cj4gKyAgICAgICAgcmV0
dXJuIHZpb2FwaWMtPnJlZGlydGJsW3Bpbl0uZmllbGRzLnZlY3RvcjsKPiArICAgIH0KClVubmVl
ZGVkIGJyYWNlcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
