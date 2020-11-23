Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F462C63798
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 18:01:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA2C20758
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 18:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="bKFYgvDL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DA2C20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.35003.66332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khG8s-0000nr-Un; Mon, 23 Nov 2020 18:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35003.66332; Mon, 23 Nov 2020 18:00:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khG8s-0000na-NE; Mon, 23 Nov 2020 18:00:46 +0000
Received: by outflank-mailman (input) for mailman id 35003;
 Mon, 23 Nov 2020 18:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khG8r-0000m8-3s
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khG8q-00070l-9n; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtn-0000at-Eg; Mon, 23 Nov 2020 17:45:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8r-0000m8-3s
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=z+TBph7KfTXS8lKGFLMVlUTRo1VQXbbt6hL6Ha7NBXk=; b=bKFYgvDLuvdd90sf0SQRz7YZW
	Gl3EccU45hARkXirfJb3fYJjKejcjZ2LAt1qj8UxFq4TL5XLSYVKhTrbkaMQj+3G5Rzi18zyTLpqA
	1eu1mKFyY8v09JBzZiDlsm9JqB5cj5owkxMy4Him1rUH83JGowtmNq0f1ZHCwYq7uuIfU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8q-00070l-9n; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtn-0000at-Eg; Mon, 23 Nov 2020 17:45:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 22/23] docs/man: modify xl-pci-configuration(5) to add 'name' field to PCI_SPEC_STRING
Date: Mon, 23 Nov 2020 17:45:02 +0000
Message-Id: <20201123174503.6800-23-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Since assignable devices can be named, a subsequent patch will support use
of a PCI_SPEC_STRING containing a 'name' parameter instead of a 'bdf'. In
this case the name will be used to look up the 'bdf' in the list of assignable
(or assigned) devices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 docs/man/xl-pci-configuration.5.pod | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index 4dd73bc498..db3360307c 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -51,7 +51,7 @@ is not specified, or if it is specified with an empty value (whether
 positionally or explicitly).
 
 B<NOTE>: In context of B<xl pci-detach> (see L<xl(1)>), parameters other than
-B<bdf> will be ignored.
+B<bdf> or B<name> will be ignored.
 
 =head1 Positional Parameters
 
@@ -70,7 +70,11 @@ B<*> to indicate all functions of a multi-function device.
 
 =item Default Value
 
-None. This parameter is mandatory as it identifies the device.
+None. This parameter is mandatory in its positional form. As a non-positional
+parameter it is also mandatory unless a B<name> parameter is present, in
+which case B<bdf> must not be present since the B<name> will be used to find
+the B<bdf> in the list of assignable devices. See L<xl(1)> for more information
+on naming assignable devices.
 
 =back
 
@@ -194,4 +198,21 @@ B<NOTE>: This overrides the global B<rdm> option.
 
 =back
 
+=item B<name>=I<STRING>
+
+=over 4
+
+=item Description
+
+This is the name given when the B<BDF> was made assignable. See L<xl(1)> for
+more information on naming assignable devices.
+
+=item Default Value
+
+None. This parameter must not be present if a B<bdf> parameter is present.
+If a B<bdf> parameter is not present then B<name> is mandatory as it is
+required to look up the B<BDF> in the list of assignable devices.
+
+=back
+
 =back
-- 
2.11.0


