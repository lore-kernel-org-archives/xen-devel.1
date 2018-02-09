From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 39/49] ARM: new VGIC: Add event channel IRQ
	handling
Date: Fri,  9 Feb 2018 14:39:27 +0000
Message-ID: <20180209143937.28866-40-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9qm-0001Yj-O1
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:40:28 +0000
Received: by mail-wr0-x243.google.com with SMTP id k32so1972326wrk.4
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:40:27 -0800 (PST)
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

VGhlIFhlbiBjb3JlL2FyY2ggY29kZSByZWxpZXMgb24gdHdvIGFic3RyYWN0ZWQgZnVuY3Rpb25z
IHRvIGluamVjdCBhbgpldmVudCBjaGFubmVsIElSUSBhbmQgdG8gcXVlcnkgaXRzIHBlbmRpbmcg
c3RhdGUuCkltcGxlbWVudCB0aG9zZSB0byBxdWVyeSB0aGUgc3RhdGUgb2YgdGhlIG5ldyBWR0lD
IGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGxpbmFyby5vcmc+Ci0tLQogeGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIHwgMjAgKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdp
Yy5jCmluZGV4IDhkNTI2MGE3ZGIuLmI2MmNkYTdkMmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS92Z2ljL3ZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKQEAgLTY5Myw2ICs2
OTMsMjYgQEAgdm9pZCB2Z2ljX2tpY2tfdmNwdXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICB9CiB9
CiAKK3ZvaWQgYXJjaF9ldnRjaG5faW5qZWN0KHN0cnVjdCB2Y3B1ICp2KQoreworICAgIHZnaWNf
aW5qZWN0X2lycSh2LT5kb21haW4sIHYsIHYtPmRvbWFpbi0+YXJjaC5ldnRjaG5faXJxLCB0cnVl
KTsKK30KKworYm9vbCB2Z2ljX2V2dGNobl9pcnFfcGVuZGluZyhzdHJ1Y3QgdmNwdSAqdikKK3sK
KyAgICBzdHJ1Y3QgdmdpY19pcnEgKmlycTsKKyAgICBib29sIHBlbmRpbmc7CisKKyAgICAvKiBE
b2VzIG5vdCB3b3JrIGZvciBMUElzLiAqLworICAgIEFTU0VSVCghaXNfbHBpKHYtPmRvbWFpbi0+
YXJjaC5ldnRjaG5faXJxKSk7CisKKyAgICBpcnEgPSB2Z2ljX2dldF9pcnEodi0+ZG9tYWluLCB2
LCB2LT5kb21haW4tPmFyY2guZXZ0Y2huX2lycSk7CisgICAgcGVuZGluZyA9IGlycV9pc19wZW5k
aW5nKGlycSk7CisgICAgdmdpY19wdXRfaXJxKHYtPmRvbWFpbiwgaXJxKTsKKworICAgIHJldHVy
biBwZW5kaW5nOworfQorCiBzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNfZ2V0X2h3X2lycV9kZXNjKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdmlycSkKIHsKLS0gCjIuMTQuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
