From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/7] x86/entry: drop unused header inclusions
Date: Thu, 28 Mar 2019 08:48:35 -0600
Message-ID: <5C9CDEC3020000780022283E@prv1-mh.provo.novell.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9WKc-0007cp-29
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 14:48:38 +0000
In-Reply-To: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSdtIGluIHBhcnRpY3VsYXIgYWZ0ZXIgZ2V0dGluZyByaWQgb2YgYXNtL2FwaWNkZWYuaCwgYnV0
IHRoZXJlIGFyZSBtb3JlCm5vIGxvbmdlciAob3IgcGVyaGFwcyBuZXZlciBoYXZpbmcgYmVlbikg
dXNlZCBvbmVzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYv
aHZtL3N2bS9lbnRyeS5TCkBAIC0xOSwxMyArMTksOCBAQAogCiAgICAgICAgIC5maWxlICJzdm0v
ZW50cnkuUyIKIAotI2luY2x1ZGUgPHhlbi9lcnJuby5oPgotI2luY2x1ZGUgPHhlbi9zb2Z0aXJx
Lmg+Ci0jaW5jbHVkZSA8YXNtL3R5cGVzLmg+CiAjaW5jbHVkZSA8YXNtL2FzbV9kZWZucy5oPgot
I2luY2x1ZGUgPGFzbS9hcGljZGVmLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KLSNpbmNsdWRl
IDxwdWJsaWMveGVuLmg+CiAKICNkZWZpbmUgVk1SVU4gIC5ieXRlIDB4MEYsMHgwMSwweEQ4CiAj
ZGVmaW5lIFNUR0kgICAuYnl0ZSAweDBGLDB4MDEsMHhEQwotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC9lbnRyeS5TCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L2VudHJ5LlMKQEAgLTE4LDEz
ICsxOCw4IEBACiAKICAgICAgICAgLmZpbGUgInZteC9lbnRyeS5TIgogCi0jaW5jbHVkZSA8eGVu
L2Vycm5vLmg+Ci0jaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4KLSNpbmNsdWRlIDxhc20vdHlwZXMu
aD4KICNpbmNsdWRlIDxhc20vYXNtX2RlZm5zLmg+Ci0jaW5jbHVkZSA8YXNtL2FwaWNkZWYuaD4K
ICNpbmNsdWRlIDxhc20vcGFnZS5oPgotI2luY2x1ZGUgPHB1YmxpYy94ZW4uaD4KIAogI2RlZmlu
ZSBWTVJFU1VNRSAgICAgLmJ5dGUgMHgwZiwweDAxLDB4YzMKICNkZWZpbmUgVk1MQVVOQ0ggICAg
IC5ieXRlIDB4MGYsMHgwMSwweGMyCi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0L2Vu
dHJ5LlMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQvZW50cnkuUwpAQCAtNCwxMCAr
NCw3IEBACiAKICAgICAgICAgLmZpbGUgIng4Nl82NC9jb21wYXQvZW50cnkuUyIKIAotI2luY2x1
ZGUgPHhlbi9lcnJuby5oPgotI2luY2x1ZGUgPHhlbi9zb2Z0aXJxLmg+CiAjaW5jbHVkZSA8YXNt
L2FzbV9kZWZucy5oPgotI2luY2x1ZGUgPGFzbS9hcGljZGVmLmg+CiAjaW5jbHVkZSA8YXNtL3Bh
Z2UuaD4KICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAjaW5jbHVkZSA8YXNtL2Rlc2MuaD4K
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZf
NjQvZW50cnkuUwpAQCAtNiwxMCArNiw3IEBACiAKICAgICAgICAgLmZpbGUgIng4Nl82NC9lbnRy
eS5TIgogCi0jaW5jbHVkZSA8eGVuL2Vycm5vLmg+Ci0jaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4K
ICNpbmNsdWRlIDxhc20vYXNtX2RlZm5zLmg+Ci0jaW5jbHVkZSA8YXNtL2FwaWNkZWYuaD4KICNp
bmNsdWRlIDxhc20vcGFnZS5oPgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRl
IDxwdWJsaWMveGVuLmg+CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
