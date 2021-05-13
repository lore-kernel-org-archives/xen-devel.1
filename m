Return-Path: <SRS0=0ON0=KI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B93C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 13 May 2021 10:03:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51BE5610CA
	for <xen-devel@archiver.kernel.org>; Thu, 13 May 2021 10:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51BE5610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.126817.238369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8Bq-0007OF-5m; Thu, 13 May 2021 10:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126817.238369; Thu, 13 May 2021 10:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8Bq-0007O2-10; Thu, 13 May 2021 10:03:34 +0000
Received: by outflank-mailman (input) for mailman id 126817;
 Thu, 13 May 2021 10:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KipV=KI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lh8Bo-0003vg-3g
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:03:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70819697-d6d0-4f9d-a70f-64adb0fb8e2a;
 Thu, 13 May 2021 10:03:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DC46B15E;
 Thu, 13 May 2021 10:03:07 +0000 (UTC)
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
X-Inumbo-ID: 70819697-d6d0-4f9d-a70f-64adb0fb8e2a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620900187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+l5tq5M/f1kECXbl74yHxqhOUkbjQkUE4NZC677IzI=;
	b=muXNug23i8D8WshIzxtjKc3x9GnLaAOKXKGlzsXTDl/23evlPFNCHKHd4a4SVRdSANqXEp
	icn4g/Bx1ghMjx9o1JXTxQFB4zJLnEvn3Te0fnTR9PVC/fhKkMdndGrcacL/hxHOGrnzad
	pwoTCoUMnAz3BRbea9XDOTFJf6ozUQ4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
Date: Thu, 13 May 2021 12:03:02 +0200
Message-Id: <20210513100302.22027-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210513100302.22027-1-jgross@suse.com>
References: <20210513100302.22027-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen frontends shouldn't BUG() in case of illegal data received from
their backends. So replace the BUG_ON()s when reading illegal data from
the ring page with negative return values.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/tty/hvc/hvc_xen.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 92c9a476defc..30d7ffb1e04c 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -86,6 +86,11 @@ static int __write_console(struct xencons_info *xencons,
 	cons = intf->out_cons;
 	prod = intf->out_prod;
 	mb();			/* update queue values before going on */
+
+	if (WARN_ONCE((prod - cons) > sizeof(intf->out),
+		      "Illegal ring page indices"))
+		return -EINVAL;
+
 	BUG_ON((prod - cons) > sizeof(intf->out));
 
 	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
@@ -114,7 +119,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
 	 */
 	while (len) {
 		int sent = __write_console(cons, data, len);
-		
+
+		if (sent < 0)
+			return sent;
+
 		data += sent;
 		len -= sent;
 
@@ -138,7 +146,10 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 	cons = intf->in_cons;
 	prod = intf->in_prod;
 	mb();			/* get pointers before reading ring */
-	BUG_ON((prod - cons) > sizeof(intf->in));
+
+	if (WARN_ONCE((prod - cons) > sizeof(intf->in),
+		      "Illegal ring page indices"))
+		return -EINVAL;
 
 	while (cons != prod && recv < len)
 		buf[recv++] = intf->in[MASK_XENCONS_IDX(cons++, intf->in)];
-- 
2.26.2


