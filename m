Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFD606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=L8hXsUSN
Received: from list by lists.xenproject.org with outflank-mailman.1458891.1670970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7I9-00083o-3R; Fri, 23 Oct 2026 04:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458891.1670970; Fri, 23 Oct 2026 04:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7I9-00083h-03; Fri, 23 Oct 2026 04:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1458891;
 Fri, 23 Oct 2026 04:54:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xK7I6-00082p-IA
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:54:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7I5-00CysQ-VH
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:54:05 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae86c-e002-0a2a0a5209dd-0a2a4508bb80-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:54:05 +0200
Received: from [52.101.125.122]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6adae86b-f659-0a2a45080019-34657d7a5bce-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:54:05 +0200
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TYYP286MB1715.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:fd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 04:54:01 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 04:54:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBiw4vR+DAgUd7jTENUklIfb8beVK0JJ9JwIY+mrYTBOl/oi2RgdsPvig8om9l+UMEPlT6P5b2Rb0piVrBxn4j7zZ/qYfzeqmP3GTiD9I0ZBDoMjX546IRLy0Nq5t0J/6x8kL74OYP1EFMcnaKmJ8WkQw6jmPMyslMk06S70sF26U3FjkN9M01/TYzHTTpDtONdkQmjlINey8w4RUSIUc6XW402UxDlmqSMgJ6Gr9pJOf7C6bcD2fYXIVXX9LvT0E200L+lUIm1yDCiV+SWMdzS03wQYoVONQzE8sGhzVvz6yBqjKyFAgoWMd193k0RZGV8NrgsqnJVtSBsvGNDAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAdKilPb0/9LuUkjGbAwn7u5vPJDH2Al5yQD43o4oA0=;
 b=h5uehEbZlMj0k/8afK7sLPPQxuAucddfpL8fbA8utBVj2nLtFPwImWCw3Q61RxLeJm9M3dKYXm1RGWg5JtVZ9lkW3BMdv4kqmkct9bE3gSrubY7FibfSMr4M9UPDQYV2PbDtqq3yqS8hPvmBm0Wjo8qNFr22tv5l6LyUSR1WAgwL1q9sg+XSMCLnfff/pkMgUO6OTekJWT0g1kRi3+cKFzrZ1r67oLacitM+3S1WSJCsJP4/GHf08EyVbcXxfDk+0ZlZr1FbLwg6Sk4g24wxCwacBgvbEU5R0CQW+bR5b4+LjdAMQ2L5bxPFIcQZiH8NV6uxOhOKz404SDgSUHkIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAdKilPb0/9LuUkjGbAwn7u5vPJDH2Al5yQD43o4oA0=;
 b=L8hXsUSNH3iC5wM/UiWVsiVYTNgHvn9odn8Psj1TQfJT08XHwU0vQlAflQ8axWVHol3gubSoVPfnwoQ7Qt+ECdH7vXEWTNMGCzfxyDAOsu5+caHb9Vs8iay2rGgnGmoeOugMjUU4bJIcjmombtF7kaH0QbUvLeFU5fwT21jcowc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: roger@xenproject.org,
	ross.lagerwall@citrix.com,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: [RFC 2/5] xen/livepatch: Allow tracers to schedule livepatch
