Return-Path: <SRS0=sPV+=KV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644E4C2B9F7
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 09:15:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1857A61408
	for <xen-devel@archiver.kernel.org>; Wed, 26 May 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1857A61408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132397.246969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llpcw-0002IN-Sq; Wed, 26 May 2021 09:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132397.246969; Wed, 26 May 2021 09:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llpcw-0002IG-PV; Wed, 26 May 2021 09:14:58 +0000
Received: by outflank-mailman (input) for mailman id 132397;
 Wed, 26 May 2021 09:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mEKv=KV=huawei.com=chenhuang5@srs-us1.protection.inumbo.net>)
 id 1llpYZ-0002BS-Gk
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 09:10:27 +0000
Received: from szxga07-in.huawei.com (unknown [45.249.212.35])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b3c0296-2828-49ec-a767-20958ce8cd30;
 Wed, 26 May 2021 09:10:25 +0000 (UTC)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FqlTG6lRjzCx9y;
 Wed, 26 May 2021 17:07:30 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:18 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 17:10:17 +0800
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
X-Inumbo-ID: 8b3c0296-2828-49ec-a767-20958ce8cd30
From: Chen Huang <chenhuang5@huawei.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Nathan Lynch <nathanl@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton
	<akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Jens
 Axboe" <axboe@kernel.dk>, Yang Yingliang <yangyingliang@huawei.com>,
	"Masahiro Yamada" <masahiroy@kernel.org>, Dan Carpenter
	<dan.carpenter@oracle.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <ocfs2-devel@oss.oracle.com>, Chen Huang
	<chenhuang5@huawei.com>
Subject: [PATCH -next 1/3] powerpc/rtas: Replaced simple_strtoull() with kstrtoull()
Date: Wed, 26 May 2021 09:20:18 +0000
Message-ID: <20210526092020.554341-1-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected

The simple_strtoull() function is deprecated in some situation, since
it does not check for the range overflow, use kstrtoull() instead.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 arch/powerpc/kernel/rtas-proc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index 6857a5b0a1c3..117886782ebd 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -259,7 +259,6 @@ __initcall(proc_rtas_init);
 static int parse_number(const char __user *p, size_t count, u64 *val)
 {
 	char buf[40];
-	char *end;
 
 	if (count > 39)
 		return -EINVAL;
@@ -269,11 +268,7 @@ static int parse_number(const char __user *p, size_t count, u64 *val)
 
 	buf[count] = 0;
 
-	*val = simple_strtoull(buf, &end, 10);
-	if (*end && *end != '\n')
-		return -EINVAL;
-
-	return 0;
+	return kstrtoull(buf, 10, val);
 }
 
 /* ****************************************************************** */
-- 
2.25.1


