From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 17/34] x86/vmce: enclose HVM load / save code in
 CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:35 +0100
Message-ID: <e41619b9a9373722c021aadfe22f6389f3eb61a5.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgg3-0001Tb-DX
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:39 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvY3B1L21jaGVjay92bWNlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svdm1jZS5jIGIveGVu
L2FyY2gveDg2L2NwdS9tY2hlY2svdm1jZS5jCmluZGV4IGUwN2NkMmYuLjQ2NzEyNWIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYworKysgYi94ZW4vYXJjaC94ODYv
Y3B1L21jaGVjay92bWNlLmMKQEAgLTM0OSw2ICszNDksNyBAQCBpbnQgdm1jZV93cm1zcih1aW50
MzJfdCBtc3IsIHVpbnQ2NF90IHZhbCkKICAgICByZXR1cm4gcmV0OwogfQogCisjaWYgQ09ORklH
X0hWTQogc3RhdGljIGludCB2bWNlX3NhdmVfdmNwdV9jdHh0KHN0cnVjdCBkb21haW4gKmQsIGh2
bV9kb21haW5fY29udGV4dF90ICpoKQogewogICAgIHN0cnVjdCB2Y3B1ICp2OwpAQCAtMzkyLDYg
KzM5Myw3IEBAIHN0YXRpYyBpbnQgdm1jZV9sb2FkX3ZjcHVfY3R4dChzdHJ1Y3QgZG9tYWluICpk
LCBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKIAogSFZNX1JFR0lTVEVSX1NBVkVfUkVTVE9SRShW
TUNFX1ZDUFUsIHZtY2Vfc2F2ZV92Y3B1X2N0eHQsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZtY2VfbG9hZF92Y3B1X2N0eHQsIDEsIEhWTVNSX1BFUl9WQ1BVKTsKKyNlbmRpZgogCiAvKgog
ICogZm9yIEludGVsIE1DRSwgYnJvYWRjYXN0IHZNQ0UgdG8gYWxsIHZjcHVzCi0tIApnaXQtc2Vy
aWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
