From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 04/26] power: Osstest::PDU::*: reuse
 default new method where applicable
Date: Thu, 24 Jan 2019 18:45:51 +0000
Message-ID: <20190124184613.2720-5-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1C-0003fs-C1
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:26 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
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

VGhlc2UgdHdvIG1vZHVsZXMgYm90aCBoYWQgdGhlIHNhbWUgYG5ldycgYXMgYHVuc3VwcG9ydGVk
Jy4gIE5vdyB0aGF0CndlIGhhdmUgYHVzZSBwYXJlbnQnIHRoZXkgY2FuIGJlIHJlbW92ZWQuCgpT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiBPc3N0ZXN0L1BEVS9tYW51YWwucG0gfCA1IC0tLS0tCiBPc3N0ZXN0L1BEVS94ZW51c2UucG0g
fCA1IC0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L09zc3Rlc3QvUERVL21hbnVhbC5wbSBiL09zc3Rlc3QvUERVL21hbnVhbC5wbQppbmRleCA3OGYy
NGRiOS4uN2Y5NTViOTAgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvUERVL21hbnVhbC5wbQorKysgYi9P
c3N0ZXN0L1BEVS9tYW51YWwucG0KQEAgLTI3LDExICsyNyw2IEBAIHVzZSBwYXJlbnQgcXcoT3Nz
dGVzdDo6UERVOjp1bnN1cHBvcnRlZCk7CiAKIG91ciAkdHR5OwogCi1zdWIgbmV3IHsKLSAgICBt
eSAoJGNsYXNzLCAkaG8pID0gQF87Ci0gICAgcmV0dXJuIGJsZXNzIHsgSG9zdCA9PiAkaG8gfSwg
JGNsYXNzOwotfQotCiBzdWIgcGR1X3Bvd2VyX3N0YXRlIHsKICAgICBteSAoJG1vLCAkb24pID0g
QF87CiAgICAgbXkgJG9ub2ZmPSAkb24gPyAib24iIDogIm9mZiI7CmRpZmYgLS1naXQgYS9Pc3N0
ZXN0L1BEVS94ZW51c2UucG0gYi9Pc3N0ZXN0L1BEVS94ZW51c2UucG0KaW5kZXggMmNlMGRkMjIu
Ljk4MWI2Y2Q5IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1BEVS94ZW51c2UucG0KKysrIGIvT3NzdGVz
dC9QRFUveGVudXNlLnBtCkBAIC0yNiwxMSArMjYsNiBAQCB1c2UgSU86OkZpbGU7CiAKIHVzZSBw
YXJlbnQgcXcoT3NzdGVzdDo6UERVOjp1bnN1cHBvcnRlZCk7CiAKLXN1YiBuZXcgewotICAgIG15
ICgkY2xhc3MsICRobykgPSBAXzsKLSAgICByZXR1cm4gYmxlc3MgeyBIb3N0ID0+ICRobyB9LCAk
Y2xhc3M7Ci19Ci0KIHN1YiBwZHVfcG93ZXJfc3RhdGUgewogICAgIG15ICgkbW8sICRvbikgPSBA
XzsKICAgICBteSAkb25vZmY9ICRvbiA/ICJvbiIgOiAib2ZmIjsKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
