Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE12C982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 07:49:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424815.1649033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TL4-0004yl-9i; Fri, 18 Sep 2026 07:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424815.1649033; Fri, 18 Sep 2026 07:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TL4-0004ye-71; Fri, 18 Sep 2026 07:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1424815;
 Fri, 18 Sep 2026 07:48:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <m.szyprowski@samsung.com>) id 1x7TL1-0004yW-IR
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 07:48:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TL0-005CIf-VV
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:48:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <m.szyprowski@samsung.com>)
 id 6aacece0-2eae-0a2a0a5409dd-0a2a4504ee20-8
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:48:50 +0200
Received: from [210.118.77.12] (helo=mailout2.w1.samsung.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <m.szyprowski@samsung.com>)
 id 6aacece1-b57f-0a2a45040019-d2764d0c6937-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 09:48:50 +0200
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260918074849euoutp022613b4ffe1e1f419eba05fd0d3114ab5~WWsr6S5v-0840708407euoutp02S
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:48:49 +0000 (GMT)
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260918074849eucas1p2f59ebb5edcf83292cd71fac7d0733896~WWsrk-7kH2296122961eucas1p2O;
 Fri, 18 Sep 2026 07:48:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260918074848eusmtip187731a913ef6f63bbe35f6c4ba5f178b~WWsrFBHrg2379023790eusmtip1m;
 Fri, 18 Sep 2026 07:48:48 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail20170921 header.d=samsung.com header.i="@samsung.com" header.h="Date:Subject:To:Cc:From:In-Reply-To:References"
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260918074849euoutp022613b4ffe1e1f419eba05fd0d3114ab5~WWsr6S5v-0840708407euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789717729;
	bh=9LRBFHkYxsMPHxldhSoBfcRMe67HegoQO3fxwKGAgho=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZA4IVbSokPWcxbEovDrM9dv0tHKT+oK6CJcM5gMAOcDFDCFv+nN/bGAGSRAUY/SxA
	 vsV46J8vI/rQCeWpuHIgeiiLastztygUel2sybT5fHV5vK8B+9naw4xtYHx1q2p0CY
	 cLQjz77i+qCb3CMLPbYym39iG17CJQHQ9zR0rHyE=
Message-ID: <e67609e4-6875-4759-bbe2-b94a1690309b@samsung.com>
Date: Fri, 18 Sep 2026 09:48:48 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: BUG kernel 6.12.19 defautl_swiotlb_limit() returns wrong value
 for CONFIG_SWIOTLB_DYNAMIC=y effects atm only under XEN dom0
To: James Dingwall <james@dingwall.me.uk>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Andreas Greve <andreas.greve@a-greve.de>
Cc: iommu@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aqzcLJQCCmqpdxz3@dingwall.me.uk>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260918074849eucas1p2f59ebb5edcf83292cd71fac7d0733896
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260918063741eucas1p290cc7d0360de73b3d07a23316a238b48
X-EPHeader: CA
X-CMS-RootMailID: 20260918063741eucas1p290cc7d0360de73b3d07a23316a238b48
References: <CGME20260918063741eucas1p290cc7d0360de73b3d07a23316a238b48@eucas1p2.samsung.com>
	<aqzcLJQCCmqpdxz3@dingwall.me.uk>
X-purgate-ID: tlsNG-ebf023/1789717730-53CC7B50-37F72A12/0/0
X-purgate-type: clean
X-purgate-size: 1631

On 18.09.2026 08:37, James Dingwall wrote:
> I've been having a problem with a Dell HBA330 SCSI controller (mpt3sas)
> when booting under Xen and CONFIG_SWIOTLB_DYNAMIC=y is set.  I had a
> similar issue with a megaraid_sas card that I previously posted about:
>
> https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html
>
> In that case we rebuilt the kernel with CONFIG_SWIOTLB_DYNAMIC=n.
> While investigating the current problem I came across a patch that was
> posted on the xen-devel list:
>
> https://protect2.fireeye.com/v1/url?k=202f9c3b-7fb4525f-202e1774-000babda0201-d2724d878716e4ba&q=1&e=538195f2-f8bd-499e-8576-5e3d7c8ebca6&u=https%3A%2F%2Flists.xen.org%2Farchives%2Fhtml%2Fxen-devel%2F2025-05%2Fmsg00991.html
>
> I have applied that to the Ubuntu 7.0.0-31 kernel sources which has
> resolved the controller initialisation error I was encountering and the
> system now boots as expected.
>
> [    3.921136] mpt3sas_cm0: no suitable DMA mask for 0000:03:00.0
> [    3.921275] mpt3sas_cm0: failure at drivers/scsi/mpt3sas/mpt3sas_scsih.c:13610/_scsih_probe()!
>
> I've included the patch below, I don't have the author's real address
> for the s-o-b.  I'm able to test alternative fixes if there are any
> issues with this one.


https://lore.kernel.org/xen-devel/93625976-e8af-4c39-90fb-45c926d420fd@a-greve.de/


Andreas: could You send Your fix with a bit more elaborated description and to the
proper recipients (hint: use scripts/get_maintainer.pl tool), so it can be reviewed
and potentially applied?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


