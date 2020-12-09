Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC864C4361B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 16:31:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8933D2076B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 16:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8933D2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48527.85838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2N5-0006zd-VX; Wed, 09 Dec 2020 16:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48527.85838; Wed, 09 Dec 2020 16:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2N5-0006zV-RM; Wed, 09 Dec 2020 16:31:19 +0000
Received: by outflank-mailman (input) for mailman id 48527;
 Wed, 09 Dec 2020 16:31:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn2N4-0006z4-Cx
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:31:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 478590eb-876e-4383-a916-6569b259bcac;
 Wed, 09 Dec 2020 16:31:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D1AD1FB;
 Wed,  9 Dec 2020 08:31:17 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77C2B3F68F;
 Wed,  9 Dec 2020 08:31:16 -0800 (PST)
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
X-Inumbo-ID: 478590eb-876e-4383-a916-6569b259bcac
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/7] xen/arm: Emulate ID registers
Date: Wed,  9 Dec 2020 16:30:53 +0000
Message-Id: <cover.1607524536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

The goal of this serie is to emulate coprocessor ID registers so that
Xen only publish to guest features that are supported by Xen and can
actually be used by guests.
One practical example where this is required are SVE support which is
forbidden by Xen as it is not supported, but if Linux is compiled with
it, it will crash on boot. An other one is AMU which is also forbidden
by Xen but one Linux compiled with it would crash if the platform
supports it.

To be able to emulate the coprocessor registers defining what features
are supported by the hardware, the TID3 bit of HCR must be disabled and
Xen must emulated the values of those registers when an exception is
catched when a guest is accessing it.

This serie is first creating a guest cpuinfo structure which will
contain the values that we want to publish to the guests and then
provides the proper emulationg for those registers when Xen is getting
an exception due to an access to any of those registers.

This is a first simple implementation to solve the problem and the way
to define the values that we provide to guests and which features are
disabled will be in a future patchset enhance so that we could decide
per guest what can be used or not and depending on this deduce the bits
to activate in HCR and the values that we must publish on ID registers.

---
Changes in V2:
  Fix First patch to properly handle DFR1 register and increase dbg32
  size. Other patches have just been rebased.

Changes in V3:
  Add handling of reserved registers as RAZ
  Minor fixes described in each patch

Bertrand Marquis (7):
  xen/arm: Add ID registers and complete cpuinfo
  xen/arm: Add arm64 ID registers definitions
  xen/arm: create a cpuinfo structure for guest
  xen/arm: Add handler for ID registers on arm64
  xen/arm: Add handler for cp15 ID registers
  xen/arm: Add CP10 exception support to handle MVFR
  xen/arm: Activate TID3 in HCR_EL2

 xen/arch/arm/arm64/vsysreg.c        | 53 ++++++++++++++++++++
 xen/arch/arm/cpufeature.c           | 69 ++++++++++++++++++++++++++
 xen/arch/arm/traps.c                |  7 ++-
 xen/arch/arm/vcpreg.c               | 76 +++++++++++++++++++++++++++++
 xen/include/asm-arm/arm64/hsr.h     | 66 +++++++++++++++++++++++++
 xen/include/asm-arm/arm64/sysregs.h | 28 +++++++++++
 xen/include/asm-arm/cpregs.h        | 37 ++++++++++++++
 xen/include/asm-arm/cpufeature.h    | 58 ++++++++++++++++++----
 xen/include/asm-arm/perfc_defn.h    |  1 +
 xen/include/asm-arm/traps.h         |  1 +
 10 files changed, 386 insertions(+), 10 deletions(-)

-- 
2.17.1


