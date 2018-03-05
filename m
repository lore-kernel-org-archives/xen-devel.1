From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 49/57] ARM: new VGIC: provide system register
	emulation stub
Date: Mon,  5 Mar 2018 16:04:07 +0000
Message-ID: <20180305160415.16760-50-andre.przywara@linaro.org>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oang=f3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1essbz-0000Uq-3C
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:05:15 +0000
Received: by mail-wr0-x243.google.com with SMTP id p104so17813375wrc.12
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 08:05:13 -0800 (PST)
In-Reply-To: <20180305160415.16760-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBhcmNoIGNvZGUgdHJhcHMgc3lzdGVtIHJlZ2lzdGVycyB3cml0ZXMgZnJvbSB0aGUg
Z3Vlc3QgYW5kIHdpbGwKcmVsYXkgYW55dGhpbmcgR0lDIHJlbGF0ZWQgdG8gdGhlIFZHSUMuClNp
bmNlIHRoaXMgYWZmZWN0cyBvbmx5IEdJQ3YzICh3aGljaCB3ZSBkb24ndCB5ZXQgZW11bGF0ZSks
IHByb3ZpZGUgYQpzdHViIGltcGxlbWVudGF0aW9uIG9mIHZnaWNfZW11bGF0ZSgpIGZvciBub3cu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9y
Zz4KLS0tCkNoYW5nZWxvZyBSRkMgLi4uIHYxOgotIG5vIGNoYW5nZXMKCiB4ZW4vYXJjaC9hcm0v
dmdpYy92Z2ljLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdp
Yy92Z2ljLmMKaW5kZXggMmEyYjhmZDFlYi4uZTE5NTJjODcyZCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL3ZnaWMvdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwpAQCAtODEz
LDYgKzgxMywxMyBAQCBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNfZ2V0X2h3X2lycV9kZXNjKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAogICAgIHJldHVybiBkZXNjOwogfQogCitib29s
IHZnaWNfZW11bGF0ZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5pb24gaHNyIGhzcikK
K3sKKyAgICBBU1NFUlQoY3VycmVudC0+ZG9tYWluLT5hcmNoLnZnaWMudmVyc2lvbiA9PSBHSUNf
VjMpOworCisgICAgcmV0dXJuIGZhbHNlOworfQorCiAvKgogICogd2FzOgogICogICAgICBpbnQg
a3ZtX3ZnaWNfbWFwX3BoeXNfaXJxKHN0cnVjdCB2Y3B1ICp2Y3B1LCB1MzIgdmlydF9pcnEsIHUz
MiBwaHlzX2lycSkKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
