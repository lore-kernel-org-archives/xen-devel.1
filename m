Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF22C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5CA2184B
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SfYBR7F6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5CA2184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEU0c-0004pg-M7; Thu, 11 Apr 2019 07:20:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9Ko=SN=bombadil.srs.infradead.org=batv+ae372c7294e1f5d16f45+5709+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hEU0a-0004pQ-Sf
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:20:29 +0000
X-Inumbo-ID: 480643a5-5c2a-11e9-92d7-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 480643a5-5c2a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cu64RjX653xuK5qqDGAabuS7Z+CzqQQ9YPkFZpxZb/M=; b=SfYBR7F6iaL+iT0Ftg60r/Pnii
 ali5asdjSmmyyFQWQLwgu+VD3z92XJJOcoXRmvUP4bs751yw7jJ5pKQbsKwDQa3KS8zuNBgBDxWRy
 OyHNpMesb10eDhjiw+rk4tEXHXT7CgjtpsUZJCT0KvWThZC2WB739uoVwjIFpXupgkFz6exWnQZ3h
 msOMoTFPu+KGm1sERBXAhpyY2T1R8aH1mAUIfGTsU10AAntmyVRcY45oAReT8g2EbpurmMmDyCgUv
 Eu6GKczhmlh9S4UgiCvSJS2kIwt0WjjjnrYsvR4RlaKy+neF/ltRJcU2+pN00tch6GspWsznnRCFf
 g18c3IIQ==;
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEU0X-0002ik-1h; Thu, 11 Apr 2019 07:20:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 11 Apr 2019 09:19:57 +0200
Message-Id: <20190411072000.4306-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411072000.4306-1-hch@lst.de>
References: <20190411072000.4306-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 1/4] swiotlb-xen: make instances match their
 method names
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

SnVzdCBkcm9wIHR3byBwb2ludGxlc3MgX2F0dHJzIHByZWZpeGVzIHRvIG1ha2UgdGhlIGNvZGUg
YSBsaXR0bGUKbW9yZSBncmVwLWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgMTcgKysrKysr
Ky0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hl
bi9zd2lvdGxiLXhlbi5jCmluZGV4IDg3N2JhZjJhOTRmNC4uZDRiYzNhYWJkNDRkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIt
eGVuLmMKQEAgLTUwNCw5ICs1MDQsOCBAQCB4ZW5fc3dpb3RsYl9zeW5jX3NpbmdsZV9mb3JfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGRldl9hZGRyLAogICogY29uY2Vy
bmluZyBjYWxscyBoZXJlIGFyZSB0aGUgc2FtZSBhcyBmb3Igc3dpb3RsYl91bm1hcF9wYWdlKCkg
YWJvdmUuCiAgKi8KIHN0YXRpYyB2b2lkCi14ZW5fc3dpb3RsYl91bm1hcF9zZ19hdHRycyhzdHJ1
Y3QgZGV2aWNlICpod2Rldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsCi0JCQkgICBpbnQgbmVs
ZW1zLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsCi0JCQkgICB1bnNpZ25lZCBsb25nIGF0
dHJzKQoreGVuX3N3aW90bGJfdW5tYXBfc2coc3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBz
Y2F0dGVybGlzdCAqc2dsLCBpbnQgbmVsZW1zLAorCQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCiB7CiAJc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKIAlp
bnQgaTsKQEAgLTUzNSw5ICs1MzQsOCBAQCB4ZW5fc3dpb3RsYl91bm1hcF9zZ19hdHRycyhzdHJ1
Y3QgZGV2aWNlICpod2Rldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsCiAgKiBzYW1lIGhlcmUu
CiAgKi8KIHN0YXRpYyBpbnQKLXhlbl9zd2lvdGxiX21hcF9zZ19hdHRycyhzdHJ1Y3QgZGV2aWNl
ICpod2Rldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsCi0JCQkgaW50IG5lbGVtcywgZW51bSBk
bWFfZGF0YV9kaXJlY3Rpb24gZGlyLAotCQkJIHVuc2lnbmVkIGxvbmcgYXR0cnMpCit4ZW5fc3dp
b3RsYl9tYXBfc2coc3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2ds
LCBpbnQgbmVsZW1zLAorCQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxv
bmcgYXR0cnMpCiB7CiAJc3RydWN0IHNjYXR0ZXJsaXN0ICpzZzsKIAlpbnQgaTsKQEAgLTU2Miw4
ICs1NjAsNyBAQCB4ZW5fc3dpb3RsYl9tYXBfc2dfYXR0cnMoc3RydWN0IGRldmljZSAqaHdkZXYs
IHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLAogCQkJCS8qIERvbid0IHBhbmljIGhlcmUsIHdlIGV4
cGVjdCBtYXBfc2cgdXNlcnMKIAkJCQkgICB0byBkbyBwcm9wZXIgZXJyb3IgaGFuZGxpbmcuICov
CiAJCQkJYXR0cnMgfD0gRE1BX0FUVFJfU0tJUF9DUFVfU1lOQzsKLQkJCQl4ZW5fc3dpb3RsYl91
bm1hcF9zZ19hdHRycyhod2Rldiwgc2dsLCBpLCBkaXIsCi0JCQkJCQkJICAgYXR0cnMpOworCQkJ
CXhlbl9zd2lvdGxiX3VubWFwX3NnKGh3ZGV2LCBzZ2wsIGksIGRpciwgYXR0cnMpOwogCQkJCXNn
X2RtYV9sZW4oc2dsKSA9IDA7CiAJCQkJcmV0dXJuIDA7CiAJCQl9CkBAIC02OTAsOCArNjg3LDgg
QEAgY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIHhlbl9zd2lvdGxiX2RtYV9vcHMgPSB7CiAJLnN5
bmNfc2luZ2xlX2Zvcl9kZXZpY2UgPSB4ZW5fc3dpb3RsYl9zeW5jX3NpbmdsZV9mb3JfZGV2aWNl
LAogCS5zeW5jX3NnX2Zvcl9jcHUgPSB4ZW5fc3dpb3RsYl9zeW5jX3NnX2Zvcl9jcHUsCiAJLnN5
bmNfc2dfZm9yX2RldmljZSA9IHhlbl9zd2lvdGxiX3N5bmNfc2dfZm9yX2RldmljZSwKLQkubWFw
X3NnID0geGVuX3N3aW90bGJfbWFwX3NnX2F0dHJzLAotCS51bm1hcF9zZyA9IHhlbl9zd2lvdGxi
X3VubWFwX3NnX2F0dHJzLAorCS5tYXBfc2cgPSB4ZW5fc3dpb3RsYl9tYXBfc2csCisJLnVubWFw
X3NnID0geGVuX3N3aW90bGJfdW5tYXBfc2csCiAJLm1hcF9wYWdlID0geGVuX3N3aW90bGJfbWFw
X3BhZ2UsCiAJLnVubWFwX3BhZ2UgPSB4ZW5fc3dpb3RsYl91bm1hcF9wYWdlLAogCS5kbWFfc3Vw
cG9ydGVkID0geGVuX3N3aW90bGJfZG1hX3N1cHBvcnRlZCwKLS0gCjIuMjAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
