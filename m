Return-Path: <SRS0=Dhy5=FM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF5DC19437
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 20:01:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18F723C40
	for <xen-devel@archiver.kernel.org>; Tue,  8 Dec 2020 20:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18F723C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.47772.84659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAS-0005Pb-H6; Tue, 08 Dec 2020 20:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47772.84659; Tue, 08 Dec 2020 20:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAQ-0005OB-LH; Tue, 08 Dec 2020 20:00:58 +0000
Received: by outflank-mailman (input) for mailman id 47772;
 Tue, 08 Dec 2020 20:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAE-0004pj-1u
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAD-00086s-B8; Tue, 08 Dec 2020 20:00:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihO-0001p0-Uv; Tue, 08 Dec 2020 19:30:59 +0000
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
	bh=kHLySQ+itOx1hiauIp8pIwnhad1Xuv7b9R5clDzcs+U=; b=6LKp47s9wKFE4yMHdI3ddHL7em
	G7Q9FNCvKRA1VkFCJG0xOSdrFHvt9gCr4kMyaKyWXCVzt33c0fFeQ8+S49JocEA7I1eBUJTPKa5lA
	/aJ1wQ4jhEIgAZI8oVw9jCMm9Nd2IxknhewWE17k7mSIf7FfyUcDGoI+BuEFTPgGd1w8=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 20/25] docs/man: modify xl(1) in preparation for naming of assignable devices
Date: Tue,  8 Dec 2020 19:30:28 +0000
Message-Id: <20201208193033.11306-21-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A subsequent patch will introduce code to allow a name to be specified to
'xl pci-assignable-add' such that the assignable device may be referred to
by than name in subsequent operations.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 docs/man/xl.1.pod.in | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index af31d2b5727a..f4779d8fd654 100644
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


