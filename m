Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156BBC2BA1A
	for <xen-devel@archiver.kernel.org>; Thu, 20 Jun 2024 14:02:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.744610.1151689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN3-00086s-4e; Thu, 20 Jun 2024 14:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744610.1151689; Thu, 20 Jun 2024 14:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN2-00086K-VT; Thu, 20 Jun 2024 14:02:36 +0000
Received: by outflank-mailman (input) for mailman id 744610;
 Thu, 20 Jun 2024 14:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIN1-0007p2-9v
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:02:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be091fc4-2f0d-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 16:02:34 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 881EC4EE0756;
 Thu, 20 Jun 2024 16:02:33 +0200 (CEST)
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
X-Inumbo-ID: be091fc4-2f0d-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 02/13] x86/cpuid: use fallthrough pseudo keyword
Date: Thu, 20 Jun 2024 16:02:13 +0200
Message-Id: <23fa8f1061b894d4dd121bc9c2fcaf2c3ad312f3.1718892030.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718892030.git.federico.serafini@bugseng.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current comment making explicit the fallthrough intention does
not follow the agreed syntax: replace it with the pseduo keyword.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpuid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index a822e80c7e..2a777436ee 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -97,9 +97,8 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         if ( is_viridian_domain(d) )
             return cpuid_viridian_leaves(v, leaf, subleaf, res);
 
+        fallthrough;
         /*
-         * Fallthrough.
-         *
          * Intel reserve up until 0x4fffffff for hypervisor use.  AMD reserve
          * only until 0x400000ff, but we already use double that.
          */
-- 
2.34.1


