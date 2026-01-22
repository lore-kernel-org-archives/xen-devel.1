Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5BAD3EE67
	for <xen-devel@archiver.kernel.org>; Thu, 22 Jan 2026 14:16:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1211110.1522638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivTt-0003Gb-Mp; Thu, 22 Jan 2026 14:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211110.1522638; Thu, 22 Jan 2026 14:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivTt-0003GU-JQ; Thu, 22 Jan 2026 14:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1211110;
 Thu, 22 Jan 2026 14:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qG0Y=73=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vivTq-0003GO-Ox
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:16:16 +0000
Received: from out28-101.mail.aliyun.com (out28-101.mail.aliyun.com
 [115.124.28.101]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e493f5e5-f79c-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 15:16:10 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gD836R0_1769091362 cluster:ay29) by smtp.aliyun-inc.com;
 Thu, 22 Jan 2026 22:16:03 +0800
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
X-Inumbo-ID: e493f5e5-f79c-11f0-b15e-2bf370ae4941
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769091366; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ZypD3Y1+lQi6OI5xAxzyvlb7R9txghHEaqtepZwmpfE=;
	b=ETPh++TXfeNnyFkI0PhEMjUylGYe+NgDAMJv2l+hMOsgK0uOoPbWUe0llf7W5rfMciDV1cXQ3qWDtNA+cZcyZF30famleGI2zdk4L9FD/C2OLI5SzXxmiE1pWfE2AlE6Z0gyAZyUZJfslYUMyIKrxQH8pHLL23SmWJu/AFjIKQA=
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>,
	Brian Gerst <brgerst@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Eric Dumazet <edumazet@google.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] x86/smp: Move the static call update for 'smp_ops' into smp_prepare_boot_cpu()
Date: Thu, 22 Jan 2026 22:15:43 +0800
Message-Id: <b5e3f1d674af21c1592eab3ce8cc7dc93f9a7dad.1769090885.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 1f60230cdc63 ("x86/smp: Use static_call for
arch_send_call_function_ipi()") changed to use a static call for
arch_send_call_function_ipi(), which causes two problems:

First, the KVM guest also changes 'smp_ops.send_call_func_ipi' when the
PV sched yield feature is available. However, the missing
static_call_update() breaks the PV sched yield feature.

Additionally, xen_smp_init() is called before static_call_init() during
the booting of the XENPV guest, which triggers a warning in
__static_call_update().

To simplify, move the static call update for 'smp_ops' into
smp_prepare_boot_cpu() to address these two problems together.

Fixes: 1f60230cdc63 ("x86/smp: Use static_call for arch_send_call_function_ipi()")
Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
I'm not sure if the XEN part is okay or not. I think there should be no
IPI before smp_prepare_boot_cpu(), and even if there is, it's okay for
the KVM guest to use the native version before smp_prepare_boot_cpu().
---
 arch/x86/kernel/smpboot.c | 1 +
 arch/x86/xen/smp_hvm.c    | 1 -
 arch/x86/xen/smp_pv.c     | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 5cd6950ab672..84b8a4163ddb 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1088,6 +1088,7 @@ void __init smp_prepare_cpus_common(void)
 
 void __init smp_prepare_boot_cpu(void)
 {
+	x86_smp_ops_static_call_update();
 	smp_ops.smp_prepare_boot_cpu();
 }
 
diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index 5ea0f53e4ea3..485c1d8804f7 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -85,5 +85,4 @@ void __init xen_hvm_smp_init(void)
 	smp_ops.smp_send_reschedule = xen_smp_send_reschedule;
 	smp_ops.send_call_func_ipi = xen_smp_send_call_function_ipi;
 	smp_ops.send_call_func_single_ipi = xen_smp_send_call_function_single_ipi;
-	x86_smp_ops_static_call_update();
 }
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 72a334b32c32..c40f326f0c3a 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -441,7 +441,6 @@ static const struct smp_ops xen_smp_ops __initconst = {
 void __init xen_smp_init(void)
 {
 	smp_ops = xen_smp_ops;
-	x86_smp_ops_static_call_update();
 
 	/* Avoid searching for BIOS MP tables */
 	x86_init.mpparse.find_mptable		= x86_init_noop;
-- 
2.31.1


