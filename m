Return-Path: <SRS0=8drl=M2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5997C4338F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Aug 2021 00:24:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D8F60EFD
	for <xen-devel@archiver.kernel.org>; Tue,  3 Aug 2021 00:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84D8F60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.163204.299009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAiDy-0000te-AT; Tue, 03 Aug 2021 00:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163204.299009; Tue, 03 Aug 2021 00:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAiDy-0000tX-7T; Tue, 03 Aug 2021 00:24:02 +0000
Received: by outflank-mailman (input) for mailman id 163204;
 Tue, 03 Aug 2021 00:24:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mAiDw-0000tR-Pu
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 00:24:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18fb132e-f3f1-11eb-9a7d-12813bfff9fa;
 Tue, 03 Aug 2021 00:24:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E48860EB5;
 Tue,  3 Aug 2021 00:23:59 +0000 (UTC)
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
X-Inumbo-ID: 18fb132e-f3f1-11eb-9a7d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627950239;
	bh=E6zENBRmB4zx1eVjbhrxX8BIHkVGgXu9tBHnCDzCieM=;
	h=Date:From:To:cc:Subject:From;
	b=hx9BErdNCXDqFcaDghqIFTAs9NcnYODyJROU9pgXqDB9GX+BA96gBnSpU6Dqww1+R
	 vfBoiPxtngnVwwhQpkwb5EsXFIyybyc7T2RQK8VzOiNt0mV3DVdoOXaqv4iKPivpDk
	 mERJ+Xtr9zMCO41p8ESX/daqdJJIPW69CERjJyxHExCCznrV5rlVjhaXM9jJocFSFe
	 JrfBLXTLDL05HORjnGX9yqRT6Fijtlb255M1xoAsIsVzRcuco72dBETexAzxDSpcWi
	 ir06tBL6VO14fAFfcT5bcvgfofTQ/r+ozT2OhTL8yB8pnPyxs1udS8Eeb3uFtK2/eo
	 mdiOEn5hg5KKA==
Date: Mon, 2 Aug 2021 17:23:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, julien@xen.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com
Subject: [PATCH v6 0/4] Generic SMMU Bindings
Message-ID: <alpine.DEB.2.21.2108021720560.10122@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This series introduces support for the generic SMMU bindings to
xen/drivers/passthrough/arm/smmu.c.

Cheers,

Stefano

Brian Woods (3):
      arm,smmu: switch to using iommu_fwspec functions
      arm,smmu: restructure code in preparation to new bindings support
      arm,smmu: add support for generic DT bindings. Implement add_device and dt_xlate.

Stefano Stabellini (1):
      xen: do not return -EEXIST if iommu_add_dt_device is called twice

 xen/drivers/passthrough/arm/smmu.c    | 141 +++++++++++++++++++++++++---------
 xen/drivers/passthrough/device_tree.c |  30 ++------
 2 files changed, 113 insertions(+), 58 deletions(-)

