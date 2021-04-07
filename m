Return-Path: <SRS0=v/14=JE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EE5C433ED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 09:56:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F78061394
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 09:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F78061394
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106585.203812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4vE-0007WC-Nm; Wed, 07 Apr 2021 09:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106585.203812; Wed, 07 Apr 2021 09:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU4vE-0007W5-JG; Wed, 07 Apr 2021 09:56:28 +0000
Received: by outflank-mailman (input) for mailman id 106585;
 Wed, 07 Apr 2021 09:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU4vC-0007Vz-Mp
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 09:56:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1920951-635e-406a-92aa-31e5104af2a5;
 Wed, 07 Apr 2021 09:56:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14AE2B07B;
 Wed,  7 Apr 2021 09:56:25 +0000 (UTC)
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
X-Inumbo-ID: a1920951-635e-406a-92aa-31e5104af2a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617789385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T+NS1lM1LbDG6QvBxPVAcgzdIHwWaQ9d4lnj+1Jzgho=;
	b=DIn2n7R9f/QtJT9gXHkvRCmo3lkbVJWus1emc7IswccP/I/9ej50g2dQdD0s+faGf1GxQr
	UvjubDLgf/8rla4IW9VVxm4Xi5r/R+cONgtBGEC15Jlpg0vnv2q/4DdR/v/0vmn3WIwsoY
	T3utv/mHK52gfvKr3WDOIpEwb/zxoJA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] docs: release-technician-checklist: update to leaf tree
 version pinning
Message-ID: <adc2ba4f-81b9-9841-a53c-8c52278ae62a@suse.com>
Date: Wed, 7 Apr 2021 11:56:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Our releases look to flip-flop between keeping or discarding the date
and title of the referenced qemu-trad commit. I think with the hash
replaced by a tag, the commit's date and title would better also be
purged.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I've been noticing this inconsistency repeatedly because I simply re-use
version update patches for the stable trees - the context mismatch
results in a such updated patch to then not apply, due to said flip-
flopping. For 4.15 I'm inclined to drop the two offending lines perhaps
while updating the version to 4.15.1-pre.

--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -53,6 +53,7 @@
 #   QEMU_UPSTREAM_REVISION,
 #   QEMU_TRADITIONAL_REVISION
 #   MINIOS_UPSTREAM_REVISION
+#     (drop any references to the specific commits, e.g. date or title)
 * change SUPPORT.md heading version number; -unstable or -rc tag
 *     (empty in stable branches after .0 release).
 * SUPPORT.md: insert correct version number in release-notes link