Date: Fri, 23 Oct 2026 13:53:46 +0900
Message-Id: <20261023045346.164171-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023044809.162759-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::7) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TYYP286MB1715:EE_
X-MS-Office365-Filtering-Correlation-Id: adcc21f8-f078-41b9-b52d-08df30c1a7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|261022105027099003|261022075727099003|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OjlHTy4xndyGBcuGnZKPdVfKNYblO+WWm2wB1dC3nH8OQwnIBbYDtB439hoyrMxGemAyErn1DF5/iQ7CeUXca9CWESApPcZ4s+cicLFAJT7q0Tb9IptwExq3COqf/3Dfo0xT+841/8o+VC+/kSenT8WvooaYmjjSX6+fr23rMZhDPrBNxJCQUcTSxeA61o+nseDL6O2tbQTUNEdfEY49oGyTz7XwqU/0SPNY8T//Q8y26s12oObo45F0HWh0rnKvxlERnRwS/xPLwHAdmKoxGFXNPN1Z6AY7ohT0vjBsBTN5/CbCZZNsSVuoXXUqXybz5+uvyDoMFlQkUdSZoXEqrKWhpBYZHnP7Gh+rrwjspVLqXkLkPurDTLbYQUSS8d9Aq8S+m3KGtwBmsoZw9GxVmZmNAMOYPuHTu9NL0DCOAukhFrRpFfAr1MCZpAhF40VNOPMJ5wOZwdVidhzx+kKiu59p+LuX/i/LH1QXBesIKnAwgKTPSwfuQy6QYC6HllXYBoNTwPfp7FbvA5VB7ooCiE/6wyKecQWkf+mn9YLFPOPujiFNI/kWTEkTWKOzxllto1eIAiE7M756enn6ssTNmTN+Sqrskm7mg2MFa3QSQwTXkWLsnttHqtzWEL4RygkQlxI/M+vHZRDjr7m22cnMHQfaXCmQ5yYNcgFqnzDUg6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(261022105027099003)(261022075727099003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4KCOEWm6Gi0sMHUqN+14sRM+Ji6T4WypUqurLnsICu8fC64RWBCADnsMxIne?=
 =?us-ascii?Q?8xhkWIwQLSeLz72To8DZXsaNtE0RTNDN+spfanXtD7GZrhxD1MBvxzEgn9kf?=
 =?us-ascii?Q?cAOmeAy5hnQQr5JsED9F4mbqMsD3pdIuoFe3mnpQBEUBbIJeQSC5NP24wkyV?=
 =?us-ascii?Q?2noXPbY1YCzf4vYPB1cagnY6RhC/EQXbmjEY+wvuP5Dk2s0eAqN0cpPCJWnS?=
 =?us-ascii?Q?SNIdZwwnl91bMBaTsLVugp+4mzasiBk1H3EOe/5U8lKgAEmHa7lIatjMKgcu?=
 =?us-ascii?Q?bVknXE5wSGJwTJ0Mp+GGmdM1JnpWAU4Z+QiJqcyWv7zOKLiRHtcxazfe4rAg?=
 =?us-ascii?Q?EjkfnhwMs4modCvFR1vpdDFQ/fTm6g79xpmeUCcevx9s32SEueHgkLlEzW0l?=
 =?us-ascii?Q?IU5ZFW/+NitJfgGIHHJ7tMrXKvWg/LpzvDUSCXINTvR5mKvVSWyurMomaH5Y?=
 =?us-ascii?Q?y4sZtqjHXcnk92qIbRzGW3tTu1NpgFr+QoVeFW+mPe4GXV9BEyoM+ZXlIr7e?=
 =?us-ascii?Q?vEa4F7BcaaqoS/AvhJWN9a8VI2mfDl/wjJvUBZ/8j/ywyrSOrX+MfHBi9Ref?=
 =?us-ascii?Q?FFRtOEkvZ56PvkC/VjrQMEiDRkrXiE5hTVzZwu2sGqAiV93tZDq0aRmykk/P?=
 =?us-ascii?Q?5pGsSO0Y3pyziLPoJSE3QE1nHgz9Y8SNPIfzZSws2Y3BP2EyaXML9dZxt1nl?=
 =?us-ascii?Q?hi0U13BF3jhZNCteJm0mIvdbUHTmIZQ0uEjEpC+TJzBqEK1nTliAxCNYyw4f?=
 =?us-ascii?Q?RnvyHCG1zAIohhdupzupV4wULyvnN2MJYM8/2A+a7BN1qLbcKWWaqM9T603U?=
 =?us-ascii?Q?0L747kSIDf+Ra2xZxig6sG2RX2wYZu/fxfsDaw4dI/vuXSA1Nn9nAO7Byt+j?=
 =?us-ascii?Q?0+S+HKCpMEp+Oj629kYAs1QMKv9h7RaHJHKtO49MGh/TF2C/xH1GK4O1ildA?=
 =?us-ascii?Q?vk4kgSpojmAznfsS3rguAIZKUm9wXdOU56/j613an6FKvQMs1H5W0z/CdtP0?=
 =?us-ascii?Q?7eKZonuvNGG41ZjAb0zQhJS/UWvMmzXbaVszv0sOhdiSLgQQeIiSoFZ62xSD?=
 =?us-ascii?Q?vZFqKyFKyo5tACfL1M2operWOoqJsypWkURcpbxMOJQ5sNvoHKnebts8FISo?=
 =?us-ascii?Q?mlizuKWL+WAMpRt/fQXzN+CVgGs5CLQLOyaEtrPmu/ZE36bx2zMa4qP3GjM2?=
 =?us-ascii?Q?PonNGlOS8UGgwiFub29hoPMRHyCKAdw6lu/4ZdmG49OL/3216U4jt8x6dwHd?=
 =?us-ascii?Q?gyuk1IvjR+8+5Ec94tEporwzADDY31QAqkrZBpxJ6jryhnkx706pXA9XAXmZ?=
 =?us-ascii?Q?s60wAjP/6G7BS8OlvF8sRs9cuDtj6TTuXaoagY7B8yng9OdfON1a0o7dxoXy?=
 =?us-ascii?Q?6vOPrIY2QZpOFz2+baLLrRkPEYvWPitkcxAdQ1a7IM/dzyQkLgcyJvzgbetg?=
 =?us-ascii?Q?4EeT6iNhnOJee5NhLMHqYUVdURPFojGo/M8fRstKNLjBzi03+0pScstqehaX?=
 =?us-ascii?Q?ZuwhT5JyRwkoobJOf/Nuu0iohkrkSmjZBPHmgfvTqz5B8PSRA2kDcdAhx/xJ?=
 =?us-ascii?Q?yTn/mmy2PXfJUn25VtcewjE2H+PfnuERtK/5WOu2c9396RSlsi2IspsHrkTs?=
 =?us-ascii?Q?lKxKKa2McHjON5niGTOsXQq6kinFQ00IhzA5b5iVHwRNDGtsm6kUiWmQOhs0?=
 =?us-ascii?Q?1ofc/cdHQXWRbZf0DV3YiM36xexQXhwSK58X/qSuN3r2cVUEwtT2lvFlGUp3?=
 =?us-ascii?Q?tebzq4/Rzg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: adcc21f8-f078-41b9-b52d-08df30c1a7a5
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 04:54:01.0295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhF16uKx639UFTaGoaVxagUEPIAxjccRLrmZ8Bhna5vV9+lT+sJGUMAn8wZL+V2LQMubbBa+/ae5ruanJrP/CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1715
X-purgate-ID: tlsNG-c1860d/1792731245-D437587B-17EDFBCE/0/0
X-purgate-type: clean
X-purgate-size: 3981
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tracers need to patch function entries without uploading
a fully filled payload. Add TRACE_ON and TRACE_OFF for
scheduling partially filled payloads from tracers.

