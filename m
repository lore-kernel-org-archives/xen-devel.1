From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: ignore guest microcode loading attempts
Date: Thu, 15 Mar 2018 05:13:48 -0600
Message-ID: <5AAA637C02000078001B2097@prv-mh.provo.novell.com>
References: <5AA7B27402000078001B0D94@prv-mh.provo.novell.com>
 <831fa40e-f82d-1140-b093-74e9a4f5f356@citrix.com>
 <5AAA5BC202000078001B202F@prv-mh.provo.novell.com>
 <06b2d681-1736-7768-adff-b250cbcd3179@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewQpV-0004ED-9v
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 11:13:53 +0000
In-Reply-To: <06b2d681-1736-7768-adff-b250cbcd3179@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEyOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMTggMTA6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pgo+Pj4+IEBAIC0y
MDAsNiArMjAyLDE2IEBAIGludCBndWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QK
Pj4+PiAgICAgICAgICAvKiBSZWFkLW9ubHkgKi8KPj4+PiAgICAgICAgICBnb3RvIGdwX2ZhdWx0
Owo+Pj4+ICAKPj4+PiArICAgIGNhc2UgTVNSX0FNRF9QQVRDSExPQURFUjoKPj4+PiArICAgICAg
ICBpZiAoIGQtPmFyY2guY3B1aWQtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9BTUQgKQo+Pj4+
ICsgICAgICAgICAgICBnb3RvIGdwX2ZhdWx0Owo+Pj4+ICsgICAgICAgIGJyZWFrOwo+Pj4+ICsK
Pj4+PiArICAgIGNhc2UgTVNSX0lBMzJfVUNPREVfV1JJVEU6Cj4+Pj4gKyAgICAgICAgaWYgKCBk
LT5hcmNoLmNwdWlkLT54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwgKQo+Pj4+ICsgICAg
ICAgICAgICBnb3RvIGdwX2ZhdWx0Owo+Pj4gQ2FuIHdlIGxlYXZlIGEgbm90ZSBoZXJlIHRoYXQg
V2luZG93cyBhdCBsZWFzdCBvbiBzb21lIGhhcmR3YXJlIGxvYWRzCj4+PiBtaWNyb2NvZGUgYmVm
b3JlIHNldHRpbmcgdXAgYW4gSURUL0dEVCwgYW5kIHdpbGwgdHJpcGxlIGZhdWx0IGlmIHdlIGhh
bmQKPj4+IGl0IGJhY2sgI0dQLgo+PiBXaWxsIGRvLgo+Pgo+Pj4gIElnbm9yaW5nIHRoZSB3cml0
ZSBtZWFucyB3aW5kb3dzIHdpbGwgc2VlIHRoZSBzYW1lCj4+PiBtaWNyb2NvZGUgdmVyc2lvbiBh
ZnRlciB0aGUgbG9hZCBhdHRlbXB0LCBhbmQgY29uY2x1ZGUgdGhhdCBpdCBkaWRuJ3QKPj4+IHN1
Y2NlZWQ/Cj4+IFRoYXQncyB3aGF0IEkgaW1wbHkuIEFmdGVyIGFsbCB0aGluZ3MgaGF2ZSB3b3Jr
ZWQgYmVmb3JlLCB3aGVyZQo+PiB3ZSBhbHNvIHNpbGVudGx5IGRyb3BwZWQgdGhlc2Ugd3JpdGVz
Lgo+IAo+IEFjdHVhbGx5LCBvbiBmdXJ0aGVyIGludmVzdGlnYXRpb24sIHdlJ3ZlIGFsd2F5cyBo
YWQgYSByZWFkX3NhZmUoKSB0ZXN0Cj4gZm9yIFBWLCB3aGljaCBtZWFucyB0aGF0IFBWIGd1ZXN0
cyBoYXZlIGFsd2F5cyB1bmlsYXRlcmFsbHkgc2VlbiAjR1AuIAo+IENhbiB3ZSByZXRhaW4gdGhh
dCBiZWhhdmlvdXIgcGxlYXNlPwoKV2VsbCwgdGhhdCdzIGV4YWN0bHkgd2hhdCBJIHdhbnRlZCB0
byBnYXRoZXIgb3BpbmlvbnMgb24gYnkgaGF2aW5nCndyaXR0ZW46CgoiV2hhdCBJJ20gdW5zdXJl
IGFib3V0IGlzIHdoZXRoZXIgd2Ugd2FudCB0byBpZ25vcmUgc3VjaCB3cml0ZXMgYWxzbyBmb3IK
IFBWIGd1ZXN0cy4gSWYgbm90LCBhdCBsZWFzdCB0aGUgV1JNU1IgY2hhbmdlIHdvdWxkIG5lZWQg
dG8gbW92ZSBpbnRvCiBodm0vaHZtLmMuIgoKSSd2ZSBqdXN0IHNlbnQgdjIsIGJ1dCBJIGNhbiBj
ZXJ0YWlubHkgc2VuZCB2MyB3aXRoIHRoZSBXUk1TUiBzaWRlCmNvZGUgbW92ZWQgKHRvIGJlIGhv
bmVzdCBJJ20gbm90IGNvbnZpbmNlZCB3ZSB3YW50IGFsbCBzb3J0cyBvZgppc197aHZtLHB2fV97
ZG9tYWluLHZjcHV9KCkgY2hlY2tzIGluIGd1ZXN0X3tyZCx3cn1tc3IoKSwgYnV0IGlmCnRoYXQg
d2FzIHlvdXIgcGxhbiwgdGhlbiB0aGUgY29kZSBjb3VsZCBhbHNvIHN0YXkgd2hlcmUgaXQgaXMp
LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
