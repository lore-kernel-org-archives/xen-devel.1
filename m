From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 4/5] libxc: introduce xc_cpuid_x86.h
Date: Thu, 24 May 2018 17:05:21 +0100
Message-ID: <20180524160522.757-5-wei.liu2@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yzin=il=citrix.com=prvs=675a57d20=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fLsk3-0000Jc-I0
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:05:27 +0000
In-Reply-To: <20180524160522.757-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Q29sbGVjdCBjcHVpZCByZWxhdGVkIHRoaW5ncyBpbnRvIGEgaGVhZGVyIGZpbGUuIFByb3ZpZGUg
dGhlIG5lY2Vzc2FyeQptYWNyb3MgdG8gbWFrZSBpdCB3b3JrLgoKU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpD
YzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGli
eGMveGNfY3B1aWRfeDg2LmMgfCAgNiArLS0tLS0KIHRvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5o
IHwgMTYgKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnhjL3hjX2NwdWlk
X3g4Ni5oCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgYi90b29scy9s
aWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCA5ZmEyZjdjMzYwLi44OWRlZDcxOGJjIDEwMDY0NAot
LS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19jcHVp
ZF94ODYuYwpAQCAtMjcsMTEgKzI3LDcgQEAKICNpbmNsdWRlIDx4ZW4vaHZtL3BhcmFtcy5oPgog
I2luY2x1ZGUgPHhlbi10b29scy9saWJzLmg+CiAKLWVudW0gewotI2RlZmluZSBYRU5fQ1BVRkVB
VFVSRShuYW1lLCB2YWx1ZSkgWDg2X0ZFQVRVUkVfIyNuYW1lID0gdmFsdWUsCi0jaW5jbHVkZSA8
eGVuL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaD4KLX07Ci0jaW5jbHVkZSAiX3hjX2NwdWlkX2F1
dG9nZW4uaCIKKyNpbmNsdWRlICJ4Y19jcHVpZF94ODYuaCIKIAogI2RlZmluZSBiaXRtYXNrb2Yo
aWR4KSAgICAgICgxdSA8PCAoKGlkeCkgJiAzMSkpCiAjZGVmaW5lIGZlYXR1cmV3b3JkX29mKGlk
eCkgKChpZHgpID4+IDUpCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuaCBi
L3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLjFhYzEyZjBlMzAKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9saWJ4Yy94Y19j
cHVpZF94ODYuaApAQCAtMCwwICsxLDE2IEBACisjaWZuZGVmIFhDX1g4Nl9DUFVJRF9ICisjZGVm
aW5lIFhDX1g4Nl9DUFVJRF9ICisKK2VudW0geworI2RlZmluZSBYRU5fQ1BVRkVBVFVSRShuYW1l
LCB2YWx1ZSkgWDg2X0ZFQVRVUkVfIyNuYW1lID0gdmFsdWUsCisjaW5jbHVkZSA8eGVuL2FyY2gt
eDg2L2NwdWZlYXR1cmVzZXQuaD4KK307CisjaW5jbHVkZSAiX3hjX2NwdWlkX2F1dG9nZW4uaCIK
KworI2RlZmluZSBNQVgoeCx5KSAoKHgpID4gKHkpID8gKHgpIDogKHkpKQorCisjZGVmaW5lIEZT
Q0FQSU5UUyBGRUFUVVJFU0VUX05SX0VOVFJJRVMKKworI2luY2x1ZGUgPGFyY2gtc2hhcmVkL2Nw
dWlkLmg+CisKKyNlbmRpZgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
