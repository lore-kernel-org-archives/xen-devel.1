From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 02/34] x86/HVM: grow MMIO cache data size
 to 64 bytes
Date: Thu, 25 Oct 2018 19:36:53 +0100
Message-ID: <9c61c76a-3ea4-9d2e-3ba1-46fd81184a3d@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
 <5BA0E74702000078001E952E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ahoo=nf=citrix.com=prvs=8298df8fa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gFkV6-0006Bc-MC
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 18:36:56 +0000
In-Reply-To: <5BA0E74702000078001E952E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTI6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMgbmVlZGVkIGJl
Zm9yZSBlbmFibGluZyBhbnkgQVZYNTEyIGluc25zIGluIHRoZSBlbXVsYXRvci4gQ2hhbmdlCj4g
dGhlIHdheSBhbGlnbm1lbnQgaXMgZW5mb3JjZWQgYXQgdGhlIHNhbWUgdGltZS4KPgo+IEFkZCBh
IGNoZWNrIHRoYXQgdGhlIGJ1ZmZlciB3b24ndCBhY3R1YWxseSBvdmVyZmxvdywgYW5kIHdoaWxl
IGF0IGl0Cj4gYWxzbyBjb252ZXJ0IHRoZSBjaGVjayBmb3IgYWNjZXNzZXMgdG8gbm90IGNyb3Nz
IHBhZ2UgYm91bmRhcmllcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiAtLS0KPiB2MzogTmV3Lgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9l
bXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+IEBAIC04NjYsNyAr
ODY2LDE4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9waHlzX21taW9fYWNjZXNzKAo+ICAgICAgaW50
IHJjID0gWDg2RU1VTF9PS0FZOwo+ICAKPiAgICAgIC8qIEFjY2Vzc2VzIG11c3QgZmFsbCB3aXRo
aW4gYSBwYWdlLiAqLwo+IC0gICAgQlVHX09OKChncGEgJiB+UEFHRV9NQVNLKSArIHNpemUgPiBQ
QUdFX1NJWkUpOwo+ICsgICAgaWYgKCAoZ3BhICYgflBBR0VfTUFTSykgKyBzaXplID4gUEFHRV9T
SVpFICkKPiArICAgIHsKPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiArICAgICAg
ICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyogQWNj
ZXNzZXMgbXVzdCBub3Qgb3ZlcmZsb3cgdGhlIGNhY2hlJ3MgYnVmZmVyLiAqLwo+ICsgICAgaWYg
KCBzaXplID4gc2l6ZW9mKGNhY2hlLT5idWZmZXIpICkKPiArICAgIHsKPiArICAgICAgICBBU1NF
UlRfVU5SRUFDSEFCTEUoKTsKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7
Cj4gKyAgICB9Cj4gIAo+ICAgICAgLyoKPiAgICAgICAqIGh2bWVtdWxfZG9faW8oKSBjYW5ub3Qg
aGFuZGxlIG5vbi1wb3dlci1vZi0yIGFjY2Vzc2VzIG9yCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vdmNwdS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCj4g
QEAgLTQyLDE1ICs0MiwxNCBAQCBzdHJ1Y3QgaHZtX3ZjcHVfYXNpZCB7Cj4gIH07Cj4gIAo+ICAv
Kgo+IC0gKiBXZSBtYXkgcmVhZCBvciB3cml0ZSB1cCB0byBtMjU2IGFzIGEgbnVtYmVyIG9mIGRl
dmljZS1tb2RlbAo+ICsgKiBXZSBtYXkgcmVhZCBvciB3cml0ZSB1cCB0byBtNTEyIGFzIGEgbnVt
YmVyIG9mIGRldmljZS1tb2RlbAo+ICAgKiB0cmFuc2FjdGlvbnMuCj4gICAqLwo+ICBzdHJ1Y3Qg
aHZtX21taW9fY2FjaGUgewo+ICAgICAgdW5zaWduZWQgbG9uZyBnbGE7Cj4gICAgICB1bnNpZ25l
ZCBpbnQgc2l6ZTsKPiAgICAgIHVpbnQ4X3QgZGlyOwo+IC0gICAgdWludDhfdCBwYWRbM107IC8q
IG1ha2UgYnVmZmVyW10gbG9uZy1hbGlnbmVkICovCj4gLSAgICB1aW50OF90IGJ1ZmZlclszMl07
Cj4gKyAgICB1aW50OF90IGJ1ZmZlcls2NF0gX19hbGlnbmVkKHNpemVvZihsb25nKSk7CgpEb24n
dCB3ZSB3YW50IGl0IDE2LWJ5dGUgYWxpZ25lZCwgcmF0aGVyIHRoYW4gOD8KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
