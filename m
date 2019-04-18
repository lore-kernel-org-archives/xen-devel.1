From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/21] selecthost: Honour new $none_ok
 optional parameter
Date: Thu, 18 Apr 2019 17:31:39 +0100
Message-ID: <20190418163158.11408-3-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xG-0001z1-HH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:06 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2Ugd2l0aCBleGlzdGluZyBjYWxsZXJzLgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbSB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQu
cG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGVjODY3ZTRmLi4zOGMxN2Q2MCAxMDA2
NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtCkBAIC0xMTI1LDkgKzExMjUsOSBAQCBzdWIgcG93ZXJfc3RhdGUgKCQkOyQpIHsKIAogIy0t
LS0tLS0tLS0gaG9zdCBzZWxlY3Rpb24gYW5kIHByb3BlcnRpZXMgLS0tLS0tLS0tLQogCi1zdWIg
c2VsZWN0aG9zdCAoJCk7Ci1zdWIgc2VsZWN0aG9zdCAoJCkgewotICAgIG15ICgkaWRlbnQpID0g
QF87CitzdWIgc2VsZWN0aG9zdCAoJDskKTsKK3N1YiBzZWxlY3Rob3N0ICgkOyQpIHsKKyAgICBt
eSAoJGlkZW50LCAkbm9uZV9vaykgPSBAXzsKICAgICAjIG11c3QgYmUgcnVuIG91dHNpZGUgdHJh
bnNhY3Rpb24KIAogICAgICMgJGlkZW50IGlzIDxpZGVudHNwZWM+CkBAIC0xMTU0LDcgKzExNTQs
MTAgQEAgc3ViIHNlbGVjdGhvc3QgKCQpIHsKICAgICAgICAgJHJ7JGlkZW50fT0gJG5hbWU7CiAg
ICAgfSBlbHNlIHsKICAgICAgICAgJG5hbWU9ICRyeyRpZGVudH07Ci0gICAgICAgIGRpZSAibm8g
c3BlY2lmaWVkICRpZGVudCIgdW5sZXNzIGRlZmluZWQgJG5hbWU7CisJaWYgKCFkZWZpbmVkICRu
YW1lKSB7CisJICAgIHJldHVybiB1bmRlZiBpZiAkbm9uZV9vazsKKwkgICAgZGllICJubyBzcGVj
aWZpZWQgJGlkZW50IjsKKwl9CiAgICAgfQogCiAgICAgbXkgJGhvPSB7Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
