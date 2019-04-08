From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 13/55] x86/mm: rewrite virt_to_xen_l3e
Date: Mon, 08 Apr 2019 09:55:47 -0600
Message-ID: <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-14-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDWcj-0003Sm-Cf
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 15:55:53 +0000
In-Reply-To: <20190207164456.9260-14-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTQ3NjksNDUgKzQ3NjksNzAgQEAgdm9pZCBmcmVlX3hlbl9wYWdldGFibGVfbmV3KG1mbl90
IG1mbikKPiAgCj4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWFwX3BnZGlyX2xvY2spOwo+ICAK
PiArLyoKPiArICogR2l2ZW4gYSB2aXJ0dWFsIGFkZHJlc3MsIHJldHVybiBhIHBvaW50ZXIgdG8g
eGVuJ3MgTDMgZW50cnkuIENhbGxlcgo+ICsgKiBuZWVkcyB0byB1bm1hcCB0aGUgcG9pbnRlci4K
PiArICovCj4gIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wzZSh1bnNpZ25lZCBs
b25nIHYpCj4gIHsKPiAgICAgIGw0X3BnZW50cnlfdCAqcGw0ZTsKPiArICAgIGwzX3BnZW50cnlf
dCAqcGwzZSA9IE5VTEw7Cj4gIAo+ICAgICAgcGw0ZSA9ICZpZGxlX3BnX3RhYmxlW2w0X3RhYmxl
X29mZnNldCh2KV07Cj4gICAgICBpZiAoICEobDRlX2dldF9mbGFncygqcGw0ZSkgJiBfUEFHRV9Q
UkVTRU5UKSApCj4gICAgICB7Cj4gICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRl
ID4gU1lTX1NUQVRFX2Jvb3Q7Cj4gLSAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBhbGxvY194
ZW5fcGFnZXRhYmxlKCk7Cj4gKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3Q7Cj4gKyAgICAgICAg
bWZuX3QgbWZuOwo+ICsKPiArICAgICAgICBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygp
Owo+ICsgICAgICAgIGlmICggbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKPiArICAgICAgICAg
ICAgZ290byBvdXQ7CgpBbnkgcmVhc29uIG5vdCB0byB1c2UgInJldHVybiBOVUxMIiBoZXJlLCBh
dm9pZGluZyB0aGUgZ290bwphbmQgbGFiZWwgYWx0b2dldGhlciBpbiB0aXMgZnVuY3Rpb24/Cgo+
ICBzdGF0aWMgbDJfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMmUodW5zaWduZWQgbG9uZyB2KQo+
ICB7Cj4gICAgICBsM19wZ2VudHJ5X3QgKnBsM2U7Cj4gKyAgICBsMl9wZ2VudHJ5X3QgKnBsMmUg
PSBOVUxMOwo+ICAKPiAgICAgIHBsM2UgPSB2aXJ0X3RvX3hlbl9sM2Uodik7Cj4gICAgICBpZiAo
ICFwbDNlICkKPiAtICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgICBnb3RvIG91dDsKCldo
eSBub3Qga2VlcCB0aGlzIG9uZSB0aGUgd2F5IGl0IGlzPwoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
