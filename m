Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ACEC433E2
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 12:15:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E72620758
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 12:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E72620758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbNcO-00056p-1F; Wed, 20 May 2020 12:14:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q69C=7C=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jbNcM-00056k-Jl
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 12:14:38 +0000
X-Inumbo-ID: 7544f0c2-9a93-11ea-b07b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7544f0c2-9a93-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 12:14:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jbNcE-0001Rk-AZ; Wed, 20 May 2020 13:14:30 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: grub-devel@gnu.org
Subject: [GRUB PATCH 2/2] 20_linux_xen: Support Xen Security Modules
 (XSM/FLASK)
Date: Wed, 20 May 2020 13:14:20 +0100
Message-Id: <20200520121420.7965-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
References: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

XSM is enabled by adding "flask=enforcing" as a Xen command line
argument, and providing the policy file as a grub module.

We make entries for both with and without XSM.  If XSM is not compiled
into Xen, then there are no policy files, so no change to the boot
options.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 util/grub.d/20_linux_xen.in | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
index 30da49d66..7a092b898 100644
--- a/util/grub.d/20_linux_xen.in
+++ b/util/grub.d/20_linux_xen.in
@@ -94,6 +94,11 @@ esac
 title_correction_code=
 
 linux_entry ()
+{
+  linux_entry_xsm "$@" false
+  linux_entry_xsm "$@" true
+}
+linux_entry_xsm ()
 {
   os="$1"
   version="$2"
@@ -101,6 +106,18 @@ linux_entry ()
   type="$4"
   args="$5"
   xen_args="$6"
+  xsm="$7"
+  # If user wants to enable XSM support, make sure there's
+  # corresponding policy file.
+  if ${xsm} ; then
+      xenpolicy="xenpolicy-$xen_version"
+      if test ! -e "${xen_dirname}/${xenpolicy}" ; then
+	  return
+      fi
+      xen_args="$xen_args flask=enforcing"
+      xen_version="$(gettext_printf "%s (XSM enabled)" "$xen_version")"
+      # xen_version is used for messages only; actual file is xen_basename
+  fi
   if [ -z "$boot_device_id" ]; then
       boot_device_id="$(grub_get_device_id "${GRUB_DEVICE}")"
   fi
@@ -154,6 +171,13 @@ EOF
     sed "s/^/$submenu_indentation/" << EOF
 	echo	'$(echo "$message" | grub_quote)'
 	${module_loader}	--nounzip   $(echo $initrd_path)
+EOF
+  fi
+  if test -n "${xenpolicy}" ; then
+    message="$(gettext_printf "Loading XSM policy ...")"
+    sed "s/^/$submenu_indentation/" << EOF
+	echo	'$(echo "$message" | grub_quote)'
+	${module_loader}     ${rel_dirname}/${xenpolicy}
 EOF
   fi
   sed "s/^/$submenu_indentation/" << EOF
-- 
2.20.1


