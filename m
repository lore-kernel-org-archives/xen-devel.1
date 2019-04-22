From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 19/20] xen/arm: Pair call to set_fixmap with
 call to clear_fixmap in copy_from_paddr
Date: Mon, 22 Apr 2019 17:49:36 +0100
Message-ID: <20190422164937.21350-20-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc93-0005PI-NF
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:17 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

QXQgdGhlIG1vbWVudCwgc2V0X2ZpeG1hcCBtYXkgcmVwbGFjZSBhIHZhbGlkIGVudHJ5IHdpdGhv
dXQgZm9sbG93aW5nCnRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVz
dWx0IHRvIFRMQiBjb25mbGljdCBhYm9ydC4KClJhdGhlciB0aGFuIGRlYWxpbmcgd2l0aCBCcmVh
ay1CZWZvcmUtTWFrZSBpbiBzZXRfZml4bWFwLCBldmVyeSBjYWxsIHRvCnNldF9maXhtYXAgaXMg
cGFpcmVkIHdpdGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2tlcm5lbC5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0va2VybmVsLmMgYi94ZW4vYXJjaC9hcm0va2VybmVs
LmMKaW5kZXggZTNmZmRiMmZhMS4uMzg5YmVmMmFmYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2tlcm5lbC5jCisrKyBiL3hlbi9hcmNoL2FybS9rZXJuZWwuYwpAQCAtNTgsMTMgKzU4LDEyIEBA
IHZvaWQgX19pbml0IGNvcHlfZnJvbV9wYWRkcih2b2lkICpkc3QsIHBhZGRyX3QgcGFkZHIsIHVu
c2lnbmVkIGxvbmcgbGVuKQogICAgICAgICBzZXRfZml4bWFwKEZJWE1BUF9NSVNDLCBtYWRkcl90
b19tZm4ocGFkZHIpLCBQQUdFX0hZUEVSVklTT1JfV0MpOwogICAgICAgICBtZW1jcHkoZHN0LCBz
cmMgKyBzLCBsKTsKICAgICAgICAgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKGRzdCwgbCk7CisgICAg
ICAgIGNsZWFyX2ZpeG1hcChGSVhNQVBfTUlTQyk7CiAKICAgICAgICAgcGFkZHIgKz0gbDsKICAg
ICAgICAgZHN0ICs9IGw7CiAgICAgICAgIGxlbiAtPSBsOwogICAgIH0KLQotICAgIGNsZWFyX2Zp
eG1hcChGSVhNQVBfTUlTQyk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBwbGFjZV9tb2R1bGVz
KHN0cnVjdCBrZXJuZWxfaW5mbyAqaW5mbywKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
