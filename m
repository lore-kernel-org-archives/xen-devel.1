From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] libs/foreignmemory: Avoid printing an error for
 ENOTSUPP
Date: Mon, 13 Aug 2018 18:33:25 +0100
Message-ID: <20180813173325.14697-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zfh6=k4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fpGik-0005Ok-Kt
 for xen-devel@lists.xenproject.org; Mon, 13 Aug 2018 17:33:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, Julien Grall <julien.grall@arm.com>, paul.durrant@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

UmVzb3VyY2UgbWFwcGluZyBpcyBub3Qgc3VwcG9ydGVkIG9uIEFybSBhbmQgcmVzdWx0cyB0byBh
biBlcnJvciBtZXNzYWdlCmF0IGV2ZXJ5IGd1ZXN0IGJvb3Q6Cgp4ZW5mb3JlaWdubWVtb3J5OiBl
cnJvcjogaW9jdGwgZmFpbGVkOiBPcGVyYXRpb24gbm90IHN1cHBvcnRlZAoKSGlkZSB0aGUgZXJy
b3IgbWVzc2FnZSB3aGVuIGVycm5vciBpcyBFTk9UU1VQUC4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogdG9vbHMvbGlicy9mb3JlaWdubWVt
b3J5L2xpbnV4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkvbGludXguYyBi
L3Rvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9saW51eC5jCmluZGV4IGE2YjQxYjBiN2YuLjM2ODZj
ZjQxZTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9saW51eC5jCisrKyBi
L3Rvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9saW51eC5jCkBAIC0zMDcsNyArMzA3LDcgQEAgaW50
IG9zZGVwX3hlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlKAogICAgIHsKICAgICAgICAgaW50
IHNhdmVkX2Vycm5vOwogCi0gICAgICAgIGlmICggZXJybm8gIT0gRU5PVFRZICkKKyAgICAgICAg
aWYgKCBlcnJubyAhPSBFTk9UVFkgJiYgZXJybm8gIT0gRU9QTk9UU1VQUCApCiAgICAgICAgICAg
ICBQRVJST1IoImlvY3RsIGZhaWxlZCIpOwogICAgICAgICBlbHNlCiAgICAgICAgICAgICBlcnJu
byA9IEVPUE5PVFNVUFA7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
