Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DB4C5DF87
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 08:42:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397204.1634574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxKpQ-0004uc-3d; Fri, 21 Aug 2026 08:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397204.1634574; Fri, 21 Aug 2026 08:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxKpQ-0004uV-0U; Fri, 21 Aug 2026 08:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1397204;
 Fri, 21 Aug 2026 08:42:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wxKpO-0004uP-Dj
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 08:42:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxKpM-00FwbT-Cm
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 10:42:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a880f67-8faa-0a2a0a5109dd-0a2a450cc664-0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 10:42:15 +0200
Received: from [52.101.228.89]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a880f64-f479-0a2a450c0019-3465e459e8f1-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 10:42:14 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6259.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:32c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 08:42:10 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 08:42:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abn3M+ddf18ino3y6o5QP0Ku0WzkoPo3BExkME66jAkpsAfPBJWWu7CADedfIgnFtMi2Krepg42AxlUydOc4gSHSrZ4xVKior6ZqrIaS0yimgRscL+6IHOkQ/hFhEKN6QTMLE9EGTJQeJ35VmCWShPgmkchoLWIS86v22pF7HuP7AqJRzH9InReCM1jlMjPzL5rgDYhm/0bjXDKsXV7UcxruI8MUyofyZPmWEXQmHe8ztivFeDYwFuwLeDhdSHjyeXjTnBfdcY03ug9+LGLT3KZ3pAABvtvigYsmjN9Ej1dLCBwthEdTiGDdzbWD2n7X56FL0nEoK1El1EqbSp+yKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSMVGeuaLgvVlkD44jgGyhemh9VA7QAPohCs4cR4/QY=;
 b=zGE9z1MbcOrzujK4Ant3NeXohCAlUoN+nVFJzuZE01rcUxmwZyElDCJB5yXkK76hfEOJ8Lqk/CAoh5WrwWNp1YCgkvbj1hKtXRuxlwrGBDLrZTnYfKKaFuVb5H1xtMLw1qlCFRh3NIJs5oGcgRlv18zNWTcAe+0cKIh52TNOwVUZByQvmFhiMgjWD3vSGsob2YtZMKwSDjrCEmvHcCPrl928Aac98fU0H/BnrUMxWss9CgTi4UrJL5sDm+FLnhJcz7Z8+Rkfb3cJe7XoyUwcItN132P7qIu/OYMOPO9dw+51qSoE41lEAK5jYm4wou8DfEMatIz06nUpuK9F/Q1HaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSMVGeuaLgvVlkD44jgGyhemh9VA7QAPohCs4cR4/QY=;
 b=FV3kTJ4JN+s3gzqFD1Iz2+8YS9Mldgb+qGYwwuTCTTqBh4ZE2BFkJqbJEAGwoKMBawffEnONpp2jEWuFRdMKsVPC3d7Agai3/suVSKs7tp1TQSbxYYNjSQqJzwXi9fZ+/puOtJtwLglzeFdNKxQNVK5FFYJFYYqn/lCBqDSsutQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/privcmd: Only claim ioreqs matching an ioeventfd
