Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0627C433EF
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 05:55:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3146113E
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 05:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D3146113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184035.332561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVg-0003Rg-AQ; Fri, 10 Sep 2021 05:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184035.332561; Fri, 10 Sep 2021 05:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVg-0003RV-78; Fri, 10 Sep 2021 05:55:36 +0000
Received: by outflank-mailman (input) for mailman id 184035;
 Fri, 10 Sep 2021 05:55:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOZVe-0002mm-CH
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 05:55:34 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afd42b3c-11fb-11ec-b210-12813bfff9fa;
 Fri, 10 Sep 2021 05:55:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B22B1FE45;
 Fri, 10 Sep 2021 05:55:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3015D13D02;
 Fri, 10 Sep 2021 05:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kAP+CUrzOmEDEAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 05:55:22 +0000
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
X-Inumbo-ID: afd42b3c-11fb-11ec-b210-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631253322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgngfMEyR4Vr8reqmxkBKjSYP0wtCAuyapjE7LwlNwk=;
	b=TaC/0oyaSn5bktgqEl+S15Rrq+YIlbrsvlGxljMRhwIbFci4Si1HyHHdTXcafK0UTKVicb
	SHNhbgfvGN0hMff6oCzagAb+eIzPk3dyw0Gxtd2OSmKnmcczRutVbK8ZB/9LAP/PgSH3BJ
	lCT/cxzHmgenA7zauRAF4UrzudIQfe0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/3] stubdom: disable building pv-grub
Date: Fri, 10 Sep 2021 07:55:17 +0200
Message-Id: <20210910055518.562-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210910055518.562-1-jgross@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
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
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
V2:
- add CHANGELOG.md entry (Jan Beulich)
---
 CHANGELOG.md         | 2 ++
 stubdom/configure    | 8 ++------
 stubdom/configure.ac | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 22cfdb4298..e7107ac3de 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    appearing in 4.12.2 and 4.11.4). Prior (4.13...4.15-like) behavior can be arranged for
    either by enabling the IOMMU_QUARANTINE_SCRATCH_PAGE setting at build (configuration) time
    or by passing "iommu=quarantine=scratch-page" on the hypervisor command line.
+ - pv-grub stubdoms will no longer be built per default. In order to be able to use pv-grub
+   configure needs to be called with "--enable-pv-grub" as parameter.
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
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


