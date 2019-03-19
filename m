From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v2 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Tue, 19 Mar 2019 19:32:22 +0800
Message-ID: <bd5c83cd-cb9d-d4c2-0fd1-6d226de6ea8a@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
 <040f45bfbf35ade98027221680777cb96e561c65.1550647742.git.puwen@hygon.cn>
 <5C8B9D6F020000780021F41C@prv1-mh.provo.novell.com>
 <3e5d403c-ba10-cfed-7cd2-7af662f59709@hygon.cn>
 <5C8F5DE0020000780021FB8E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2oAA=RW=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h6D4N-0000B4-Qs
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 11:38:11 +0000
In-Reply-To: <5C8F5DE0020000780021FB8E@prv1-mh.provo.novell.com>
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

T24gMjAxOS8zLzE4IDE2OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNi4wMy4xOSBh
dCAxMToxMSwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8zLzE1IDIwOjQxLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIxLjAyLjE5IGF0IDEwOjUwLCA8cHV3ZW5AaHln
b24uY24+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwo+Pj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9hbWQuYwo+Pj4+IEBAIC01NDUsNiArNTQ1LDgg
QEAgaW50IF9faW5pdCBhbWRfdnBtdV9pbml0KHZvaWQpCj4+Pj4gICAgICAgIHN3aXRjaCAoIGN1
cnJlbnRfY3B1X2RhdGEueDg2ICkKPj4+PiAgICAgICAgewo+Pj4+ICAgICAgICBjYXNlIDB4MTU6
Cj4+Pj4gKyAgICBjYXNlIDB4MTc6Cj4+Pj4gKyAgICBjYXNlIDB4MTg6Cj4+Pj4gICAgICAgICAg
ICBudW1fY291bnRlcnMgPSBGMTVIX05VTV9DT1VOVEVSUzsKPj4+PiAgICAgICAgICAgIGNvdW50
ZXJzID0gQU1EX0YxNUhfQ09VTlRFUlM7Cj4+Pj4gICAgICAgICAgICBjdHJscyA9IEFNRF9GMTVI
X0NUUkxTOwo+Pj4KPj4+IFVubGVzcyB5b3Uga25vdyB3aGF0IEFNRCBGYW0xOCB3aWxsIGxvb2sg
bGlrZSwgeW91IGNhbid0IGRvIGl0Cj4+PiBsaWtlIHRoaXMuIEZhbTE4IHJlYWxseSBuZWVkcyB0
byBiZSBmdXJ0aGVyIHF1YWxpZmllZCBieSBhIHZlbmRvcgo+Pj4gY2hlY2sgYXQgdGhpcyBwb2lu
dCBpbiB0aW1lLgo+Pgo+PiBIeWdvbiB3aWxsIG5lZ290aWF0ZSB3aXRoIEFNRCB0byBtYWtlIHN1
cmUgdGhhdCBvbmx5IEh5Z29uIHNob3VsZCB1c2UKPj4gRmFtMThoLgo+IAo+IEluIHRoZSBzdWNj
ZXNzIGNhc2Ugb2Ygd2hpY2ggcGxlYXNlIHN0YXRlIHRoaXMgaW4gdGhlIGRlc2NyaXB0aW9uLgo+
IFVudGlsIHRob3NlIG5lZ290aWF0aW9ucyBoYXZlIHN1Y2NlZWRlZCBJJ20gYWZyYWlkIEknbSBn
b2luZyB0bwo+IGluc2lzdCB0byBzZWUgdGhlIGV4dHJhIGNoZWNrIGFkZGVkLgoKSG93IHRvIGNo
ZWNrIHZlbmRvcj8gTWF5YmUgbGlrZSB0aGlzOgogICAgIGNhc2UgMHgxNToKICAgICBjYXNlIDB4
MTc6CiAgICAgY2FzZSAweDE4OgogICAgICAgICBpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ID09IFg4Nl9WRU5ET1JfQU1EICYmCiAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4NiA9PSAw
eDE4KQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgogICAgICAgICBudW1fY291bnRlcnMg
PSBGMTVIX05VTV9DT1VOVEVSUzsKICAgICAgICAgY291bnRlcnMgPSBBTURfRjE1SF9DT1VOVEVS
UzsKICAgICAgICAgY3RybHMgPSBBTURfRjE1SF9DVFJMUzsKCm9yIGp1c3QgYWRkIEh5Z29uIHN1
cHBvcnQgYXQgYmVnaW5uaW5nIG9mIGFtZF92cG11X2luaXQoKToKICAgICBpZiAoYm9vdF9jcHVf
ZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSFlHT04pIHsKICAgICAgICAgbnVtX2NvdW50
ZXJzID0gRjE1SF9OVU1fQ09VTlRFUlM7CiAgICAgICAgIGNvdW50ZXJzID0gQU1EX0YxNUhfQ09V
TlRFUlM7CiAgICAgICAgIGN0cmxzID0gQU1EX0YxNUhfQ1RSTFM7CiAgICAgICAgIGs3X2NvdW50
ZXJzX21pcnJvcmVkID0gMTsKICAgICB9CgotLSAKUmVnYXJkcywKUHUgV2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
