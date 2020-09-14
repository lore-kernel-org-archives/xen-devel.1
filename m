Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC25C43461
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 12:39:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A04320759
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 12:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A04320759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnlI-0001eO-0H; Mon, 14 Sep 2020 12:39:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHnlG-0001eC-CE
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:39:10 +0000
X-Inumbo-ID: 1946bd0f-9534-4a5f-8dc1-6569f06bd3bc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1946bd0f-9534-4a5f-8dc1-6569f06bd3bc;
 Mon, 14 Sep 2020 12:39:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 259D7B2F5;
 Mon, 14 Sep 2020 12:39:24 +0000 (UTC)
Subject: [PATCH 2/3] x86/shim: adjust Kconfig defaults
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
Message-ID: <7eb74774-f8dc-ef97-c66d-0c4ac50ed9e0@suse.com>
Date: Mon, 14 Sep 2020 14:39:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just like HVM, defaulting SHADOW_PAGING and TBOOT to Yes in shim-
exclusive mode makes no sense, as the respective code is dead there.

Also adjust the shim default config file: It needs to specifiy values
only for settings where a non-default value is wanted.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -116,9 +116,9 @@ config XEN_SHSTK
 	  compatiblity can be provided via the PV Shim mechanism.
 
 config SHADOW_PAGING
-        bool "Shadow Paging"
-        default y
-        ---help---
+	bool "Shadow Paging"
+	default y if !PV_SHIM_EXCLUSIVE
+	---help---
 
           Shadow paging is a software alternative to hardware paging support
           (Intel EPT, AMD NPT).
@@ -165,8 +165,8 @@ config HVM_FEP
 	  If unsure, say N.
 
 config TBOOT
-	def_bool y
-	prompt "Xen tboot support" if EXPERT
+	bool "Xen tboot support" if EXPERT
+	default y if !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	---help---
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -8,12 +8,9 @@ CONFIG_NR_CPUS=32
 CONFIG_EXPERT=y
 CONFIG_SCHED_NULL=y
 # Disable features not used by the PV shim
-# CONFIG_HVM is not set
 # CONFIG_XEN_SHSTK is not set
 # CONFIG_HYPFS is not set
-# CONFIG_SHADOW_PAGING is not set
 # CONFIG_BIGMEM is not set
-# CONFIG_TBOOT is not set
 # CONFIG_KEXEC is not set
 # CONFIG_XENOPROF is not set
 # CONFIG_XSM is not set


