Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B4AEF3719
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 08:47:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249168.1546681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzWGS-0000W6-WE; Mon, 09 Mar 2026 08:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249168.1546681; Mon, 09 Mar 2026 08:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzWGS-0000Vz-SC; Mon, 09 Mar 2026 08:47:00 +0000
Received: by outflank-mailman (input) for mailman id 1249168;
 Mon, 09 Mar 2026 08:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTGA=BJ=isrc.iscas.ac.cn=pengpeng.hou@srs-se1.protection.inumbo.net>)
 id 1vzW78-0007Y7-EB
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 08:37:22 +0000
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bf5d2b0-1b93-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 09:37:17 +0100 (CET)
Received: from localhost.localdomain (unknown [210.73.43.101])
 by APP-05 (Coremail) with SMTP id zQCowABX7A+yhq5pUEjxCQ--.52456S2;
 Mon, 09 Mar 2026 16:37:06 +0800 (CST)
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
X-Inumbo-ID: 2bf5d2b0-1b93-11f1-b164-2bf370ae4941
From: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	18291782795@163.com,
	pengpeng.hou@isrc.iscas.ac.cn
Subject: [PATCH] xen/grant-table: scope gnttab suspend and resume helpers to hibernate callbacks
Date: Mon,  9 Mar 2026 08:36:22 +0000
Message-Id: <20260309083622.717803-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABX7A+yhq5pUEjxCQ--.52456S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyfCFW7Wr4UCw1UKF1xKrg_yoW8Xw1fpF
	WDJrWjyrZ8Ga4SvFWSya4FyFy5Ca9xJayxJrs8urZxZa1xGF1xArWSqFy0vrn7GrW8JF4v
	yFsFg343Cr4UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU8wIDDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pshqw1hhqjhx1rx6x21ufox2xfdvhtffof0/

From: pengpeng.hou@isrc.iscas.ac.cn

In current linux.git (1954c4f01220), gnttab_suspend() and
gnttab_resume() are defined and declared unconditionally. However,
their only in-tree callers reside in drivers/xen/manage.c, which are
guarded by #ifdef CONFIG_HIBERNATE_CALLBACKS.

Match the helper scope to their callers by wrapping the definitions in
CONFIG_HIBERNATE_CALLBACKS and providing no-op stubs in the header. This
fixes the config-scope mismatch and reduces the code footprint when
hibernation callbacks are disabled.

Signed-off-by: pengpeng.hou@isrc.iscas.ac.cn
---
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@
-int gnttab_resume(void)
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+int gnttab_resume(void)
 {
 	gnttab_request_version();
 	return gnttab_setup();
@@
 	if (xen_pv_domain())
 		gnttab_interface->unmap_frames();
 	return 0;
 }
+#endif
 
 static int gnttab_expand(unsigned int req_entries)
 {
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@
 
 int gnttab_init(void);
+#ifdef CONFIG_HIBERNATE_CALLBACKS
 int gnttab_suspend(void);
 int gnttab_resume(void);
+#else
+static inline int gnttab_suspend(void)
+{
+	return 0;
+}
+
+static inline int gnttab_resume(void)
+{
+	return 0;
+}
+#endif
 
 int gnttab_grant_foreign_access(domid_t domid, unsigned long frame,
 				int readonly);


