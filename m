From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 14/17] x86: don't report PV support when
 !CONFIG_PV
Date: Thu, 4 Oct 2018 16:43:33 +0100
Message-ID: <32712c07e513a33cfe2579f92f5bc124fb141853.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g861M-0007Jt-5k
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:58:36 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
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
aC94ODYvc2V0dXAuYyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5j
IGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggNmFjNWQzMi4uMjkzYzlhYSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE4
MjcsMTAgKzE4MjcsMTMgQEAgdm9pZCBhcmNoX2dldF94ZW5fY2Fwcyh4ZW5fY2FwYWJpbGl0aWVz
X2luZm9fdCAqaW5mbykKIAogICAgICgqaW5mbylbMF0gPSAnXDAnOwogCi0gICAgc25wcmludGYo
cywgc2l6ZW9mKHMpLCAieGVuLSVkLiVkLXg4Nl82NCAiLCBtYWpvciwgbWlub3IpOwotICAgIHNh
ZmVfc3RyY2F0KCppbmZvLCBzKTsKLSAgICBzbnByaW50ZihzLCBzaXplb2YocyksICJ4ZW4tJWQu
JWQteDg2XzMycCAiLCBtYWpvciwgbWlub3IpOwotICAgIHNhZmVfc3RyY2F0KCppbmZvLCBzKTsK
KyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1BWKSApCisgICAgeworICAgICAgICBzbnByaW50
ZihzLCBzaXplb2YocyksICJ4ZW4tJWQuJWQteDg2XzY0ICIsIG1ham9yLCBtaW5vcik7CisgICAg
ICAgIHNhZmVfc3RyY2F0KCppbmZvLCBzKTsKKyAgICAgICAgc25wcmludGYocywgc2l6ZW9mKHMp
LCAieGVuLSVkLiVkLXg4Nl8zMnAgIiwgbWFqb3IsIG1pbm9yKTsKKyAgICAgICAgc2FmZV9zdHJj
YXQoKmluZm8sIHMpOworICAgIH0KICAgICBpZiAoIGh2bV9lbmFibGVkICkKICAgICB7CiAgICAg
ICAgIHNucHJpbnRmKHMsIHNpemVvZihzKSwgImh2bS0lZC4lZC14ODZfMzIgIiwgbWFqb3IsIG1p
bm9yKTsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
