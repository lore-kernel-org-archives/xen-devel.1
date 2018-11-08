From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 08 Nov 2018 08:49:44 -0700
Message-ID: <5BE45B1802000078001F9C36@prv1-mh.provo.novell.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
 <cbd9fb77-110c-86e3-2e2f-da096bae83f0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKmZ4-0008BF-OW
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:49:50 +0000
In-Reply-To: <cbd9fb77-110c-86e3-2e2f-da096bae83f0@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE2OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMTEvMTggMTU6MzMsIFdlaSBMaXUgd3JvdGU6Cj4+IE9uIE1vbiwgTm92IDA1
LCAyMDE4IGF0IDA5OjExOjQ0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MDUuMTEuMTggYXQgMTY6NDksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+
PiBPbiAwNS8xMS8xOCAxNTo0OCwgV2VpIExpdSB3cm90ZToKPj4+Pj4gT24gTW9uLCBOb3YgMDUs
IDIwMTggYXQgMDg6MDQ6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+PiBP
biAwMi4xMS4xOCBhdCAxNjo1NSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni94ODZfNjQvdHJhcHMuYwo+Pj4+Pj4+IEBAIC0yOTgsOCArMjk4LDIxIEBAIHN0YXRpYyB1
bnNpZ25lZCBpbnQgd3JpdGVfc3R1Yl90cmFtcG9saW5lKAo+Pj4+Pj4+ICB9Cj4+Pj4+Pj4gIAo+
Pj4+Pj4+ICBERUZJTkVfUEVSX0NQVShzdHJ1Y3Qgc3R1YnMsIHN0dWJzKTsKPj4+Pj4+PiArCj4+
Pj4+Pj4gKyNpZmRlZiBDT05GSUdfUFYKPj4+Pj4+PiAgdm9pZCBsc3Rhcl9lbnRlcih2b2lkKTsK
Pj4+Pj4+PiAgdm9pZCBjc3Rhcl9lbnRlcih2b2lkKTsKPj4+Pj4+PiArI2Vsc2UKPj4+Pj4+PiAr
c3RhdGljIGlubGluZSB2b2lkIGxzdGFyX2VudGVyKHZvaWQpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiAr
ICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4+Pj4+Pj4gK30KPj4+Pj4+PiArCj4+
Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjc3Rhcl9lbnRlcih2b2lkKQo+Pj4+Pj4+ICt7Cj4+
Pj4+Pj4gKyAgICBwYW5pYygiJXMgY2FsbGVkIiwgX19mdW5jX18pOwo+Pj4+Pj4+ICt9Cj4+Pj4+
Pj4gKyNlbmRpZiAvKiBDT05GSUdfUFYgKi8KPj4+Pj4+IERvIHdlIHJlYWxseSBuZWVkIHR3byBz
ZXBhcmF0ZSBzdHVicyAoYW5kIHR3byBzZXBhcmF0ZSBzdHJpbmcgbGl0ZXJhbHMpCj4+Pj4+PiBo
ZXJlPwo+Pj4+PiBJIHRoaW5rIGl0IGlzIGNsZWFyZXIgaWYgd2UgaGF2ZSB0d28gZGlzdGluY3Qg
bWVzc2FnZXMuIEJ1dCBJJ20gbm90IHRvbwo+Pj4+PiBmdXNzZWQgZWl0aGVyIHdheSByZWFsbHku
IElmIHlvdSBmZWVsIHN0cm9uZ2x5IGFib3V0IHRoaXMsIEknbSBoYXBweSB0bwo+Pj4+PiBjaGFu
Z2UgaXQgdG8gb25seSBvbmUgZnVuY3Rpb24uCj4+Pj4gVGhpcyBpcyB0aGUgY29ycmVjdCB3YXkg
dG8gZG8gaXQuICBfX2Z1bmNfXyB3aWxsIGFscmVhZHkgYmUgaW4gdGhlCj4+Pj4gc3RyaW5nIHRh
YmxlLCBhbmQgdGhlIGZvcm1hdCBzdHJpbmcgKGJlaW5nIGlkZW50aWNhbCkgd2lsbCBiZSBtZXJn
ZWQuCj4+PiBXaHkgd291bGQgX19mdW5jX18gYmUgaW4gdGhlIHN0cmluZyB0YWJsZSBhbHJlYWR5
LCBmb3IgZnVuY3Rpb25zCj4+PiBjb250YWluaW5nIG5vIG90aGVyIHJlZmVyZW5jZXMgdG8gaXQ/
Cj4+IFdoYXQgaXMgdGhlIHdheSBmb3J3YXJkPyBEbyB3ZSByZWFsbHkgY2FyZSBpZiB0aGVyZSBp
cyBvbmUgbW9yZSBzdHJpbmcKPj4gbGl0ZXJhbCBpbiB0aGUgYmluYXJ5Pwo+IAo+IE5vLiAgT25l
IGV4dHJhIHN0cmluZyBsaWtlIHRoaXMgaXMgbm90IHNvbWV0aGluZyB3aGljaCBuZWVkcyBjYXJp
bmcKPiBhYm91dCBpbiB0aGUgc2xpZ2h0ZXN0LgoKU28ganVzdCB0byBjbGFyaWZ5IC0gdGhlIHVu
bmVjZXNzYXJ5IHJlZHVuZGFuY3kgaW4gdGhlIHNvdXJjZSBpcyBvZiBtb3JlCnJlbGV2YW5jZSB0
byBtZSB0aGFuIHRoZSByZXN1bHRpbmcgc2xpZ2h0bHkgbGFyZ2VyIGJpbmFyeS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
