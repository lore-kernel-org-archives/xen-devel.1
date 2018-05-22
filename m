From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 12/13] xen/arm: smccc: Fix indentation in
 ARM_SMCCC_ARCH_WORKAROUND_1_FID
Date: Tue, 22 May 2018 18:42:53 +0100
Message-ID: <20180522174254.27551-13-julien.grall@arm.com>
References: <20180522174254.27551-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m9vh=ij=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fLBJf-0002F0-Je
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 17:43:19 +0000
In-Reply-To: <20180522174254.27551-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vaW5jbHVkZS9hc20tYXJtL3NtY2NjLmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL3NtY2NjLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NtY2NjLmgKaW5kZXggYTY4MDRj
ZWM5OS4uNzRjMTNmODQxOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9zbWNjYy5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc21jY2MuaApAQCAtMjU0LDkgKzI1NCw5IEBAIHN0
cnVjdCBhcm1fc21jY2NfcmVzIHsKIAogI2RlZmluZSBBUk1fU01DQ0NfQVJDSF9XT1JLQVJPVU5E
XzFfRklEICAgICAgICAgICAgIFwKICAgICBBUk1fU01DQ0NfQ0FMTF9WQUwoQVJNX1NNQ0NDX0ZB
U1RfQ0FMTCwgICAgICAgICBcCi0gICAgICAgICAgICAgICAgICAgICAgQVJNX1NNQ0NDX0NPTlZf
MzIsICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgICAgICAgIEFSTV9TTUNDQ19PV05FUl9B
UkNILCAgICAgICAgIFwKLSAgICAgICAgICAgICAgICAgICAgICAweDgwMDApCisgICAgICAgICAg
ICAgICAgICAgICAgIEFSTV9TTUNDQ19DT05WXzMyLCAgICAgICAgICAgXAorICAgICAgICAgICAg
ICAgICAgICAgICBBUk1fU01DQ0NfT1dORVJfQVJDSCwgICAgICAgIFwKKyAgICAgICAgICAgICAg
ICAgICAgICAgMHg4MDAwKQogCiAjZGVmaW5lIEFSTV9TTUNDQ19BUkNIX1dPUktBUk9VTkRfMl9G
SUQgICAgICAgICAgICAgXAogICAgIEFSTV9TTUNDQ19DQUxMX1ZBTChBUk1fU01DQ0NfRkFTVF9D
QUxMLCAgICAgICAgIFwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
