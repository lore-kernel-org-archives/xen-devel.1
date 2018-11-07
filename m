From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/3] automation: add two Arm64 builds to Gitlab
 CI
Date: Wed, 7 Nov 2018 12:31:48 +0000
Message-ID: <20181107123149.4751-3-wei.liu2@citrix.com>
References: <20181107123149.4751-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eq5n=ns=citrix.com=prvs=8424bdc41=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKN02-0004gA-Da
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 12:31:58 +0000
In-Reply-To: <20181107123149.4751-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIHR3byBnY2MgYnVpbGRzLiBDbGFuZyBidWlsZHMgYXJlIGtub3duIHRvIGJlIGJyb2tlbiBh
dCB0aGUgbW9tZW50LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KLS0tCiAuZ2l0bGFiLWNpLnltbCB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwg
Yi8uZ2l0bGFiLWNpLnltbAppbmRleCBiZjZiZjdkODk1Li5mMmRiNmRmYTUzIDEwMDY0NAotLS0g
YS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNpLnltbApAQCAtMjY5LDMgKzI2OSwyNSBA
QCB1YnVudHUteGVuaWFsLWdjYy1kZWJ1ZzoKICAgICBDT05UQUlORVI6IHVidW50dTp4ZW5pYWwK
ICAgICBkZWJ1ZzogeQogICAgIFhFTl9UQVJHRVRfQVJDSDogeDg2XzY0CisKKyMgQXJtIGJ1aWxk
cworCitkZWJpYW4tdW5zdGFibGUtZ2NjLWFybTY0OgorICA8PDogKmJ1aWxkCisgIHZhcmlhYmxl
czoKKyAgICA8PDogKmdjYworICAgIENPTlRBSU5FUjogZGViaWFuOnVuc3RhYmxlLWFybTY0djgK
KyAgICBkZWJ1ZzogbgorICAgIFhFTl9UQVJHRVRfQVJDSDogYXJtNjQKKyAgdGFnczoKKyAgICAt
IGFybTY0CisKK2RlYmlhbi11bnN0YWJsZS1nY2MtZGVidWctYXJtNjQ6CisgIDw8OiAqYnVpbGQK
KyAgdmFyaWFibGVzOgorICAgIDw8OiAqZ2NjCisgICAgQ09OVEFJTkVSOiBkZWJpYW46dW5zdGFi
bGUtYXJtNjR2OAorICAgIGRlYnVnOiB5CisgICAgWEVOX1RBUkdFVF9BUkNIOiBhcm02NAorICB0
YWdzOgorICAgIC0gYXJtNjQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
