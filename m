From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 41/74] xen/pvh: do not mark the low 1MB
	as IO mem
Date: Thu, 4 Jan 2018 13:05:52 +0000
Message-ID: <20180104130625.28605-42-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5aB-0005Hj-Li
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:29:19 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCk9uIFBWSCB0aGVy
ZSdzIG5vdGhpbmcgc3BlY2lhbCBvbiB0aGUgbG93IDFNQgoKU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMg
fCA5ICsrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CmluZGV4IGY3M2ZlZTIyNWUuLjM1NWU2NzQ3YmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC0xMjIsNiArMTIyLDcgQEAKICNpbmNsdWRl
IDxhc20vZml4bWFwLmg+CiAjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KICNpbmNsdWRlIDxhc20v
cGNpLmg+CisjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CiAKICNpbmNsdWRlIDxhc20vaHZtL2dyYW50
X3RhYmxlLmg+CiAjaW5jbHVkZSA8YXNtL3B2L2dyYW50X3RhYmxlLmg+CkBAIC0yODgsOCArMjg5
LDEyIEBAIHZvaWQgX19pbml0IGFyY2hfaW5pdF9tZW1vcnkodm9pZCkKICAgICBkb21fY293ID0g
ZG9tYWluX2NyZWF0ZShET01JRF9DT1csIERPTUNSRl9kdW1teSwgMCwgTlVMTCk7CiAgICAgQlVH
X09OKElTX0VSUihkb21fY293KSk7CiAKLSAgICAvKiBGaXJzdCAxTUIgb2YgUkFNIGlzIGhpc3Rv
cmljYWxseSBtYXJrZWQgYXMgSS9PLiAqLwotICAgIGZvciAoIGkgPSAwOyBpIDwgMHgxMDA7IGkr
KyApCisgICAgLyoKKyAgICAgKiBGaXJzdCAxTUIgb2YgUkFNIGlzIGhpc3RvcmljYWxseSBtYXJr
ZWQgYXMgSS9PLiAgSWYgd2UgYm9vdGVkIFBWSCwKKyAgICAgKiByZWNsYWltIHRoZSBzcGFjZS4g
IElycmVzcGVjdGl2ZSwgbGVhdmUgTUZOIDAgYXMgc3BlY2lhbCBmb3IgdGhlIHNha2UKKyAgICAg
KiBvZiAwIGJlaW5nIGEgdmVyeSBjb21tb24gZGVmYXVsdCB2YWx1ZS4KKyAgICAgKi8KKyAgICBm
b3IgKCBpID0gMDsgaSA8IChwdmhfYm9vdCA/IDEgOiAweDEwMCk7IGkrKyApCiAgICAgICAgIHNo
YXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QobWZuX3RvX3BhZ2UoX21mbihpKSksCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZG9tX2lvLCBYRU5TSEFSRV93cml0YWJsZSk7CiAKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
