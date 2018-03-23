From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11] x86/libxc: fix usage of
 XEN_X86_EMU_ALL after VPCI addition
Date: Fri, 23 Mar 2018 10:57:56 +0000
Message-ID: <20180323105756.72586-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8ehz=gn=citrix.com=prvs=6134115c4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ezKOX-0001E4-1q
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 10:58:01 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SFZNIGd1ZXN0IHNob3VsZCBiZSBjcmVhdGVkIHdpdGggKFhFTl9YODZfRU1VX0FMTCAmCn5YRU5f
WDg2X0VNVV9WUENJKS4gVGhpcyBpcyBub3QgYW4gaXNzdWUgZm9yIHhsL2xpYnhsIGJlY2F1c2Ug
aXQKYWxyZWFkeSBzZXRzIHRoZSBjb3JyZWN0IGVtdWxhdGlvbiBmbGFncyBhbmQgZG9lc24ndCBw
YXNzIGEgTlVMTAp4Y19kb21haW5fY29uZmlndXJhdGlvbl90IHRvIHhjX2RvbWFpbl9jcmVhdGUu
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGMveGNfZG9tYWluLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy9saWJ4Yy94Y19kb21haW4uYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbWFpbi5j
CmluZGV4IGVhM2RmMWVmMzEuLjI2YjRiOTA4YjkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hj
X2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbWFpbi5jCkBAIC00MCw3ICs0MCw3IEBA
IGludCB4Y19kb21haW5fY3JlYXRlKHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBzc2lkcmVm
LAogCiAjaWYgZGVmaW5lZCAoX19pMzg2KSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCiAgICAgICAg
IGlmICggZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3QgKQotICAgICAgICAgICAgbGNv
bmZpZy5lbXVsYXRpb25fZmxhZ3MgPSBYRU5fWDg2X0VNVV9BTEw7CisgICAgICAgICAgICBsY29u
ZmlnLmVtdWxhdGlvbl9mbGFncyA9IChYRU5fWDg2X0VNVV9BTEwgJiB+WEVOX1g4Nl9FTVVfVlBD
SSk7CiAjZWxpZiBkZWZpbmVkIChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQogICAg
ICAgICBsY29uZmlnLmdpY192ZXJzaW9uID0gWEVOX0RPTUNUTF9DT05GSUdfR0lDX05BVElWRTsK
ICAgICAgICAgbGNvbmZpZy5ucl9zcGlzID0gMDsKLS0gCjIuMTYuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
