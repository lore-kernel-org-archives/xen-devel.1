From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/passthrough: move io.c to the x86
 subfolder
Date: Fri, 4 Jan 2019 11:33:27 +0100
Message-ID: <20190104103329.35741-3-roger.pau@citrix.com>
References: <20190104103329.35741-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPMs=PM=citrix.com=prvs=9008e7f41=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gfMnx-0007cT-Aa
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 10:34:17 +0000
In-Reply-To: <20190104103329.35741-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgbWFrZXMgbm8gc2Vuc2UgZm9yIGlvLmMgdG8gYmUgb24gdGhlIHRvcCBsZXZlbCBwYXNzdGhy
b3VnaApkaXJlY3RvcnksIHNpbmNlIGl0J3MgeDg2IHNwZWNpZmljLgoKTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUgICAgICAgfCAzIC0tLQogeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gveDg2L01ha2VmaWxlICAgfCAxICsKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3sg
PT4geDg2fS9pby5jIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKIHJlbmFtZSB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC97ID0+IHg4Nn0vaW8uYyAo
MTAwJSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9NYWtlZmlsZSBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCmluZGV4IGQ1MGFiMTg4YzguLmJjZmVhNjZk
MDUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlCkBAIC02LDYgKzYsMyBAQCBzdWJkaXItJChD
T05GSUdfQVJNKSArPSBhcm0KIG9iai15ICs9IGlvbW11Lm8KIG9iai0kKENPTkZJR19IQVNfUENJ
KSArPSBwY2kubwogb2JqLSQoQ09ORklHX0hBU19ERVZJQ0VfVFJFRSkgKz0gZGV2aWNlX3RyZWUu
bwotCi14ODYtJChDT05GSUdfSFZNKSA6PSBpby5vCi1vYmotJChDT05GSUdfWDg2KSArPSAkKHg4
Ni15KQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L01ha2VmaWxlIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L01ha2VmaWxlCmluZGV4IGE3MGNmOTQ2MGQuLjA3
MTVmZmJjMDAgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9NYWtlZmls
ZQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvTWFrZWZpbGUKQEAgLTEsMiArMSwz
IEBACiBvYmoteSArPSBhdHMubwogb2JqLXkgKz0gaW9tbXUubworb2JqLSQoQ09ORklHX0hWTSkg
Kz0gaW8ubwpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pby5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUg
ZnJvbSB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCnJlbmFtZSB0byB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC94ODYvaW8uYwotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