It lets tracers reuse the existing livepatch logic and
keeps the payload uploaded by tracers separate from the
ones uploaded by users.

Signed-off-by: Ryo Takakura <takakura@valinux.co.jp>
---
 xen/common/livepatch.c      | 60 ++++++++++++++++++++++++++++++++++++-
 xen/include/xen/livepatch.h |  5 ++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 70f601846f..a76403af59 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -49,6 +49,9 @@ static LIST_HEAD(applied_list);
 static unsigned int payload_cnt;
 static unsigned int payload_version = 1;
 
+#define LIVEPATCH_TRACE_ON  100
+#define LIVEPATCH_TRACE_OFF 101
+
 /* Defines an outstanding patching action. */
 struct livepatch_work
 {
@@ -58,7 +61,7 @@ struct livepatch_work
     struct payload *data;        /* The payload on which to act. */
     volatile bool do_work;       /* Signals work to do. */
     volatile bool ready;         /* Signals all CPUs synchronized. */
-    unsigned int cmd;            /* Action request: LIVEPATCH_ACTION_* */
+    unsigned int cmd;            /* Action request: LIVEPATCH_ACTION_* or LIVEPATCH_TRACE_* */
 };
 
 /* There can be only one outstanding patching action. */
@@ -1737,6 +1740,14 @@ static void livepatch_do_action(void)
         }
         break;
 
+    case LIVEPATCH_TRACE_ON:
+        rc = apply_payload(data);
+        break;
+
+    case LIVEPATCH_TRACE_OFF:
+        rc = revert_payload(data);
+        break;
+
     default:
         rc = -EINVAL; /* Make GCC5 happy. */
         ASSERT_UNREACHABLE();
@@ -1823,6 +1834,51 @@ static int schedule_work(struct payload *data, uint32_t cmd, uint32_t timeout)
     return 0;
 }
 
+int livepatch_schedule_trace_on(struct payload *payload, struct livepatch_func *func, unsigned long ip)
+{
+    void *old_addr;
+    int rc;
+
+    spin_lock(&payload_lock);
+    if ( is_work_scheduled(payload) )
+    {
+        rc = -EBUSY;
+        goto out;
+    }
+
+    old_addr = func->old_addr;
+    func->old_addr = (void *)ip;
+
+    payload->rc = -EAGAIN;
+    rc = schedule_work(payload, LIVEPATCH_TRACE_ON, 0);
+    if ( rc )
+        func->old_addr = old_addr;
+
+out:
+    spin_unlock(&payload_lock);
+
+    return rc;
+}
+
+int livepatch_schedule_trace_off(struct payload *payload)
+{
+    int rc;
+
+    spin_lock(&payload_lock);
+    if ( is_work_scheduled(payload) )
+    {
+        spin_unlock(&payload_lock);
+        return -EBUSY;
+    }
+
+    payload->rc = -EAGAIN;
+    rc = schedule_work(payload, LIVEPATCH_TRACE_OFF, 0);
+
+    spin_unlock(&payload_lock);
+
+    return rc;
+}
+
 static void cf_check tasklet_fn(void *unused)
 {
     this_cpu(work_to_do) = 1;
@@ -1861,6 +1917,8 @@ static void noinline do_livepatch_work(void)
             ACTION(APPLY),
             ACTION(REVERT),
             ACTION(REPLACE),
+            [LIVEPATCH_TRACE_ON] = "TRACE_ON",
+            [LIVEPATCH_TRACE_OFF] = "TRACE_OFF",
     };
 #undef ACTION
     unsigned int cpu = smp_processor_id();
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index ae34c938d6..1b927af8ee 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -140,6 +140,11 @@ struct payload;
 int revert_payload(struct payload *data);
 void revert_payload_tail(struct payload *data);
 
+int livepatch_schedule_trace_on(struct payload *payload,
+                                struct livepatch_func *func,
+                                unsigned long ip);
+int livepatch_schedule_trace_off(struct payload *payload);
+
 #else /* !CONFIG_LIVEPATCH */
 
 static inline int livepatch_op(struct xen_sysctl_livepatch_op *op)
-- 
2.34.1


