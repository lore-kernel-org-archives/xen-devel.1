From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v2 37/45] ARM: new VGIC: Provide system register
	emulation stub
Date: Thu, 15 Mar 2018 20:30:42 +0000
Message-ID: <20180315203050.19791-38-andre.przywara@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jxrf=gf=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ewZXR-0004Lj-5D
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:31:49 +0000
Received: by mail-wr0-x241.google.com with SMTP id d10so9640293wrf.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 13:31:48 -0700 (PDT)
In-Reply-To: <20180315203050.19791-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBhcmNoIGNvZGUgdHJhcHMgc3lzdGVtIHJlZ2lzdGVycyB3cml0ZXMgZnJvbSB0aGUg
Z3Vlc3QgYW5kIHdpbGwKcmVsYXkgYW55dGhpbmcgR0lDIHJlbGF0ZWQgdG8gdGhlIFZHSUMuClNp
bmNlIHRoaXMgYWZmZWN0cyBvbmx5IEdJQ3YzICh3aGljaCB3ZSBkb24ndCB5ZXQgZW11bGF0ZSks
IHByb3ZpZGUgYQpzdHViIGltcGxlbWVudGF0aW9uIG9mIHZnaWNfZW11bGF0ZSgpIGZvciBub3cu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9y
Zz4KQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQpDaGFu
Z2Vsb2cgdjEgLi4uIHYyOgotIEFkZCBBY2tlZC1ieToKCiB4ZW4vYXJjaC9hcm0vdmdpYy92Z2lj
LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMK
aW5kZXggYjU2NjgyZjhlNC4uNzNjZDQzZjBmYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3Zn
aWMvdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwpAQCAtODA0LDYgKzgwNCwx
MyBAQCBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNfZ2V0X2h3X2lycV9kZXNjKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCB2Y3B1ICp2LAogICAgIHJldHVybiBkZXNjOwogfQogCitib29sIHZnaWNfZW11
bGF0ZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5pb24gaHNyIGhzcikKK3sKKyAgICBB
U1NFUlQoY3VycmVudC0+ZG9tYWluLT5hcmNoLnZnaWMudmVyc2lvbiA9PSBHSUNfVjMpOworCisg
ICAgcmV0dXJuIGZhbHNlOworfQorCiAvKgogICogd2FzOgogICogICAgICBpbnQga3ZtX3ZnaWNf
bWFwX3BoeXNfaXJxKHN0cnVjdCB2Y3B1ICp2Y3B1LCB1MzIgdmlydF9pcnEsIHUzMiBwaHlzX2ly
cSkKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
