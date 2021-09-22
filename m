Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DD3C433F5
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 01:41:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBBB60FC1
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 01:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDBBB60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=greensocs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.193247.344208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTDk7-0004u3-NY; Thu, 23 Sep 2021 01:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193247.344208; Thu, 23 Sep 2021 01:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTDk7-0004tZ-I6; Thu, 23 Sep 2021 01:41:43 +0000
Received: by outflank-mailman (input) for mailman id 193247;
 Thu, 23 Sep 2021 01:41:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTDk4-0004qi-R7
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 01:41:41 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64ff03ca-1c0f-11ec-ba03-12813bfff9fa;
 Thu, 23 Sep 2021 01:41:39 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4B88C21EC3;
 Wed, 22 Sep 2021 16:15:50 +0000 (UTC)
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
X-Inumbo-ID: 64ff03ca-1c0f-11ec-ba03-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pOou7ntZwf6jxxWFcKHppVKqRu0dT3fZc00S/uH+MyA=;
	b=5bk6PS2OqJmvZzhaI9CocH6KgDJLjQ0sST8dAep+XnkbKqazJzdfin3fRbNcoCFIIJ4LDG
	GoegIeSg8nXubLp4NmRiWtEy9I5diF4x3MSZmpTdsP6bl5Lp7T8uGdnf7mcsqHi+kAZIk3
	qGWjcdZLReG9SyIDa9sXiR3hURGJtcE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org,
	mark.burton@greensocs.com,
	mirela.grujic@greensocs.com,
	edgari@xilinx.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 06/16] qapi: Allow device_add to execute in machine initialized phase
Date: Wed, 22 Sep 2021 18:13:55 +0200
Message-Id: <20210922161405.140018-7-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

From: Mirela Grujic <mirela.grujic@greensocs.com>

To configure a machine using QMP we need the device_add command to
execute at machine initialized phase.

Note: for device_add command in qdev.json adding the 'allow-init-config'
option has no effect because the command appears to bypass QAPI (see
TODO at qapi/qdev.json:61). The option is added there solely to document
the intent.
For the same reason, the flags have to be explicitly set in
monitor_init_qmp_commands() when the device_add command is registered.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---

The commit is fine, but we may add intermediate commits before this one
in order to add or change the condition for a device type to be accepted
in the 'initialized' state (see the cover-letter of the series).
---
 qapi/qdev.json         | 3 ++-
 monitor/misc.c         | 2 +-
 softmmu/qdev-monitor.c | 6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..ad669ae175 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -67,7 +67,8 @@
 ##
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
-  'gen': false } # so we can get the additional arguments
+  'gen': false, # so we can get the additional arguments
+  'allow-preconfig': true }
 
 ##
 # @device_del:
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..2c476de316 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -231,7 +231,7 @@ static void monitor_init_qmp_commands(void)
     qmp_init_marshal(&qmp_commands);
 
     qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
-                         QCO_NO_OPTIONS);
+                         QCO_ALLOW_PRECONFIG);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 834f2b56b5..47ccd90be8 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -824,6 +824,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     QemuOpts *opts;
     DeviceState *dev;
 
+    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
+        error_setg(errp, "The command is permitted only after "
+                         "the machine is initialized");
+        return;
+    }
+
     opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
     if (!opts) {
         return;
-- 
2.33.0


