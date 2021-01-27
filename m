Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE943C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 15:33:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C6E207A2
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 15:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C6E207A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76158.137295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4moR-0001py-L1; Wed, 27 Jan 2021 15:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76158.137295; Wed, 27 Jan 2021 15:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4moR-0001pr-I4; Wed, 27 Jan 2021 15:32:55 +0000
Received: by outflank-mailman (input) for mailman id 76158;
 Wed, 27 Jan 2021 15:32:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4moQ-0001pm-Ek
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:32:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 243aed72-fe80-4e26-abd1-23b47152ed9d;
 Wed, 27 Jan 2021 15:32:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 607C4B74D;
 Wed, 27 Jan 2021 15:32:52 +0000 (UTC)
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
X-Inumbo-ID: 243aed72-fe80-4e26-abd1-23b47152ed9d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611761572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NCBL+mR9JZqZiEcZqPjiRv52Fj+FD/XJTvWuF80jUWE=;
	b=UZJlEAwfdxIc8yvqzjykhzXIUbkDcm6ipkWxq8KwF68ypvbXlIoRT50be07+fnihZaolFw
	d4fS5hJ354S7AswGr6vkhgO0XY01U8WKLoR3wA9ogsFJiFsxI/jzr+z1GG2OP++y9GE0gy
	9xORxJAQnGJrqQYKiLVemHcRhe2cQvY=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenstored: fix build on libc without O_CLOEXEC
Message-ID: <a5af8c21-f12d-d9a0-1751-90e5e8e0902e@suse.com>
Date: Wed, 27 Jan 2021 16:32:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The call to lu_read_state() would remain unresolved in this case. Frame
the construct by a suitable #ifdef, and while at it also frame command
line handling related pieces similarly.

Fixes: 9777fa6b6ea0 ("tools/xenstore: evaluate the live update flag when starting")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2061,7 +2061,9 @@ static struct option options[] = {
 	{ "internal-db", 0, NULL, 'I' },
 	{ "verbose", 0, NULL, 'V' },
 	{ "watch-nb", 1, NULL, 'W' },
+#ifndef NO_LIVE_UPDATE
 	{ "live-update", 0, NULL, 'U' },
+#endif
 	{ NULL, 0, NULL, 0 } };
 
 extern void dump_conn(struct connection *conn); 
@@ -2141,9 +2143,11 @@ int main(int argc, char *argv[])
 		case 'p':
 			priv_domid = strtol(optarg, NULL, 10);
 			break;
+#ifndef NO_LIVE_UPDATE
 		case 'U':
 			live_update = true;
 			break;
+#endif
 		}
 	}
 	if (optind != argc)
@@ -2206,9 +2210,11 @@ int main(int argc, char *argv[])
 	if (tracefile)
 		tracefile = talloc_strdup(NULL, tracefile);
 
+#ifndef NO_LIVE_UPDATE
 	/* Read state in case of live update. */
 	if (live_update)
 		lu_read_state();
+#endif
 
 	/* Get ready to listen to the tools. */
 	initialize_fds(&sock_pollfd_idx, &timeout);

