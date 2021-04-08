Return-Path: <SRS0=xlmN=JF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23838C433ED
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 12:22:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA3136115B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Apr 2021 12:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA3136115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107273.205085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTfw-0005Hb-3w; Thu, 08 Apr 2021 12:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107273.205085; Thu, 08 Apr 2021 12:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTfw-0005HU-08; Thu, 08 Apr 2021 12:22:20 +0000
Received: by outflank-mailman (input) for mailman id 107273;
 Thu, 08 Apr 2021 12:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTfu-0005HE-H6
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:22:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf8f449f-9a86-476a-9037-856b12ccccfc;
 Thu, 08 Apr 2021 12:22:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2243BB005;
 Thu,  8 Apr 2021 12:22:17 +0000 (UTC)
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
X-Inumbo-ID: bf8f449f-9a86-476a-9037-856b12ccccfc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yw8CWbx2pQJIEiz3GQW/HJc3UcPF7hTPHrhYjaL9Afc=;
	b=fbV0ORejrfI1vC5N37glstyj2ieCvn/yvOHuDv1Xs0lZN1N00myO81LBoMF/qK8VwJgWoR
	dgkQ3MlPeCrUPgN+hB+ca1Ffktw4CI0tZXFfHPurVvRrbKCRbgx+PCNtOAjn6026/4ZWCg
	BxTCN3wWIcg1YJsXoj0eO/55k9U1FjU=
Subject: [PATCH 10/11] video/lfb: avoid effectively open-coding
 xzalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <e08e0ccd-503b-f2f1-0391-763172060643@suse.com>
Date: Thu, 8 Apr 2021 14:22:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/video/lfb.c
+++ b/xen/drivers/video/lfb.c
@@ -147,8 +147,9 @@ int __init lfb_init(struct lfb_prop *lfb
 {
     lfb.lfbp = *lfbp;
 
-    lfb.lbuf = xmalloc_bytes(lfb.lfbp.bytes_per_line);
-    lfb.text_buf = xzalloc_bytes(lfb.lfbp.text_columns * lfb.lfbp.text_rows);
+    lfb.lbuf = xmalloc_array(unsigned char, lfb.lfbp.bytes_per_line);
+    lfb.text_buf = xzalloc_array(unsigned char,
+                                 lfb.lfbp.text_columns * lfb.lfbp.text_rows);
     lfb.line_len = xzalloc_array(unsigned int, lfb.lfbp.text_columns);
 
     if ( !lfb.lbuf || !lfb.text_buf || !lfb.line_len )


