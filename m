Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFDCC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6163D21841
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ssqlzStP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6163D21841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEU0j-0004rx-8H; Thu, 11 Apr 2019 07:20:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9Ko=SN=bombadil.srs.infradead.org=batv+ae372c7294e1f5d16f45+5709+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hEU0h-0004r9-DQ
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:20:35 +0000
X-Inumbo-ID: 4b6f683a-5c2a-11e9-92d7-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b6f683a-5c2a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A/NEr2biDwgkhdYdNyvQFqlbV9vo3JFPIHcjRjIbiYY=; b=ssqlzStP+dXATSWv4MBC85tba7
 PXzq3I4BLkvOBrtXp9Knaq2Ki386NyR6OvYI0fajqvA/9GiVU4jw8Py/eJSez2gIg/d9xqe9QNS6u
 2AhQFH0GZERRIVA9XoVQ1IQWubq+oeBqiySoEnot8IzDKK3c2xCLxn4OhU1aRi8J38KVi4C6IwuTK
 4Bf84rH3ANzLtS/yf6wcBMxwu73Kt94cgf5jOaalXl0MMutkTOkJhw+qUMi2yOuuarLt2FipR/2NB
 Hj8Aj7YOnwrEmqBmnIan3y+N1JKua/l0bWLB3AuuWBODKZg1iukzZe9NgL08HOVE0DaA6yLJ1qL+I
 dcR0CihQ==;
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEU0Z-0002it-J7; Thu, 11 Apr 2019 07:20:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 11 Apr 2019 09:19:58 +0200
Message-Id: <20190411072000.4306-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411072000.4306-1-hch@lst.de>
References: <20190411072000.4306-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 2/4] swiotlb-xen: use ->map_page to implement
 ->map_sg
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

