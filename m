Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09E1C432BE
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:01:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6997461245
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6997461245
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.170962.312086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBH-0003un-RM; Tue, 24 Aug 2021 11:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170962.312086; Tue, 24 Aug 2021 11:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBH-0003ug-Ln; Tue, 24 Aug 2021 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 170962;
 Tue, 24 Aug 2021 11:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2g-0003Ux-Ax
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 494f4692-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:51 +0000 (UTC)
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
X-Inumbo-ID: 494f4692-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEelbM4UoXbBjdC2Us5bYDimWRQuQticI4pfz6oeico=;
  b=AtqoZtSTf0BBr4W/oSLNxSVY5Zaw0EqmcVbxNYZiltMktQG0r8WcdY3H
   8z+tcwCgfDLIiksRIzoVa2Vf2T+VxAOG363zSmiNF4Es7Df9MtUsUQCzQ
   k6UYZExK/C8cxShyQvOp+4s/vbhYvaIBXOaLNAyZqD6EgGEmJ/yGomZw/
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K/J/akUfpicZ6OzK9IaEFb0RO9niAiRqNr7aZimZGWj5ic+hUsiB3DOwWn15nxWmazaz/lZ+PC
 nSxUYSxF4LlJdaqayN7IJJfWYA031dK8nR4uEnnFPJJwBTxFihoNdSHgIVY+vlUVOd2rN9HAGP
 1WVYfGKEQ7tVsUTYM4Lw9sEJPFhetQykunHnIy2FVNAUR8Yu4WSjiH8F9D4STYjuYX8hSiXKmD
 wee8e4qRr/F2tgFOceRTrei1PIbt8e+hPfBqv6wJQeQHTzvbN9BXrA557ThYnk7kV7qKHaaEWq
 lLECsuzaxC6Sg8SRa4Uii0of
X-SBRS: 5.1
X-MesageID: 50772220
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:a1Duva4RO7YUTBA3uQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772220"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v7 31/51] xen/tools/kconfig: fix build with -Wdeclaration-after-statement
Date: Tue, 24 Aug 2021 11:50:18 +0100
Message-ID: <20210824105038.1257926-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to start building kconfig with HOSTCFLAGS from Config.mk,
it has the flag "-Wdeclaration-after-statement".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/confdata.c b/xen/tools/kconfig/confdata.c
index 3569d2dec37c..a69250c91355 100644
--- a/xen/tools/kconfig/confdata.c
+++ b/xen/tools/kconfig/confdata.c
@@ -1237,6 +1237,7 @@ void set_all_choice_values(struct symbol *csym)
 
 bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
+	bool has_changed = false;
 	struct symbol *sym, *csym;
 	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
 					 * pty: probability of tristate = y
@@ -1283,7 +1284,6 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 			exit( 1 );
 		}
 	}
-	bool has_changed = false;
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym) || (sym->flags & SYMBOL_VALID))
-- 
Anthony PERARD


