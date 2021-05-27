Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD04C47089
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 12:34:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F01B61248
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 12:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F01B61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133132.248228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFDh-000718-8R; Thu, 27 May 2021 12:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133132.248228; Thu, 27 May 2021 12:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFDh-000711-5S; Thu, 27 May 2021 12:34:37 +0000
Received: by outflank-mailman (input) for mailman id 133132;
 Thu, 27 May 2021 12:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFDg-00070k-Qk
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:34:36 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b16f1a14-e0ad-4a58-9e46-3a98dbaac28e;
 Thu, 27 May 2021 12:34:36 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CB041FD2E;
 Thu, 27 May 2021 12:34:35 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 627DF11A98;
 Thu, 27 May 2021 12:34:35 +0000 (UTC)
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
X-Inumbo-ID: b16f1a14-e0ad-4a58-9e46-3a98dbaac28e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s14UwhbZNQTt7lOAtjre/DnjC1roVy/CdMyBN/BeKjU=;
	b=c3NCNrrsRqryCplBfqnWzNqBgavC9PaVCwK7GfhTDGMxDhSLEwXp6j42Re6gisC5CXdV5G
	nHHia1Z9bK1qnveiJ5pdPiqgXvsbjZmSebQ3ECl+3f0j5BJ3LLeQ69mpVZiNOVCcpbzDz2
	fYRLuwaSIHJCo6qg/1b2fWwvYqgCkY0=
Subject: [PATCH v2 09/12] video/vesa: unmap frame buffer when relinquishing
 console
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <843f440e-039f-ca0b-6ac1-a4d50559d5bc@suse.com>
Date: Thu, 27 May 2021 14:34:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point in keeping the VA space occupied when no further output
will occur.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/video/lfb.c
+++ b/xen/drivers/video/lfb.c
@@ -168,4 +168,5 @@ void lfb_free(void)
     xfree(lfb.lbuf);
     xfree(lfb.text_buf);
     xfree(lfb.line_len);
+    lfb.lfbp.lfb = ZERO_BLOCK_PTR;
 }
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -197,5 +197,7 @@ void __init vesa_endboot(bool_t keep)
                    vlfb_info.width * bpp);
         lfb_flush();
         lfb_free();
+        iounmap(lfb);
+        lfb = ZERO_BLOCK_PTR;
     }
 }


