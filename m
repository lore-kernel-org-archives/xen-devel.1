Return-Path: <SRS0=cIP9=CB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C87C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 09:37:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB962075B
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 09:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFB962075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mQb-00067I-V7; Sun, 23 Aug 2020 09:36:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQH-0004t9-T7
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:21 +0000
X-Inumbo-ID: 3b359747-b860-4779-8c0d-9e54c9bfffa8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b359747-b860-4779-8c0d-9e54c9bfffa8;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80451ADE0;
 Sun, 23 Aug 2020 09:35:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 31/38] tools/libxl: fix dependencies of libxl tests
Date: Sun, 23 Aug 2020 11:35:12 +0200
Message-Id: <20200823093519.18386-32-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Today building the libxl internal tests depends on libxlutil having
been built, in spite of the tests not using any functionality og
libxlutil. Fix this by dropping the dependency.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxl/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 65f3968947..1541d25f72 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -317,14 +317,14 @@ libxlutil.so.$(XLUMAJOR).$(XLUMINOR): $(LIBXLU_OBJS) libxenlight.so
 libxlutil.a: $(LIBXLU_OBJS)
 	$(AR) rcs libxlutil.a $^
 
-test_%: test_%.o test_common.o libxlutil.so libxenlight_test.so
+test_%: test_%.o test_common.o libxenlight_test.so
 	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
 
 libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
-testidl: testidl.o libxlutil.so libxenlight.so
-	$(CC) $(LDFLAGS) -o $@ testidl.o libxlutil.so $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
+testidl: testidl.o libxenlight.so
+	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.26.2


