Return-Path: <SRS0=Ja2z=AY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFA3C433E7
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2020 07:46:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341CF20674
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2020 07:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 341CF20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jut9j-00087i-Hb; Mon, 13 Jul 2020 07:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jut9i-000877-4R
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 07:45:42 +0000
X-Inumbo-ID: d6233408-c4dc-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6233408-c4dc-11ea-8496-bc764e2007e4;
 Mon, 13 Jul 2020 07:45:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9652AC82;
 Mon, 13 Jul 2020 07:45:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] mini-os: don't hard-wire xen internal paths
Date: Mon, 13 Jul 2020 09:45:31 +0200
Message-Id: <20200713074531.27547-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Mini-OS shouldn't use Xen internal paths for building. Import the
needed paths from Xen and fall back to the current values only if
the import was not possible.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 15 ++++++++++++++-
 Makefile  | 35 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/Config.mk b/Config.mk
index f6a2afa..cb823c2 100644
--- a/Config.mk
+++ b/Config.mk
@@ -33,6 +33,19 @@ endif
 #
 ifneq ($(XEN_ROOT),)
 MINIOS_ROOT=$(XEN_ROOT)/extras/mini-os
+
+-include $(XEN_ROOT)/stubdom/mini-os.mk
+
+XENSTORE_CPPFLAGS ?= -isystem $(XEN_ROOT)/tools/xenstore/include
+TOOLCORE_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore
+TOOLLOG_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog
+EVTCHN_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn
+GNTTAB_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
+CALL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
+FOREIGNMEMORY_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
+DEVICEMODEL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
+CTRL_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
+GUEST_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
 else
 MINIOS_ROOT=$(TOPLEVEL_DIR)
 endif
@@ -93,7 +106,7 @@ DEF_CPPFLAGS += -D__MINIOS__
 ifeq ($(libc),y)
 DEF_CPPFLAGS += -DHAVE_LIBC
 DEF_CPPFLAGS += -isystem $(MINIOS_ROOT)/include/posix
-DEF_CPPFLAGS += -isystem $(XEN_ROOT)/tools/xenstore/include
+DEF_CPPFLAGS += $(XENSTORE_CPPFLAGS)
 endif
 
 ifneq ($(LWIPDIR),)
diff --git a/Makefile b/Makefile
index be640cd..82422a5 100644
--- a/Makefile
+++ b/Makefile
@@ -125,23 +125,24 @@ OBJS := $(filter-out $(OBJ_DIR)/lwip%.o $(LWO), $(OBJS))
 
 ifeq ($(libc),y)
 ifeq ($(CONFIG_XC),y)
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore -whole-archive -lxentoolcore -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore/libxentoolcore.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog -whole-archive -lxentoollog -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog/libxentoollog.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn -whole-archive -lxenevtchn -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn/libxenevtchn.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab -whole-archive -lxengnttab -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab/libxengnttab.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call -whole-archive -lxencall -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call/libxencall.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory -whole-archive -lxenforeignmemory -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel -whole-archive -lxendevicemodel -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel/libxendevicemodel.a
-APP_LDLIBS += -L$(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH) -whole-archive -lxenguest -lxenctrl -no-whole-archive
-LIBS += $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)/libxenctrl.a
-LIBS += $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)/libxenguest.a
+APP_LDLIBS += -L$(TOOLCORE_PATH) -whole-archive -lxentoolcore -no-whole-archive
+LIBS += $(TOOLCORE_PATH)/libxentoolcore.a
+APP_LDLIBS += -L$(TOOLLOG_PATH) -whole-archive -lxentoollog -no-whole-archive
+LIBS += $(TOOLLOG_PATH)/libxentoollog.a
+APP_LDLIBS += -L$(EVTCHN_PATH) -whole-archive -lxenevtchn -no-whole-archive
+LIBS += $(EVTCHN_PATH)/libxenevtchn.a
+APP_LDLIBS += -L$(GNTTAB_PATH) -whole-archive -lxengnttab -no-whole-archive
+LIBS += $(GNTTAB_PATH)/libxengnttab.a
+APP_LDLIBS += -L$(CALL_PATH) -whole-archive -lxencall -no-whole-archive
+LIBS += $(XCALL_PATH)/libxencall.a
+APP_LDLIBS += -L$(FOREIGNMEMORY_PATH) -whole-archive -lxenforeignmemory -no-whole-archive
+LIBS += $(FOREIGNMEMORY_PATH)/libxenforeignmemory.a
+APP_LDLIBS += -L$(DEVICEMODEL_PATH) -whole-archive -lxendevicemodel -no-whole-archive
+LIBS += $(DEVICEMODEL_PATH)/libxendevicemodel.a
+APP_LDLIBS += -L$(GUEST_PATH) -whole-archive -lxenguest -no-whole-archive
+LIBS += $(GUEST_PATH)/libxenguest.a
+APP_LDLIBS += -L$(CTRL_PATH) -whole-archive -lxenctrl -no-whole-archive
+LIBS += $(CTRL_PATH)/libxenctrl.a
 endif
 APP_LDLIBS += -lpci
 APP_LDLIBS += -lz
-- 
2.26.2


