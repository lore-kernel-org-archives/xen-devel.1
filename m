Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8B5C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 15:31:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C355D206C2
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 15:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C355D206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76154.137284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mnJ-0001iy-BS; Wed, 27 Jan 2021 15:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76154.137284; Wed, 27 Jan 2021 15:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mnJ-0001ir-7i; Wed, 27 Jan 2021 15:31:45 +0000
Received: by outflank-mailman (input) for mailman id 76154;
 Wed, 27 Jan 2021 15:31:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4mnH-0001il-OL
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:31:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 559a7538-2135-45a0-a322-70911f12ea35;
 Wed, 27 Jan 2021 15:31:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BF5BADE0;
 Wed, 27 Jan 2021 15:31:42 +0000 (UTC)
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
X-Inumbo-ID: 559a7538-2135-45a0-a322-70911f12ea35
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611761502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+xMr8r59GC8l/0GawA88vKREQ5w6lVwfXZx8ItnU74Q=;
	b=IGOSkn5vnbOa7M8tCdR77wM2BS0JyMIR11buvsmATUnpcrsX9zdsHkyGJ68sbM/Ngh0NOD
	aIausovsvGACHkSBpMkOuOAQc+8AOjD+q/wwtWuIZqmga/YXTeoXi3HCER/M0ClLqSpD8v
	8MFlG65a0FRQVEkJJUlGJYKFLxAfQrM=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxlutil: avoid almost-undefined behavior
Message-ID: <1d735cfa-d011-c8f5-ff39-81e0227e3a5d@suse.com>
Date: Wed, 27 Jan 2021 16:31:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While only value computations of an object are disallowed in the
presence of another unsequenced side effect, at least gcc 4.3 looks to
extend this to taking the object's address. The resulting warning causes
the build to fail, because of -Werror.

While there also correct an adjacent comment.

Fixes: bdc0799fe26a ("libxlu: introduce xlu_pci_parse_spec_string()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -155,9 +155,10 @@ int xlu_pci_parse_spec_string(XLU_Config
     if (!ret) {
         bdf_present = true;
 
-        /* Check whether 'vslot' if present */
+        /* Check whether 'vslot' is present */
         if (*ptr == '@') {
-            ret = parse_vslot(&pci->vdevfn, ++ptr, &ptr);
+            ++ptr;
+            ret = parse_vslot(&pci->vdevfn, ptr, &ptr);
             if (ret)
                 return ret;
         }

