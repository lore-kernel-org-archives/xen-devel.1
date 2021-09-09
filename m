Return-Path: <SRS0=yIgx=N7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F9FC433FE
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 08:27:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D7960FC0
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 08:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3D7960FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.182752.330504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFOz-0000Lx-Jt; Thu, 09 Sep 2021 08:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182752.330504; Thu, 09 Sep 2021 08:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFOz-0000LA-CO; Thu, 09 Sep 2021 08:27:21 +0000
Received: by outflank-mailman (input) for mailman id 182752;
 Thu, 09 Sep 2021 08:27:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOFOx-0000Fc-TD
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:27:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd7e9ceb-1147-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:27:17 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AE3722323;
 Thu,  9 Sep 2021 08:27:15 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 44BED13AB4;
 Thu,  9 Sep 2021 08:27:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id SGNPD2LFOWHPEAAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 09 Sep 2021 08:27:14 +0000
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
X-Inumbo-ID: bd7e9ceb-1147-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631176035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKgds8sS3qW4uVOZtuYU/xKRL4VfjAB9MmtS4lgtd1s=;
	b=pBaQHqm4l76QobGJBt0AG1Bqj3JJHypVnlW2cOHLAXSLKwOQvbFoxR7mxYiZkfIxZA1tpg
	2j7VmjQgJKONoDWVziTvopkWYNOitkSyqmxZi9OlPTtwxOQ6tR5MhrrFN5zrFuo+h/aT0d
	KWYOka5qw6xRuPV7CVLOxT/s2AGynqw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] stubdom: disable building pv-grub
Date: Thu,  9 Sep 2021 10:27:05 +0200
Message-Id: <20210909082705.9434-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210909082705.9434-1-jgross@suse.com>
References: <20210909082705.9434-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stubdom based pv-grub is using a very outdated version of grub
(0.97) and should not be used any longer. Mainline grub has support for
PV guests for a long time now, so that should be used as a boot loader
of a PV domain.

So disable building pv-grub per default. In case someone really wants
to continue using it he/she can still use a pv-grub binary from an older
Xen version or manually enable building it via:

  configure --enable-pv-grub

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/configure    | 8 ++------
 stubdom/configure.ac | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/stubdom/configure b/stubdom/configure
index aa48df986d..df31532abb 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -1342,7 +1342,7 @@ Optional Features:
   --enable-ioemu-stubdom  Build and install ioemu-stubdom
   --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
   --enable-caml-stubdom   Build and install caml-stubdom (default is DISABLED)
-  --disable-pv-grub       Build and install pv-grub (default is ENABLED)
+  --enable-pv-grub        Build and install pv-grub (default is DISABLED)
   --disable-xenstore-stubdom
                           Build and install xenstore-stubdom (default is
                           ENABLED)
@@ -2129,11 +2129,7 @@ fi
 else
 
 
-grub=y
-STUBDOM_TARGETS="$STUBDOM_TARGETS grub"
-STUBDOM_BUILD="$STUBDOM_BUILD pv-grub"
-STUBDOM_INSTALL="$STUBDOM_INSTALL install-grub"
-STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-grub"
+grub=n
 
 
 fi
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index bd6f765929..a07a1edae5 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -21,7 +21,7 @@ m4_include([../m4/fetcher.m4])
 AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
 AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
 AX_STUBDOM_DEFAULT_DISABLE([caml-stubdom], [caml])
-AX_STUBDOM_DEFAULT_ENABLE([pv-grub], [grub])
+AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
 AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
 AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
 AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
-- 
2.26.2


