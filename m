From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH net-next] xen-netback: use true and false for
 boolean values
Date: Wed, 1 Aug 2018 19:31:01 -0500
Message-ID: <20180802003101.GA19256__7924.50561789355$1533187688$gmane$org@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+i43=kr=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1fl1WE-0006Fq-Ql
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 00:31:06 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id E68CFE54992
 for <xen-devel@lists.xenproject.org>;
 Wed,  1 Aug 2018 19:31:04 -0500 (CDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "David S. Miller" <davem@davemloft.net>
Cc: xen-devel@lists.xenproject.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

UmV0dXJuIHN0YXRlbWVudHMgaW4gZnVuY3Rpb25zIHJldHVybmluZyBib29sIHNob3VsZCB1c2Ug
dHJ1ZSBvciBmYWxzZQppbnN0ZWFkIG9mIGFuIGludGVnZXIgdmFsdWUuCgpUaGlzIGlzc3VlIHdh
cyBkZXRlY3RlZCB3aXRoIHRoZSBoZWxwIG9mIENvY2NpbmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMv
bmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9uZXRiYWNrLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMKaW5k
ZXggYTI3ZGFhMi4uMzYyMWUwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
bmV0YmFjay5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYwpAQCAtMTYw
Myw5ICsxNjAzLDkgQEAgc3RhdGljIHZvaWQgeGVudmlmX2N0cmxfYWN0aW9uKHN0cnVjdCB4ZW52
aWYgKnZpZikKIHN0YXRpYyBib29sIHhlbnZpZl9jdHJsX3dvcmtfdG9kbyhzdHJ1Y3QgeGVudmlm
ICp2aWYpCiB7CiAJaWYgKGxpa2VseShSSU5HX0hBU19VTkNPTlNVTUVEX1JFUVVFU1RTKCZ2aWYt
PmN0cmwpKSkKLQkJcmV0dXJuIDE7CisJCXJldHVybiB0cnVlOwogCi0JcmV0dXJuIDA7CisJcmV0
dXJuIGZhbHNlOwogfQogCiBpcnFyZXR1cm5fdCB4ZW52aWZfY3RybF9pcnFfZm4oaW50IGlycSwg
dm9pZCAqZGF0YSkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
