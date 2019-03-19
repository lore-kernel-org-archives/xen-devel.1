From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Tue, 19 Mar 2019 06:57:41 -0600
Message-ID: <5C90E7450200007800220415@prv1-mh.provo.novell.com>
References: <cover.1550647742.git.puwen@hygon.cn>
 <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
 <5C8B9D6F020000780021F41C@prv1-mh.provo.novell.com>
 <3e5d403c-ba10-cfed-7cd2-7af662f59709@hygon.cn>
 <5C8F5DE0020000780021FB8E@prv1-mh.provo.novell.com>
 <bd5c83cd-cb9d-d4c2-0fd1-6d226de6ea8a@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6EJU-0006gO-1z
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 12:57:52 +0000
In-Reply-To: <bd5c83cd-cb9d-d4c2-0fd1-6d226de6ea8a@hygon.cn>
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

Pj4+IE9uIDE5LjAzLjE5IGF0IDEyOjMyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8xOCAxNjo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE2LjAzLjE5IGF0IDEx
OjExLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4gT24gMjAxOS8zLzE1IDIwOjQxLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyMS4wMi4xOSBhdCAxMDo1MCwgPHB1d2VuQGh5Z29u
LmNuPiB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11X2FtZC5jCj4+Pj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwo+Pj4+PiBAQCAtNTQ1LDYgKzU0NSw4
IEBAIGludCBfX2luaXQgYW1kX3ZwbXVfaW5pdCh2b2lkKQo+Pj4+PiAgICAgICAgc3dpdGNoICgg
Y3VycmVudF9jcHVfZGF0YS54ODYgKQo+Pj4+PiAgICAgICAgewo+Pj4+PiAgICAgICAgY2FzZSAw
eDE1Ogo+Pj4+PiArICAgIGNhc2UgMHgxNzoKPj4+Pj4gKyAgICBjYXNlIDB4MTg6Cj4+Pj4+ICAg
ICAgICAgICAgbnVtX2NvdW50ZXJzID0gRjE1SF9OVU1fQ09VTlRFUlM7Cj4+Pj4+ICAgICAgICAg
ICAgY291bnRlcnMgPSBBTURfRjE1SF9DT1VOVEVSUzsKPj4+Pj4gICAgICAgICAgICBjdHJscyA9
IEFNRF9GMTVIX0NUUkxTOwo+Pj4+Cj4+Pj4gVW5sZXNzIHlvdSBrbm93IHdoYXQgQU1EIEZhbTE4
IHdpbGwgbG9vayBsaWtlLCB5b3UgY2FuJ3QgZG8gaXQKPj4+PiBsaWtlIHRoaXMuIEZhbTE4IHJl
YWxseSBuZWVkcyB0byBiZSBmdXJ0aGVyIHF1YWxpZmllZCBieSBhIHZlbmRvcgo+Pj4+IGNoZWNr
IGF0IHRoaXMgcG9pbnQgaW4gdGltZS4KPj4+Cj4+PiBIeWdvbiB3aWxsIG5lZ290aWF0ZSB3aXRo
IEFNRCB0byBtYWtlIHN1cmUgdGhhdCBvbmx5IEh5Z29uIHNob3VsZCB1c2UKPj4+IEZhbTE4aC4K
Pj4gCj4+IEluIHRoZSBzdWNjZXNzIGNhc2Ugb2Ygd2hpY2ggcGxlYXNlIHN0YXRlIHRoaXMgaW4g
dGhlIGRlc2NyaXB0aW9uLgo+PiBVbnRpbCB0aG9zZSBuZWdvdGlhdGlvbnMgaGF2ZSBzdWNjZWVk
ZWQgSSdtIGFmcmFpZCBJJ20gZ29pbmcgdG8KPj4gaW5zaXN0IHRvIHNlZSB0aGUgZXh0cmEgY2hl
Y2sgYWRkZWQuCj4gCj4gSG93IHRvIGNoZWNrIHZlbmRvcj8gTWF5YmUgbGlrZSB0aGlzOgo+ICAg
ICAgY2FzZSAweDE1Ogo+ICAgICAgY2FzZSAweDE3Ogo+ICAgICAgY2FzZSAweDE4Ogo+ICAgICAg
ICAgIGlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgJiYKPiAg
ICAgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODYgPT0gMHgxOCkKPiAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gCj4gICAgICAgICAgbnVtX2NvdW50ZXJzID0gRjE1SF9OVU1fQ09VTlRF
UlM7Cj4gICAgICAgICAgY291bnRlcnMgPSBBTURfRjE1SF9DT1VOVEVSUzsKPiAgICAgICAgICBj
dHJscyA9IEFNRF9GMTVIX0NUUkxTOwo+IAo+IG9yIGp1c3QgYWRkIEh5Z29uIHN1cHBvcnQgYXQg
YmVnaW5uaW5nIG9mIGFtZF92cG11X2luaXQoKToKPiAgICAgIGlmIChib290X2NwdV9kYXRhLng4
Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9IWUdPTikgewo+ICAgICAgICAgIG51bV9jb3VudGVycyA9
IEYxNUhfTlVNX0NPVU5URVJTOwo+ICAgICAgICAgIGNvdW50ZXJzID0gQU1EX0YxNUhfQ09VTlRF
UlM7Cj4gICAgICAgICAgY3RybHMgPSBBTURfRjE1SF9DVFJMUzsKPiAgICAgICAgICBrN19jb3Vu
dGVyc19taXJyb3JlZCA9IDE7Cj4gICAgICB9CgpBIHN1aXRhYmxlIHZhcmlhbnQgb2YgdGhlIGxh
dHRlciBvcgoKaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQpCnsKICAgIHVuc2lnbmVkIGlu
dCBpLCBmYW0gPSBjdXJyZW50X2NwdV9kYXRhLng4NgoKICAgIC8qIDxzdWl0YWJsZSBjb21tZW50
PiAqLwogICAgaWYgKCBjdXJyZW50X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9I
WUdPTiAmJiBmYW0gPT0gMHgxOCApCiAgICAgICBmYW0gPSAweDE3OwoKICAgIHN3aXRjaCAoIGZh
bSApCiAgICAuLi4KCm9yIHBlcmhhcHMgZXZlbiBiZXR0ZXIgd291bGQgYmUgdHdvIHNlcGFyYXRl
IHN3aXRjaCgpLWVzLCBvbmUgZm9yCkFNRCBhbmQgb25lIGZvciBIeWdvbi4gUG9zc2libHkgZXZl
biBhIHNlcGFyYXRlIGh5Z29uX3ZwbXVfaW5pdCgpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
