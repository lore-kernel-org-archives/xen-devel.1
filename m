Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F5FC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 17:01:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A60B64F2E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 17:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A60B64F2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95623.180564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJfiz-0001II-1w; Tue, 09 Mar 2021 17:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95623.180564; Tue, 09 Mar 2021 17:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJfiy-0001IB-V7; Tue, 09 Mar 2021 17:00:48 +0000
Received: by outflank-mailman (input) for mailman id 95623;
 Tue, 09 Mar 2021 17:00:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJfix-0001I6-FO
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 17:00:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d535eb3-32fe-49f4-a0dd-89e450590a87;
 Tue, 09 Mar 2021 17:00:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8959FAEBD;
 Tue,  9 Mar 2021 17:00:45 +0000 (UTC)
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
X-Inumbo-ID: 8d535eb3-32fe-49f4-a0dd-89e450590a87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615309245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dU5QsM3WvQuC5eyrehfrQFR2D70sAZqFXdDdpQ0tB6A=;
	b=Rnu8+dcJ4g3u2jbhRDQ4GCyFt8Y4eKvyoPpKV74hafTyZU8ts01FDHsj/hRn6hBfHE1jLx
	XWU19QmrvbqPmQmhvsUfPUgQOkQ42PMg2xbQd3dBDdzLl+SzN44DKNNACLeA+7UXOOOio4
	hfQ5qkiWHki/iKFknu68k/SenO9ii4g=
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Xen: drop exports of {set,clear}_foreign_p2m_mapping()
Message-ID: <746a5cd6-1446-eda4-8b23-03c1cac30b8d@suse.com>
Date: Tue, 9 Mar 2021 18:00:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

They're only used internally, and the layering violation they contain
(x86) or imply (Arm) of calling HYPERVISOR_grant_table_op() strongly
advise against any (uncontrolled) use from a module. The functions also
never had users except the ones from drivers/xen/grant-table.c forever
since their introduction in 3.15.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It's not clear to me why Arm doesn't have merely stubs just like x86 has
when PV support is disabled.

--- a/arch/arm/xen/p2m.c
+++ b/arch/arm/xen/p2m.c
@@ -130,7 +130,6 @@ int set_foreign_p2m_mapping(struct gntta
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(set_foreign_p2m_mapping);
 
 int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 			      struct gnttab_unmap_grant_ref *kunmap_ops,
@@ -145,7 +144,6 @@ int clear_foreign_p2m_mapping(struct gnt
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(clear_foreign_p2m_mapping);
 
 bool __set_phys_to_machine_multi(unsigned long pfn,
 		unsigned long mfn, unsigned long nr_pages)
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -776,7 +776,6 @@ int set_foreign_p2m_mapping(struct gntta
 out:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(set_foreign_p2m_mapping);
 
 int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 			      struct gnttab_unmap_grant_ref *kunmap_ops,
@@ -802,7 +801,6 @@ int clear_foreign_p2m_mapping(struct gnt
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(clear_foreign_p2m_mapping);
 
 #ifdef CONFIG_XEN_DEBUG_FS
 #include <linux/debugfs.h>

