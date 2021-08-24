Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A11C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:01:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3EB6115A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 11:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D3EB6115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.170960.312075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUB3-0003GS-FC; Tue, 24 Aug 2021 11:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170960.312075; Tue, 24 Aug 2021 11:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUB3-0003GH-Bs; Tue, 24 Aug 2021 11:01:09 +0000
Received: by outflank-mailman (input) for mailman id 170960;
 Tue, 24 Aug 2021 11:01:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4S-0001EC-F1
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e617b9b-5a5e-4494-8b72-22f8ebac187a;
 Tue, 24 Aug 2021 10:52:19 +0000 (UTC)
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
X-Inumbo-ID: 8e617b9b-5a5e-4494-8b72-22f8ebac187a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Egvo0J+VmflXfAlaJgCtB/ylgXyk2Ou1lKw+xDQ2zOE=;
  b=CnLfuk9U2LaijG36A7donSzpU+9S4coJpYh6wmEaDmtjprHtheT8Pak9
   4JmrKEkkNhknilAbvKic0MEgshJAIUDZgzbk/RlYItAPFn9uU3U0j6PuL
   FMAciOArGPjaK7jeAc7ABhGkYSBcH1AeikyMFspg+yHWCDAJpL2DtlMCC
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MrliczgKjkZzflRwdjnCOG5/Va3dupq6Bhxuiu6S5anisuXDaTyeSkrI2Z4YI3y+DaeOals0fR
 me7Me/eRTASKPtaeFwQNCN0lQSyK9ZmrOYXNJQqeaUDDfU5cWmGtAObdohMN0c4kIeBx/czBy+
 QSdvarpCoLWMPMErAlydFbxLzGJwsa2ISNtmO1dUEfwIkY65vXELSJprWs479LGI/E3QhjC2Co
 UCYHLPJClaCBLivQ1FFbsLZdDnO5sFHHBt1lfxaUqVGLikv7CVlCo5qoMeXhW+XttGLSKpNP1V
 KBFkZbDZz3+7ssJDHfmfWxkQ
X-SBRS: 5.1
X-MesageID: 51130801
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+pO/KaABhTwsDlLlHegQsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssHFJo7C90dq7MArhHP9OkMIs1NiZLW3bUQeTQr2KjrGSiQEIeReOkdK1vJ
 0IG8QQNDSaNykYsS+O2njcLz9W+qjkzEnHv4bj5kYoaTsvR7Br7g9/BAreOFZxXhN6CZ0wE4
 fZztZbphK7EE5nIviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY5BEDSDlCqI1Svl
 Qt0jaJqJlLgcvLiiM05FWjrKi+X+GRiOerMfb8y/T97A+czzpAKr4RH4Fq9wpF2N1HoGxa6+
 Uk5S1QcvibokmhBF2dsF/j3RLt3y0p7GKnwViEgWH7qci8Xz4iDdFd7LgpBCcxxnBQyO2U6p
 g7qF5xdqAnfC/ojWD4/ZzFRhtqnk27rT4rlvMSlWVWVc8bZKVKpYIS8UtJGNNYdRiKoLwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23xdnWx/zUEf2MsD901wva4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+tBmnEUXv3QRevyJTcZdM60lf22uDKCZkOlZ2Xka0zvegPcc
 76IS5lXEYJCj3TINzLx5tW7xyIW3m5UV3Wu7Fj26Q=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130801"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 44/51] build: add $(srctree) in few key places
Date: Tue, 24 Aug 2021 11:50:31 +0100
Message-ID: <20210824105038.1257926-45-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds $(srctree) to a few path where make's VPATH=$(srctree) won't
apply.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/arch.mk   | 2 +-
 xen/build.mk           | 4 ++--
 xen/include/Makefile   | 4 ++--
 xen/xsm/flask/Makefile | 8 ++++----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 53b48ded28de..f0dc6820f85c 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -63,7 +63,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 efi-check-o = arch/x86/efi/check.o
 
 # Check if the compiler supports the MS ABI.
-XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(efi-check-o:.o=.c) -o $(efi-check-o),y)
+XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check-o:.o=.c) -o $(efi-check-o),y)
 
 # Check if the linker supports PE.
 EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
diff --git a/xen/build.mk b/xen/build.mk
index 537c32f42d25..0f9d718709b7 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -25,9 +25,9 @@ define cmd_compile.h
 	    -e 's/@@version@@/$(XEN_VERSION)/g' \
 	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
 	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
-	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
+	    -e 's!@@changeset@@!$(shell $(srctree)/tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
 	    < $< > $(dot-target).tmp; \
-	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
+	sed -rf $(srctree)/tools/process-banner.sed < .banner >> $(dot-target).tmp; \
 	mv -f $(dot-target).tmp $@; \
     fi
 endef
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 341196306abd..0b72c129da69 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -51,7 +51,7 @@ $(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
 
 $(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(src)/xlat.lst <$< >$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(srctree)/$(src)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
 $(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh $(src)/Makefile
@@ -67,7 +67,7 @@ $(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(src)/xlat.lst | uniq)
+xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srctree)/$(src)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
 $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(src)/Makefile
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index bff36aa97918..56aed07e27fe 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -8,8 +8,8 @@ CFLAGS-y += -I$(obj)/include
 
 AWK = awk
 
-FLASK_H_DEPEND := $(addprefix $(src)/policy/,security_classes initial_sids)
-AV_H_DEPEND = $(src)/policy/access_vectors
+FLASK_H_DEPEND := $(addprefix $(srctree)/$(src)/policy/,security_classes initial_sids)
+AV_H_DEPEND = $(srctree)/$(src)/policy/access_vectors
 
 FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
 AV_H_FILES := av_perm_to_string.h av_permissions.h
@@ -18,14 +18,14 @@ ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
 $(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
 extra-y += $(ALL_H_FILES)
 
-mkflask := $(src)/policy/mkflask.sh
+mkflask := $(srctree)/$(src)/policy/mkflask.sh
 quiet_cmd_mkflask = MKFLASK $@
 cmd_mkflask = $(SHELL) $(mkflask) $(AWK) $(obj)/include $(FLASK_H_DEPEND)
 
 $(addprefix $(obj)/%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
-mkaccess := $(src)/policy/mkaccess_vector.sh
+mkaccess := $(srctree)/$(src)/policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
 cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(obj)/include $(AV_H_DEPEND)
 
-- 
Anthony PERARD


