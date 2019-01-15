From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:09:40 +0000
Message-ID: <20190115110940.29403-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNAP=PX=citrix.com=prvs=9111e199a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gjMcM-0006m0-Fd
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:10:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VXNlcnMgbWF5IGNob29zZSB0byBleHBvcnQgYSBzbmFwc2hvdCBvZiBPVk1GIGFuZCBidWlsZCBp
dAp3aXRoIHhlbi5naXQgc3VwcGxpZWQgb3ZtZi1tYWtlZmlsZS4gSW4gdGhhdCBjYXNlIHdlIGRv
bid0Cm5lZWQgdG8gY2FsbCBgZ2l0IHN1Ym1vZHVsZWAuCgpGaXhlcyBiMTYyODE4NzBlLgoKUmVw
b3J0ZWQtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9maXJtd2FyZS9vdm1mLW1ha2Vm
aWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSBiL3Rvb2xzL2Zpcm13
YXJlL292bWYtbWFrZWZpbGUKaW5kZXggM2RlMmZjMDMwMC4uNTVmOTk5MjE0NSAxMDA2NDQKLS0t
IGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS9vdm1m
LW1ha2VmaWxlCkBAIC0xNiw3ICsxNiw3IEBAIGFsbDogYnVpbGQKIAogLlBIT05ZOiBidWlsZAog
YnVpbGQ6Ci0JJChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0IC0tcmVjdXJzaXZlCisJaWYg
dGVzdCAtZSAuZ2l0IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1
cnNpdmUgOyBmaQogCU92bWZQa2cvYnVpbGQuc2ggLWEgWDY0IC1iICQoVEFSR0VUKSAtbiA0CiAJ
Y3AgQnVpbGQvT3ZtZlg2NC8kKFRBUkdFVClfR0NDKi9GVi9PVk1GLmZkIG92bWYuYmluCiAKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
