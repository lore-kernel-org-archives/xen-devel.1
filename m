Return-Path: <SRS0=g3ET=HL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92346C433E6
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 15:46:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E3564E0D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 15:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E3564E0D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83311.154713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VD9-0001Wi-M1; Tue, 09 Feb 2021 15:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83311.154713; Tue, 09 Feb 2021 15:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9VD9-0001WY-IE; Tue, 09 Feb 2021 15:45:55 +0000
Received: by outflank-mailman (input) for mailman id 83311;
 Tue, 09 Feb 2021 15:45:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhOK=HL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9VD7-0001R5-NH
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:45:53 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b968c8-2196-422f-9340-f280c55629c7;
 Tue, 09 Feb 2021 15:45:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x19Fjf1k8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Feb 2021 16:45:41 +0100 (CET)
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
X-Inumbo-ID: d0b968c8-2196-422f-9340-f280c55629c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612885546;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
	From:Subject:Sender;
	bh=fa5j5Ui9HQveRfkyt1TfxRyt7x+hRbirF8KvXljSbrY=;
	b=ORVRf+/ObjRTJPxO3DjyVCIf5lR2dIgrebamLEWloeFSSLOffRPHa1G7yLcYoi4mCz
	dG09APmwN9/iQsJ9E8/lFNKLch8Bg8mGIgozz9YvZDag6/QFTZ/es1/tagBeRv8z3jZd
	WKkN/CRd9rY12St/WLeu3A1zyc0jkzn7QGwaSd7wKMjvBgfwmV6GhXibjSMhMpGw6X/u
	kRN37fxq8+6Whuy8i0XcxXCJfLvWcreb78aPbQpS3FLfvbonuZTQWA+lNhNwkLozIeHl
	5NxCfm4J5zss9NFEFF+EJ9jals0CTxa/BQ8Nih5C66HpYsMc7u40trL2cB1v7V7+Wk5b
	QADw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GxPjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210209 2/4] tools: add with-xen-scriptdir configure option
Date: Tue,  9 Feb 2021 16:45:34 +0100
Message-Id: <20210209154536.10851-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209154536.10851-1-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some distros plan for fresh installations will have an empty /etc,
whose content will not be controlled by the package manager anymore.

To make this possible, add a knob to configure to allow storing the
hotplug scripts to libexec instead of /etc/xen/scripts.

The current default remains unchanged, which is /etc/xen/scripts.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 m4/paths.m4 | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/m4/paths.m4 b/m4/paths.m4
index a736f57d8d..7be314a3e2 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -76,6 +76,14 @@ AC_ARG_WITH([libexec-leaf-dir],
     [libexec_subdir=$withval],
     [libexec_subdir=$PACKAGE_TARNAME])
 
+AC_ARG_WITH([xen-scriptdir],
+    AS_HELP_STRING([--with-xen-scriptdir=DIR],
+    [Path to directory for dom0 hotplug scripts. [SYSCONFDIR/xen/scripts]]),
+    [xen_scriptdir_path=$withval],
+    [xen_scriptdir_path=$XEN_CONFIG_DIR/scripts])
+XEN_SCRIPT_DIR=$xen_scriptdir_path
+AC_SUBST(XEN_SCRIPT_DIR)
+
 AC_ARG_WITH([xen-dumpdir],
     AS_HELP_STRING([--with-xen-dumpdir=DIR],
     [Path to directory for domU crash dumps. [LOCALSTATEDIR/lib/xen/dump]]),
@@ -137,9 +145,6 @@ AC_SUBST(SHAREDIR)
 INITD_DIR=$initddir_path
 AC_SUBST(INITD_DIR)
 
-XEN_SCRIPT_DIR=$XEN_CONFIG_DIR/scripts
-AC_SUBST(XEN_SCRIPT_DIR)
-
 case "$host_os" in
 *freebsd*) XEN_LOCK_DIR=$localstatedir/lib ;;
 *netbsd*) XEN_LOCK_DIR=$rundir_path ;;

