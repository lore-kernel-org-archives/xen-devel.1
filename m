From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v1 03/13] xen/arm: setup: Check errata for boot
 CPU later on
Date: Tue,  5 Jun 2018 16:22:53 +0100
Message-ID: <20180605152303.14450-4-julien.grall@arm.com>
References: <20180605152303.14450-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s9k6=ix=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fQDnu-0005An-HI
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 15:23:22 +0000
In-Reply-To: <20180605152303.14450-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

U29tZSBlcnJhdGEgd2lsbCByZWx5IG9uIHRoZSBTTUNDQyB2ZXJzaW9uIHdoaWNoIGlzIGRldGVj
dGVkIGJ5CnBzY2lfaW5pdCgpLgoKVGhpcyBpcyBwYXJ0IG9mIFhTQS0yNjMuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2Vz
IGluIHYyOgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyByZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNo
L2FybS9zZXR1cC5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hl
bi9hcmNoL2FybS9zZXR1cC5jCmluZGV4IDFkNmY2YmYzN2UuLmFjOTNkZTQ3ODYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC0x
NzEsOCArMTcxLDYgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3Nvcl9pZCh2b2lkKQogICAg
IH0KIAogICAgIHByb2Nlc3Nvcl9zZXR1cCgpOwotCi0gICAgY2hlY2tfbG9jYWxfY3B1X2VycmF0
YSgpOwogfQogCiB2b2lkIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsIHBhZGRyX3Qg
ZSwKQEAgLTc3OSw2ICs3NzcsMTIgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxv
bmcgYm9vdF9waHlzX29mZnNldCwKICAgICBwcmludGsoWEVOTE9HX0lORk8gIlNNUDogQWxsb3dp
bmcgJXUgQ1BVc1xuIiwgY3B1cyk7CiAgICAgbnJfY3B1X2lkcyA9IGNwdXM7CiAKKyAgICAvKgor
ICAgICAqIFNvbWUgZXJyYXRhIHJlbGllcyBvbiBTTUNDQyB2ZXJzaW9uIHdoaWNoIGlzIGRldGVj
dGVkIGJ5IHBzY2lfaW5pdCgpCisgICAgICogKGNhbGxlZCBmcm9tIHNtcF9pbml0X2NwdXMoKSku
CisgICAgICovCisgICAgY2hlY2tfbG9jYWxfY3B1X2VycmF0YSgpOworCiAgICAgaW5pdF94ZW5f
dGltZSgpOwogCiAgICAgZ2ljX2luaXQoKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
