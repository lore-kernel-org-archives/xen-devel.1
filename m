From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 02/12] xen/arm: fix get_cpu_info() when built
 with clang
Date: Wed, 27 Mar 2019 18:45:21 +0000
Message-ID: <20190327184531.30986-3-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYY-0001hZ-GE
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:46 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgdW5kZXJzdGFuZHMgdGhlIEdDQ2lzbSBpbiB1c2UgaGVyZSwgYnV0IHN0aWxsIGNvbXBs
YWlucyB0aGF0IHNwIGlzCnVuaXRpYWxpc2VkLiBJbiBzdWNoIGNhc2VzLCByZXNvcnQgdG8gdGhl
IG9sZGVyIHZlcnNpb25zIG9mIHRoaXMgY29kZSwKd2hpY2ggZGlyZWN0bHkgcmVhZCBzcCBpbnRv
IHRoZSB0ZW1wb3JhcnkgdmFyaWFibGUuCgpOb3RlIHRoYXQgd2Ugc3RpbGwga2VlcCB0aGUgR0ND
aXNtIGluIHRoZSBkZWZhdWx0IGNhc2UsIGFzIGl0IGNhdXNlcyBHQ0MKdG8gY3JlYXRlIHJhdGhl
ciBiZXR0ZXIgYXNzZW1ibHkuCgpUaGlzIGlzIGJhc2VkIG9uIHRoZSB4ODYgY291bnRlcnBhcnQu
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0K
IHhlbi9pbmNsdWRlL2FzbS1hcm0vY3VycmVudC5oIHwgMTAgKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vY3VycmVudC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jdXJyZW50LmgK
aW5kZXggYzRhZjY2ZmJiOS4uNmI3YzFkZjY0ZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9jdXJyZW50LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jdXJyZW50LmgKQEAgLTI4
LDggKzI4LDE2IEBAIHN0cnVjdCBjcHVfaW5mbyB7CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGNw
dV9pbmZvICpnZXRfY3B1X2luZm8odm9pZCkKIHsKKyNpZmRlZiBfX2NsYW5nX18KKyAgICB1bnNp
Z25lZCBsb25nIHNwOworCisgICAgYXNtICgibW92ICUwLCBzcCIgOiAiPXIiIChzcCkpOworI2Vs
c2UKICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIHNwIGFzbSAoInNwIik7Ci0gICAgcmV0dXJu
IChzdHJ1Y3QgY3B1X2luZm8gKikoKHNwICYgfihTVEFDS19TSVpFIC0gMSkpICsgU1RBQ0tfU0la
RSAtIHNpemVvZihzdHJ1Y3QgY3B1X2luZm8pKTsKKyNlbmRpZgorCisgICAgcmV0dXJuIChzdHJ1
Y3QgY3B1X2luZm8gKikoKHNwICYgfihTVEFDS19TSVpFIC0gMSkpICsKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBTVEFDS19TSVpFIC0gc2l6ZW9mKHN0cnVjdCBjcHVfaW5mbykpOwog
fQogCiAjZGVmaW5lIGd1ZXN0X2NwdV91c2VyX3JlZ3MoKSAoJmdldF9jcHVfaW5mbygpLT5ndWVz
dF9jcHVfdXNlcl9yZWdzKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
