Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A2CC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 790642133D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 07:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EAmU8yLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 790642133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEU0c-0004pa-DA; Thu, 11 Apr 2019 07:20:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9Ko=SN=bombadil.srs.infradead.org=batv+ae372c7294e1f5d16f45+5709+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hEU0a-0004pR-Sf
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:20:29 +0000
X-Inumbo-ID: 4732a846-5c2a-11e9-92d7-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4732a846-5c2a-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 07:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9rgLBTobUlfyW0kUm7uO449bZqYFnsJPAG1/oEP8+gU=; b=EAmU8yLU7flnhOpuyBNS9HbTT
 0BCQvd1NuJKFCjYlXQ7yOGSORH+Gb9VO+5Ajn+IrbtdIvZlDXqNHQf5tyg3jzEraucGFKX4lUrqWV
 CJdjkenVhUYRoeZ2MKBTxmOTD0YYNxecUOYMPcPL1vJBaVFpKyEJsV0SAL4nH44v95caoby0LLk5U
 cSndaAImyZGIwHJN6h4dAQe1U7ryRRZeZoqKX19IduJVk5gGxptSPQjm1LYWT6rI+cni+lUshtmOy
 pMaqDPmNyythaxBzBFexRUZ7wKzZc/LPtg2K/2+jAbMcPYUrUJ0wc+s3SggZ+15Pbtm1hqhdcz0yc
 V+dPU9vbg==;
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEU0U-0002ie-Ga; Thu, 11 Apr 2019 07:20:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 11 Apr 2019 09:19:56 +0200
Message-Id: <20190411072000.4306-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] a few xen swiotlb cleanups
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

SGkgYWxsLAoKYmVsb3cgYXJlIGEgY291cGxlIG9mIGNsZWFudXBzIGZvciBzd2lvdGxiLXhlbi5j
LiAgVGhleSB3ZXJlIGRvbmUgaW4KcHJlcGFyYXRpb24gb2YgZXZlbnR1YWxseSB1c2luZyB0aGUg
ZG1hLW5vbmNvaGVyZW50LmggY2FjaGUgZmx1c2hpbmcKaG9va3MsIGJ1dCB0aGF0IGZpbmFsIGdv
YWwgd2lsbCBuZWVkIHNvbWUgbWFqb3Igd29yayB0byB0aGUgYXJtMzIgY29kZQpmaXJzdC4gIFVu
dGlsIHRoZW4gSSB0aGluayB0aGVzZSBwYXRjaGVzIG1pZ2h0IGJlIGJldHRlciBpbiBtYWlubGlu
ZQp0aGFuIGluIG15IGxvY2FsIHRyZWUgc28gdGhhdCB0aGV5IGRvbid0IGJpdHJvdC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
