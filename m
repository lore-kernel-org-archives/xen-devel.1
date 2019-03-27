From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 04/12] xen/arm: memaccess: Initialize correctly
 *access in __p2m_get_mem_access
Date: Wed, 27 Mar 2019 18:45:23 +0000
Message-ID: <20190327184531.30986-5-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYc-0001j1-03
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:50 +0000
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
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvbW1pdCA4ZDg0ZTcwMWZkICJ4ZW4vYXJtOiBpbml0aWFsaXplIGFjY2VzcyIgaW5pdGlh
bGl6ZXMKKmFjY2VzcyB1c2luZyB0aGUgd3JvbmcgZW51bWVyYXRpb24gdHlwZS4gVGhpcyByZXN1
bHQgdG8gYSB3YXJuaW5nCnVzaW5nIGNsYW5nOgoKbWVtX2FjY2Vzcy5jOjUwOjIwOiBlcnJvcjog
aW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUKJ3AybV9hY2Nlc3NfdCcg
dG8gZGlmZmVyZW50IGVudW1lcmF0aW9uIHR5cGUgJ3hlbm1lbV9hY2Nlc3NfdCcKWy1XZXJyb3Is
LVdlbnVtLWNvbnZlcnNpb25dCiAgICAqYWNjZXNzID0gcDJtLT5kZWZhdWx0X2FjY2VzczsKICAg
ICAgICAgICAgfiB+fn5+fl5+fn5+fn5+fn5+fn5+CgpUaGUgY29ycmVjdCBzb2x1dGlvbiBpcyB0
byB1c2UgdGhlIGFycmF5IG1lbWFjY2VzcyB0aGF0IHdpbGwgZG8gdGhlCmNvbnZlcnNpb24gYmV0
d2VlbiB0aGUgMiBlbnVtcy4KCkZpeGVzOiA4ZDg0ZTcwMWZkICgieGVuL2FybTogaW5pdGlhbGl6
ZSBhY2Nlc3MiKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgoKLS0tCgpUaGlzIHBhdGNoIGlzIGNhbmRpZGF0ZSBmb3IgYmFja3BvcnRpbmcgaW4gNC4x
Mi4KLS0tCiB4ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMKaW5kZXggZGI0OTM3MmEy
Yy4uM2UzNjIwMjk0YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYworKysg
Yi94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCkBAIC00Nyw3ICs0Nyw3IEBAIHN0YXRpYyBpbnQg
X19wMm1fZ2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLAogICAgIH07
CiAKICAgICBBU1NFUlQocDJtX2lzX2xvY2tlZChwMm0pKTsKLSAgICAqYWNjZXNzID0gcDJtLT5k
ZWZhdWx0X2FjY2VzczsKKyAgICAqYWNjZXNzID0gbWVtYWNjZXNzW3AybS0+ZGVmYXVsdF9hY2Nl
c3NdOwogCiAgICAgLyogSWYgbm8gc2V0dGluZyB3YXMgZXZlciBzZXQsIGp1c3QgcmV0dXJuIHJ3
eC4gKi8KICAgICBpZiAoICFwMm0tPm1lbV9hY2Nlc3NfZW5hYmxlZCApCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
