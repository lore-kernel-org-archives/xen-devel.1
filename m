From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/62] ts-xen-build-prep: only install
 w3c-dtd-xhtml for suites <stretch
Date: Wed, 10 Apr 2019 15:23:09 +0100
Message-ID: <20190410142408.22848-4-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEA9-0006BA-Na
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:17 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoYXQgcGFja2FnZSBpcyBub3Qg
aW5jbHVkZWQgaW4gc3RyZXRjaC4KClRoYXQgcGFja2FnZSB3YXMgaW5zdGFsbGVkIGJlY2F1c2Ug
dGhlIGxpYnZpcnQgYnVpbGQgbmVlZGVkIGl0LgpIb3dldmVyIGxpYnZpcnQgYnVpbGRzIGZpbmUg
d2l0aG91dCBpdCBpbiBzdHJldGNoLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgotLS0KIHRzLXhlbi1idWlsZC1wcmVwIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMteGVuLWJ1aWxk
LXByZXAgYi90cy14ZW4tYnVpbGQtcHJlcAppbmRleCAyM2JiYmViOS4uYTE1YWIzZGYgMTAwNzU1
Ci0tLSBhL3RzLXhlbi1idWlsZC1wcmVwCisrKyBiL3RzLXhlbi1idWlsZC1wcmVwCkBAIC0yMDYs
MTEgKzIwNiwxMyBAQCBzdWIgcHJlcCAoKSB7CiAgICAgICAgICAgICAgICAgICAgICAgbGliZ2xp
YjIuMC1kZXYgbGlibHptYS1kZXYgcGtnLWNvbmZpZwogICAgICAgICAgICAgICAgICAgICAgIGF1
dG9jb25mIGF1dG9tYWtlIGxpYnRvb2wgeHNsdHByb2MKICAgICAgICAgICAgICAgICAgICAgICBs
aWJ4bWwyLXV0aWxzIGxpYnhtbDItZGV2Ci0gICAgICAgICAgICAgICAgICAgICAgbGliZGV2bWFw
cGVyLWRldiB3M2MtZHRkLXhodG1sIGxpYnhtbC14cGF0aC1wZXJsCi0gICAgICAgICAgICAgICAg
ICAgICAgbGliZWxmLWRldgorICAgICAgICAgICAgICAgICAgICAgIGxpYmRldm1hcHBlci1kZXYg
bGlieG1sLXhwYXRoLXBlcmwgbGliZWxmLWRldgogICAgICAgICAgICAgICAgICAgICAgIGNjYWNo
ZSBuYXNtIGNoZWNrcG9saWN5IGVidGFibGVzCiAgICAgICAgICAgICAgICAgICAgICAgbGliZ251
dGxzMjgtZGV2KTsKIAorICAgIGlmICgkaG8tPntTdWl0ZX0gPX4gbS9zcXVlZXplfHdoZWV6eXxq
ZXNzaWUvKSB7CisJcHVzaChAcGFja2FnZXMsICJ3M2MtZHRkLXhodG1sIik7CisgICAgfQogICAg
IGlmICgkaG8tPntTdWl0ZX0gIX4gbS9zcXVlZXplfHdoZWV6eS8pIHsKIAlwdXNoKEBwYWNrYWdl
cywgcXcob2NhbWwtbm94IG9jYW1sLWZpbmRsaWIpKTsKICAgICB9Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
