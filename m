Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526B8C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2185321841
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZcVJqm0X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2185321841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEU0j-0004sF-KA; Thu, 11 Apr 2019 07:20:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9Ko=SN=bombadil.srs.infradead.org=batv+ae372c7294e1f5d16f45+5709+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hEU0i-0004ri-Rx
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:20:36 +0000
X-Inumbo-ID: 4c980f9a-5c2a-11e9-92d7-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c980f9a-5c2a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYiYFX3eg2WXGlXW6/DFT8QDPeE9y3XIAunmMPhB284=; b=ZcVJqm0XyJ4JVyOw5F4VMNXsm/
 aUoR7AgKq0nEFUzJ76b+nHGfI1rXEO5GFhTKGslPK8uPW8Z4Wxyss8XxSwezyvxfHoOLxXeaeniRf
 crvFcwtNGXf7xPT9UqILYYWP23ak4R9eeANbL3ZOeZb6fMr9zA9JeJVVt9iRTtTDV/6gz+zte8DOI
 jEEebY/FNTTJRkg6FLuOYDMb0ybKU1lnswIa0IY9IIhdmxN9pTX3+PKYqt0VWiqGLz35T5+nvDihl
 AY9aB3OcNgZFx8ucP/6e4OTUHQDALXwa7uz6YOmG5J2tGPmHuEaNrGEKevMdmMoGLJbQ0KhRc3RCU
 sxZZligQ==;
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEU0e-0002jU-K5; Thu, 11 Apr 2019 07:20:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 11 Apr 2019 09:20:00 +0200
Message-Id: <20190411072000.4306-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411072000.4306-1-hch@lst.de>
References: <20190411072000.4306-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 4/4] swiotlb-xen: ensure we have a single
 callsite for xen_dma_map_page
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVmYWN0b3IgdGhlIGNvZGUgYSBiaXQgdG8gbWFrZSBmdXJ0aGVyIGNoYW5nZXMgZWFzaWVyLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVy
cy94ZW4vc3dpb3RsYi14ZW4uYyB8IDMxICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14
ZW4uYwppbmRleCA5YTk1MTUwNGRjMTIuLjVkY2IwNmZlOTY2NyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC0z
OTEsMTMgKzM5MSw4IEBAIHN0YXRpYyBkbWFfYWRkcl90IHhlbl9zd2lvdGxiX21hcF9wYWdlKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCiAJaWYgKGRtYV9jYXBhYmxlKGRl
diwgZGV2X2FkZHIsIHNpemUpICYmCiAJICAgICFyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFy
eShwaHlzLCBzaXplKSAmJgogCQkheGVuX2FyY2hfbmVlZF9zd2lvdGxiKGRldiwgcGh5cywgZGV2
X2FkZHIpICYmCi0JCShzd2lvdGxiX2ZvcmNlICE9IFNXSU9UTEJfRk9SQ0UpKSB7Ci0JCS8qIHdl
IGFyZSBub3QgaW50ZXJlc3RlZCBpbiB0aGUgZG1hX2FkZHIgcmV0dXJuZWQgYnkKLQkJICogeGVu
X2RtYV9tYXBfcGFnZSwgb25seSBpbiB0aGUgcG90ZW50aWFsIGNhY2hlIGZsdXNoZXMgZXhlY3V0
ZWQKLQkJICogYnkgdGhlIGZ1bmN0aW9uLiAqLwotCQl4ZW5fZG1hX21hcF9wYWdlKGRldiwgcGFn
ZSwgZGV2X2FkZHIsIG9mZnNldCwgc2l6ZSwgZGlyLCBhdHRycyk7Ci0JCXJldHVybiBkZXZfYWRk
cjsKLQl9CisJCXN3aW90bGJfZm9yY2UgIT0gU1dJT1RMQl9GT1JDRSkKKwkJZ290byBkb25lOwog
CiAJLyoKIAkgKiBPaCB3ZWxsLCBoYXZlIHRvIGFsbG9jYXRlIGFuZCBtYXAgYSBib3VuY2UgYnVm
ZmVyLgpAQCAtNDEwLDE5ICs0MDUsMjUgQEAgc3RhdGljIGRtYV9hZGRyX3QgeGVuX3N3aW90bGJf
bWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIAkJcmV0dXJu
IERNQV9NQVBQSU5HX0VSUk9SOwogCiAJZGV2X2FkZHIgPSB4ZW5fcGh5c190b19idXMobWFwKTsK
LQl4ZW5fZG1hX21hcF9wYWdlKGRldiwgcGZuX3RvX3BhZ2UobWFwID4+IFBBR0VfU0hJRlQpLAot
CQkJCQlkZXZfYWRkciwgbWFwICYgflBBR0VfTUFTSywgc2l6ZSwgZGlyLCBhdHRycyk7CiAKIAkv
KgogCSAqIEVuc3VyZSB0aGF0IHRoZSBhZGRyZXNzIHJldHVybmVkIGlzIERNQSdibGUKIAkgKi8K
LQlpZiAoZG1hX2NhcGFibGUoZGV2LCBkZXZfYWRkciwgc2l6ZSkpCi0JCXJldHVybiBkZXZfYWRk
cjsKLQotCWF0dHJzIHw9IERNQV9BVFRSX1NLSVBfQ1BVX1NZTkM7Ci0Jc3dpb3RsYl90YmxfdW5t
YXBfc2luZ2xlKGRldiwgbWFwLCBzaXplLCBkaXIsIGF0dHJzKTsKKwlpZiAodW5saWtlbHkoIWRt
YV9jYXBhYmxlKGRldiwgZGV2X2FkZHIsIHNpemUpKSkgeworCQlzd2lvdGxiX3RibF91bm1hcF9z
aW5nbGUoZGV2LCBtYXAsIHNpemUsIGRpciwKKwkJCQlhdHRycyB8IERNQV9BVFRSX1NLSVBfQ1BV
X1NZTkMpOworCQlyZXR1cm4gRE1BX01BUFBJTkdfRVJST1I7CisJfQogCi0JcmV0dXJuIERNQV9N
QVBQSU5HX0VSUk9SOworCXBhZ2UgPSBwZm5fdG9fcGFnZShtYXAgPj4gUEFHRV9TSElGVCk7CisJ
b2Zmc2V0ID0gbWFwICYgflBBR0VfTUFTSzsKK2RvbmU6CisJLyoKKwkgKiB3ZSBhcmUgbm90IGlu
dGVyZXN0ZWQgaW4gdGhlIGRtYV9hZGRyIHJldHVybmVkIGJ5IHhlbl9kbWFfbWFwX3BhZ2UsCisJ
ICogb25seSBpbiB0aGUgcG90ZW50aWFsIGNhY2hlIGZsdXNoZXMgZXhlY3V0ZWQgYnkgdGhlIGZ1
bmN0aW9uLgorCSAqLworCXhlbl9kbWFfbWFwX3BhZ2UoZGV2LCBwYWdlLCBkZXZfYWRkciwgb2Zm
c2V0LCBzaXplLCBkaXIsIGF0dHJzKTsKKwlyZXR1cm4gZGV2X2FkZHI7CiB9CiAKIC8qCi0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
