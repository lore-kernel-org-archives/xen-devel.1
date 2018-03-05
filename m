From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 46/57] ARM: new VGIC: Add event channel IRQ
	handling
Date: Mon,  5 Mar 2018 16:04:04 +0000
Message-ID: <20180305160415.16760-47-andre.przywara@linaro.org>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oang=f3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1essbv-0000H3-F2
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:05:11 +0000
Received: by mail-wm0-x243.google.com with SMTP id z81so16908209wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 08:05:10 -0800 (PST)
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

VGhlIFhlbiBjb3JlL2FyY2ggY29kZSByZWxpZXMgb24gdHdvIGFic3RyYWN0ZWQgZnVuY3Rpb25z
IHRvIGluamVjdCBhbgpldmVudCBjaGFubmVsIElSUSBhbmQgdG8gcXVlcnkgaXRzIHBlbmRpbmcg
c3RhdGUuCkltcGxlbWVudCB0aG9zZSB0byBxdWVyeSB0aGUgc3RhdGUgb2YgdGhlIG5ldyBWR0lD
IGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2Vsb2cgUkZDIC4uLiB2MToKLSBhZGQgbG9ja2lu
ZwoKIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS92Z2ljL3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwppbmRleCA1YmJmNTVk
YTIxLi4wYmYyNTdjODY1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKKysr
IGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCkBAIC02OTgsNiArNjk4LDI5IEBAIHZvaWQgdmdp
Y19raWNrX3ZjcHVzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgfQogfQogCit2b2lkIGFyY2hfZXZ0
Y2huX2luamVjdChzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICB2Z2ljX2luamVjdF9pcnEodi0+ZG9t
YWluLCB2LCB2LT5kb21haW4tPmFyY2guZXZ0Y2huX2lycSwgdHJ1ZSk7Cit9CisKK2Jvb2wgdmdp
Y19ldnRjaG5faXJxX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpCit7CisgICAgc3RydWN0IHZnaWNf
aXJxICppcnE7CisgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKKyAgICBib29sIHBlbmRpbmc7CisK
KyAgICAvKiBEb2VzIG5vdCB3b3JrIGZvciBMUElzLiAqLworICAgIEFTU0VSVCghaXNfbHBpKHYt
PmRvbWFpbi0+YXJjaC5ldnRjaG5faXJxKSk7CisKKyAgICBpcnEgPSB2Z2ljX2dldF9pcnEodi0+
ZG9tYWluLCB2LCB2LT5kb21haW4tPmFyY2guZXZ0Y2huX2lycSk7CisgICAgc3Bpbl9sb2NrX2ly
cXNhdmUoJmlycS0+aXJxX2xvY2ssIGZsYWdzKTsKKyAgICBwZW5kaW5nID0gaXJxX2lzX3BlbmRp
bmcoaXJxKTsKKyAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpcnEtPmlycV9sb2NrLCBmbGFn
cyk7CisgICAgdmdpY19wdXRfaXJxKHYtPmRvbWFpbiwgaXJxKTsKKworICAgIHJldHVybiBwZW5k
aW5nOworfQorCiBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNfZ2V0X2h3X2lycV9kZXNjKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgdmlycSkKIHsKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
