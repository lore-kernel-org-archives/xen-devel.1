From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v2 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Tue, 19 Mar 2019 23:22:28 +0800
Message-ID: <5ea00329-64a2-26f1-530a-67ab424dff6f@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
 <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
 <5C8B9D6F020000780021F41C@prv1-mh.provo.novell.com>
 <3e5d403c-ba10-cfed-7cd2-7af662f59709@hygon.cn>
 <5C8F5DE0020000780021FB8E@prv1-mh.provo.novell.com>
 <bd5c83cd-cb9d-d4c2-0fd1-6d226de6ea8a@hygon.cn>
 <5C90E7450200007800220415@prv1-mh.provo.novell.com>
 <cb8f4c45-7b09-0916-487d-8137bbedbb1f@hygon.cn>
 <5C90F55A02000078002204F3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2oAA=RW=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h6Gez-0004z9-V6
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 15:28:13 +0000
In-Reply-To: <5C90F55A02000078002204F3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8zLzE5IDIxOjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOS4wMy4xOSBhdCAx
NDo0NywgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8zLzE5IDIwOjU4LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IE9uIDE5LjAzLjE5IGF0IDEyOjMyLCA8cHV3ZW5AaHlnb24uY24+
IHdyb3RlOgo+Pj4+IE9uIDIwMTkvMy8xOCAxNjo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+
IE9uIDE2LjAzLjE5IGF0IDExOjExLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+Pj4+Pj4gT24g
MjAxOS8zLzE1IDIwOjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyMS4wMi4xOSBh
dCAxMDo1MCwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L2NwdS92cG11X2FtZC5jCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9h
bWQuYwo+Pj4+Pj4+PiBAQCAtNTQ1LDYgKzU0NSw4IEBAIGludCBfX2luaXQgYW1kX3ZwbXVfaW5p
dCh2b2lkKQo+Pj4+Pj4+PiAgICAgICAgICBzd2l0Y2ggKCBjdXJyZW50X2NwdV9kYXRhLng4NiAp
Cj4+Pj4+Pj4+ICAgICAgICAgIHsKPj4+Pj4+Pj4gICAgICAgICAgY2FzZSAweDE1Ogo+Pj4+Pj4+
PiArICAgIGNhc2UgMHgxNzoKPj4+Pj4+Pj4gKyAgICBjYXNlIDB4MTg6Cj4+Pj4+Pj4+ICAgICAg
ICAgICAgICBudW1fY291bnRlcnMgPSBGMTVIX05VTV9DT1VOVEVSUzsKPj4+Pj4+Pj4gICAgICAg
ICAgICAgIGNvdW50ZXJzID0gQU1EX0YxNUhfQ09VTlRFUlM7Cj4+Pj4+Pj4+ICAgICAgICAgICAg
ICBjdHJscyA9IEFNRF9GMTVIX0NUUkxTOwo+Pj4+Pj4+Cj4+Pj4+Pj4gVW5sZXNzIHlvdSBrbm93
IHdoYXQgQU1EIEZhbTE4IHdpbGwgbG9vayBsaWtlLCB5b3UgY2FuJ3QgZG8gaXQKPj4+Pj4+PiBs
aWtlIHRoaXMuIEZhbTE4IHJlYWxseSBuZWVkcyB0byBiZSBmdXJ0aGVyIHF1YWxpZmllZCBieSBh
IHZlbmRvcgo+Pj4+Pj4+IGNoZWNrIGF0IHRoaXMgcG9pbnQgaW4gdGltZS4KPj4+Pj4+Cj4+Pj4+
PiBIeWdvbiB3aWxsIG5lZ290aWF0ZSB3aXRoIEFNRCB0byBtYWtlIHN1cmUgdGhhdCBvbmx5IEh5
Z29uIHNob3VsZCB1c2UKPj4+Pj4+IEZhbTE4aC4KPj4+Pj4KPj4+Pj4gSW4gdGhlIHN1Y2Nlc3Mg
Y2FzZSBvZiB3aGljaCBwbGVhc2Ugc3RhdGUgdGhpcyBpbiB0aGUgZGVzY3JpcHRpb24uCj4+Pj4+
IFVudGlsIHRob3NlIG5lZ290aWF0aW9ucyBoYXZlIHN1Y2NlZWRlZCBJJ20gYWZyYWlkIEknbSBn
b2luZyB0bwo+Pj4+PiBpbnNpc3QgdG8gc2VlIHRoZSBleHRyYSBjaGVjayBhZGRlZC4KPj4+PiBv
ciBqdXN0IGFkZCBIeWdvbiBzdXBwb3J0IGF0IGJlZ2lubmluZyBvZiBhbWRfdnBtdV9pbml0KCk6
Cj4+Pj4gICAgICAgIGlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9I
WUdPTikgewo+Pj4+ICAgICAgICAgICAgbnVtX2NvdW50ZXJzID0gRjE1SF9OVU1fQ09VTlRFUlM7
Cj4+Pj4gICAgICAgICAgICBjb3VudGVycyA9IEFNRF9GMTVIX0NPVU5URVJTOwo+Pj4+ICAgICAg
ICAgICAgY3RybHMgPSBBTURfRjE1SF9DVFJMUzsKPj4+PiAgICAgICAgICAgIGs3X2NvdW50ZXJz
X21pcnJvcmVkID0gMTsKPj4+PiAgICAgICAgfQo+Pj4gb3IgcGVyaGFwcyBldmVuIGJldHRlciB3
b3VsZCBiZSB0d28gc2VwYXJhdGUgc3dpdGNoKCktZXMsIG9uZSBmb3IKPj4+IEFNRCBhbmQgb25l
IGZvciBIeWdvbi4gUG9zc2libHkgZXZlbiBhIHNlcGFyYXRlIGh5Z29uX3ZwbXVfaW5pdCgpLgo+
Pgo+PiBBIHNlcGFyYXRlIGh5Z29uX3ZwbXVfaW5pdCgpIGlzIGFsc28gZmluZSBleGNlcHQgdGhh
dCB0aGUgbGFzdCBwYXJ0IG9mCj4+IHRoZSBmdW5jdGlvbiBjYW4gYmUgc2hhcmVkLgo+IAo+IFNv
IHBlcmhhcHMgc3BsaXQgdGhhdCBwYXJ0IG91dCBpbnRvIGEgc3RhdGljIF92cG11X2luaXQoKSBv
ciBjb21tb25faW5pdCgpPwoKT2theSwgSSdsbCB0cnkgdG8gc3BsaXQgdGhhdCBwYXJ0LgoKLS0g
ClJlZ2FyZHMsClB1IFdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