Date: Fri, 21 Aug 2026 17:41:12 +0900
Message-ID: <20260821084112.2374949-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:379::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acddfd7-fb63-4ce1-d87d-08deff6016ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	qpYnDOPNYSEfcqaAzyy7VttNEe/KPKLdwWL8XcCAK9HbQCGdbY9Yowcpp043ZwK8f4HzM/VqTW9WoY4FJguhaBKsOxnCsQWGMRN00lgkvDRdcm73jsWM3hYV/j+3K+55BvQQzLzFxz267cLEfKUV5pUkP0NAbYPJWq2Pj/immWxaccLV5HDncOSGpxwjqRdwKAm+T/5WNqL3Z3T0QLAKa1WEdiHyBPr6GCUrARnRgyp1nOKn63FJHdW+Qri6BXSxyKDWo271hBlfelvXAiYyT37SLedUrIvO0ixdoMBRHys18wKurfyl2ZP/jf3NvEACZ4WD509IoWFI45My+mdfNX5V6688fxaIK4CUDkX3AuId5b1Vq8f6lvDuyLZd2YDLEuV4Q5IyPod1d/FZnYEKCq5DTRcminyTMlvf958meCVZ28pwjwtG0H/G6lMlf+Q7w/1EHx76dwLxY1qVkod86J7Y8rhqi2DkiR8cTG73X7fRMreE+A8iwszWkYaxpSxqJ1UXYOqzS64cxLJboeD8BCMqYTx6GwuCNoCs/EUUo3ZUFdeHlx8KmthrHQwPhB+BFh9XqMoooRjb2wJqLsrmc9iSFaGJPvhsqlG+SAx5ne9x9XlBNCiQSsyvpWeU+LUa9Gw3Z3hDiQdACYineU/lUTM693mPuOgdRJb0jqgmJrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DZgUrxb/u0wk0rl4fe9suhB0PYuVVWmFa3HiOHen+vF0oe5nIGaHCM/RcwED?=
 =?us-ascii?Q?FMTAGB17Q74yStT0/eqQ+A7493FlvpKex2A7TLWq/SK5XWNl28Bl96bOhZg1?=
 =?us-ascii?Q?ke4LlEuI+dr9LC7GD+8KkUiwEQgB0EezGfkn/G7TNZvOB0oTe2A3uwwGsmWd?=
 =?us-ascii?Q?JkX0GN0spfnXUcCiauvI+4zsL5ZKy2cf5cV4iDYuuE3FWRY3cSu1NGn34+UC?=
 =?us-ascii?Q?dNlt7FXPsEAipMwwWK/ow1sGpAPcw1ZxPqyFexZcOkeoEnKaGlggp9376B1p?=
 =?us-ascii?Q?MYTWU5MAkoaDHHc7GPxlasgX1pxTNIjwNWbMHe6hxRLacv3V/z1xM/ojhseL?=
 =?us-ascii?Q?LDMn7fksuNRQyQAv7yYzE79Upgt71/zlOcrv1K237ivgBR671yUAUxTK2lWS?=
 =?us-ascii?Q?yWXhYI4r3ZX04VjhqIOxCBHSaQ4gyg5S2kUHFkEVUH6w6AdlSC2ZDlFAMLK3?=
 =?us-ascii?Q?SDlEsMAaXU2xqblKAn7nBcBhC1hU0K7eL1yeYNVQg6aiUEKmbcLTg9cpgs2V?=
 =?us-ascii?Q?s8Q0D09iLyTm3kH4h1FfuThV64hE64+RSbp/qrm4Iwq2ZmEaTi2VbMxm3qzw?=
 =?us-ascii?Q?gHm7KDAh5d1Oe0Q2VOrfdF79eYJgkAG/HiZ55aAL8YozYW0jPki8kcjjoQiZ?=
 =?us-ascii?Q?tReZvub9xqoCuIQLIdrV+4p1vgK+zLP0cy5FTuaY6sFDSI9nnkygZ2R45UU2?=
 =?us-ascii?Q?yTr6EZV4KQrrZCK8OhQpGs0t+GtgKF/s68LNLurIijjcG93oTpnUdEjnZwh+?=
 =?us-ascii?Q?XI3uxwR4IZwyXJhhQMieo09X+WsClegdokl0znT3Fs7yr6tMpWvcMF4ySyqw?=
 =?us-ascii?Q?S/bh4ZtyBRyzNOYGqvbQsyBzXpuGp2bKymtTHARQzdiMcaQx4LIyl9KNLVXe?=
 =?us-ascii?Q?VKSJME2d7r+3cpl3/cNSmAdIH8s6oT1PDcb3NvLtxQ2iEkNnalwuEKON3FG7?=
 =?us-ascii?Q?ykfPjGp97wQOtF/5wwVB6Q3T1gd0jAxyjQN6x/obYSHStqmjVpqWNA6VXAjH?=
 =?us-ascii?Q?/f3ky7sngQ+IO8vfYPOdRi/yMf2nBOb4E1ixuAPvgpMuOvteUR4bOBKf1cjp?=
 =?us-ascii?Q?+pfHIATAyZRni64i4o8E8t4lMrBvZqCcyPqJjttpbwZ3leyNfu9umhFc0oma?=
 =?us-ascii?Q?QGpkUjXbNBaHz0lXBLAPWWeQ48VvYsEJHC0fzrgVF9sfSM9DncrljhoaNZ5x?=
 =?us-ascii?Q?f/9iw+AxCbyP9PC8vGGiXUqnLTY8Q3xtQAJsRY2k7rDM3PkBGBzT5RH/CP8y?=
 =?us-ascii?Q?Hmi9dCSgczaLirfOUwyx84SH86ePgBeSfoDFto10XKjMUsezMwB6EtMdMxr6?=
 =?us-ascii?Q?GAyCD9jkLMUcvaSR35frHXURdMUwpdKIG4CrwkuD3Z5eAFP+M8sRB7uB4Eji?=
 =?us-ascii?Q?BeuItxAIbrh3OJJ5Uircg5X1kclDrqqO1FE0NoJHosDIF+v/+Q/4X8bFoYzS?=
 =?us-ascii?Q?M7uHQSKEOdef1trOMJuAJIHTWdis2e0bEGLG0ITmJYAQ3Q8zYbRg+T0sgu2X?=
 =?us-ascii?Q?+j6BpIwcjogEZ7xDQ2gnwJB50SYPjS3Xh6LUTJSD/TFnUqyvpeVR+o6J2onc?=
 =?us-ascii?Q?k7Wp+H4aVz5fn5ozPTjddTxE8bipWvegLKKftdKR4X9HUH/v7VwKFEg/GRoU?=
 =?us-ascii?Q?34QQ0rjVQxWw7GTum0QlzhfcJj0tkv2EwMjKbeHhlAHA2JRYQyjtIAOWK76L?=
 =?us-ascii?Q?up7C8bGGLBdg20fwhp8xUk1gJv7Owybobb39CguCeAsrQgCOrtY3mgugvt9V?=
 =?us-ascii?Q?WnzyELUd1GDoDXJm0lC593e4XQLoHwuJFax805OMnwgPnFUDKE1h?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acddfd7-fb63-4ce1-d87d-08deff6016ce
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:42:09.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hssqArvtqZemSTUEFuBM4UqZ7FHcTLApOX/W/xCd6YZMjYKosAYk12qGmT9BZsK/J/YKoDl3mPH2r74WaWuR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6259
X-purgate-ID: tlsNG-d25034/1787301735-50520A5B-E93D9B01/0/0
X-purgate-type: clean
X-purgate-size: 3600

