Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758EBC43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 18:58:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347994.1605827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHBL-0000Ot-E2; Mon, 29 Jun 2026 18:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347994.1605827; Mon, 29 Jun 2026 18:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHBL-0000Om-9y; Mon, 29 Jun 2026 18:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1347994;
 Mon, 29 Jun 2026 18:58:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vishal.moola@gmail.com>) id 1weHBK-0000NO-02
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:58:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHBI-001Dud-SL
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 20:58:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c01e-2eae-0a2a0a5409dd-0a2a4505c51e-34
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:58:08 +0200
Received: from [209.85.210.172] (helo=mail-pf1-f172.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vishal.moola@gmail.com>)
 id 6a42c03f-3cb2-0a2a45050019-d155d2acec7d-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 20:58:08 +0200
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-845537740ddso2122410b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 11:58:08 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net
 ([2601:644:937c:6c90:6d4e:7b2d:4a39:fb0c])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8479ff8f959sm223955b3a.3.2026.06.29.11.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:58:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782759487; x=1783364287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V216nmU9ttJM2RugBVItOUGA9QghN1LSEfvMALpwJOA=;
        b=NAk9z7oQzLMh1Z60re/RW0xj4SxnlenoSOCoJeizb1nr/8bzfaWmenId5Qxkd6hckh
         WDJujAlQjITr5mM+2Pcdqvl4osyqjf8OowRpn4bY8S9tDmgW1oWcLOCIq1fLH1KxJ3Un
         YP1tRmrlHYhTq/eZDLNLSx96qnLWlg24fC4F5PZfJzeRUwoI9YrPo8W4xAPcFbMTlTZF
         9mMUSG7TAq/zL430F4XPGywJOs0nVOEASwnS7fR6DhjOMYQrpIaTNoYIRx8XqwFFH6FW
         bq6amxIL1Rhp13AhdIRZDNdswK+Z29xPuEWSI70jMq2HQS7WK82AM2fAENreyRObzPt2
         Dxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759487; x=1783364287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V216nmU9ttJM2RugBVItOUGA9QghN1LSEfvMALpwJOA=;
        b=SsryBbioYxlArwMYMDjxt1gHvR9iG9kbdpWZSQ2D+20hR2tB4ADhjlcn1MGRm0VFy/
         Qt8GSf6c8bYSvRKm4ELp4bu6xJPHOEW9rQLo7GqNARPhWZDR+jqXWAnqUB3vtozoRQpg
         jcKevPNrdPdZtS0/aUP38GG7ehByhjHZDMDFR+J4cUcS35lDUNAuTxnRbvmCyxvDcoCh
         tlkhbYGzpnAt6i5IuHDAx8WF40bU8sopMjf9Jixq6SaISxP9Tcfdlpe0qvrW1R5jS+2v
         oV0l6Q53tzuM4Xpz5QnSecvZcIzOD00e6reDxzFgPDpkjapCgepRYvPfhrIrzIeewsqo
         cWVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2mSzSvyTp5iu98pyvo5F/hfkC8pJ40iVIlvR6rMz3tTIgQOd1WpM0vNTMTnsoAx5HWofUHKMQvdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+c7t1tKjEp/CIG5lnea8AsoC4WbX7XiL2PBiE19Biauyql6Lr
	YpJe81K1DlmEZjZYc5nXrhcl0ZjBKCQDUZtwtuDq9rCMByPh/1PCCo5j
X-Gm-Gg: AfdE7cluoWfPW7YTE7a4t6E62oucjutS9Uzgvc2WWc+xJUBm4ratX1Wy7BU6xxj3sxQ
	YnSOmd58ntSkeuauPQZPHlK82O2IqZQFejZS6m9ikBy68DmvDEO+tWyD7GIQHvkP6EJE2Ps2yrG
	3wzu7IyXatTg+MtuPPfzJjDvDNZ/y4zdfGgV9uSZiUhj8L3UOH/MuIu3ENH3GzraHBuiOxD2sqO
	ukcCbBDEptyyKq3gsbcs1aaxEfxSle2Vwwjpd9OTklV1oMdV0W5H4CAgMhDX0aDq3nQC7v+Px7Y
	yHL8WW6o8KfYrDsmiXhw6PQwuzJ6sMBEWHDXSXt1hjoV2CP6tre+zRjqoe47EMio6lCn/0ReC7C
	Ra5bKtxQAS8FYdVM4dxph8a4wf8cma6VafYpFuwT96sz4U2H1kC5rvY9+H7Sdh11Bqsi654tPyW
	85svvvtnHR4ZxhnBHUFMLw74F4u9Anh4BLeImZqv5WkYfgNGoeRyOfpuO4FJBHMzZ6/jHJAv4=
X-Received: by 2002:a05:6a00:8c8:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-8479f232bebmr511836b3a.35.1782759486753;
        Mon, 29 Jun 2026 11:58:06 -0700 (PDT)
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Vishal Moola <vishal.moola@gmail.com>
Subject: [PATCH v2 0/9] Convert x86 pgd_lists to ptdescs
Date: Mon, 29 Jun 2026 11:57:33 -0700
Message-ID: <20260629185742.126987-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782759488-153052B8-37CE1B43/0/0
X-purgate-type: clean
X-purgate-size: 1903

This continues the ptdesc conversions for x86[1]. This is a necessary step
in preparation for the separate allocation of ptdescs from struct page.
Once ptdescs are not wrappers, the pgd_list should be used to find our
ptdesc, not page.

In fact, after patch 4 we can successfully boot a 32-bit x86 kernel
that separately allocates ptdescs.

All of the patches are rather straightforward, I just kept them split up
for ease of review. There are no intended functional changes as ptdescs
are currently still wrappers around struct page.

[1] https://lore.kernel.org/linux-mm/20260211195233.368497-1-vishal.moola@gmail.com/

----------------

v2:
  - Collect Review tags
  - Rebase on 7.2-rc1

I've compiled and booted both 64 and 32 bit on a kernel with separately
allocated ptdescs. I ensured the codepaths were hit for all the changes
except Xen.

This applies cleanly to 7.2-rc1. Dave, can you please take this through
the x86 mm tree?

Vishal Moola (9):
  x86/mm/pat: Use IS_ENABLED() instead of ifdef
  x86/mm/pat: Convert __set_pmd_pte() to ptdescs
  x86/mm/pat: Convert collapse_pmd_page() to ptdescs
  x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
  x86/mm: Convert sync_global_pgds_l5() to ptdescs
  x86/mm: Convert sync_global_pgds_l4() to ptdescs
  x86/mm: Convert pgd_page_get_mm() to ptdescs
  x86/xen: Convert xen_mm_pin_all() to ptdescs
  x86/xen: Convert xen_mm_unpin_all() to ptdescs

 arch/x86/include/asm/pgtable.h       |  2 +-
 arch/x86/include/asm/pgtable_types.h |  2 +-
 arch/x86/mm/fault.c                  |  8 ++++----
 arch/x86/mm/init_64.c                | 16 ++++++++--------
 arch/x86/mm/pat/set_memory.c         | 17 ++++++++---------
 arch/x86/mm/pgtable.c                |  4 ++--
 arch/x86/xen/mmu_pv.c                | 22 +++++++++++-----------
 7 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.54.0


