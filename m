Return-Path: <SRS0=zz9o=DD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4559C2D0A8
	for <xen-devel@archiver.kernel.org>; Sat, 26 Sep 2020 20:56:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B224207F7
	for <xen-devel@archiver.kernel.org>; Sat, 26 Sep 2020 20:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="IMu2zPfl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B224207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMHEn-0003jH-6e; Sat, 26 Sep 2020 20:56:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMHEl-0003jB-RE
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 20:56:07 +0000
X-Inumbo-ID: 62f6b0cb-6736-4726-bd1e-895d23866b31
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62f6b0cb-6736-4726-bd1e-895d23866b31;
 Sat, 26 Sep 2020 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=V+xG5A7DMztGKIQTC0U2EEPTOOPtgXmNyDJn6bMD3UM=; b=IMu2zPfl7dzaItBRWEgxwExXz6
 ah5gfKDjrE+kcYZQlIIWKZA0wb7PQwGAChAgfsAYVwyM3yEfv7SxBYmX/wORm6ax4kMK77HDvOaiZ
 Kaeh8LCBX0pw4XZ9t+nnJQyTpjW35T2AF7ZcnK/GVVDJQkrNnSY//Yu+FYLmWLieg4Zk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEf-0000C5-O3; Sat, 26 Sep 2020 20:56:01 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMHEf-0004I0-8S; Sat, 26 Sep 2020 20:56:01 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] xen/arm: Unbreak ACPI
Date: Sat, 26 Sep 2020 21:55:38 +0100
Message-Id: <20200926205542.9261-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

Xen on ARM has been broken for quite a while on ACPI systems. This
series aims to fix it.

Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
to only support 5.1). So I did only some light testing.

I have only build tested the x86 side so far.

Cheers,

*** BLURB HERE ***

Julien Grall (4):
  xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
  xen/arm: acpi: The fixmap area should always be cleared during
    failure/unmap
  xen/arm: Check if the platform is not using ACPI before initializing
    Dom0less
  xen/arm: Introduce fw_unreserved_regions() and use it

 xen/arch/arm/acpi/lib.c     | 79 ++++++++++++++++++++++++++++++-------
 xen/arch/arm/kernel.c       |  2 +-
 xen/arch/arm/setup.c        | 25 +++++++++---
 xen/arch/x86/acpi/lib.c     | 18 +++++++++
 xen/drivers/acpi/osl.c      | 34 ++++++++--------
 xen/include/asm-arm/setup.h |  2 +-
 xen/include/xen/acpi.h      |  1 +
 7 files changed, 123 insertions(+), 38 deletions(-)

-- 
2.17.1


