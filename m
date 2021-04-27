Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10CFC433B4
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 12:56:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE2B613D8
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 12:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE2B613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.118459.224596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNGV-0003bp-Uf; Tue, 27 Apr 2021 12:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118459.224596; Tue, 27 Apr 2021 12:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNGV-0003bi-R5; Tue, 27 Apr 2021 12:56:35 +0000
Received: by outflank-mailman (input) for mailman id 118459;
 Tue, 27 Apr 2021 12:56:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNGV-0003bb-7O
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:56:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c390bd37-2823-428f-b64b-871f8272425d;
 Tue, 27 Apr 2021 12:56:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFE0EB190;
 Tue, 27 Apr 2021 12:56:33 +0000 (UTC)
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
X-Inumbo-ID: c390bd37-2823-428f-b64b-871f8272425d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619528193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0oy01Y/07q3+WCTPLWPJmj0XnG5cCqIDnUl08wgz+c=;
	b=dTXmFjwO5z3Xu+AfHxr94gHX42Lej1gFRshWInrkSPuCTHllJ2i6q7EDkkaPGmZ5fEkp/C
	UYuu9rmBpUGfMYP+X/6FBuKn8VZyVn4geK6ZwVckLEAOBmGtlnRKQ+q0MR1h97F9/ct0Z6
	0oZt6s44BuFyKAbFKdZdJqAt1vVeDB8=
Subject: [PATCH 7/7] video/vesa: adjust (not just) command line option
 handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Message-ID: <7e3f69d7-23e8-397d-72b6-8c489d80ea45@suse.com>
Date: Tue, 27 Apr 2021 14:56:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Document both options. Add section annotations to both variables holding
the parsed values as well as a few adjacent ones. Adjust the types of
font_height and vga_compat.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2369,9 +2369,21 @@ cache-warming. 1ms (1000) has been measu
 ### vesa-map
 > `= <integer>`
 
+> Default: `0`
+
+Specify, in MiB, the portion of video RAM to actually remap.  This will be
+honored only when large enough to cover the space needed for the chosen video
+mode, and only when less than a non-zero value possibly specified through
+'vesa-ram'.
+
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
@@ -19,17 +19,17 @@
 
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
 
-static unsigned int vram_remap;
+static unsigned int __initdata vram_remap;
 integer_param("vesa-map", vram_remap);
 
-static int font_height;
+static unsigned int __initdata font_height;
 static int __init parse_font_height(const char *s)
 {
     if ( simple_strtoul(s, &s, 10) == 8 && (*s++ == 'x') )


