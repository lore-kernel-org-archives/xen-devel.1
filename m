Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F147AC11F6B
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E76613B7
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E76613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148728.274994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPm-00063p-5y; Thu, 01 Jul 2021 14:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148728.274994; Thu, 01 Jul 2021 14:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPl-00061q-So; Thu, 01 Jul 2021 14:11:37 +0000
Received: by outflank-mailman (input) for mailman id 148728;
 Thu, 01 Jul 2021 14:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPa-0005tj-1k
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25f2d19-cf1c-4c7d-836e-4235e74b1443;
 Thu, 01 Jul 2021 14:10:44 +0000 (UTC)
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
X-Inumbo-ID: f25f2d19-cf1c-4c7d-836e-4235e74b1443
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PhrWzllsmLHVtsvEGcbavRIVcyx12iALMT+0SLc+Lhs=;
  b=QDp7U/jDvk/GYunNHwWNG1Jbmm5eBEkeRjBJx55HcvbRjAJQSHtIBnxA
   maVvccfueKvfOpapATahyjuSl8Ww9O0K5eM/fBK6aoL1Pn+wObPRooyZe
   7TB/O3mNFSuKl/kcFOEtDIhfNn8VvPQXRtSeY488R4Ja+jPIwSyisb4lG
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EXPDeoC24V8gZrB7FKnrI6Hlp/UMZnCQskM3aLrQz5qmeKZoJKWdRMQtbs+qoED/o4hvORc5Zo
 1fggobvKcCsk61ozDgD2rc9452v19ekrMDIi988o8VhT6f3a9Sze0DCYqk3BdlK9NjCxECes1Y
 QsqKjq3yHLFPKBKpETAj+5pu9onZx0h24DDHEbN6vGnIl3BL5e2JUz1URQya6xXaFxUNCxKPR3
 WOQCrWldnhbyhv2uvezBX4cfqK/aC++ah8qPIDjBmkcOk4MaH/0EA/xONuiv1FYtjvLqKF1xlv
 zyg=
X-SBRS: 5.1
X-MesageID: 47755362
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kw4536p8biEpunqYJdebNQgaV5r5eYIsimQD101hICG9E/b4qy
 nAppwmPHPP4wr5eUtQ+uxoW5PvfZq/z/JICOAqVItKOjONhILBFvAG0WKI+VLd8kPFm9K1rp
 0BT0C1YOeAaWSTTq7BkW6F+6xL+qj/zEjy792ut0uECWpRGtxdB8IQMHf8LqWzLDM2fqbQ0/
 Knl7B6T87JQwV0UviG
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755362"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH v6 17/31] build: convert binfile use to if_changed
Date: Thu, 1 Jul 2021 15:09:57 +0100
Message-ID: <20210701141011.785641-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow to detect command line changes and allow to regenerate
the file in that case.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/common/Makefile    | 8 ++++++--
 xen/xsm/flask/Makefile | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 54de70d42278..93df3178b71f 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -80,8 +80,12 @@ config.gz: $(CONF_FILE)
 
 config_data.o: config.gz
 
-config_data.S: $(BASEDIR)/tools/binfile
-	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
+quiet_cmd_binfile = BINFILE $@
+cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data
+
+config_data.S: $(BASEDIR)/tools/binfile FORCE
+	$(call if_changed,binfile)
+targets += config_data.S
 
 clean::
 	rm -f config_data.S config.gz 2>/dev/null
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 637159ad8276..0ad15cb16606 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -35,8 +35,12 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 flask-policy.o: policy.bin
 
-flask-policy.S: $(BASEDIR)/tools/binfile
-	$(SHELL) $(BASEDIR)/tools/binfile -i $@ policy.bin xsm_flask_init_policy
+quiet_cmd_binfile = BINFILE $@
+cmd_binfile = $(SHELL) $< -i $@ policy.bin xsm_flask_init_policy
+
+flask-policy.S: $(BASEDIR)/tools/binfile FORCE
+	$(call if_changed,binfile)
+targets += flask-policy.S
 
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
-- 
Anthony PERARD


