Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113D8CD4851
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2026 12:42:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307952.1579490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN8uQ-00007z-LJ; Wed, 13 May 2026 12:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307952.1579490; Wed, 13 May 2026 12:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN8uQ-00007s-Iq; Wed, 13 May 2026 12:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1307952;
 Wed, 13 May 2026 12:41:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wN8uP-00007k-9p
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 12:41:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN8uN-00C24R-56
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:41:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 6a04718a-2eae-0a2a0a5409dd-0a2a4506aeac-20
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 14:41:52 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 6a04718f-7371-0a2a45060019-d98c6eacd714-1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 14:41:51 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A2E165C;
 Wed, 13 May 2026 05:41:45 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB323F7B4;
 Wed, 13 May 2026 05:41:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778676110; bh=NM3eJlbqL8Yo0QXE/TrTFd72EjUsY9X8TYQBIlW72YY=;
	h=From:To:Cc:Subject:Date:From;
	b=R9Zsuyeqy9jSA1DVX+V2FfsM326JQXb+nRJbr4GGC9s/msBsSeFKVpMVYis7d4faB
	 R7kf6aT07aOoZc4jHI67PbusPP+PmqITxF7ssazO+Qnmbny0o8RIkqQiEZ4HFTndE7
	 6ZIF6rUt2fVeDCxxMDmUCh2Cu2iE96ACHgwWGXfg=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH v7 0/3] Fifth MPU Series
Date: Wed, 13 May 2026 13:41:35 +0100
Message-Id: <20260513124138.275290-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778676112-85B6DD75-8C75625D/0/0
X-purgate-type: clean
X-purgate-size: 1462

This series continues to further the ongoing work to introduce support
for MPU systems in Xen.

The patches in this series aim to implement MPU specific p2m functions.

This serie is based on staging 8070bdfa7220e772fae248abd3cbf5e87fc0fefb.


Harry Ramsey (2):
  arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
  arm/mpu: Implement p2m tables

Penny Zheng (1):
  arm/mpu: implement setup_virt_paging for MPU systems

 docs/misc/arm/device-tree/booting.txt    | 14 +++++
 xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
 xen/arch/arm/dom0less-build.c            | 62 ++++++++++++++++++
 xen/arch/arm/domain.c                    | 37 +++++++++++
 xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
 xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
 xen/arch/arm/include/asm/domain.h        |  4 ++
 xen/arch/arm/include/asm/domain_build.h  | 10 +++
 xen/arch/arm/include/asm/mpu/p2m.h       |  8 +++
 xen/arch/arm/include/asm/p2m.h           |  5 ++
 xen/arch/arm/include/asm/processor.h     |  8 +++
 xen/arch/arm/mpu/arm64/mm.c              |  5 ++
 xen/arch/arm/mpu/p2m.c                   | 72 ++++++++++++++++++++-
 xen/include/public/arch-arm.h            |  7 +++
 xen/include/public/domctl.h              |  4 +-
 17 files changed, 328 insertions(+), 9 deletions(-)

-- 
2.34.1


