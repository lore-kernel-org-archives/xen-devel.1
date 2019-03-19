From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] xen/arm: kernel: Remove Dom prefix when using
 %pd format
Date: Tue, 19 Mar 2019 23:23:43 +0000
Message-ID: <20190319232343.24371-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vbZj=RW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6O5F-0001ja-Nt
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 23:23:49 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZvcm1hdCAlcGQgd2lsbCBhbHJlYWR5IHByZWZpeCB0aGUgZG9tYWluIElEIHdpdGggJ2Qn
LiBTbyBhdm9pZCB0bwpwcmVmaXggd2l0aCAnRG9tJy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2tlcm5lbC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2tlcm5lbC5jIGIveGVuL2FyY2gvYXJtL2tlcm5lbC5jCmlu
ZGV4IGQwNGE4NjJmOTkuLmUzZmZkYjJmYTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9rZXJu
ZWwuYworKysgYi94ZW4vYXJjaC9hcm0va2VybmVsLmMKQEAgLTQ4NCw3ICs0ODQsNyBAQCBpbnQg
X19pbml0IGtlcm5lbF9wcm9iZShzdHJ1Y3Qga2VybmVsX2luZm8gKmluZm8sCiAgICAgICAgIHJl
dHVybiAtRU5PRU5UOwogICAgIH0KIAotICAgIHByaW50aygiTG9hZGluZyBEb20lcGQga2VybmVs
IGZyb20gYm9vdCBtb2R1bGUgQCAlIlBSSXBhZGRyIlxuIiwKKyAgICBwcmludGsoIkxvYWRpbmcg
JXBkIGtlcm5lbCBmcm9tIGJvb3QgbW9kdWxlIEAgJSJQUklwYWRkciJcbiIsCiAgICAgICAgICAg
IGluZm8tPmQsIGluZm8tPmtlcm5lbF9ib290bW9kdWxlLT5zdGFydCk7CiAgICAgaWYgKCBpbmZv
LT5pbml0cmRfYm9vdG1vZHVsZSApCiAgICAgICAgIHByaW50aygiTG9hZGluZyByYW1kaXNrIGZy
b20gYm9vdCBtb2R1bGUgQCAlIlBSSXBhZGRyIlxuIiwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
