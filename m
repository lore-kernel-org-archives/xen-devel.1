Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA77C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 14:01:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BCFC23A69
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 14:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BCFC23A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67036.119317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03BX-0007GX-El; Thu, 14 Jan 2021 14:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67036.119317; Thu, 14 Jan 2021 14:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03BX-0007GQ-Bk; Thu, 14 Jan 2021 14:01:11 +0000
Received: by outflank-mailman (input) for mailman id 67036;
 Thu, 14 Jan 2021 14:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l03BW-0007GL-J3
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 14:01:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de20bc0a-eb8c-440e-95fb-f8a31c718429;
 Thu, 14 Jan 2021 14:01:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DAA8ACB0;
 Thu, 14 Jan 2021 14:01:05 +0000 (UTC)
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
X-Inumbo-ID: de20bc0a-eb8c-440e-95fb-f8a31c718429
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610632865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozV+NI5tJw/UDqRBwSjSuM2/yJJ8OSfM2DDUK0Itn6A=;
	b=TlU/iV0/2lOkYm+I3mD7V1rP/0kFhrvYrFySS5m9s+tHP9zJhnErkxZSPXPxYOegsj+FaZ
	B/bXupI37yIA/if1oxxk/SZkllIGAaNgcuhs6JE60FwcNWqqXzzLSqQw37bQ9gbX4m+RJH
	HEqqLOlcqUNa+RkZvnkZboRIgMbP7/I=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] argo: don't leak stack contents when returning ring info
Message-ID: <a2621d1e-dd52-4e46-9e4b-dffd94e73993@suse.com>
Date: Thu, 14 Jan 2021 15:01:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The max_message_size field of the output gets filled only when the flags
field is non-zero. Don't copy back uninitialized data to guest context.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1405,7 +1405,8 @@ fill_ring_data(const struct domain *curr
         rcu_unlock_domain(dst_d);
 
     if ( !ret && (__copy_field_to_guest(data_ent_hnd, &ent, flags) ||
-                  __copy_field_to_guest(data_ent_hnd, &ent, max_message_size)) )
+                  (ent.flags &&
+                   __copy_field_to_guest(data_ent_hnd, &ent, max_message_size))) )
         return -EFAULT;
 
     return ret;

