Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130B5C433E6
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:53:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D148423128
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 22:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D148423128
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68736.123188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxi-00029m-5b; Fri, 15 Jan 2021 22:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68736.123188; Fri, 15 Jan 2021 22:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxh-00029d-Uw; Fri, 15 Jan 2021 22:52:57 +0000
Received: by outflank-mailman (input) for mailman id 68736;
 Fri, 15 Jan 2021 22:52:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xxg-0001jt-JL
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88666d25-87f4-428c-bada-d362b87ac924;
 Fri, 15 Jan 2021 22:52:45 +0000 (UTC)
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
X-Inumbo-ID: 88666d25-87f4-428c-bada-d362b87ac924
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jgfv4P04PbdaWw919nXNWbo+zvG8+hgWuQW3OvzjTJ0=;
  b=P/2qFlHlGYQCWTa1lmc98Q0hLvSPQzK1JMI2kGRlKhqjDyTUw5DorGvC
   cA2KHLE3ew+ql8JxCQv9q69/f4RWBYs/5dCAYLb7IfbXYZClKRg/QDs1E
   C5XWI9lHrdWfQHqE3nj3MhU1R7+a5nAlHcDLSyBZPAs5CNgys205d9c/J
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VKqtPcqsjhHQvdTIHL3aQ47xaq8O3xmEdlojko1lowvTT5oaY4xvpyMOvFCTDzf2/HVSqt+8MA
 Djcx8v8fVoUpvaDGx82w5yRVsyS/40OAJ6N6ahRMqNRyeHXJeCdhePsVxIxmxYBy+ZPlp+OlTK
 1FMmSeBZOnpK1Ubjd1B0M4GYNjaxDzQCDLSbvJu+s8sBxzdq2ubJ9QlNdzAFLG0IE/ylvQRHhs
 7x/FXZqoWXVEbw34aH2CVHmZCC8IVY9trvq8V4VouhHaQT9e7k7a4NbGaf23zpteFdXX2LjTlc
 BSE=
X-SBRS: 5.1
X-MesageID: 35206337
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35206337"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v1 2/4] tools/ocaml/xenstored: fix quota calculation for mkdir EEXIST
Date: Fri, 15 Jan 2021 22:29:07 +0000
Message-ID: <6293bbc59bf4904e975dcc0e31608f858d34d84e.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We increment the domain's quota on mkdir even when the node already
exists.
This results in a quota inconsistency after live update, where
reconstructing the tree from scratch results in a different quota.

Not a security issue because the domain uses up quota faster,
so it will only get a Quota error sooner than it should.

Discovered by the structured fuzzing test:
```
live-update-agree: FAIL

When given the input:

  [{ "domid" = 0;
    "cmd" = { "tid" = 0;
              "rid" = 0;
              "op" = MKDIR;
              "data" = "/" } }; { "domid" = 0;
                                  "cmd" = { "tid" = 0;
                                            "rid" = 0;
                                            "op" = DEBUG;
                                            "data" = "live-update\000-s" } }]

the test failed:

    store agrement: diff --git 1/tmp/expected5b4372.txt 2/tmp/actual1c18b5.txt
index ac39964836..af318026ec 100644
--- 1/tmp/expected5b4372.txt
+++ 2/tmp/actual1c18b5.txt
@@ -1,9 +1,9 @@
{ "stat_transaction_coalesce" = 0;
  "stat_transaction_abort" = 0;
  "store" = /{n0}
  /tool{n0}
  /local{n0}
  ;
  "quota" = { "maxent" = 8192;
  "maxsize" = 2048;
  "cur" = (hashtbl (0, +3+))-2-)) } }

Fatal error: exception Crowbar.TestFailure
```

This shows that the quota was 2 instead of 3 after a live update.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/store.ml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index a9c079a417..1a9f71fa62 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -420,6 +420,7 @@ let mkdir store perm path =
 	(* It's upt to the mkdir logic to decide what to do with existing path *)
 	if not (existing || (Perms.Connection.is_dom0 perm)) then Quota.check store.quota owner 0;
 	store.root <- path_mkdir store perm path;
+	if not existing then
 	Quota.add_entry store.quota owner
 
 let rm store perm path =
-- 
2.29.2


