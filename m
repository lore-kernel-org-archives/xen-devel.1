From: Josh Abraham <j.abraham1776@gmail.com>
Subject: [PATCH] xen: fix GCC warning and remove duplicate
 EVTCHN_ROW/EVTCHN_COL usage
Date: Wed, 12 Sep 2018 15:13:54 -1000
Message-ID: <20180913011354.GA19226__1255.49642039022$1536814964$gmane$org@josh-ThinkPad-T460s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ouki=l3=gmail.com=j.abraham1776@srs-us1.protection.inumbo.net>)
 id 1g0GCm-0004aL-SX
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 01:14:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id g2-v6so1811802plo.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 18:13:58 -0700 (PDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com
Cc: jgross@suse.com, j.abraham1776@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, aams@amazon.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCByZW1vdmVzIGR1cGxpY2F0ZSBtYWNybyB1c2VhZ2UgaW4gZXZlbnRzX2Jhc2Uu
Yy4KCkl0IGFsc28gZml4ZXMgZ2NjIHdhcm5pbmc6CnZhcmlhYmxlIOKAmGNvbOKAmSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogSm9z
aHVhIEFicmFoYW0gPGouYWJyYWhhbTE3NzZAZ21haWwuY29tPgotLS0KIGRyaXZlcnMveGVuL2V2
ZW50cy9ldmVudHNfYmFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19i
YXNlLmMgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwppbmRleCAwOGU0YWYwNGQ2
ZjIuLmU2YzE5MzQ3MzRiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19i
YXNlLmMKKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKQEAgLTEzOCw3ICsx
MzgsNyBAQCBzdGF0aWMgaW50IHNldF9ldnRjaG5fdG9faXJxKHVuc2lnbmVkIGV2dGNobiwgdW5z
aWduZWQgaXJxKQogCQljbGVhcl9ldnRjaG5fdG9faXJxX3Jvdyhyb3cpOwogCX0KIAotCWV2dGNo
bl90b19pcnFbRVZUQ0hOX1JPVyhldnRjaG4pXVtFVlRDSE5fQ09MKGV2dGNobildID0gaXJxOwor
CWV2dGNobl90b19pcnFbcm93XVtjb2xdID0gaXJxOwogCXJldHVybiAwOwogfQogCi0tIAoyLjE3
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
