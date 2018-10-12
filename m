From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 08/17] x86: make construct_dom0 build with
 !CONFIG_PV
Date: Fri, 12 Oct 2018 08:12:46 -0600
Message-ID: <5BC0ABDE02000078001F1094@prv1-mh.provo.novell.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <c3dca1d3b314660f15aa886c410815c6ae10dc8a.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAyBQ-0004MQ-3o
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 14:12:52 +0000
In-Reply-To: <c3dca1d3b314660f15aa886c410815c6ae10dc8a.1538667753.git-series.wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb20w
X2J1aWxkLmMKPiBAQCAtNTA5LDggKzUwOSwxNiBAQCBpbnQgX19pbml0IGNvbnN0cnVjdF9kb20w
KHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IG1vZHVsZV90ICppbWFnZSwKPiAgICAgIH0KPiAgI2Vu
ZGlmCj4gIAo+IC0gICAgcmMgPSAoaXNfaHZtX2RvbWFpbihkKSA/IGRvbTBfY29uc3RydWN0X3B2
aCA6IGRvbTBfY29uc3RydWN0X3B2KQo+IC0gICAgICAgICAoZCwgaW1hZ2UsIGltYWdlX2hlYWRy
b29tLCBpbml0cmQsIGNtZGxpbmUpOwo+ICsgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICkKPiAr
ICAgICAgICByYyA9IGRvbTBfY29uc3RydWN0X3B2aChkLCBpbWFnZSwgaW1hZ2VfaGVhZHJvb20s
IGluaXRyZCwgY21kbGluZSk7Cj4gKyAgICBlbHNlIGlmICggaXNfcHZfZG9tYWluKGQpICkKPiAr
ICAgICAgICByYyA9IGRvbTBfY29uc3RydWN0X3B2KGQsIGltYWdlLCBpbWFnZV9oZWFkcm9vbSwg
aW5pdHJkLCBjbWRsaW5lKTsKPiArICAgIGVsc2UKPiArICAgIHsKPiArICAgICAgICBBU1NFUlRf
VU5SRUFDSEFCTEUoKTsKPiArICAgICAgICByYyA9IC1FSU5WQUw7Cj4gKyAgICB9CgpEZXBlbmRp
bmcgb24gd2hhdCB0aGUgcGxhbnMgYXJlIHdydCBzaW11bHRhbmVvdXMgUFY9biBhbmQgSFZNPW4s
CnRoaXMgbWF5IGJldHRlciBuZWVkIHRvIGJlIHBhbmljKCkuIFRoZSBhc3NlcnRpb24gaXMgY2Vy
dGFpbmx5IG5vdCB2YWxpZAppbiB0aGF0IGNhc2UgLSBpdCBpcyB2ZXJ5IG11Y2ggZXhwZWN0ZWQg
dG8gZ2V0IHRoZXJlIGluIHN1Y2ggYSBjYXNlLiBJdAppcyBvbmx5IHZhbGlkIGlmIHRoZSBLY29u
ZmlnIGNoYW5nZSBkb2Vzbid0IGFsbG93IGZvciB0aGF0IGNvbWJpbmF0aW9uLgpJbiBhbnkgZXZl
bnQgSSBzZWUgdGhhdCBwYXRjaCAxMyBkb2Vzbid0IGNoYW5nZSB0aGUgY29kZSBhYm92ZQphZ2Fp
bi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
