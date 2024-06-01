Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B09DC27C4F
	for <xen-devel@archiver.kernel.org>; Sat,  1 Jun 2024 10:17:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.734110.1140303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnL-000612-PY; Sat, 01 Jun 2024 10:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734110.1140303; Sat, 01 Jun 2024 10:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnL-00060v-ME; Sat, 01 Jun 2024 10:17:03 +0000
Received: by outflank-mailman (input) for mailman id 734110;
 Sat, 01 Jun 2024 10:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDLnK-0005zz-MF
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 10:17:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c9403e-2000-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 12:17:01 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id ED9494EE0745;
 Sat,  1 Jun 2024 12:16:58 +0200 (CEST)
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
X-Inumbo-ID: 15c9403e-2000-11ef-90a1-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 0/5] address violations of MISRA C rules
Date: Sat,  1 Jun 2024 12:16:51 +0200
Message-Id: <cover.1717236930.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patches 1 to 4 address violations of MISRA C Rule 20.12 by deviating certain
uses of some macros, while the last patch addresses some regressions introduced
by the latest bitops series

Nicola Vetrini (5):
  xen/domain: deviate violation of MISRA C Rule 20.12
  x86/domain: deviate violation of MISRA C Rule 20.12
  x86: deviate violation of MISRA C Rule 20.12
  automation/eclair_analysis: address remaining violations of MISRA C
    Rule 20.12
  xen: fix MISRA regressions on rule 20.9 and 20.12

 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 +++++++-
 docs/misra/safe.json                             | 8 ++++++++
 xen/arch/x86/domain.c                            | 1 +
 xen/arch/x86/domctl.c                            | 1 +
 xen/arch/x86/include/asm/shared.h                | 1 +
 xen/common/domain.c                              | 1 +
 xen/include/xen/self-tests.h                     | 2 +-
 7 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1

