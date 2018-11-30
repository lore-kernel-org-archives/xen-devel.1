From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/9] libxl: Get rid of support for
 QEMU_USER_BASE (xen-qemuuser-domidNN)
Date: Fri, 30 Nov 2018 16:56:51 +0000
Message-ID: <20181130165651.p5i73ozkgi4zbjaa@zion.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-3-george.dunlap@citrix.com>
 <20181128153202.p3aymgn5kzeosdjh@zion.uk.xensource.com>
 <980E034A-58AC-408E-8923-A9931D0A17DE@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ton=OJ=citrix.com=prvs=865490da1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSm71-0000ez-HO
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:57:55 +0000
Content-Disposition: inline
In-Reply-To: <980E034A-58AC-408E-8923-A9931D0A17DE@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMTI6NTM6MjBQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiAKPiAKPiA+IE9uIE5vdiAyOCwgMjAxOCwgYXQgMzozMiBQTSwgV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAKPiA+IE9uIEZyaSwgTm92IDIzLCAyMDE4IGF0
IDA1OjE0OjU2UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPj4gUUVNVV9VU0VSX0JB
U0UgYWxsb3dzIGEgdXNlciB0byBzcGVjaWZ5IHRoZSBVSUQgdG8gdXNlIHdoZW4gcnVubmluZwo+
ID4+IHRoZSBkZXZpY2Vtb2RlbCBmb3IgYSBzcGVjaWZpYyBkb21haW4gbnVtYmVyLiAgVW5mb3J0
dW5hdGVseSwgdGhpcyBpcwo+ID4+IG5vdCByZWFsbHkgcHJhY3RpY2FsOiBJdCByZXF1aXJlcyBu
ZWFybHkgMzIsMDAwIGVudHJpZXMgaW4KPiA+PiAvZXRjL3Bhc3N3ZC4gIFFFTVVfVVNFUl9SQU5H
RV9CQVNFIGlzIG11Y2ggbW9yZSBwcmFjdGljYWwuCj4gPj4gCj4gPj4gUmVtb3ZlIHN1cHBvcnQg
Zm9yIFFFTVVfVVNFUl9CQVNFLgo+ID4+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiA+IAo+ID4gSSBoYXZlIG5vIHByb2JsZW0g
d2l0aCB5b3UgcmVtb3ZpbmcgdGhpcywgYnV0IHlvdSBmb3Jnb3QgdG8gY2hhbmdlCj4gPiB4bC5j
ZmcucG9kLjUuaW4uCj4gCj4gSG1t4oCmIGl0IHNlZW1zIHdoYXQgSSAqcmVhbGx5KiBmb3Jnb3Qg
dG8gZG8gd2FzIHJlbW92ZSB0aGF0IGVudGlyZQo+IHNlY3Rpb24gYW5kIHBvaW50IHRvIHRoZSBm
ZWF0dXJlIGRvYyBpbnN0ZWFkLiAgSXTigJlzIHF1aXRlIG91dCBvZiBkYXRlCj4gbm93IChlLmcu
LCBjZHJvbSBpbnNlcnQgc2hvdWxkIHdvcmsgSSB0aGluaywgcWVtdSBpcyBjaHJvb3RlZCBzbyBj
YW7igJl0Cj4gcmVhZCB3b3JsZC1yZWFkYWJsZSBmaWxlcywgJmMpLiAgV2l0aCB5b3VyIHBlcm1p
c3Npb24gSeKAmWxsIHB1dCBmaXhpbmcKPiB0aGF0IHVwIHByb3Blcmx5IG9uIGEgdG8tZG8gbGlz
dCAodG8gYmUgZG9uZSBiZWZvcmUgNC4xMiByZWxlYXNlIGF0IGEKPiBtaW5pbXVtKS4KClN1cmUu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
