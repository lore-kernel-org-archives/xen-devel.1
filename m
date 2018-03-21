From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 4/5] x86/msr: update domain policy on
 CPUID policy changes
Date: Wed, 21 Mar 2018 20:53:35 +0000
Message-ID: <6460deda-46c3-932e-03e2-271f1707af25@citrix.com>
References: <20180228160948.6313-1-sergey.dyasli@citrix.com>
 <20180228160948.6313-5-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180228160948.6313-5-sergey.dyasli@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOCAxNjowOSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmgKPiBp
bmRleCA0MTlhYjZmOGE3Li40NzQ3NTcyODcxIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbXNyLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21zci5oCj4gQEAgLTYwNiw2
ICs2MDYsOSBAQCBpbnQgaW5pdF92Y3B1X21zcl9wb2xpY3koc3RydWN0IHZjcHUgKnYpOwo+ICBp
bnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0
X3QgKnZhbCk7Cj4gIGludCBndWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgbXNy
LCB1aW50NjRfdCB2YWwpOwo+ICAKPiArLyogVXBkYXRlIGF2YWlsYWJpbGl0eSBvZiBwZXItZG9t
YWluIE1TUnMgYmFzZWQgb24gQ1BVSUQgcG9saWN5ICovCj4gK3ZvaWQgcmVjYWxjdWxhdGVfbXNy
X3BvbGljeShzdHJ1Y3QgZG9tYWluICpkKTsKCkVpdGhlciB0aGlzIG5lZWRzIG5hbWluZyB0byBi
ZSBzcGVjaWZpY2FsbHkgdGhlIGRvbWFpbiBwb2xpY3ksIG9yIHRoZQpjb21tZW50IHNob3VsZG4n
dCBzcGVjaWZ5IHBlci1kb21haW4gb25seS7CoCBBcyB3ZSBidWlsZCB1cCB0aGUgcG9saWNpZXMs
CkkgZXhwZWN0IHdlIHdpbGwgZW5kIHVwIG5lZWRpbmcgdG8gdHdlYWsgdGhlIHZjcHUgcG9saWNp
ZXMgYXMgd2VsbC4KCk90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+ICh3aXRoCnNvbWUgZnVsbCBzdG9wcyBhdCB0aGUgZW5kIG9m
IGNvbW1lbnRzLCBzZWVpbmcgYXMgdGhlIHNlcmllcyBuZWVkcwphbm90aGVyIHNwaW4uKQoKPiAr
Cj4gICNlbmRpZiAvKiAhX19BU1NFTUJMWV9fICovCj4gIAo+ICAjZW5kaWYgLyogX19BU01fTVNS
X0ggKi8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
