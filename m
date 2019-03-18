From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Mon, 18 Mar 2019 02:59:12 -0600
Message-ID: <5C8F5DE0020000780021FB8E@prv1-mh.provo.novell.com>
References: <cover.1550647742.git.puwen@hygon.cn>
 <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
 <5C8B9D6F020000780021F41C@prv1-mh.provo.novell.com>
 <3e5d403c-ba10-cfed-7cd2-7af662f59709@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5o75-00082L-Ml
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 08:59:19 +0000
In-Reply-To: <3e5d403c-ba10-cfed-7cd2-7af662f59709@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE5IGF0IDExOjExLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8xNSAyMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIxLjAyLjE5IGF0IDEw
OjUwLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92
cG11X2FtZC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKPj4+IEBAIC01
NDUsNiArNTQ1LDggQEAgaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQpCj4+PiAgICAgICBz
d2l0Y2ggKCBjdXJyZW50X2NwdV9kYXRhLng4NiApCj4+PiAgICAgICB7Cj4+PiAgICAgICBjYXNl
IDB4MTU6Cj4+PiArICAgIGNhc2UgMHgxNzoKPj4+ICsgICAgY2FzZSAweDE4Ogo+Pj4gICAgICAg
ICAgIG51bV9jb3VudGVycyA9IEYxNUhfTlVNX0NPVU5URVJTOwo+Pj4gICAgICAgICAgIGNvdW50
ZXJzID0gQU1EX0YxNUhfQ09VTlRFUlM7Cj4+PiAgICAgICAgICAgY3RybHMgPSBBTURfRjE1SF9D
VFJMUzsKPj4gCj4+IFVubGVzcyB5b3Uga25vdyB3aGF0IEFNRCBGYW0xOCB3aWxsIGxvb2sgbGlr
ZSwgeW91IGNhbid0IGRvIGl0Cj4+IGxpa2UgdGhpcy4gRmFtMTggcmVhbGx5IG5lZWRzIHRvIGJl
IGZ1cnRoZXIgcXVhbGlmaWVkIGJ5IGEgdmVuZG9yCj4+IGNoZWNrIGF0IHRoaXMgcG9pbnQgaW4g
dGltZS4KPiAKPiBIeWdvbiB3aWxsIG5lZ290aWF0ZSB3aXRoIEFNRCB0byBtYWtlIHN1cmUgdGhh
dCBvbmx5IEh5Z29uIHNob3VsZCB1c2UKPiBGYW0xOGguCgpJbiB0aGUgc3VjY2VzcyBjYXNlIG9m
IHdoaWNoIHBsZWFzZSBzdGF0ZSB0aGlzIGluIHRoZSBkZXNjcmlwdGlvbi4KVW50aWwgdGhvc2Ug
bmVnb3RpYXRpb25zIGhhdmUgc3VjY2VlZGVkIEknbSBhZnJhaWQgSSdtIGdvaW5nIHRvCmluc2lz
dCB0byBzZWUgdGhlIGV4dHJhIGNoZWNrIGFkZGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
