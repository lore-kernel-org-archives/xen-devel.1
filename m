Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D2C193FE
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 14:56:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660C020838
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 14:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 660C020838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43595.78384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpdC-0002WD-CS; Thu, 03 Dec 2020 14:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43595.78384; Thu, 03 Dec 2020 14:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpdB-0002V5-Ge; Thu, 03 Dec 2020 14:30:49 +0000
Received: by outflank-mailman (input) for mailman id 43595;
 Thu, 03 Dec 2020 14:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpd7-0002Nz-T2
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpd7-0006UB-5W; Thu, 03 Dec 2020 14:30:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYS-00015c-HK; Thu, 03 Dec 2020 14:25:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=uc5JF4Aw3pRQS5p/Kqsvv3JLTlI3UZvcoVyjRuBT19E=; b=ni+xR/2s0ypTiaPZl2MQim2ZYv
	vLUYxnJMgmF0xkH09F7XnADzdfhQZuaanv+P8p3dgr+mLhudocMkUmBCFXwbEI0gPcDJUnecaZTwO
	yakLmhTFRgCY4OyxZ+vcJOe4sUkw7ZpkzCqlQp39tXAEHyZn8pisxEBznfqovzxfe9x4=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 20/23] docs/man: modify xl(1) in preparation for naming of assignable devices
Date: Thu,  3 Dec 2020 14:25:31 +0000
Message-Id: <20201203142534.4017-21-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A subsequent patch will introduce code to allow a name to be specified to
'xl pci-assignable-add' such that the assignable device may be referred to
by than name in subsequent operations.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl.1.pod.in | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index c5fbce3b5c4b..0822a5842835 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1595,19 +1595,23 @@ List virtual network interfaces for a domain.
 
 =over 4
 
-=item B<pci-assignable-list>
+=item B<pci-assignable-list> [I<-n>]
 
 List all the B<BDF> of assignable PCI devices. See
-L<xl-pci-configuration(5)> for more information.
+L<xl-pci-configuration(5)> for more information. If the -n option is
+specified then any name supplied when the device was made assignable
+will also be displayed.
 
 These are devices in the system which are configured to be
 available for passthrough and are bound to a suitable PCI
 backend driver in domain 0 rather than a real driver.
 
-=item B<pci-assignable-add> I<BDF>
+=item B<pci-assignable-add> [I<-n NAME>] I<BDF>
 
 Make the device at B<BDF> assignable to guests. See
-L<xl-pci-configuration(5)> for more information.
+L<xl-pci-configuration(5)> for more information. If the -n option is
+supplied then the assignable device entry will the named with the
+given B<NAME>.
 
 This will bind the device to the pciback driver and assign it to the
 "quarantine domain".  If it is already bound to a driver, it will
@@ -1622,10 +1626,11 @@ not to do this on a device critical to domain 0's operation, such as
 storage controllers, network interfaces, or GPUs that are currently
 being used.
 
-=item B<pci-assignable-remove> [I<-r>] I<BDF>
+=item B<pci-assignable-remove> [I<-r>] I<BDF>|I<NAME>
 
-Make the device at B<BDF> not assignable to guests. See
-L<xl-pci-configuration(5)> for more information.
+Make a device non-assignable to guests. The device may be identified
+either by its B<BDF> or the B<NAME> supplied when the device was made
+assignable. See L<xl-pci-configuration(5)> for more information.
 
 This will at least unbind the device from pciback, and
 re-assign it from the "quarantine domain" back to domain 0.  If the -r
-- 
2.20.1


