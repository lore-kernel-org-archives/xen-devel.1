Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F61098793
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2026 15:01:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1258096.1552258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bLz-0001l0-JP; Fri, 20 Mar 2026 15:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258096.1552258; Fri, 20 Mar 2026 15:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3bLz-0001kp-F5; Fri, 20 Mar 2026 15:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1258096;
 Fri, 20 Mar 2026 15:01:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3bLy-0001Ve-B4
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 15:01:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1e4f0b-246d-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 16:01:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 046424D27B;
 Fri, 20 Mar 2026 15:01:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D619B42868;
 Fri, 20 Mar 2026 15:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cusPM0xhvWksXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 20 Mar 2026 15:01:32 +0000
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
X-Inumbo-ID: af1e4f0b-246d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMmQvyab5G2G37hAWlU7WoprCOyLWbdVZgzV27fPe1Y=;
	b=sezfUz6RZ3nMFx6zUFekzrc3QDFxkgKQwMpcDYUOBQ95kiJWb3QS375tzfBQFb7z8gxjM+
	eK+QZmeSjNOyrMl1/j22YLtQRKBWiPvl+MfwSmUAfgtsoiSWoeKdHgnuSCbs7mU6cWykSd
	chdAsTm4FXFtHYeUdWO62NdoidYQt/I=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sezfUz6R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774018893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMmQvyab5G2G37hAWlU7WoprCOyLWbdVZgzV27fPe1Y=;
	b=sezfUz6RZ3nMFx6zUFekzrc3QDFxkgKQwMpcDYUOBQ95kiJWb3QS375tzfBQFb7z8gxjM+
	eK+QZmeSjNOyrMl1/j22YLtQRKBWiPvl+MfwSmUAfgtsoiSWoeKdHgnuSCbs7mU6cWykSd
	chdAsTm4FXFtHYeUdWO62NdoidYQt/I=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 02/12] tools/xenstored: add helper to parse domid
Date: Fri, 20 Mar 2026 16:01:10 +0100
Message-ID: <20260320150120.874878-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320150120.874878-1-jgross@suse.com>
References: <20260320150120.874878-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: 046424D27B

Today a domid passed in by a command is parsed using atoi(). This
will still "succeed" even with a domid like "x", resulting in "0" to
be used instead.

Use a common domid parser instead rejecting everything but integers
in the range 0..65535 like specified in docs/misc/xenstore.txt.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch (kind of suggested by Anthony Perard)
---
 tools/xenstored/domain.c | 47 +++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e453b3061f..a70acddf94 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -732,6 +732,18 @@ static char *talloc_domain_path(const void *context, unsigned int domid)
 	return talloc_asprintf(context, "/local/domain/%u", domid);
 }
 
+/* Parse a domid. Sets errno either to 0 or EINVAL. */
+static unsigned int parse_domid(const char *input)
+{
+	unsigned long domid;
+	char *endptr;
+
+	domid = strtoul(input, &endptr, 10);
+	errno = (*endptr != 0 || domid > 65535) ? EINVAL : 0;
+
+	return domid;
+}
+
 int domain_get_quota(const void *ctx, struct connection *conn,
 		     unsigned int domid)
 {
@@ -1077,7 +1089,10 @@ int do_introduce(const void *ctx, struct connection *conn,
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
 		return EINVAL;
 
-	domid = atoi(vec[0]);
+	domid = parse_domid(vec[0]);
+	if (errno)
+		return errno;
+
 	/* Ignore the gfn, we don't need it. */
 	port = atoi(vec[2]);
 
@@ -1124,8 +1139,12 @@ int do_set_target(const void *ctx, struct connection *conn,
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) < ARRAY_SIZE(vec))
 		return EINVAL;
 
-	domid = atoi(vec[0]);
-	tdomid = atoi(vec[1]);
+	domid = parse_domid(vec[0]);
+	if (errno)
+		return errno;
+	tdomid = parse_domid(vec[1]);
+	if (errno)
+		return errno;
 
         domain = find_connected_domain(domid);
 	if (IS_ERR(domain))
@@ -1152,7 +1171,9 @@ static struct domain *onearg_domain(struct connection *conn,
 	if (!domid_str)
 		return ERR_PTR(-EINVAL);
 
-	domid = atoi(domid_str);
+	domid = parse_domid(domid_str);
+	if (errno)
+		return ERR_PTR(-errno);
 	if (domid == store_domid || domid == priv_domid)
 		return ERR_PTR(-EINVAL);
 
@@ -1200,11 +1221,15 @@ int do_get_domain_path(const void *ctx, struct connection *conn,
 {
 	char *path;
 	const char *domid_str = onearg(in);
+	unsigned int domid;
 
 	if (!domid_str)
 		return EINVAL;
 
-	path = talloc_domain_path(ctx, atoi(domid_str));
+	domid = parse_domid(domid_str);
+	if (errno)
+		return errno;
+	path = talloc_domain_path(ctx, domid);
 	if (!path)
 		return errno;
 
@@ -1223,7 +1248,9 @@ int do_is_domain_introduced(const void *ctx, struct connection *conn,
 	if (!domid_str)
 		return EINVAL;
 
-	domid = atoi(domid_str);
+	domid = parse_domid(domid_str);
+	if (errno)
+		return errno;
 	if (domid == DOMID_SELF)
 		result = 1;
 	else
@@ -1261,7 +1288,9 @@ int do_get_feature(const void *ctx, struct connection *conn,
 		return EINVAL;
 
 	if (n_args == 1) {
-		domid = atoi(vec[0]);
+		domid = parse_domid(vec[0]);
+		if (errno)
+			return errno;
 		domain = find_or_alloc_existing_domain(domid);
 		if (!domain)
 			return ENOENT;
@@ -1289,7 +1318,9 @@ int do_set_feature(const void *ctx, struct connection *conn,
 	if (get_strings(in, vec, ARRAY_SIZE(vec)) != ARRAY_SIZE(vec))
 		return EINVAL;
 
-	domid = atoi(vec[0]);
+	domid = parse_domid(vec[0]);
+	if (errno)
+		return errno;
 	features = atoi(vec[1]);
 	domain = find_or_alloc_existing_domain(domid);
 	if (!domain)
-- 
2.53.0


