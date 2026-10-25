Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3C606A31A
	for <xen-devel@archiver.kernel.org>; Sun, 25 Oct 2026 06:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=d8WzNrgh
Received: from list by lists.xenproject.org with outflank-mailman.1460430.1671568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKrqe-0003A7-BM; Sun, 25 Oct 2026 06:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460430.1671568; Sun, 25 Oct 2026 06:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKrqe-00039x-5R; Sun, 25 Oct 2026 06:36:52 +0000
Received: by outflank-mailman (input) for mailman id 1460430;
 Sun, 25 Oct 2026 06:36:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xKrqc-00039r-Rn
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2026 06:36:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKrqb-00CqCQ-QS
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2026 07:36:49 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6adda339-bab6-0a2a0a5309dd-0a2a4503d954-14
 for <xen-devel@lists.xenproject.org>; Sun, 25 Oct 2026 07:36:49 +0100
Received: from [40.93.196.45]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6adda37f-fae8-0a2a45030019-285dc42df94a-3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Oct 2026 07:36:49 +0100
Received: from BY5PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:1e0::37)
 by AT6PR12MB026081.namprd12.prod.outlook.com (2603:10b6:170:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Sun, 25 Oct
 2026 06:35:01 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::4e) by BY5PR03CA0027.outlook.office365.com
 (2603:10b6:a03:1e0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Sun, 25
 Oct 2026 06:35:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Sun, 25 Oct 2026 06:35:00 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Sun, 25 Oct 2026 01:34:56 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4F0MHAOjqmYqJT5vh+kaJKzl5zXhu5EmskLsAmWzkERj3BN4w4MZXrNkKqAWihu0ve6eq3+NJKZgCHY3AB5z5g894ZoLfI/cRLHOe2Berv4Vr5EJQAhgS0nPsoey0F1Noaj/NHM2/h8Aqv7CLnNSdOrh1XSWgVBLoqiDYYR0aZ4K2GK4vWWGoxDWVkEPgRCfoNlKkxw2GESdd5JNhXdzLDdup/TEjmKg2anPtYWT6vIzoC3DGy8+DL6cnE1Z0c9+Bxr3rY0OPstCqeIeWhq/q/hGW5DBwwurtMzOQjGtvIPC4mzWpgjyMMt3kBdItZUyQfRv8K8jPx439/cRsk1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GijEse6hff60BEqBgFxft9+bDZ0t5yGKOBH3CY1qHc=;
 b=qsJzjSOFMlNRffqJzS3l9r23qQoKiaBgsbHhRJFIDoXLOQXT55l5sEXqxNuiGSOrBeWbBLPBwDA3m2ANAWZH6NaFxtvmeopG5q3ZQYOUHTvAQmbk3H06l8RsvD9hJLxH4qWBzJAWr6N+Rbb32956qorXrteHsGB4/ajLAtTig0/nmejOvCWBt2Jux/H9sK8r8T/Cjsvz/Itgiojwak1E5I+Ho39hXzszpANUxp9gbRzsItunScMTIQKocyAeMK/tcfioiaXBFHNSJQeEhT0YIGnXA94ZWVCffTVjc/YkpULSo08OcJLKMSJKGltj6PtoExUvsq5IQmPdP16mEyCe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GijEse6hff60BEqBgFxft9+bDZ0t5yGKOBH3CY1qHc=;
 b=d8WzNrgh8glFSoRvjPtCLSjgZuPyMN59tL/EoJyAMj2xiL5lRRewio14RH845LLo5iARGSIRWLKtM58D9Nw8GWsj5BfUJz6bJBTAG76jfQu3FRfBp/5Fo5WnZiT/QXtzP0gNZMHHRtKEGpoOe1YFbvG/1wL9frJfbW3YGF5xSRI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Shuaidong Chen <shuaidong.chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Penny Zheng
	<penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>, Shuaidong Chen
	<shuaidong.chen@amd.com>
Subject: [XEN PATCH] automation/eclair: merge the two R14.3 invariant-condition deviations
Date: Sun, 25 Oct 2026 14:34:43 +0800
Message-ID: <20261025063443.2489592-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|AT6PR12MB026081:EE_
X-MS-Office365-Filtering-Correlation-Id: 85aeca3e-fea7-4a9f-4573-08df32621849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|7416014|36860700016|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|261009221227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/UbQ3HmVc9DHScvY9NANC7W9TppRtvReIPlwXsCFvSFgJg/vQlT0hcaXcsVVEW4D4y6U9gafOJBQs8WdW7sAznta8Pe4mdGt/mxOi8KY9mSMOTpxSSYhPq22czrGXgf7T3ByGqNPIGZQI/pnDUWy5+6DUkispXlkchQ33r7RRpgDn0Y4c8nfrM508/AiO4NveJ0GeVK+AOMSjABZckURP8gvmGxkKI/LlG5hroJO0nUQYyLlzj9OwRjQlfUqz1gL/LSoYgJeS/+pPWni8aUtwSo6K8GwW02FZpAFEXiFHIyIWw6Zvwet5xdyY7juNANqrKxD0AlVD5il8eD3LgSY/LpzzxykFpvocJeDVTejfmtuz53Iq3HGY8eCjIlW1yWAZMkL1ZsMjrvXj7KFcdTb5fCBlBVF8Af8QdVzg+byXhtg8spvTdmmcpVCv+DVOg4Ob5l65pvezZzTXhjarCjzi/qXL+Xi1kraYei6CEk1vDg7clI0H45XW0UVf3EPjRwPZ2Ad2Am6TCPxIo4NC++tnegpwmlIInhul2ETsKVH241fmeptEAkTD05kjIRLAVC/iyxF5uDi7YR62btLikcAfOf4G3NAS7yW5rs0X6xIWgM8WIoCzt0lyCP7+VdGFyVml4wGq+NRNbWE/OEJQp30vz/mNr28v9EZj4iiabI8l42LSCac+tK5NAIqPUa9todMlE4tsD7fNOXGnZP/j3hccw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(7416014)(36860700016)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(261009221227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dz6Hs+WSrlVuDD6RagnzN+lmE8O6mRYYmSdn2m6VQbu7XRSfMCwS/e1vaUfpX4O2QGCzDbDWqyRNiwowQrX9hse51PuFxdFg8NZ0PGW9TXzu1ZTllOow1VZ01Pa4ckuBxn6VOgyzGWAuo1xzL3iAH/GV9/qQ5ZVOlOvKz/Yzc/KOzDGXz091CzbZZdqtioNoULerqhNhAXn7Ri901OBVd5SqXN1T8AI3kaFqpn3HMs6DJESnkoDrRMsBZry9cSi6LUeSxU4TWpjlB1KhqLbvY7aMXHIYB61J0jTGyxk5ZsEDOlXixSe/gJ+CALpNfjNTgqp38FixzOscCLfu+AoZhexZU7iKxrOnnvSHwnIVdAJSbiQ5vWL88Srb5OJfTkXT9re+bLqW9F7wtlfRNSUvAF+STbkzIf7RSfe97e+8pphOqc3xl1lo38DZO09quUhd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2026 06:35:00.4264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85aeca3e-fea7-4a9f-4573-08df32621849
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB026081
X-purgate-ID: tlsNG-33051d/1792910209-7448C4E9-A2B9A6BC/0/0
X-purgate-type: clean
X-purgate-size: 3275
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
deviated by two separate entries.  One covers 'if' statements and
conditional operators and places no restriction on where the invariant
condition comes from.  The other covers 'switch' statements, but only
when the controlling expression is a 'sizeof' operator.

The rationale recorded for the two is the same: the condition is
deliberate.  Nothing about a 'switch' makes an invariant condition less
deliberate than the same condition in an 'if', so the 'sizeof'
restriction reads as an artefact of that entry having been added for
read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
as a considered limit.

Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
one, which the general predicate now subsumes.  Invariant 'switch'
conditions that are not a 'sizeof' become deliberate as a result; that
is the intent.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++------
 docs/misra/deviations.rst                        | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33d..08a88ddfa62 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -472,12 +472,8 @@ activity."
 -config=MC3A2.R14.2,reports+={disapplied,"any()"}
 -doc_end
 
--doc_begin="The XEN team relies on the fact that invariant conditions of 'if' statements and conditional operators are deliberate"
--config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator))" }
--doc_end
-
--doc_begin="Switches having a 'sizeof' operator as the condition are deliberate and have limited scope."
--config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
+-doc_begin="The XEN team relies on the fact that invariant conditions of 'if' statements, conditional operators and 'switch' statements are deliberate"
+-config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator||switch_stmt))" }
 -doc_end
 
 -doc_begin="The use of an invariant size argument in {put,get}_unsafe_size and array_access_ok, as defined in arch/x86(_64)?/include/asm/uaccess.h is deliberate and is deemed safe."
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 32713172067..99a1b2332c2 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -458,12 +458,8 @@ Deviations related to MISRA C:2012 Rules:
 
    * - R14.3
      - The Xen team relies on the fact that invariant conditions of 'if'
-       statements and conditional operators are deliberate.
-     - Tagged as `deliberate` for ECLAIR.
-
-   * - R14.3
-     - Switches having a 'sizeof' operator as the condition are deliberate and
-       have limited scope.
+       statements, conditional operators and 'switch' statements are
+       deliberate.
      - Tagged as `deliberate` for ECLAIR.
 
    * - R14.3
-- 
2.34.1


