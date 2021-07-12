Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824BEC07E99
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 20:28:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD03611B0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 20:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD03611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154794.285933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32XV-0003Fk-5c; Mon, 12 Jul 2021 20:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154794.285933; Mon, 12 Jul 2021 20:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32XV-0003Fd-2k; Mon, 12 Jul 2021 20:28:29 +0000
Received: by outflank-mailman (input) for mailman id 154794;
 Mon, 12 Jul 2021 20:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32XT-0002d1-TJ
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:28:27 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d46873e7-58be-4c02-995b-cdbd467750bd;
 Mon, 12 Jul 2021 20:28:20 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626121631731159.05291359206763;
 Mon, 12 Jul 2021 13:27:11 -0700 (PDT)
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
X-Inumbo-ID: d46873e7-58be-4c02-995b-cdbd467750bd
ARC-Seal: i=1; a=rsa-sha256; t=1626121633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kLdJdIu2B0sLjxgDl0cXV5ahlraberDEFR87mh1XZs9TlmMNaZunpWNjNq02oBNQycG5VG9+Fc3SrBKprpLIKXCFTFBie4a7FVI9VRV7UqpOPmbDh2l5I4MsvBlCm01m2MgpkJvrnmf9FbavQMIusRT0tdUICk/qW6gjPvrF+Mo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121633; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DGzgCbEHasEIauV+Grt/GSDN45RLCvReoOth5bQGsrA=; 
	b=nufHYMT4eSltdL2thnqcZqiN19ON6WU6lFW7sEDVzoq0+wvnOQU5NqUzaHZ5MW9jYzgmqeAc5u7VIYedev3ZF55bpZZZjtW2xwG0ithFloGci/YD0ckmH7AZjXAYDjhvLZ3lXC8SaMC45K2+F4XNeZLyaX2vsLab/rrOanzyVE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121633;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DGzgCbEHasEIauV+Grt/GSDN45RLCvReoOth5bQGsrA=;
	b=k05zMi0++lXNBT/DGe/jzY7TQLwS94Fs6aAVtZClVGJmJfTbhmHDkk/Dtqo0lw0a
	14Wq27Y+gsOphTXoDcFrSx5Oh4fg0wCi9OyvjURR4t9/LiM/w52ObDewf8cJ3ftLvPX
	/k/mvwJEFMzF/Ad34rg0QY9BOIZSBjbk+JC7Xsqg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/10] xsm: drop generic event channel labeling
Date: Mon, 12 Jul 2021 16:32:30 -0400
Message-Id: <20210712203233.20289-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The generic event channel labeling has not been used by any XSM module since
its introduction. This commit removes the capability leaving FLASK labeling
field always present. In the future if a new XSM module needs to have its own
channel label, this or a new form can be introduced.
---
 xen/common/Kconfig      | 8 --------
 xen/include/xen/sched.h | 9 ---------
 2 files changed, 17 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3b50391392..d03a991183 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -202,17 +202,9 @@ config XENOPROF
 
 menu "Xen Security Modules"
 
-config XSM_EVTCHN_LABELING
-	bool "Enables security labeling of event channels"
-	default n
-	help
-	  This enables an XSM module to label and enforce access control over
-	  event channels.
-
 config XSM_FLASK
 	bool "FLux Advanced Security Kernel support"
 	default n
-	select XSM_EVTCHN_LABELING
 	help
 	  Enables FLASK (FLux Advanced Security Kernel) as the access control
 	  mechanism used by the XSM framework.  This provides a mandatory access
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index aecf0b8424..ef6ba6d791 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -120,15 +120,7 @@ struct evtchn
     unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
     uint32_t fifo_lastq;           /* Data for identifying last queue. */
 
-#ifdef CONFIG_XSM_EVTCHN_LABELING
     union {
-#ifdef XSM_NEED_GENERIC_EVTCHN_SSID
-        /*
-         * If an XSM module needs more space for its event channel context,
-         * this pointer stores the necessary data for the security server.
-         */
-        void *generic;
-#endif
 #ifdef CONFIG_XSM_FLASK
         /*
          * Inlining the contents of the structure for FLASK avoids unneeded
@@ -138,7 +130,6 @@ struct evtchn
         uint32_t flask_sid;
 #endif
     } ssid;
-#endif
 } __attribute__((aligned(64)));
 
 int  evtchn_init(struct domain *d, unsigned int max_port);
-- 
2.20.1


