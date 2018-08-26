From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 07/23] x86/vpmu: put HVM only code under
 CONFIG_HVM
Date: Sun, 26 Aug 2018 13:19:40 +0100
Message-ID: <d60e683ec206739a3522df4550aca3c4191dc447.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu1T-0007Ep-7R
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:20:03 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdlIHUzMiB0byB1aW50MzJfdCB3aGlsZSBhdCBpdC4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2NwdS92cG11LmMgfCA2
ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jIGIveGVuL2FyY2gveDg2L2NwdS92
cG11LmMKaW5kZXggYjk3OGUwNS4uZmE2NzYyZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Nw
dS92cG11LmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKQEAgLTE5Niw4ICsxOTYsMTAg
QEAgdm9pZCB2cG11X2RvX2ludGVycnVwdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIHsK
ICAgICBzdHJ1Y3QgdmNwdSAqc2FtcGxlZCA9IGN1cnJlbnQsICpzYW1wbGluZzsKICAgICBzdHJ1
Y3QgdnBtdV9zdHJ1Y3QgKnZwbXU7CisjaWZkZWYgQ09ORklHX0hWTQogICAgIHN0cnVjdCB2bGFw
aWMgKnZsYXBpYzsKLSAgICB1MzIgdmxhcGljX2x2dHBjOworICAgIHVpbnQzMl90IHZsYXBpY19s
dnRwYzsKKyNlbmRpZgogCiAgICAgLyoKICAgICAgKiBkb20wIHdpbGwgaGFuZGxlIGludGVycnVw
dCBmb3Igc3BlY2lhbCBkb21haW5zIChlLmcuIGlkbGUgZG9tYWluKSBvciwKQEAgLTMyNCw2ICsz
MjYsNyBAQCB2b2lkIHZwbXVfZG9faW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQogICAgICAgICByZXR1cm47CiAgICAgfQogCisjaWZkZWYgQ09ORklHX0hWTQogICAgIC8qIEhW
TSBndWVzdHMgKi8KICAgICB2bGFwaWMgPSB2Y3B1X3ZsYXBpYyhzYW1wbGluZyk7CiAKQEAgLTM0
NSw2ICszNDgsNyBAQCB2b2lkIHZwbXVfZG9faW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQogICAgICAgICBzYW1wbGluZy0+bm1pX3BlbmRpbmcgPSAxOwogICAgICAgICBicmVh
azsKICAgICB9CisjZW5kaWYKIH0KIAogc3RhdGljIHZvaWQgdnBtdV9zYXZlX2ZvcmNlKHZvaWQg
KmFyZykKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
