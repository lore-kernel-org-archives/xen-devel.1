From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 42/49] ARM: new VGIC: provide system
	register emulation stub
Date: Fri,  9 Feb 2018 14:39:30 +0000
Message-ID: <20180209143937.28866-43-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9qp-0001lM-TO
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:40:31 +0000
Received: by mail-wr0-x241.google.com with SMTP id w50so8486874wrc.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:40:30 -0800 (PST)
In-Reply-To: <20180209143937.28866-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBhcmNoIGNvZGUgdHJhcHMgc3lzdGVtIHJlZ2lzdGVycyB3cml0ZXMgZnJvbSB0aGUg
Z3Vlc3QgYW5kIHdpbGwKcmVsYXkgYW55dGhpbmcgR0lDIHJlbGF0ZWQgdG8gdGhlIFZHSUMuClNp
bmNlIHRoaXMgYWZmZWN0cyBvbmx5IEdJQ3YzICh3aGljaCB3ZSBkb24ndCB5ZXQgZW11bGF0ZSks
IHByb3ZpZGUgYQpzdHViIGltcGxlbWVudGF0aW9uIG9mIHZnaWNfZW11bGF0ZSgpIGZvciBub3cu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9y
Zz4KLS0tCiB4ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2lj
LmMgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKaW5kZXggOTdmZmRiYTVhZC4uZDkxMDI4YmQ0
MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCisrKyBiL3hlbi9hcmNoL2Fy
bS92Z2ljL3ZnaWMuYwpAQCAtNzkwLDYgKzc5MCwxMyBAQCBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNf
Z2V0X2h3X2lycV9kZXNjKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAogICAgIHJl
dHVybiBkZXNjOwogfQogCitib29sIHZnaWNfZW11bGF0ZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncywgdW5pb24gaHNyIGhzcikKK3sKKyAgICBBU1NFUlQoY3VycmVudC0+ZG9tYWluLT5hcmNo
LnZnaWMudmVyc2lvbiA9PSBHSUNfVjMpOworCisgICAgcmV0dXJuIGZhbHNlOworfQorCiAvKgog
ICogd2FzOgogICogICAgICBpbnQga3ZtX3ZnaWNfbWFwX3BoeXNfaXJxKHN0cnVjdCB2Y3B1ICp2
Y3B1LCB1MzIgdmlydF9pcnEsIHUzMiBwaHlzX2lycSkKLS0gCjIuMTQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
