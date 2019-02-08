From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH net-next] xen-netback: mark expected switch
 fall-through
Date: Fri, 8 Feb 2019 13:58:38 -0600
Message-ID: <20190208195838.GA11878__30257.8359887534$1549655988$gmane$org@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdwH=QP=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gsCIR-00080l-G6
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 19:58:47 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 8A261345C8
 for <xen-devel@lists.xenproject.org>; Fri,  8 Feb 2019 13:58:42 -0600 (CST)
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

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpXYXJu
aW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MwoKVGhpcyBwYXRj
aCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxpbmcKLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaC4KClNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9A
ZW1iZWRkZWRvci5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYyBiL2RyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL3hlbmJ1cy5jCmluZGV4IDI2MjU3NDBiZGM0YS4uMzMwZGRiNjQ5MzBmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYworKysgYi9kcml2ZXJzL25l
dC94ZW4tbmV0YmFjay94ZW5idXMuYwpAQCAtNjU1LDcgKzY1NSw3IEBAIHN0YXRpYyB2b2lkIGZy
b250ZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAkJc2V0X2JhY2tlbmRf
c3RhdGUoYmUsIFhlbmJ1c1N0YXRlQ2xvc2VkKTsKIAkJaWYgKHhlbmJ1c19kZXZfaXNfb25saW5l
KGRldikpCiAJCQlicmVhazsKLQkJLyogZmFsbCB0aHJvdWdoIGlmIG5vdCBvbmxpbmUgKi8KKwkJ
LyogZmFsbCB0aHJvdWdoIC0gaWYgbm90IG9ubGluZSAqLwogCWNhc2UgWGVuYnVzU3RhdGVVbmtu
b3duOgogCQlzZXRfYmFja2VuZF9zdGF0ZShiZSwgWGVuYnVzU3RhdGVDbG9zZWQpOwogCQlkZXZp
Y2VfdW5yZWdpc3RlcigmZGV2LT5kZXYpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
