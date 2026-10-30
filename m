Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F01606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=DF+6sPvM
Received: from list by lists.xenproject.org with outflank-mailman.1465657.1676118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmay-0007XR-AV; Fri, 30 Oct 2026 13:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465657.1676118; Fri, 30 Oct 2026 13:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmay-0007XK-7U; Fri, 30 Oct 2026 13:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1465657;
 Fri, 30 Oct 2026 13:24:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xMmax-0007XE-8E
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 13:24:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMmaw-00000004GqQ-1yp2;
 Fri, 30 Oct 2026 13:24:34 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMmav-00000007jyu-40Q8;
 Fri, 30 Oct 2026 13:24:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=8aPU48opGdNz807TGF9TgmPgjbyhOB7kUbla249bPCU=; b=DF+6sPvMXpAxhJkJd6oMkXaK4j
	4XeqM/IoF65Rt0nn9F8GyZfH6rjv65ivqxCYwSu92kt6r4EZjZtMyzpjRruWjVwNifLEJtqtdAuqz
	LXhdrx5DtSsaKZHRrJeV5FX2Mtjgeu+XZm0zMd1iC2uLcfqtGiHQgQ4jLBdT6eXA1mqk=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 0/2] x86/cpu: TSC handling adjustments
Date: Fri, 30 Oct 2026 14:24:17 +0100
Message-ID: <20261030132419.84264-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

The fist patch fixes a bug if started with TSC_AUX != 0, as then the
cached value won't match the hardware one.

Second patch fixes handling of TSC_ADJUST and TSC offset for HVM
domains, in an attempt to make it consistent with hardware behavior.

Thanks, Roger.

Roger Pau Monne (2):
  x86/cpu: keep cached TSC_AUX state coherent with hardware
  x86/hvm: sync APs TSC with the BSP at creation only

 xen/arch/x86/acpi/power.c |  3 +++
 xen/arch/x86/cpu/common.c |  5 +++++
 xen/arch/x86/hvm/domain.c |  5 -----
 xen/arch/x86/hvm/hvm.c    | 19 +++++++++++--------
 xen/arch/x86/hvm/save.c   | 34 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/time.c       |  5 ++---
 6 files changed, 53 insertions(+), 18 deletions(-)

-- 
2.55.0


