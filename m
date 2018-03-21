From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 28/39] ARM: new VGIC: Add event channel IRQ
 handling
Date: Wed, 21 Mar 2018 16:32:24 +0000
Message-ID: <20180321163235.12529-29-andre.przywara@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p7ro=gl=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eygfw-0002jT-7L
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:33:20 +0000
Received: by mail-wm0-x242.google.com with SMTP id l9so10911330wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 09:33:19 -0700 (PDT)
In-Reply-To: <20180321163235.12529-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBjb3JlL2FyY2ggY29kZSByZWxpZXMgb24gdHdvIGFic3RyYWN0ZWQgZnVuY3Rpb25z
IHRvIGluamVjdCBhbgpldmVudCBjaGFubmVsIElSUSBhbmQgdG8gcXVlcnkgaXRzIHBlbmRpbmcg
c3RhdGUuCkltcGxlbWVudCB0aG9zZSB0byBxdWVyeSB0aGUgc3RhdGUgb2YgdGhlIG5ldyBWR0lD
IGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGxpbmFyby5vcmc+CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyB8IDIzICsrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwppbmRl
eCAwNzg2NmQ3MjQzLi4zZDgxOGE5OGFkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92
Z2ljLmMKKysrIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCkBAIC02OTksNiArNjk5LDI5IEBA
IHZvaWQgdmdpY19raWNrX3ZjcHVzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgfQogfQogCit2b2lk
IGFyY2hfZXZ0Y2huX2luamVjdChzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICB2Z2ljX2luamVjdF9p
cnEodi0+ZG9tYWluLCB2LCB2LT5kb21haW4tPmFyY2guZXZ0Y2huX2lycSwgdHJ1ZSk7Cit9CisK
K2Jvb2wgdmdpY19ldnRjaG5faXJxX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpCit7CisgICAgc3Ry
dWN0IHZnaWNfaXJxICppcnE7CisgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKKyAgICBib29sIHBl
bmRpbmc7CisKKyAgICAvKiBEb2VzIG5vdCB3b3JrIGZvciBMUElzLiAqLworICAgIEFTU0VSVCgh
aXNfbHBpKHYtPmRvbWFpbi0+YXJjaC5ldnRjaG5faXJxKSk7CisKKyAgICBpcnEgPSB2Z2ljX2dl
dF9pcnEodi0+ZG9tYWluLCB2LCB2LT5kb21haW4tPmFyY2guZXZ0Y2huX2lycSk7CisgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJmlycS0+aXJxX2xvY2ssIGZsYWdzKTsKKyAgICBwZW5kaW5nID0gaXJx
X2lzX3BlbmRpbmcoaXJxKTsKKyAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpcnEtPmlycV9s
b2NrLCBmbGFncyk7CisgICAgdmdpY19wdXRfaXJxKHYtPmRvbWFpbiwgaXJxKTsKKworICAgIHJl
dHVybiBwZW5kaW5nOworfQorCiBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNfZ2V0X2h3X2lycV9kZXNj
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdmlycSkKIHsKLS0gCjIuMTQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
