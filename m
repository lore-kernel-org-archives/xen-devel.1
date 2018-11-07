From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/8] x86/vvmx: introduce
 nvmx_vcpu_preinit()
Date: Wed, 7 Nov 2018 13:39:59 +0000
Message-ID: <d2995a32-3999-22ad-d651-d4dd81babc8d@citrix.com>
References: <20181106120759.8789-1-sergey.dyasli@citrix.com>
 <20181106120759.8789-2-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106120759.8789-2-sergey.dyasli@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTEvMTggMTI6MDcsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+
IGluZGV4IGRmZDA4ZTJkMGEuLmM4YmM4ZTZkMTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdnZteC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCj4gQEAg
LTU3LDYgKzU3LDE2IEBAIHZvaWQgbnZteF9jcHVfZGVhZCh1bnNpZ25lZCBpbnQgY3B1KQo+ICAg
ICAgcGVyX2NwdSh2dm1jc19idWYsIGNwdSkgPSBOVUxMOwo+ICB9Cj4gIAo+ICsvKiBUaGlzIGZ1
bmN0aW9uIGluaXRpYWxpc2VzIGZpZWxkcyB0aGF0IGFyZSBub3QgMCBieSBkZWZhdWx0ICovCj4g
K3ZvaWQgbnZteF92Y3B1X3ByZWluaXQoc3RydWN0IHZjcHUgKnYpCj4gK3sKPiArICAgIHN0cnVj
dCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8yX252bXgodik7Cj4gKyAgICBzdHJ1Y3QgbmVzdGVk
dmNwdSAqbnZjcHUgPSAmdmNwdV9uZXN0ZWRodm0odik7Cj4gKwo+ICsgICAgbnZteC0+dm14b25f
cmVnaW9uX3BhID0gSU5WQUxJRF9QQUREUjsKPiArICAgIG52Y3B1LT5udl92dm1jeGFkZHIgPSBJ
TlZBTElEX1BBRERSOwoKdm14b25fcmVnaW9uX3BhIGlzIFZULXggc3BlY2lmaWMsIGJ1dCBudl92
dm1jeGFkZHIgaXMgY29tbW9uLsKgIEluc3RlYWQKb2YgYWRkaW5nIHlldCBhbm90aGVyIGZ1bmN0
aW9uIHdoaWNoIHdpbGwgYmUgZm9sZGVkIGV2ZW50dWFsbHksIEknZCBqdXN0CmZpeCBodm1fdmNw
dV9pbml0aWFsaXNlKCkgKHdoaWNoIGlzIHdoZXJlIHRoaXMgY29kZSB3aWxsIGV2ZW50dWFsbHkg
bW92ZSkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
