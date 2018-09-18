From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 11/12] x86: add domain type flags for domain
 parameters
Date: Tue, 18 Sep 2018 08:03:08 +0200
Message-ID: <20180918060309.7186-12-jgross@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g29Au-0001hJ-Uj
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 06:07:52 +0000
In-Reply-To: <20180918060309.7186-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGZsYWdzIGZvciBleGNsdWRpbmcgcHYtIG9yIGh2bS1kb21haW5zIGZvciBkb21haW4gcGFy
YW1ldGVycy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgIHwgNSArKysrKwogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9kb21haW4uaCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYv
ZG9tYWluLmMKaW5kZXggOGU1N2U3YTE4MS4uNTU3ZWJkMWI4NyAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtMjEwOCw2ICsy
MTA4LDExIEBAIF9faW5pdGNhbGwoaW5pdF92Y3B1X2tpY2tfc29mdGlycSk7CiAKIGludCBhcmNo
X2RvbWFpbl9jaGVja19wYXJmbGFncyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgZmxh
Z3MpCiB7CisgICAgaWYgKCBmbGFncyAmIChpc19odm1fZG9tYWluKGQpID8gUEFSQU1fRkxBR19O
T0hWTQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IChpc19wdl8zMmJpdF9k
b21haW4oZCkgPworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQVJBTV9G
TEFHX05PUFYzMiA6IFBBUkFNX0ZMQUdfTk9QVjY0KSkgKQorICAgICAgICByZXR1cm4gLUVJTlZB
TDsKKwogICAgIHJldHVybiAwOwogfQogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2
L2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCA0ZGE0MzUzZGU3
Li41N2QxNWVkM2NmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKQEAgLTI4Niw2ICsyODYsMTIgQEAgc3Ry
dWN0IG1vbml0b3Jfd3JpdGVfZGF0YSB7CiAgICAgdWludDY0X3QgY3I0OwogfTsKIAorLyogRmxh
Z3MgZm9yIGV4Y2x1ZGluZyBkb21haW4gdHlwZXMgZnJvbSBwZXItZG9tYWluIHBhcmFtZXRlcnMu
ICovCisjZGVmaW5lIFBBUkFNX0ZMQUdfTk9IVk0gICAweDAwMDAwMDAxCisjZGVmaW5lIFBBUkFN
X0ZMQUdfTk9QVjMyICAweDAwMDAwMDAyCisjZGVmaW5lIFBBUkFNX0ZMQUdfTk9QVjY0ICAweDAw
MDAwMDA0CisjZGVmaW5lIFBBUkFNX0ZMQUdfTk9QViAgICAoUEFSQU1fRkxBR19OT1BWMzIgfCBQ
QVJBTV9GTEFHX05PUFY2NCkKKwogc3RydWN0IGFyY2hfZG9tYWluCiB7CiAgICAgc3RydWN0IHBh
Z2VfaW5mbyAqcGVyZG9tYWluX2wzX3BnOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
