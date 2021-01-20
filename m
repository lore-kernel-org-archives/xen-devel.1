Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DBBC433E6
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3052F2342C
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3052F2342C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71178.127314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l22HP-00028s-UD; Wed, 20 Jan 2021 01:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71178.127314; Wed, 20 Jan 2021 01:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l22HP-00028j-Pw; Wed, 20 Jan 2021 01:27:27 +0000
Received: by outflank-mailman (input) for mailman id 71178;
 Wed, 20 Jan 2021 01:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AECs=GX=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1l22HO-000272-GQ
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 01:27:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a0a2226-4e46-4aa9-8d81-a8640502adf1;
 Wed, 20 Jan 2021 01:27:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57FEA2312D;
 Wed, 20 Jan 2021 01:27:24 +0000 (UTC)
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
X-Inumbo-ID: 1a0a2226-4e46-4aa9-8d81-a8640502adf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611106045;
	bh=RXasSzsPwlyqWugfoG3XkngjRibGw7leLfBysKrf8B4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pAg10lR56ClIYbZShGRFOUX0Bec9zxo05MTV2e9nwWrtZwb84D41mFbFmBSGUbiSa
	 J63fH3rjSWQ1aMVtN9ckEV6QE29PdU7HtdHhOZs6rr/K2iJuc7YWc0TnDG/3nGzTGA
	 gaK4JUUNqoHHOvd3fwFCAPWn/I5wDj02F8PJNc+wcANdloWvqFNioGuCNn/sqPrwqT
	 raOxghCYy6RF7o32bpQD39X7JA46EPVqDVAdM8TbncjugDyRC2RonTLCQKEKNkzlN9
	 r0pDic+Ff/znW9xiINU5xOmRD7f3YH5cZtwM5mpJ643VLJiI7tLsRFr/Q+CBwDLmCn
	 jcwwrRNOYJ4Dg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.4 15/26] x86/xen: Add xen_no_vector_callback option to test PCI INTX delivery
Date: Tue, 19 Jan 2021 20:26:52 -0500
Message-Id: <20210120012704.770095-15-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: David Woodhouse <dwmw@amazon.co.uk>

[ Upstream commit b36b0fe96af13460278bf9b173beced1bd15f85d ]

It's useful to be able to test non-vector event channel delivery, to make
sure Linux will work properly on older Xen which doesn't have it.

It's also useful for those working on Xen and Xen-compatible hypervisors,
because there are guest kernels still in active use which use PCI INTX
even when vector delivery is available.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20210106153958.584169-4-dwmw2@infradead.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  4 ++++
 arch/x86/xen/enlighten_hvm.c                    | 11 ++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 74ba077e99e56..a19ae163c0589 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5452,6 +5452,10 @@
 			This option is obsoleted by the "nopv" option, which
 			has equivalent effect for XEN platform.
 
+	xen_no_vector_callback
+			[KNL,X86,XEN] Disable the vector callback for Xen
+			event channel interrupts.
+
 	xen_scrub_pages=	[XEN]
 			Boolean option to control scrubbing pages before giving them back
 			to Xen, for use by other domains. Can be also changed at runtime
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index e138f7de52d20..6024fafed1642 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -175,6 +175,8 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
        return 0;
 }
 
+static bool no_vector_callback __initdata;
+
 static void __init xen_hvm_guest_init(void)
 {
 	if (xen_pv_domain())
@@ -194,7 +196,7 @@ static void __init xen_hvm_guest_init(void)
 
 	xen_panic_handler_init();
 
-	if (xen_feature(XENFEAT_hvm_callback_vector))
+	if (!no_vector_callback && xen_feature(XENFEAT_hvm_callback_vector))
 		xen_have_vector_callback = 1;
 
 	xen_hvm_smp_init();
@@ -220,6 +222,13 @@ static __init int xen_parse_nopv(char *arg)
 }
 early_param("xen_nopv", xen_parse_nopv);
 
+static __init int xen_parse_no_vector_callback(char *arg)
+{
+	no_vector_callback = true;
+	return 0;
+}
+early_param("xen_no_vector_callback", xen_parse_no_vector_callback);
+
 bool __init xen_hvm_need_lapic(void)
 {
 	if (xen_pv_domain())
-- 
2.27.0


