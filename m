From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC 04/16] vgic: move irq_to_pending out of lock
Date: Wed, 28 Nov 2018 23:31:59 +0200
Message-ID: <1543440731-21947-5-git-send-email-andrii.anisov@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfkv=oh=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gS7RW-0008W4-E1
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 21:32:22 +0000
Received: by mail-lj1-x22a.google.com with SMTP id n18-v6so24811049lji.7
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 13:32:21 -0800 (PST)
In-Reply-To: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkZvciBHSUNWMiBw
ZW5kaW5nX2lycSBhbGxvY2F0aW9uIGlzIG5vdCBjb25jdXJyZW50LCBzbyByZWR1Y2UKc29tZSBj
b2RlIHVuZGVyIGxvY2suCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5p
c292QGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS92Z2ljLmMgfCA5ICsrKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMuYwppbmRleCBhNjQ2MzNm
Li4zNzg1N2IxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy5jCisrKyBiL3hlbi9hcmNo
L2FybS92Z2ljLmMKQEAgLTI2NywxNyArMjY3LDE2IEBAIGJvb2wgdmdpY19taWdyYXRlX2lycShz
dHJ1Y3QgdmNwdSAqb2xkLCBzdHJ1Y3QgdmNwdSAqbmV3LCB1bnNpZ25lZCBpbnQgaXJxKQogICAg
IEFTU0VSVCghaXNfbHBpKGlycSkpOwogI2VuZGlmCiAKLSAgICBzcGluX2xvY2tfaXJxc2F2ZSgm
b2xkLT5hcmNoLnZnaWMubG9jaywgZmxhZ3MpOwotCiAgICAgcCA9IGlycV90b19wZW5kaW5nKG9s
ZCwgaXJxKTsKIAogICAgIC8qIG5vdGhpbmcgdG8gZG8gZm9yIHZpcnR1YWwgaW50ZXJydXB0cyAq
LwogICAgIGlmICggcC0+ZGVzYyA9PSBOVUxMICkKICAgICB7Ci0gICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJm9sZC0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKTsKICAgICAgICAgcmV0dXJu
IHRydWU7CiAgICAgfQogCisgICAgc3Bpbl9sb2NrX2lycXNhdmUoJm9sZC0+YXJjaC52Z2ljLmxv
Y2ssIGZsYWdzKTsKKwogICAgIC8qIG1pZ3JhdGlvbiBhbHJlYWR5IGluIHByb2dyZXNzLCBubyBu
ZWVkIHRvIGRvIGFueXRoaW5nICovCiAgICAgaWYgKCB0ZXN0X2JpdChHSUNfSVJRX0dVRVNUX01J
R1JBVElORywgJnAtPnN0YXR1cykgKQogICAgIHsKQEAgLTU2OSw4ICs1NjgsNiBAQCB2b2lkIHZn
aWNfaW5qZWN0X2lycShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQg
aW50IHZpcnEsCiAgICAgICAgIHJldHVybjsKICAgICB9CiAKLSAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmdi0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKTsKLQogICAgIG4gPSBpcnFfdG9fcGVuZGluZyh2
LCB2aXJxKTsKICNpZmRlZiBDT05GSUdfR0lDVjMKICAgICAvKiBJZiBhbiBMUEkgaGFzIGJlZW4g
cmVtb3ZlZCwgdGhlcmUgaXMgbm90aGluZyB0byBpbmplY3QgaGVyZS4gKi8KQEAgLTU4MSw2ICs1
NzgsOCBAQCB2b2lkIHZnaWNfaW5qZWN0X2lycShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNw
dSAqdiwgdW5zaWduZWQgaW50IHZpcnEsCiAgICAgfQogI2VuZGlmCiAKKyAgICBzcGluX2xvY2tf
aXJxc2F2ZSgmdi0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKTsKKwogICAgIHNldF9iaXQoR0lDX0lS
UV9HVUVTVF9RVUVVRUQsICZuLT5zdGF0dXMpOwogCiAgICAgaWYgKCAhbGlzdF9lbXB0eSgmbi0+
aW5mbGlnaHQpICkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
