From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] get_maintainer: Improve patch recognition
Date: Wed, 29 May 2019 11:35:43 +0000
Message-ID: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QpgD=T5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hVws1-0001iT-8x
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:35:49 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, Joe Perches <joe@perches.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KCkZyb206IEpvZSBQZXJjaGVzIDxq
b2VAcGVyY2hlcy5jb20+CgpUaGVyZSBhcmUgbW9kZSBjaGFuZ2UgYW5kIHJlbmFtZSBvbmx5IHBh
dGNoZXMgdGhhdCBhcmUgdW5yZWNvZ25pemVkCmJ5IHRoZSBnZXRfbWFpbnRhaW5lci5wbCBzY3Jp
cHQuCgpSZWNvZ25pemUgdGhlbS4KClJlcG9ydGVkLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDx4
eXByb24uZ2xwa0BnbXguZGU+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgpTaWduZWQtb2Zm
LWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ci0tLQog
c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKaW5kZXggZDUy
OGRhNzM4Yy4uMTc0ZGZiN2U0MCAxMDA3NTUKLS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5w
bAorKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCkBAIC00NDUsNyArNDQ1LDE4IEBAIGZv
cmVhY2ggbXkgJGZpbGUgKEBBUkdWKSB7CiAKIAl3aGlsZSAoPCRwYXRjaD4pIHsKIAkgICAgbXkg
JHBhdGNoX2xpbmUgPSAkXzsKLQkgICAgaWYgKG0vXlwrXCtcK1xzKyhcUyspLyBvciBtL14tLS1c
cysoXFMrKS8pIHsKKwkgICAgaWYgKG0vXiBtb2RlIGNoYW5nZSBbMC03XSsgPT4gWzAtN10rIChc
UyspXHMqJC8pIHsKKwkJbXkgJGZpbGVuYW1lID0gJDE7CisJCXB1c2goQGZpbGVzLCAkZmlsZW5h
bWUpOworCSAgICB9IGVsc2lmIChtL15yZW5hbWUgKD86ZnJvbXx0bykgKFxTKylccyokLykgewor
CQlteSAkZmlsZW5hbWUgPSAkMTsKKwkJcHVzaChAZmlsZXMsICRmaWxlbmFtZSk7CisJICAgIH0g
ZWxzaWYgKG0vXmRpZmYgLS1naXQgYVwvKFxTKykgYlwvKFxTKylccyokLykgeworCQlteSAkZmls
ZW5hbWUxID0gJDE7CisJCW15ICRmaWxlbmFtZTIgPSAkMjsKKwkJcHVzaChAZmlsZXMsICRmaWxl
bmFtZTEpOworCQlwdXNoKEBmaWxlcywgJGZpbGVuYW1lMik7CisJICAgIH0gZWxzaWYgKG0vXlwr
XCtcK1xzKyhcUyspLyBvciBtL14tLS1ccysoXFMrKS8pIHsKIAkJbXkgJGZpbGVuYW1lID0gJDE7
CiAJCWlmICgkMSBuZSAiL2Rldi9udWxsIikgeyAjSWdub3JlIHRoZSBuby1maWxlIHBsYWNlaG9s
ZGVyCiAJCSAgICAkZmlsZW5hbWUgPX4gc0BeW14vXSovQEA7Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
