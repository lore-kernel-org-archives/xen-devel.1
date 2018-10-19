From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 11/16] x86: don't set sysenter_entry in vmcs
 when !CONFIG_PV
Date: Fri, 19 Oct 2018 15:28:37 +0100
Message-ID: <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDWEd-0006HP-BX
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:58:43 +0000
In-Reply-To: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHN5bWJvbCB3aWxsIG5vdCBiZSBhdmFpbGFibGUgd2hlbiBQViBpcyBkaXNhYmxlZC4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQp2MjogbmV3Ci0t
LQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1j
cy5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCmluZGV4IGQ5NzQ3YjQuLjI4MjY3N2Eg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYworKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bWNzLmMKQEAgLTExNTksOSArMTE1OSwxNiBAQCBzdGF0aWMgaW50IGNvbnN0
cnVjdF92bWNzKHN0cnVjdCB2Y3B1ICp2KQogICAgIF9fdm13cml0ZShIT1NUX0NTX1NFTEVDVE9S
LCBfX0hZUEVSVklTT1JfQ1MpOwogICAgIF9fdm13cml0ZShIT1NUX1JJUCwgKHVuc2lnbmVkIGxv
bmcpdm14X2FzbV92bWV4aXRfaGFuZGxlcik7CiAKKyNpZmRlZiBDT05GSUdfUFYKICAgICAvKiBI
b3N0IFNZU0VOVEVSIENTOlJJUC4gKi8KICAgICBfX3Ztd3JpdGUoSE9TVF9TWVNFTlRFUl9DUywg
X19IWVBFUlZJU09SX0NTKTsKICAgICBfX3Ztd3JpdGUoSE9TVF9TWVNFTlRFUl9FSVAsICh1bnNp
Z25lZCBsb25nKXN5c2VudGVyX2VudHJ5KTsKKyNlbHNlCisgICAgLyoKKyAgICAgKiBTaG91bGQg
c29tZXRoaW5nIGJlIHB1dCBoZXJlIGZvciBkZWJ1Z2dpbmcgcHVycG9zZT8gV2UgbmV2ZXIKKyAg
ICAgKiBzZXQgaXQgdXAgaW4gdGhlIGZpcnN0IHBsYWNlLgorICAgICAqLworI2VuZGlmCiAKICAg
ICAvKiBNU1IgaW50ZXJjZXB0cy4gKi8KICAgICBfX3Ztd3JpdGUoVk1fRVhJVF9NU1JfTE9BRF9D
T1VOVCwgMCk7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
