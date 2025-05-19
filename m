Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F7C2D0CD
	for <xen-devel@archiver.kernel.org>; Mon, 19 May 2025 19:23:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.990169.1374101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH65D-0007NW-95; Mon, 19 May 2025 19:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990169.1374101; Mon, 19 May 2025 19:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH65D-0007NP-5w; Mon, 19 May 2025 19:23:31 +0000
Received: by outflank-mailman (input) for mailman id 990169;
 Mon, 19 May 2025 19:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH65B-0007ND-1W
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:23:29 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc383cfc-34e6-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 21:23:25 +0200 (CEST)
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
X-Inumbo-ID: bc383cfc-34e6-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747682604; x=1747941804;
	bh=V7zaVKx0lwtMA+mwrVVONifnlxJ+3PzeD6PCowI19tY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RjdXVL9osbT6lcXF3utVxGkdEcPFttz1P/SBgicO+Fa4+bwbckByN46WpJ5tL3fA/
	 CpECjNs7X0DjGaFgl4y5LOr0TGoIt8+KxxbcHjhV7GHn1lbeI9U839awT7xeZvNafG
	 /ch9vrqhxYy5rCncP4zpF/JltlGIFHZRcVeDqhIkGoUevwG9yEoVrnfB9+D4y3lUdc
	 +18SUlhH5rzuhIa4FdTu1HV4luBMsG09sG/aghz72lPny5nfx9FtHdlfjtQb+zJEln
	 klBoPaS3skG/gbbMJHWvk8cj0Jk9YpWZw5ov/kPOFEA8rsPVtC/rRDTBlE/kThYJGT
	 rUf3nHIgQU66w==
Date: Mon, 19 May 2025 19:23:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v7 0/3] xen/domain: domain ID allocation
Message-ID: <20250519192306.1364471-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 876f14d5bc9ffab4313313cae61d9dea1005bd0f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series adds new library calls for allocating domain IDs.

Patch 1 introduces new domid_{alloc,free} calls.
Patch 2 adjusts hardware domain ID treatment on Arm.
Patch 3 introduces new CONFIG_MAX_DOMID parameter to limit the number of
domains during run-time.

Link to v6: https://lore.kernel.org/xen-devel/20250516020434.1145337-1-dmuk=
hin@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
825273124

Denis Mukhin (3):
  xen/domain: unify domain ID allocation
  xen/domain: adjust domain ID allocation for Arm
  xen/domain: introduce CONFIG_MAX_DOMID

 xen/arch/arm/domain_build.c             | 17 ++++---
 xen/arch/arm/tee/ffa.c                  |  3 +-
 xen/arch/x86/cpu/mcheck/mce.c           |  2 +-
 xen/arch/x86/cpu/vpmu.c                 |  2 +-
 xen/arch/x86/setup.c                    | 11 +++--
 xen/common/Kconfig                      |  7 +++
 xen/common/device-tree/dom0less-build.c | 17 ++++---
 xen/common/domain.c                     | 59 +++++++++++++++++++++++--
 xen/common/domctl.c                     | 42 +++---------------
 xen/common/sched/core.c                 |  4 +-
 xen/drivers/passthrough/vtd/iommu.c     |  2 +-
 xen/include/public/domctl.h             |  2 +-
 xen/include/xen/domain.h                |  3 ++
 13 files changed, 106 insertions(+), 65 deletions(-)

--=20
2.34.1



