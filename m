Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A65C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 12:50:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0130760233
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0130760233
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93667.176703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9uQ-0002xa-9q; Fri, 05 Mar 2021 12:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93667.176703; Fri, 05 Mar 2021 12:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI9uQ-0002xS-61; Fri, 05 Mar 2021 12:50:22 +0000
Received: by outflank-mailman (input) for mailman id 93667;
 Fri, 05 Mar 2021 12:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lI9uP-0002x5-Ek
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 12:50:21 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a65fd52-4119-400a-9090-9e60c8b83d25;
 Fri, 05 Mar 2021 12:50:20 +0000 (UTC)
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
X-Inumbo-ID: 3a65fd52-4119-400a-9090-9e60c8b83d25
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614948620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FKWKNNS8zeB+e6A5j+ecHtMlcXfb4/SSo+PatHCy8Ts=;
  b=e/ZbU0K6q2abucZcny24+9xwuwuE3jMFx5mzCqve7cmZp4cbeGNRMR8B
   bV5V2L+sdB/rxUH7WQVEB5Io1Kd5Iart5UNWXzQMYnFnFEvPxgzMk6vlk
   s2fzTfNSTwhgB0qa+DviLzPOx5UAsIzykapY88ZV+TwhGEzwEAKxPsKqp
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gDfgj/tGi2uTIKC6wNER95ZO5fbcuwAD+5NsNnMb1Hu6XNHraemPv/vpZpaGWHCmhkiRoUCIP8
 VjyuD5K7uRXHbZDv5ih+QawLOGlNOg4kExZc68kpWngwZaUYYmXB7bGXj3If4tBvcm19DWkcDw
 JX+G7K7ZUJIRaSK8SU/ka2Hj8cj2fHIh7+G+3mgOei9wbq5wIoi6gZxg/XsMge1paVG33+LtJg
 yAuBIAOCj3TePSa/SDuUzLPmFeODaeaTn8BW8S14fdOkc2/8sOnGbgtpE8IcZQU1j9c2nMq40V
 +ro=
X-SBRS: 5.1
X-MesageID: 38547171
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="38547171"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] tools/libs: Fix headers.chk logic
Date: Fri, 5 Mar 2021 12:49:49 +0000
Message-ID: <20210305124949.6719-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210305124949.6719-1-andrew.cooper3@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 4664034cd dropped the $(LIBHEADERSGLOB) dependency for the headers.chk
rule, without replacing it.

As headers.chk uses $^, a typical build looks like:

  andrewcoop@andrewcoop:/local/xen.git$ make -C tools/libs/devicemodel/
  make: Entering directory '/local/xen.git/tools/libs/devicemodel'
  for i in ; do \
      gcc -x c -ansi -Wall -Werror
      -I/local/xen.git/tools/libs/devicemodel/../../../tools/include \
            -S -o /dev/null $i || exit 1; \
      echo $i; \
  done >headers.chk.new
  mv headers.chk.new headers.chk

i.e. with an empty for loop, and checking only the $(AUTOINCS).

Reinsert a $(LIBHEADERS) dependency.

Fixes: 4664034cd ("tools/libs: move official headers to common directory")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/libs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index a68cec244c..2d973ccb95 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -76,7 +76,7 @@ else
 .PHONY: headers.chk
 endif
 
-headers.chk: $(AUTOINCS)
+headers.chk: $(LIBHEADERS) $(AUTOINCS)
 
 headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
-- 
2.11.0


