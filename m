Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A21C11F6E
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:22:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10BE613FE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10BE613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148824.275159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZp-0006Gf-3o; Thu, 01 Jul 2021 14:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148824.275159; Thu, 01 Jul 2021 14:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZo-0006F0-IP; Thu, 01 Jul 2021 14:22:00 +0000
Received: by outflank-mailman (input) for mailman id 148824;
 Thu, 01 Jul 2021 14:21:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxR3-0005F9-NI
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:12:57 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a858c7a-da76-11eb-8328-12813bfff9fa;
 Thu, 01 Jul 2021 14:11:29 +0000 (UTC)
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
X-Inumbo-ID: 3a858c7a-da76-11eb-8328-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OrEgff/HihyncUiqJLBMZO5p+YLhIkvLwk8ijwp7Og0=;
  b=IUfo/cC9BJbSiM1KYJctmiuzcp9to3pjLOtjRa4ds9PpHv3vFqDyWefd
   IjctC1G7l8j6oAmARtzjKsdhKfm1V64W+ZW6SN70bhiZ7ryl6zndGM/If
   U16WeVEpgDuFxwXZqap56dQIclNMKjCb1W+0HqqBTEKaFuZpyuuV9XP5h
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NZ/MaMEfgDUzcZbO6KcGdvFFBkHR6NU6p9DlxJ715VT6RLQFJVjuh+XWDqbgfYwIUafNmoXmMD
 s5GWIkHuy3tIdJLKyBUd38fMpUhl7cgGEMYmMn1ljii3q4QxU/+6/kllIcIZR9FVnHja/7ft2S
 XfcCt8A1gjJ8Nr70Y062zL0eqCSZwEGMUzGKj44Pw2bwN9tbGbB6R1QkAwNSNffdD5qSKV8yG1
 +TwvxqSndDA8dZvxdN/pxcne3QiUmMutVWbk5vMssasw8CCES/aRV+71vb0L7eGqP7O0AgEOUj
 ODY=
X-SBRS: 5.1
X-MesageID: 47755472
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CZGT3q1O+8E7RG7SPjPV7gqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755472"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 19/31] build: rework .banner generation
Date: Thu, 1 Jul 2021 15:09:59 +0100
Message-ID: <20210701141011.785641-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Avoid depending on Makefile but still allow to rebuild the banner when
$(XEN_FULLVERSION) changes.

Also add a dependency on tools/xen.flf, even if not expected to
change.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 7e3e4c42d77b..267ae77aef7a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -399,13 +399,19 @@ delete-unfresh-files:
 		rm -f include/xen/compile.h; \
 	fi
 
-.banner: Makefile
-	@if which figlet >/dev/null 2>&1 ; then \
-		echo " Xen $(XEN_FULLVERSION)" | figlet -f tools/xen.flf > $@.tmp; \
-	else \
-		echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
-	fi
-	@mv -f $@.tmp $@
+quiet_cmd_banner = BANNER  $@
+define cmd_banner
+    if which figlet >/dev/null 2>&1 ; then \
+	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
+    else \
+	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
+    fi; \
+    mv -f $@.tmp $@
+endef
+
+.banner: tools/xen.flf FORCE
+	$(call if_changed,banner)
+targets += .banner
 
 # compile.h contains dynamic build info. Rebuilt on every 'make' invocation.
 include/xen/compile.h: include/xen/compile.h.in .banner
-- 
Anthony PERARD


