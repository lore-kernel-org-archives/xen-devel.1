Return-Path: <SRS0=neah=WM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0792EC3A59D
	for <xen-devel@archiver.kernel.org>; Fri, 16 Aug 2019 13:00:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB612133F
	for <xen-devel@archiver.kernel.org>; Fri, 16 Aug 2019 13:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mf7gDq06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB612133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqR-0006ut-3c; Fri, 16 Aug 2019 13:00:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqQ-0006uS-AL
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:38 +0000
X-Inumbo-ID: d77b3d9e-c025-11e9-b90c-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d77b3d9e-c025-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XzVGQCPIzP80hj29yoKKmiRzbXskwbhBNL+qS7AZZRY=; b=mf7gDq063PtFs4Y2UUMW6zn16Z
 IpWo4iN85xzGULcHErn1+SNZUGQcbVSJz/8EWhnco/HGvOgLl9st+edt2gU7arYKR0RQLpwVkZHqv
 FB+Jz93Im1HBlYTwFfLpmGL1kcRXOH+tCyqRamRmxDS2A8AI6yTC3pvv80eSh5P+U6wtIHz9npXfl
 ww9Q9L+Oa3szn8PiiiTt/Gy5ndO6qZyb3U+i21v/ZksgqOLuIM4q4b1Kck6gdhfHq2tWbNQ5lCjiM
 v9NiWLjgTFEt0FJ67PJ5lmfbqwVGEt4W3SJZfELoY0iUlioztIjUW15b5gcwShqQaHcqHtgrg0Ms4
 014UhbFA==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqM-0006Qu-UP; Fri, 16 Aug 2019 13:00:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:07 +0200
Message-Id: <20190816130013.31154-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 05/11] xen: remove the exports for xen_{create,
 destroy}_contiguous_region
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2Ugcm91dGluZXMgYXJlIG9ubHkgdXNlZCBieSBzd2lvdGxiLXhlbiwgd2hpY2ggY2Fubm90
IGJlIG1vZHVsYXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBhcmNoL2FybS94ZW4vbW0uYyAgICAgfCAyIC0tCiBhcmNoL3g4Ni94ZW4vbW11X3B2
LmMgfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwppbmRleCAzODhhNDUwMDJiYWQu
LmE1OTk4MGYxYWE1NCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0veGVuL21tLmMKKysrIGIvYXJjaC9h
cm0veGVuL21tLmMKQEAgLTE3NSwxMyArMTc1LDExIEBAIGludCB4ZW5fY3JlYXRlX2NvbnRpZ3Vv
dXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAogCSpkbWFf
aGFuZGxlID0gcHN0YXJ0OwogCXJldHVybiAwOwogfQotRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2Ny
ZWF0ZV9jb250aWd1b3VzX3JlZ2lvbik7CiAKIHZvaWQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19y
ZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIpCiB7CiAJcmV0dXJu
OwogfQotRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24pOwog
CiBpbnQgX19pbml0IHhlbl9tbV9pbml0KHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94
ZW4vbW11X3B2LmMgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKaW5kZXggMjZlOGIzMjY5NjZkLi5j
OGRiZWU2MmVjMmEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYworKysgYi9hcmNo
L3g4Ni94ZW4vbW11X3B2LmMKQEAgLTI2MjUsNyArMjYyNSw2IEBAIGludCB4ZW5fY3JlYXRlX2Nv
bnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAog
CSpkbWFfaGFuZGxlID0gdmlydF90b19tYWNoaW5lKHZzdGFydCkubWFkZHI7CiAJcmV0dXJuIHN1
Y2Nlc3MgPyAwIDogLUVOT01FTTsKIH0KLUVYUE9SVF9TWU1CT0xfR1BMKHhlbl9jcmVhdGVfY29u
dGlndW91c19yZWdpb24pOwogCiB2b2lkIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBo
eXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyKQogewpAQCAtMjY2MCw3ICsyNjU5
LDYgQEAgdm9pZCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3Rh
cnQsIHVuc2lnbmVkIGludCBvcmRlcikKIAogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnhlbl9y
ZXNlcnZhdGlvbl9sb2NrLCBmbGFncyk7CiB9Ci1FWFBPUlRfU1lNQk9MX0dQTCh4ZW5fZGVzdHJv
eV9jb250aWd1b3VzX3JlZ2lvbik7CiAKIHN0YXRpYyBub2lubGluZSB2b2lkIHhlbl9mbHVzaF90
bGJfYWxsKHZvaWQpCiB7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
