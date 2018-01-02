From: manish.jaggi@linaro.org
Subject: [RFC 07/11] Add kernel helper functions
Date: Tue,  2 Jan 2018 14:58:05 +0530
Message-ID: <20180102092809.1841-8-manish.jaggi@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=aiit=d5=linaro.org=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1eWIsT-0002ac-8z
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 09:28:57 +0000
Received: by mail-pl0-x244.google.com with SMTP id i6so28325668plt.13
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2018 01:28:56 -0800 (PST)
In-Reply-To: <20180102092809.1841-1-manish.jaggi@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@linaro.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: Manish Jaggi <manish.jaggi@linaro.org>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAbGluYXJvLm9yZz4KCkFkZCBrYWxsb2Mg
a2ZyZWUgZnVuY3Rpb25zIGZyb20gbGludXgga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogTWFuaXNo
IEphZ2dpIDxtYW5pc2guamFnZ2lAbGluYXJvLm9yZz4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4va2Vy
bmVsLmggfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaCBiL3hlbi9pbmNsdWRlL3hlbi9r
ZXJuZWwuaAppbmRleCA1NDhiNjRkYTlmLi43ODUxN2Y2Y2FhIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS94ZW4va2VybmVsLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oCkBAIC03LDYg
KzcsMTYgQEAKIAogI2luY2x1ZGUgPHhlbi90eXBlcy5oPgogCisvKiBYZW46IERlZmluZSBjb21w
YXRpYmlsaXR5IGZ1bmN0aW9ucyAqLworI2RlZmluZSBGV19CVUcgICAgICAgICAiW0Zpcm13YXJl
IEJ1Z106ICIKKyNkZWZpbmUgcHJfZXJyKGZtdCwgLi4uKSBwcmludGsoWEVOTE9HX0VSUiBmbXQs
ICMjIF9fVkFfQVJHU19fKQorI2RlZmluZSBwcl93YXJuKGZtdCwgLi4uKSBwcmludGsoWEVOTE9H
X1dBUk5JTkcgZm10LCAjIyBfX1ZBX0FSR1NfXykKKworLyogQWxpYXMgdG8gWGVuIGFsbG9jYXRp
b24gaGVscGVycyAqLworI2RlZmluZSBrZnJlZSB4ZnJlZQorI2RlZmluZSBrbWFsbG9jKHNpemUs
IGZsYWdzKSAgICAgICAgICAgIF94bWFsbG9jKHNpemUsIHNpemVvZih2b2lkICopKQorI2RlZmlu
ZSBremFsbG9jKHNpemUsIGZsYWdzKSAgICAgICAgICAgIF94emFsbG9jKHNpemUsIHNpemVvZih2
b2lkICopKQorCiAvKgogICogbWluKCkvbWF4KCkgbWFjcm9zIHRoYXQgYWxzbyBkbwogICogc3Ry
aWN0IHR5cGUtY2hlY2tpbmcuLiBTZWUgdGhlCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
