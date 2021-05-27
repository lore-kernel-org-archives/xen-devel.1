Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86C4C4707F
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 12:37:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68840601FA
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 12:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68840601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.133157.248261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFFu-0000Z2-A9; Thu, 27 May 2021 12:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133157.248261; Thu, 27 May 2021 12:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFFu-0000Yv-6d; Thu, 27 May 2021 12:36:54 +0000
Received: by outflank-mailman (input) for mailman id 133157;
 Thu, 27 May 2021 12:36:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFFs-0000Rp-EK
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:36:52 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e121168b-91ff-47b9-8d50-55f2917047ce;
 Thu, 27 May 2021 12:36:44 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68EB02190B;
 Thu, 27 May 2021 12:36:43 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4E09411A98;
 Thu, 27 May 2021 12:36:43 +0000 (UTC)
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
X-Inumbo-ID: e121168b-91ff-47b9-8d50-55f2917047ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622119003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhpIoP1aaH4G2df5l8aytfLGQDfICiVkm9QqY6PH9WQ=;
	b=JOkSOdwks15QM8gFY5bUcX9p3IPMpCQ2Nr+zN+ZuOWWti45KYkFv/DaKE6PUR+KCLrdJrq
	1fZgcETH4CPMQiJPL3ikpklKHnV3JsHwhbfEIh8f6XniuuVTTv0T+ppDpy5Z71nUJ/GMdt
	pnQNmCZ8H3aqC7xb4uTVuyatTW/Tnmk=
Subject: [PATCH v2 12/12] video/vesa: adjust (not just) command line option
 handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <b7e01b63-c0e3-7cf9-8599-4e3453b4047c@suse.com>
Date: Thu, 27 May 2021 14:36:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Document the remaining option. Add section annotation to the variable
holding the parsed value as well as a few adjacent ones. Adjust the
types of font_height and vga_compat.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Re-base over added earlier patch.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2369,6 +2369,11 @@ cache-warming. 1ms (1000) has been measu
 ### vesa-ram
 > `= <integer>`
 
+> Default: `0`
+
+This allows to override the amount of video RAM, in MiB, determined to be
+present.
+
 ### vga
 > `= ( ask | current | text-80x<rows> | gfx-<width>x<height>x<depth> | mode-<mode> )[,keep]`
 
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -19,16 +19,16 @@
 
 static void lfb_flush(void);
 
-static unsigned char *lfb;
-static const struct font_desc *font;
-static bool_t vga_compat;
+static unsigned char *__read_mostly lfb;
+static const struct font_desc *__initdata font;
+static bool __initdata vga_compat;
 
-static unsigned int vram_total;
+static unsigned int __initdata vram_total;
 integer_param("vesa-ram", vram_total);
 
 static unsigned int __initdata vram_remap;
 
-static int font_height;
+static unsigned int __initdata font_height;
 static int __init parse_font_height(const char *s)
 {
     if ( simple_strtoul(s, &s, 10) == 8 && (*s++ == 'x') )


