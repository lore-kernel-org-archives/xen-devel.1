From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v2 34/45] ARM: new VGIC: Add event channel IRQ
	handling
Date: Thu, 15 Mar 2018 20:30:39 +0000
Message-ID: <20180315203050.19791-35-andre.przywara@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jxrf=gf=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ewZXP-0004GL-6T
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 20:31:47 +0000
Received: by mail-wm0-x241.google.com with SMTP id q83so12890810wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 13:31:45 -0700 (PDT)
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

VGhlIFhlbiBjb3JlL2FyY2ggY29kZSByZWxpZXMgb24gdHdvIGFic3RyYWN0ZWQgZnVuY3Rpb25z
IHRvIGluamVjdCBhbgpldmVudCBjaGFubmVsIElSUSBhbmQgdG8gcXVlcnkgaXRzIHBlbmRpbmcg
c3RhdGUuCkltcGxlbWVudCB0aG9zZSB0byBxdWVyeSB0aGUgc3RhdGUgb2YgdGhlIG5ldyBWR0lD
IGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGxpbmFyby5vcmc+CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgotLS0KQ2hhbmdlbG9nIHYxIC4uLiB2MjoKLSBBZGQgQWNrZWQtYnk6CgogeGVuL2Fy
Y2gvYXJtL3ZnaWMvdmdpYy5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMv
dmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCmluZGV4IDdmZjY4MDQ0M2MuLjI3N2Nm
NGEwM2UgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYworKysgYi94ZW4vYXJj
aC9hcm0vdmdpYy92Z2ljLmMKQEAgLTY4OSw2ICs2ODksMjkgQEAgdm9pZCB2Z2ljX2tpY2tfdmNw
dXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICB9CiB9CiAKK3ZvaWQgYXJjaF9ldnRjaG5faW5qZWN0
KHN0cnVjdCB2Y3B1ICp2KQoreworICAgIHZnaWNfaW5qZWN0X2lycSh2LT5kb21haW4sIHYsIHYt
PmRvbWFpbi0+YXJjaC5ldnRjaG5faXJxLCB0cnVlKTsKK30KKworYm9vbCB2Z2ljX2V2dGNobl9p
cnFfcGVuZGluZyhzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICBzdHJ1Y3QgdmdpY19pcnEgKmlycTsK
KyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOworICAgIGJvb2wgcGVuZGluZzsKKworICAgIC8qIERv
ZXMgbm90IHdvcmsgZm9yIExQSXMuICovCisgICAgQVNTRVJUKCFpc19scGkodi0+ZG9tYWluLT5h
cmNoLmV2dGNobl9pcnEpKTsKKworICAgIGlycSA9IHZnaWNfZ2V0X2lycSh2LT5kb21haW4sIHYs
IHYtPmRvbWFpbi0+YXJjaC5ldnRjaG5faXJxKTsKKyAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaXJx
LT5pcnFfbG9jaywgZmxhZ3MpOworICAgIHBlbmRpbmcgPSBpcnFfaXNfcGVuZGluZyhpcnEpOwor
ICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlycS0+aXJxX2xvY2ssIGZsYWdzKTsKKyAgICB2
Z2ljX3B1dF9pcnEodi0+ZG9tYWluLCBpcnEpOworCisgICAgcmV0dXJuIHBlbmRpbmc7Cit9CisK
IHN0cnVjdCBpcnFfZGVzYyAqdmdpY19nZXRfaHdfaXJxX2Rlc2Moc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHZjcHUgKnYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCB2aXJxKQogewotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
