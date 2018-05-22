From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 03/13] xen/arm: setup: Check errata for boot CPU
 later on
Date: Tue, 22 May 2018 18:42:44 +0100
Message-ID: <20180522174254.27551-4-julien.grall@arm.com>
References: <20180522174254.27551-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m9vh=ij=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fLBJU-00029a-Q8
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 17:43:08 +0000
In-Reply-To: <20180522174254.27551-1-julien.grall@arm.com>
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
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2Fy
bS9zZXR1cC5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9h
cmNoL2FybS9zZXR1cC5jCmluZGV4IDFkNmY2YmYzN2UuLmFjOTNkZTQ3ODYgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC0xNzEs
OCArMTcxLDYgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3Nvcl9pZCh2b2lkKQogICAgIH0K
IAogICAgIHByb2Nlc3Nvcl9zZXR1cCgpOwotCi0gICAgY2hlY2tfbG9jYWxfY3B1X2VycmF0YSgp
OwogfQogCiB2b2lkIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsIHBhZGRyX3QgZSwK
QEAgLTc3OSw2ICs3NzcsMTIgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcg
Ym9vdF9waHlzX29mZnNldCwKICAgICBwcmludGsoWEVOTE9HX0lORk8gIlNNUDogQWxsb3dpbmcg
JXUgQ1BVc1xuIiwgY3B1cyk7CiAgICAgbnJfY3B1X2lkcyA9IGNwdXM7CiAKKyAgICAvKgorICAg
ICAqIFNvbWUgZXJyYXRhIHJlbGllcyBvbiBTTUNDQyB2ZXJzaW9uIHdoaWNoIGlzIGRldGVjdGVk
IGJ5IHBzY2lfaW5pdCgpCisgICAgICogKGNhbGxlZCBmcm9tIHNtcF9pbml0X2NwdXMoKSkuCisg
ICAgICovCisgICAgY2hlY2tfbG9jYWxfY3B1X2VycmF0YSgpOworCiAgICAgaW5pdF94ZW5fdGlt
ZSgpOwogCiAgICAgZ2ljX2luaXQoKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