V2UgY2FuIHNpbXBseSBsb29wIG92ZXIgdGhlIHNlZ21lbnRzIGFuZCBtYXAgdGhlbSwgcmVtb3Zp
bmcgbG90cyBvZgpkdXBsaWNhdGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCA2OCArKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwppbmRleCBkNGJjM2FhYmQ0
NGQuLjk3YTU1YzIyNTU5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwor
KysgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC01MTcsMjQgKzUxNyw4IEBAIHhlbl9z
d2lvdGxiX3VubWFwX3NnKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3Qg
KnNnbCwgaW50IG5lbGVtcywKIAogfQogCi0vKgotICogTWFwIGEgc2V0IG9mIGJ1ZmZlcnMgZGVz
Y3JpYmVkIGJ5IHNjYXR0ZXJsaXN0IGluIHN0cmVhbWluZyBtb2RlIGZvciBETUEuCi0gKiBUaGlz
IGlzIHRoZSBzY2F0dGVyLWdhdGhlciB2ZXJzaW9uIG9mIHRoZSBhYm92ZSB4ZW5fc3dpb3RsYl9t
YXBfcGFnZQotICogaW50ZXJmYWNlLiAgSGVyZSB0aGUgc2NhdHRlciBnYXRoZXIgbGlzdCBlbGVt
ZW50cyBhcmUgZWFjaCB0YWdnZWQgd2l0aCB0aGUKLSAqIGFwcHJvcHJpYXRlIGRtYSBhZGRyZXNz
IGFuZCBsZW5ndGguICBUaGV5IGFyZSBvYnRhaW5lZCB2aWEKLSAqIHNnX2RtYV97YWRkcmVzcyxs
ZW5ndGh9KFNHKS4KLSAqCi0gKiBOT1RFOiBBbiBpbXBsZW1lbnRhdGlvbiBtYXkgYmUgYWJsZSB0
byB1c2UgYSBzbWFsbGVyIG51bWJlciBvZgotICogICAgICAgRE1BIGFkZHJlc3MvbGVuZ3RoIHBh
aXJzIHRoYW4gdGhlcmUgYXJlIFNHIHRhYmxlIGVsZW1lbnRzLgotICogICAgICAgKGZvciBleGFt
cGxlIHZpYSB2aXJ0dWFsIG1hcHBpbmcgY2FwYWJpbGl0aWVzKQotICogICAgICAgVGhlIHJvdXRp
bmUgcmV0dXJucyB0aGUgbnVtYmVyIG9mIGFkZHIvbGVuZ3RoIHBhaXJzIGFjdHVhbGx5Ci0gKiAg
ICAgICB1c2VkLCBhdCBtb3N0IG5lbnRzLgotICoKLSAqIERldmljZSBvd25lcnNoaXAgaXNzdWVz
IGFzIG1lbnRpb25lZCBhYm92ZSBmb3IgeGVuX3N3aW90bGJfbWFwX3BhZ2UgYXJlIHRoZQotICog
c2FtZSBoZXJlLgotICovCiBzdGF0aWMgaW50Ci14ZW5fc3dpb3RsYl9tYXBfc2coc3RydWN0IGRl
dmljZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLCBpbnQgbmVsZW1zLAoreGVuX3N3
aW90bGJfbWFwX3NnKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2ws
IGludCBuZWxlbXMsCiAJCWVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwgdW5zaWduZWQgbG9u
ZyBhdHRycykKIHsKIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwpAQCAtNTQzLDUwICs1MjcsMTgg
QEAgeGVuX3N3aW90bGJfbWFwX3NnKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRl
cmxpc3QgKnNnbCwgaW50IG5lbGVtcywKIAlCVUdfT04oZGlyID09IERNQV9OT05FKTsKIAogCWZv
cl9lYWNoX3NnKHNnbCwgc2csIG5lbGVtcywgaSkgewotCQlwaHlzX2FkZHJfdCBwYWRkciA9IHNn
X3BoeXMoc2cpOwotCQlkbWFfYWRkcl90IGRldl9hZGRyID0geGVuX3BoeXNfdG9fYnVzKHBhZGRy
KTsKLQotCQlpZiAoc3dpb3RsYl9mb3JjZSA9PSBTV0lPVExCX0ZPUkNFIHx8Ci0JCSAgICB4ZW5f
YXJjaF9uZWVkX3N3aW90bGIoaHdkZXYsIHBhZGRyLCBkZXZfYWRkcikgfHwKLQkJICAgICFkbWFf
Y2FwYWJsZShod2RldiwgZGV2X2FkZHIsIHNnLT5sZW5ndGgpIHx8Ci0JCSAgICByYW5nZV9zdHJh
ZGRsZXNfcGFnZV9ib3VuZGFyeShwYWRkciwgc2ctPmxlbmd0aCkpIHsKLQkJCXBoeXNfYWRkcl90
IG1hcCA9IHN3aW90bGJfdGJsX21hcF9zaW5nbGUoaHdkZXYsCi0JCQkJCQkJCSBzdGFydF9kbWFf
YWRkciwKLQkJCQkJCQkJIHNnX3BoeXMoc2cpLAotCQkJCQkJCQkgc2ctPmxlbmd0aCwKLQkJCQkJ
CQkJIGRpciwgYXR0cnMpOwotCQkJaWYgKG1hcCA9PSBETUFfTUFQUElOR19FUlJPUikgewotCQkJ
CWRldl93YXJuKGh3ZGV2LCAic3dpb3RsYiBidWZmZXIgaXMgZnVsbFxuIik7Ci0JCQkJLyogRG9u
J3QgcGFuaWMgaGVyZSwgd2UgZXhwZWN0IG1hcF9zZyB1c2VycwotCQkJCSAgIHRvIGRvIHByb3Bl
ciBlcnJvciBoYW5kbGluZy4gKi8KLQkJCQlhdHRycyB8PSBETUFfQVRUUl9TS0lQX0NQVV9TWU5D
OwotCQkJCXhlbl9zd2lvdGxiX3VubWFwX3NnKGh3ZGV2LCBzZ2wsIGksIGRpciwgYXR0cnMpOwot
CQkJCXNnX2RtYV9sZW4oc2dsKSA9IDA7Ci0JCQkJcmV0dXJuIDA7Ci0JCQl9Ci0JCQlkZXZfYWRk
ciA9IHhlbl9waHlzX3RvX2J1cyhtYXApOwotCQkJeGVuX2RtYV9tYXBfcGFnZShod2RldiwgcGZu
X3RvX3BhZ2UobWFwID4+IFBBR0VfU0hJRlQpLAotCQkJCQkJZGV2X2FkZHIsCi0JCQkJCQltYXAg
JiB+UEFHRV9NQVNLLAotCQkJCQkJc2ctPmxlbmd0aCwKLQkJCQkJCWRpciwKLQkJCQkJCWF0dHJz
KTsKLQkJCXNnLT5kbWFfYWRkcmVzcyA9IGRldl9hZGRyOwotCQl9IGVsc2UgewotCQkJLyogd2Ug
YXJlIG5vdCBpbnRlcmVzdGVkIGluIHRoZSBkbWFfYWRkciByZXR1cm5lZCBieQotCQkJICogeGVu
X2RtYV9tYXBfcGFnZSwgb25seSBpbiB0aGUgcG90ZW50aWFsIGNhY2hlIGZsdXNoZXMgZXhlY3V0
ZWQKLQkJCSAqIGJ5IHRoZSBmdW5jdGlvbi4gKi8KLQkJCXhlbl9kbWFfbWFwX3BhZ2UoaHdkZXYs
IHBmbl90b19wYWdlKHBhZGRyID4+IFBBR0VfU0hJRlQpLAotCQkJCQkJZGV2X2FkZHIsCi0JCQkJ
CQlwYWRkciAmIH5QQUdFX01BU0ssCi0JCQkJCQlzZy0+bGVuZ3RoLAotCQkJCQkJZGlyLAotCQkJ
CQkJYXR0cnMpOwotCQkJc2ctPmRtYV9hZGRyZXNzID0gZGV2X2FkZHI7Ci0JCX0KKwkJc2ctPmRt
YV9hZGRyZXNzID0geGVuX3N3aW90bGJfbWFwX3BhZ2UoZGV2LCBzZ19wYWdlKHNnKSwKKwkJCQlz
Zy0+b2Zmc2V0LCBzZy0+bGVuZ3RoLCBkaXIsIGF0dHJzKTsKKwkJaWYgKHNnLT5kbWFfYWRkcmVz
cyA9PSBETUFfTUFQUElOR19FUlJPUikKKwkJCWdvdG8gb3V0X3VubWFwOwogCQlzZ19kbWFfbGVu
KHNnKSA9IHNnLT5sZW5ndGg7CiAJfQorCiAJcmV0dXJuIG5lbGVtczsKK291dF91bm1hcDoKKwl4
ZW5fc3dpb3RsYl91bm1hcF9zZyhkZXYsIHNnbCwgaSwgZGlyLCBhdHRycyB8IERNQV9BVFRSX1NL
SVBfQ1BVX1NZTkMpOworCXNnX2RtYV9sZW4oc2dsKSA9IDA7CisJcmV0dXJuIDA7CiB9CiAKIC8q
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
