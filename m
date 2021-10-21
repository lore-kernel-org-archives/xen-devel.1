Return-Path: <SRS0=pycK=PK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303A4C43219
	for <xen-devel@archiver.kernel.org>; Fri, 22 Oct 2021 04:10:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C4560F93
	for <xen-devel@archiver.kernel.org>; Fri, 22 Oct 2021 04:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6C4560F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.214568.373359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdlse-0006Z1-FC; Fri, 22 Oct 2021 04:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214568.373359; Fri, 22 Oct 2021 04:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdlse-0006Yu-BP; Fri, 22 Oct 2021 04:10:08 +0000
Received: by outflank-mailman (input) for mailman id 214568;
 Thu, 21 Oct 2021 18:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IF2L=PJ=intel.com=lucas.demarchi@srs-us1.protection.inumbo.net>)
 id 1mdcbA-00047r-O1
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 18:15:28 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcd78c22-329a-11ec-8389-12813bfff9fa;
 Thu, 21 Oct 2021 18:15:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
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
X-Inumbo-ID: dcd78c22-329a-11ec-8389-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252606741"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="252606741"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="527582103"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Date: Thu, 21 Oct 2021 11:15:09 -0700
Message-Id: <20211021181511.1533377-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
there as we seek to bring the driver to other architectures, Daniel
suggested that we could finish the cleanup and remove it altogether,
through the tip tree. So here I'm sending both commits needed for that.

Lucas De Marchi (2):
  drm/i915/gem: stop using PAGE_KERNEL_IO
  x86/mm: nuke PAGE_KERNEL_IO

 arch/x86/include/asm/fixmap.h             | 2 +-
 arch/x86/include/asm/pgtable_types.h      | 7 -------
 arch/x86/mm/ioremap.c                     | 2 +-
 arch/x86/xen/setup.c                      | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
 include/asm-generic/fixmap.h              | 2 +-
 6 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.33.1