The ioeventfd handler shares its event channel with the userspace device
model. It must only claim requests that match a registered ioeventfd.
Other requests are left for userspace.

ioeventfd_interrupt() currently marks every MMIO write INPROCESS before
looking for a match. For an unmatched request it drops the lock and
restores READY. Userspace may see INPROCESS and skip it. Restoring READY
does not send another notification. If userspace handles the request at
the same time, the READY store may overwrite its state.

Find a matching ioeventfd before changing the request state.

The lock now protects only the ioeventfd list. Use explicit virt_*mb()
barriers for the ioreq shared with Xen.

Fixes: f0d7db7b3324 ("xen: privcmd: Add support for ioeventfd")
Cc: stable@vger.kernel.org
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/xen/privcmd.c | 47 +++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 7cfc28f1bb86..c67ec6d282cf 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1169,51 +1169,40 @@ static irqreturn_t ioeventfd_interrupt(int irq, void *dev_id)
 	struct privcmd_kernel_ioreq *kioreq = port->kioreq;
 	struct ioreq *ioreq = &kioreq->ioreq[port->vcpu];
 	struct privcmd_kernel_ioeventfd *kioeventfd;
-	unsigned int state = STATE_IOREQ_READY;
+	bool matched = false;
 
-	if (ioreq->state != STATE_IOREQ_READY ||
-	    ioreq->type != IOREQ_TYPE_COPY || ioreq->dir != IOREQ_WRITE)
+	if (ioreq->state != STATE_IOREQ_READY)
 		return IRQ_NONE;
 
-	/*
-	 * We need a barrier, smp_mb(), here to ensure reads are finished before
-	 * `state` is updated. Since the lock implementation ensures that
-	 * appropriate barrier will be added anyway, we can avoid adding
-	 * explicit barrier here.
-	 *
-	 * Ideally we don't need to update `state` within the locks, but we do
-	 * that here to avoid adding explicit barrier.
-	 */
+	/* Xen publishes the request before changing its state to READY. */
+	virt_rmb();
 
-	spin_lock(&kioreq->lock);
-	ioreq->state = STATE_IOREQ_INPROCESS;
+	if (ioreq->type != IOREQ_TYPE_COPY || ioreq->dir != IOREQ_WRITE)
+		return IRQ_NONE;
 
+	spin_lock(&kioreq->lock);
 	list_for_each_entry(kioeventfd, &kioreq->ioeventfds, list) {
 		if (ioreq->addr == kioeventfd->addr + VIRTIO_MMIO_QUEUE_NOTIFY &&
 		    ioreq->size == kioeventfd->addr_len &&
 		    (ioreq->data & QUEUE_NOTIFY_VQ_MASK) == kioeventfd->vq) {
+			/* Finish reading the request before claiming it. */
+			virt_mb();
+			ioreq->state = STATE_IOREQ_INPROCESS;
 			eventfd_signal(kioeventfd->eventfd);
-			state = STATE_IORESP_READY;
+			matched = true;
 			break;
 		}
 	}
 	spin_unlock(&kioreq->lock);
 
-	/*
-	 * We need a barrier, smp_mb(), here to ensure writes are finished
-	 * before `state` is updated. Since the lock implementation ensures that
-	 * appropriate barrier will be added anyway, we can avoid adding
-	 * explicit barrier here.
-	 */
-
-	ioreq->state = state;
-
-	if (state == STATE_IORESP_READY) {
-		notify_remote_via_evtchn(port->port);
-		return IRQ_HANDLED;
-	}
+	if (!matched)
+		return IRQ_NONE;
 
-	return IRQ_NONE;
+	/* Publish the response only after signaling the eventfd. */
+	virt_wmb();
+	ioreq->state = STATE_IORESP_READY;
+	notify_remote_via_evtchn(port->port);
+	return IRQ_HANDLED;
 }
 
 static void ioreq_free(struct privcmd_kernel_ioreq *kioreq)

base-commit: d330fb86a7170f845123ae82d95df440fad9b707
-- 
2.51.0


