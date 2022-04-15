Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C666DC433EF
	for <xen-devel@archiver.kernel.org>; Fri, 15 Apr 2022 07:42:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.305573.520644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfGaO-00008i-2c; Fri, 15 Apr 2022 07:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305573.520644; Fri, 15 Apr 2022 07:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfGaN-00008b-Vj; Fri, 15 Apr 2022 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 305573;
 Fri, 15 Apr 2022 07:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UAI=UZ=bombadil.srs.infradead.org=BATV+2d633663de0085320ac7+6809+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nfGaL-00008V-Ul
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 07:41:42 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b4262ae-bc8f-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 09:41:38 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nfGaG-009Cis-7P; Fri, 15 Apr 2022 07:41:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7b4262ae-bc8f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xanSGgJ3nmtzvbbdp9vVuGDNU57I0ihEAXyIecrf4bA=; b=lps71QQUamaHvR3jlBRw+n3uyM
	JFgM5Skqngi7JHyRil4qKMmAEM5LFTvcWctJCRRUKTHITWjByEaRjFXlI1QFwKwfDznzrnq/lmskY
	ehCLULfMu+QaORULxHxFRPom6cawrtOvL6VeWCdLRS1vsaXUEDq/mTvEhVnvx0flpxmqzBiwKSAX3
	LmQI65ZSeNYRW47jHR4TI91hvxdPBP9a+ni/rg4MKnyPzCdRkLG2CLrX55JwN8keJFvMvbjNu1uEU
	DrvFdR6Ne1c+TOm7uYaONr2V++soK+q3+FnvCW2LW7BjSo6SkR3egrhx72Jv82FoBDGRaXaU2ABV7
	CtfGLRrg==;
Date: Fri, 15 Apr 2022 00:41:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH 0/6] virtio: Solution to restrict memory access under
 Xen using xen-virtio DMA ops layer
Message-ID: <YlkhsH4zqly/BykB@infradead.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

I can only see three out of 6 patches on the linux-arm-kernel list,
which makes reviewing this impossible.  Also please Cc me directly
on any series doing crazy things with dma ops.  Thanks!

