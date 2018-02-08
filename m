From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V3] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Thu, 08 Feb 2018 02:22:43 -0700
Message-ID: <5A7C24F302000078001A64B1@prv-mh.provo.novell.com>
References: <1517559257-2846-1-git-send-email-rcojocaru@bitdefender.com>
 <5A7B3EFF02000078001A62B5@prv-mh.provo.novell.com>
 <8d940984-173d-6be8-6e0c-503dbc2c133b@bitdefender.com>
 <b5d0962a-e9fa-65d8-b90e-fa62058ab37a@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b5d0962a-e9fa-65d8-b90e-fa62058ab37a@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: andrew.cooper3@citrix.com, bitweasil@cryptohaze.com, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE4IGF0IDA5OjUxLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDcvMjAxOCAwNzo0MiBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBP
biAwMi8wNy8yMDE4IDA3OjAxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2h2bS5oCj4+Pj4gQEAgLTM0LDYgKzM0LDkgQEAgZXh0ZXJuIGJvb2xfdCBvcHRfaHZtX2Zl
cDsKPj4+PiAgI2RlZmluZSBvcHRfaHZtX2ZlcCAwCj4+Pj4gICNlbmRpZgo+Pj4+ICAKPj4+PiAr
I2RlZmluZSBYODZfQ1IzX05PRkxVU0ggKDF1bGwgPDwgNjMpCj4+Pgo+Pj4gVGhpcyBiZWxvbmdz
IGluIHg4Ni1kZWZzLmgKPiAKPiBTb3JyeSwgZG8geW91IG1lYW4geGVuL2FyY2gveDg2L2Jvb3Qv
ZGVmcy5oPyBPciB0aGF0IEkgc2hvdWxkIGFkZCBhIG5ldwo+IGhlYWRlciBmb3IgdGhpcz8KPiAK
PiAnZmluZCAuIC1uYW1lIHg4Ni1kZWZzLmgnIGNvbWVzIHVwIGVtcHR5LWhhbmRlZC4KCk9oLCBz
b3JyeSAtIHhlbi9pbmNsdWRlL2FzbS14ODYveDg2LWRlZm5zLmggKHlvdSBjb3VsZCBzaW1wbHkK
aGF2ZSBsb29rZWQgZm9yIHdoZXJlIHRoZSBDUjAgYW5kIENSNCBkZWZpbml0aW9ucyBhbGwgbGl2
ZSkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
