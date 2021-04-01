Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34380C43460
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 16:45:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE3B6138F
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 16:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE3B6138F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104673.200481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS0RF-0003EZ-Bx; Thu, 01 Apr 2021 16:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104673.200481; Thu, 01 Apr 2021 16:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS0RF-0003ES-93; Thu, 01 Apr 2021 16:44:57 +0000
Received: by outflank-mailman (input) for mailman id 104673;
 Thu, 01 Apr 2021 16:44:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lS0RE-0003EL-RR
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:44:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lS0RE-00026i-Db; Thu, 01 Apr 2021 16:44:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lS0RD-0003Vh-VV; Thu, 01 Apr 2021 16:44:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=OiaaY8Ipo2EWvkLByzV6dgLZ0290eAYdoAl27NRpKL8=; b=2g2s2cZnVUu0gTEVl5aqFGGDN1
	fZLcfEjRqub3Kb/XKr+ilVRemxHLPr6PLVpsavnsxxVKWMQGAXvDebKZx4JHg/vh4BCBuo1WYrEBi
	Cu7+nJzwl4zJB46dBg6RJTNKQqHPG6N403TiAO1NCkEnzEdBLl+XlO6pFEqz8kSszSgE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/2] xen/arm: Mitigate straight-line speculation
Date: Thu,  1 Apr 2021 17:44:42 +0100
Message-Id: <20210401164444.20377-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

Last year, Arm released a whitepaper about a new category of speculation.
(see [1] and [2]). In short, a processor may be able to speculate past
some of the unconditional control flow instructions (e.g eret, smc, br).

In some of the cases, the registers will contain values controlled by
the guest. While there is no known gadget afterwards, we still want to
prevent any leakage in the future.

The mitigation is planned in two parts:
   1) Arm provided patches for both GCC and LLVM to add speculation barrier
   and remove problematic code sequence.
   2) Inspection of assembly code and call to higher level (e.g smc in our case).

I still haven't looked at 1) and how to mitigate properly Arm32 (see
patch #1) and SMC call. So this issue is not fully addressed.

Note that the ERET instruction was already addressed as part of XSA-312.

Cheers,

[1] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability
[2] https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/downloads/straight-line-speculation

Julien Grall (2):
  xen/arm: Include asm/asm-offsets.h and asm/macros.h on every assembly
    files
  xen/arm64: Place a speculation barrier following an ret instruction

 xen/arch/arm/Makefile                |  2 +-
 xen/arch/arm/arm32/entry.S           |  2 +-
 xen/arch/arm/arm32/head.S            |  1 -
 xen/arch/arm/arm32/lib/lib1funcs.S   |  1 +
 xen/arch/arm/arm32/proc-v7.S         |  1 -
 xen/arch/arm/arm64/debug-cadence.inc |  1 -
 xen/arch/arm/arm64/debug-pl011.inc   |  2 --
 xen/arch/arm/arm64/entry.S           |  2 --
 xen/arch/arm/arm64/head.S            |  2 --
 xen/arch/arm/arm64/smc.S             |  3 ---
 xen/include/asm-arm/arm64/macros.h   |  6 ++++++
 xen/include/asm-arm/config.h         |  6 ++++++
 xen/include/asm-arm/macros.h         | 18 +++++++++---------
 13 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.17.1


