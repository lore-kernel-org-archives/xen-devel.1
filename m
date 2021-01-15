Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562E4C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:52:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A91F23128
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A91F23128
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68724.123104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxK-0001cM-Cq; Fri, 15 Jan 2021 22:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68724.123104; Fri, 15 Jan 2021 22:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxK-0001cA-9Z; Fri, 15 Jan 2021 22:52:34 +0000
Received: by outflank-mailman (input) for mailman id 68724;
 Fri, 15 Jan 2021 22:52:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XxI-0001Wj-Uw
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1366477a-b333-4dbf-9fcb-4f25fa92549d;
 Fri, 15 Jan 2021 22:52:27 +0000 (UTC)
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
X-Inumbo-ID: 1366477a-b333-4dbf-9fcb-4f25fa92549d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+OLxkWnJxNPmZrvNFRL0MUtN+MtApJbP2A5WxD+DnyM=;
  b=a+t0ffsA7VIZqI/z4eElpcbh9GUtyggG7NnL0k7xm597ZqSw+YL367pn
   s7LjtWfTDhjhBHz+6TCW/oNLpfwSAN0TW6NK4O1PNdpzredbDdKRavrai
   CQ+6kV8K7/fk2sTto3MDnI0Gs0aYAky+sct1cSAbrdMlPbAVbIDFCQ3bU
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: V53lsOBJVkj3wb96l9yOL6SkECcF2upuHaHmTNxngYM3/flR16vvt099LsvoxFo/BD+Q+PFI7a
 TadbGOW8pJCyvIsyg0yvPsBZc8mA7RMmDKQBI366IIvLma9VvtzuB7tbZeqkxwwF550zwg7W1f
 5O+iufqIUeysATXV7nVDbW2MIjrcyNEy2kef8/cgiQNasTj43U7Pu/n/yMMWONDPMJ7gEpVxDU
 0wIg5zVr0nHClzSxJqSWOBuDyBwioKHtJP107nxlUD6TbQKDDPRhjlHm64nxl8cmwyE24fU/T7
 2Ak=
X-SBRS: 5.1
X-MesageID: 35263547
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35263547"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] tools/ocaml/xenstored: trim txhistory on xenbus reconnect
Date: Fri, 15 Jan 2021 22:28:52 +0000
Message-ID: <08cd2d0b9af30f544ab63476b8f7d02d2f9c3fd8.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is a global history, containing transactions from the past 0.05s, which get trimmed whenever any transaction commits or aborts.
Destroying a domain will cause xenopsd to perform some transactions deleting the tree, so that is fine.
But I think that a domain can abuse the xenbus reconnect facility to cause a large history to be
recorded - provided that noone does any transactions on the system inbetween, which may be difficult
to achieve given squeezed's constant pinging.

The theoretical situation is like this:
- a domain starts a transaction, creates as large a tree as it can, commits it. Then repeatedly:
    - start a transaction, do nothing with it, start a transaction, delete part of the large tree, write some new unique data there, don't commit
    - cause a xenbus reconnect (I think this can be done by writing something to the ring). This causes all transactions/watches for the connection to be cleared, but NOT the history, there were no commits, so nobody trimmed the history, i.e. it the history can contain transactions from more than just 0.05s
    - loop back and start more transactions, you can keep this up indefinitely without hitting quotas

Now there is a periodic History.trim running every 0.05s, so I don't think you can do much damage
with it.
But lets be safe an trim the transaction history anyway on reconnect.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changed since V1:
* post publicly now that the XSA is out (not a security issue)
---
 tools/ocaml/xenstored/connection.ml | 2 +-
 tools/ocaml/xenstored/history.ml    | 4 ++++
 tools/ocaml/xenstored/process.ml    | 4 ++--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index eb23c3af7a..1cf24beafd 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -47,7 +47,7 @@ let mark_as_bad con =
 
 let initial_next_tid = 1
 
-let reconnect con =
+let do_reconnect con =
 	Xenbus.Xb.reconnect con.xb;
 	(* dom is the same *)
 	Hashtbl.clear con.transactions;
diff --git a/tools/ocaml/xenstored/history.ml b/tools/ocaml/xenstored/history.ml
index f39565bff5..3899353da8 100644
--- a/tools/ocaml/xenstored/history.ml
+++ b/tools/ocaml/xenstored/history.ml
@@ -53,6 +53,10 @@ let end_transaction txn con tid commit =
 	trim ~txn ();
 	success
 
+let reconnect con =
+	trim ();
+	Connection.do_reconnect con
+
 let push (x: history_record) =
 	let dom = x.con.Connection.dom in
 	match dom with
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index dd50456ad5..da8e9cdb26 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -705,7 +705,7 @@ let do_input store cons doms con =
 			Connection.do_input con
 		with Xenbus.Xb.Reconnect ->
 			info "%s requests a reconnect" (Connection.get_domstr con);
-			Connection.reconnect con;
+			History.reconnect con;
 			info "%s reconnection complete" (Connection.get_domstr con);
 			false
 		| Failure exp ->
@@ -744,7 +744,7 @@ let do_output _store _cons _doms con =
 			ignore (Connection.do_output con)
 		with Xenbus.Xb.Reconnect ->
 			info "%s requests a reconnect" (Connection.get_domstr con);
-			Connection.reconnect con;
+			History.reconnect con;
 			info "%s reconnection complete" (Connection.get_domstr con)
 	)
 
-- 
2.29.2


