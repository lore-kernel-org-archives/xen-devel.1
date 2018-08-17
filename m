From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 02/34] x86/vvmx: make get_shadow_eptp static
 function
Date: Fri, 17 Aug 2018 16:12:20 +0100
Message-ID: <8031c7ec84999887184e15c73a534ee80a0642d7.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgQq-0007y0-07
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:12:56 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
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

SXRzIGNhbGxlcnMgbGl2ZSB3aXRoaW4gdGhlIHNhbWUgZmlsZS4KClNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jICAgICAgICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14LmggfCAy
IC0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYwppbmRleCA5MThkNDdkLi5iN2Q5YTFhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCkBAIC0x
MTA3LDcgKzExMDcsNyBAQCBzdGF0aWMgdm9pZCBsb2FkX3NoYWRvd19ndWVzdF9zdGF0ZShzdHJ1
Y3QgdmNwdSAqdikKICAgICAvKiBUT0RPOiBDUjMgdGFyZ2V0IGNvbnRyb2wgKi8KIH0KIAotdWlu
dDY0X3QgZ2V0X3NoYWRvd19lcHRwKHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHVpbnQ2NF90IGdl
dF9zaGFkb3dfZXB0cChzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtID0gcDJtX2dldF9uZXN0ZWRwMm0odik7CiAgICAgc3RydWN0IGVwdF9kYXRhICplcHQgPSAm
cDJtLT5lcHQ7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdnZteC5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3Z2bXguaAppbmRleCA5ZWEzNWViLi5hMjBi
ZDllIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdnZteC5oCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14LmgKQEAgLTE4OCw4ICsxODgsNiBAQCBl
bnVtIHZteF9pbnNuX2Vycm5vIHNldF92dm1jc19yZWFsX3NhZmUoY29uc3Qgc3RydWN0IHZjcHUg
KiwgdTMyIGVuY29kaW5nLAogICAgc2V0X3Z2bWNzX3JlYWxfc2FmZSh2Y3B1LCBlbmNvZGluZywg
dmFsKSA6IFwKICAgIHNldF92dm1jc192aXJ0dWFsX3NhZmUodmNwdV9uZXN0ZWRodm0odmNwdSku
bnZfdnZtY3gsIGVuY29kaW5nLCB2YWwpKQogCi11aW50NjRfdCBnZXRfc2hhZG93X2VwdHAoc3Ry
dWN0IHZjcHUgKnYpOwotCiB2b2lkIG52bXhfZGVzdHJveV92bWNzKHN0cnVjdCB2Y3B1ICp2KTsK
IGludCBudm14X2hhbmRsZV92bXB0cmxkKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsKIGlu
dCBudm14X2hhbmRsZV92bXB0cnN0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsKLS0gCmdp
dC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
