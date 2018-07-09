From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 2/4] automation: install some packages for
 CentOS from EPEL
Date: Mon, 9 Jul 2018 16:32:14 +0100
Message-ID: <20180709153216.15892-3-wei.liu2@citrix.com>
References: <20180709153216.15892-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pzs8=jz=citrix.com=prvs=72153cbb0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcY9F-0005Ud-BU
 for xen-devel@lists.xenproject.org; Mon, 09 Jul 2018 15:32:21 +0000
In-Reply-To: <20180709153216.15892-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSBhcmUgbmVlZGVkIHRvIGJ1aWxkIHRvb2xzLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL2J1aWxkL2NlbnRvcy83LjIuZG9j
a2VyZmlsZSB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvYXV0b21hdGlvbi9idWlsZC9jZW50b3MvNy4yLmRvY2tlcmZpbGUgYi9hdXRvbWF0
aW9uL2J1aWxkL2NlbnRvcy83LjIuZG9ja2VyZmlsZQppbmRleCAzNGVhYzlhYmQ0Li5mNDZhNWUz
ZjJiIDEwMDY0NAotLS0gYS9hdXRvbWF0aW9uL2J1aWxkL2NlbnRvcy83LjIuZG9ja2VyZmlsZQor
KysgYi9hdXRvbWF0aW9uL2J1aWxkL2NlbnRvcy83LjIuZG9ja2VyZmlsZQpAQCAtNiw2ICs2LDkg
QEAgTEFCRUwgbWFpbnRhaW5lci5uYW1lPSJUaGUgWGVuIFByb2plY3QiIFwKICMgdGhlIHZlcnNp
b24gd2Ugd2FudAogQ09QWSBDZW50T1MtNy4yLnJlcG8gL2V0Yy95dW0ucmVwb3MuZC9DZW50T1Mt
QmFzZS5yZXBvCiAKKyMgaW5zdGFsbCBFUEVMIGZvciBkZXY4NiwgeHotZGV2ZWwgYW5kIHBvc3Np
Ymx5IG90aGVyIHBhY2thZ2VzCitSVU4geXVtIC15IGluc3RhbGwgaHR0cHM6Ly9kbC5mZWRvcmFw
cm9qZWN0Lm9yZy9wdWIvZXBlbC9lcGVsLXJlbGVhc2UtbGF0ZXN0LTcubm9hcmNoLnJwbQorCiBS
VU4gbWtkaXIgL2J1aWxkCiBXT1JLRElSIC9idWlsZAogCkBAIC00MCw0ICs0Myw3IEBAIFJVTiBy
cG0gLS1yZWJ1aWxkZGIgJiYgXAogICAgICAgICBwYXRjaCBcCiAgICAgICAgIGNoZWNrcG9saWN5
IFwKICAgICAgICAgdGV4aW5mbyBcCisgICAgICAgIGRldjg2IFwKKyAgICAgICAgeHotZGV2ZWwg
XAorICAgICAgICBiemlwMiBcCiAgICAgJiYgeXVtIGNsZWFuIGFsbAotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
