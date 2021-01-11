Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A88FC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 17:50:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94FA20738
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 17:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94FA20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65268.115709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1L6-0007jh-7K; Mon, 11 Jan 2021 17:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65268.115709; Mon, 11 Jan 2021 17:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1L6-0007jY-3u; Mon, 11 Jan 2021 17:50:48 +0000
Received: by outflank-mailman (input) for mailman id 65268;
 Mon, 11 Jan 2021 17:50:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1E7-0002a6-1O
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:35 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c65e824-aa95-492f-a39b-6908ed7b7505;
 Mon, 11 Jan 2021 17:42:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgRM3F
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:27 +0100 (CET)
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
X-Inumbo-ID: 1c65e824-aa95-492f-a39b-6908ed7b7505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386964;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=9pjTvN2SDiVoAmd9HAK4WC99qoqIwJCGptpIVjUyIgE=;
	b=HjX4tyGOdwTuV0w53C62CtS0mhov8/dpwOpBQbrd6ryRGy264G73vH+si/NokSWnWt
	aRUNUchl8K42i1bte9liqzrbKXYOta7VtAi4K81en5oqZZWhPtnQgon1qos0wnDeajJK
	SM3o61de4U4D4hS1Vs+o2PYbVMmGR4uUaBsEphMEhj5R8Tjjt///H9MEXsp9z/Lu/eUM
	oZW6+R/yqYh22oXbiUtnftS9HBAySZbSj/2wB/i94FSNuNY6VAnj++Lo/igXElxu0s6E
	DzwjsRGqpVjAPMa2F0SRkMvJNW8Nh3ieMwWThSgVgz9rqXAzLvOfySflr5TiyRmpYBE0
	VoBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v20210111 01/39] stubdom: fix tpm_version
Date: Mon, 11 Jan 2021 18:41:46 +0100
Message-Id: <20210111174224.24714-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is just a declaration, not a variable.

ld: /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpm_cmd_handler.o):(.bss+0x0): multiple definition of `tpm_version'; /home/abuild/rpmbuild/BUILD/xen-4.14.20200616T103126.3625b04991/non-dbg/stubdom/vtpmmgr/vtpmmgr.a(vtpmmgr.o):(.bss+0x0): first defined here

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 stubdom/vtpmmgr/vtpmmgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/vtpmmgr/vtpmmgr.h b/stubdom/vtpmmgr/vtpmmgr.h
index 2e6f8de9e4..f40ca9fd67 100644
--- a/stubdom/vtpmmgr/vtpmmgr.h
+++ b/stubdom/vtpmmgr/vtpmmgr.h
@@ -53,7 +53,7 @@
 enum {
     TPM1_HARDWARE = 1,
     TPM2_HARDWARE,
-} tpm_version;
+};
 
 struct tpm_hardware_version {
     int hw_version;

