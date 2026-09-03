Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253B4C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:43:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407370.1640462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28fK-0000JM-0k; Thu, 03 Sep 2026 14:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407370.1640462; Thu, 03 Sep 2026 14:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28fJ-0000JE-TP; Thu, 03 Sep 2026 14:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1407370;
 Thu, 03 Sep 2026 14:43:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1x28fI-0000J8-Qu
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:43:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28fH-00FAg5-U5
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:43:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a998795-2eae-0a2a0a5409dd-0a2a4501bfc8-22
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:43:43 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a99879a-5984-0a2a45010019-d98c6eac890e-1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:43:38 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1AF01596;
 Thu,  3 Sep 2026 07:43:33 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.7.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73EFA3F673;
 Thu,  3 Sep 2026 07:43:36 -0700 (PDT)
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
	t=1788446617; bh=mxmqrcsBVhcdTQFKurB+Zs99Ktsao9E8vsivza3IAQs=;
	h=From:To:Cc:Subject:Date:From;
	b=XSJv8EqRzP68UGIK7MEVv8vHAVIXY9LG1hb5N93r/f9GkWo0iaVk6uu+bDVL8vgz4
	 lMCGxZ6cDvAXgBBl+dE4x3+v6TqKoiHpTZhjoQS3N/ZFVDifxQf9G20TiC+hBENcew
	 OtpM4Xz6rUfkGgf6+NAJbnnbcydrHD3keDo40N10=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 0/6] xen/arm: ffa: Harden notifications and enable VM-to-VM delivery
Date: Thu,  3 Sep 2026 16:43:25 +0200
Message-ID: <cover.1788268510.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788446623-BE867757-B72EAF58/0/0
X-purgate-type: clean
X-purgate-size: 2840

This series hardens FF-A notification handling in the Arm FF-A mediator
and completes local delivery for non-secure VM-to-VM notifications.

The serie was pushed and almost completely reviewed before 4.22 release
except for the last patch.

Hardening and state handling (Patches 1-4):
1) Fix notification pending interrupt delivery when vcpu0 is offline by
   reusing a common global NPI injection helper.
2) Replace the single hypervisor notification boolean with a protected
   HYP bitmap and keep bitmap lifecycle tied to the cached endpoint ID.
3) Tighten notification parameter validation so malformed BIND, UNBIND,
   GET, and SET requests are rejected consistently before reaching
   cached state or the SPMC.
4) Preserve the secure pending indication until secure notifications are
   retrieved, protect the secure pending latch with notif_lock,
   serialize SPMC INFO_GET polling, and keep INFO_GET return width
   consistent with the caller.

Local VM notification delivery (Patches 5-6):
1) Track non-secure VM notification bindings locally, promote pending
   state to a per-bit bitmap, and validate BIND/UNBIND requests
   against that state.
2) Deliver non-secure VM-to-VM notifications locally, track whether a
   local NPI is already armed, and only advertise notification support
   when firmware capabilities or CONFIG_FFA_VM_TO_VM actually provide
   it.

Backward compatibility: v1.0/v1.1 guests remain compatible. Valid
guest-visible notification behavior is preserved; the series only
tightens malformed-request handling and enables local non-secure
VM-to-VM delivery when CONFIG_FFA_VM_TO_VM is enabled.

Gitlab branch with patches:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa/-/tree/vm-notif/v3?ref_type=heads
CI pass result (fail on both macos jobs, runner unavailable):
https://gitlab.com/xen-project/people/bmarquis/xen-ffa/-/pipelines/2816768212

Changes since 2:
- remove redundant irq raised cleanup in patch 6
- add R-b from Jens

Changes since v1:
- Keep pending notification state stable across failed local NPI injection.
- Tighten local NPI armed-state tracking for Hypervisor and VM notifications.
- Details in each commit message.

Bertrand Marquis (6):
  xen/arm: ffa: Fix NPI injection when vcpu0 is offline
  xen/arm: ffa: Track hypervisor notifications in a bitmap
  xen/arm: ffa: Tighten notification parameter validation
  xen/arm: ffa: Preserve secure notification state when polling SPMC
  xen/arm: ffa: Track VM notification bindings locally
  xen/arm: ffa: Deliver VM-to-VM notifications locally

 xen/arch/arm/tee/ffa.c         |  24 ++-
 xen/arch/arm/tee/ffa_notif.c   | 369 +++++++++++++++++++++++++++------
 xen/arch/arm/tee/ffa_private.h |  25 ++-
 3 files changed, 343 insertions(+), 75 deletions(-)

-- 
2.53.0


