From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v2 7/7] add sleep,
 msleep and NOW() macros to time manager
Date: Sun,  8 Apr 2018 15:15:59 +0200
Message-ID: <20180408131559.6840-7-semelpaul@gmail.com>
References: <20180408131559.6840-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aspc=g5=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f59nx-0001SP-FG
 for xen-devel@lists.xenproject.org; Sun, 08 Apr 2018 12:52:21 +0000
Received: by mail-wm0-x243.google.com with SMTP id r131so10709521wmb.2
 for <xen-devel@lists.xenproject.org>; Sun, 08 Apr 2018 05:52:20 -0700 (PDT)
In-Reply-To: <20180408131559.6840-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de, Paul Semel <phentex@amazon.de>, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+CgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4KLS0tCiBjb21tb24vdGltZS5jICAgICAgfCAxMCAr
KysrKysrKysrCiBpbmNsdWRlL3h0Zi90aW1lLmggfCAxMiArKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1lLmMgYi9j
b21tb24vdGltZS5jCmluZGV4IGY3NTk3OWEuLjI0NmEyZGQgMTAwNjQ0Ci0tLSBhL2NvbW1vbi90
aW1lLmMKKysrIGIvY29tbW9uL3RpbWUuYwpAQCAtMTMxLDYgKzEzMSwxNiBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgbXNwaW5fc2xlZXAodWludDY0X3QgdCkKICAgICBuc3Bpbl9zbGVlcChuc2VjKTsK
IH0KIAordm9pZCBzbGVlcCh1aW50NjRfdCB0KQoreworICAgIHNwaW5fc2xlZXAodCk7Cit9CisK
K3ZvaWQgbXNsZWVwKHVpbnQ2NF90IHQpCit7CisgICAgbXNwaW5fc2xlZXAodCk7Cit9CisKIC8q
CiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRpZmYgLS1naXQgYS9pbmNsdWRlL3h0
Zi90aW1lLmggYi9pbmNsdWRlL3h0Zi90aW1lLmgKaW5kZXggMmZmOGY0Mi4uOTdmM2I1YiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS94dGYvdGltZS5oCisrKyBiL2luY2x1ZGUveHRmL3RpbWUuaApAQCAt
MjUsOCArMjUsMjAgQEAgdWludDY0X3Qgc2luY2VfYm9vdF90aW1lKHZvaWQpOwogCiB1aW50NjRf
dCBjdXJyZW50X3RpbWUodm9pZCk7CiAKKy8qIFRoaXMgZnVuY3Rpb24gdGFrZXMgc2Vjb25kcyBp
biBwYXJhbWV0ZXIgKi8KK3ZvaWQgc2xlZXAodWludDY0X3QgZik7CisKKy8qIEJlIGNhcmVmdWws
IHRoaXMgZnVuY3Rpb24gdGFrZXMgbWlsbGlzZWNvbmRzIGluIHBhcmFtZXRlciwKKyAqIG5vdCBt
aWNyb3NlY29uZHMgIQorICovCit2b2lkIG1zbGVlcCh1aW50NjRfdCBmKTsKKwogaW50IGdldHRp
bWVvZmRheShzdHJ1Y3QgdGltZXZhbCAqdHApOwogCisKKy8qIFRoaXMgcmV0dXJucyB0aGUgY3Vy
cmVudCBlcG9jaCB0aW1lICovCisjZGVmaW5lIE5PVygpIGN1cnJlbnRfdGltZSgpCisKICNlbmRp
ZiAvKiBYVEZfVElNRV9IICovCiAKIC8qCi0tIAoyLjE2LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
