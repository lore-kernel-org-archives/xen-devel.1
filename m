Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AD2F33A65
	for <xen-devel@archiver.kernel.org>; Thu,  5 Mar 2026 13:57:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1246734.1545847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9Cs-00049t-LP; Thu, 05 Mar 2026 13:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246734.1545847; Thu, 05 Mar 2026 13:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9Cs-00049m-I7; Thu, 05 Mar 2026 13:57:38 +0000
Received: by outflank-mailman (input) for mailman id 1246734;
 Thu, 05 Mar 2026 13:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy98F-00008m-5J
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98646d41-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:52:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 748E75BEC7;
 Thu,  5 Mar 2026 13:52:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54D0A3EA76;
 Thu,  5 Mar 2026 13:52:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id n8KnE7CKqWkMTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:48 +0000
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
X-Inumbo-ID: 98646d41-189a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+4ZO/KspblmGGLhGlNMkeWiLuNQLDCEDNiLJzLmjPY=;
	b=foug50Oxl/72LzeH5fthq6evZ/egSmCWIwtKH48ES5xxykx8PW6vFp7YvV9Mk5NBiS9sHD
	F5t+nvvLv8VTVuuis5HKMRGA1ne++NR0kV7fF4xsW49Erk9v25T3ITR9kxMCy/FKdwT1PN
	hJ0HsStVaIIJo4y2pRJUcrQrHmg4Wd4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+4ZO/KspblmGGLhGlNMkeWiLuNQLDCEDNiLJzLmjPY=;
	b=foug50Oxl/72LzeH5fthq6evZ/egSmCWIwtKH48ES5xxykx8PW6vFp7YvV9Mk5NBiS9sHD
	F5t+nvvLv8VTVuuis5HKMRGA1ne++NR0kV7fF4xsW49Erk9v25T3ITR9kxMCy/FKdwT1PN
	hJ0HsStVaIIJo4y2pRJUcrQrHmg4Wd4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 07/11] tools/xenstored: implement the GET/SET_QUOTA commands
Date: Thu,  5 Mar 2026 14:52:04 +0100
Message-ID: <20260305135208.2208663-8-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.79 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.964];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]

Add the implementation of the GET_QUOTA and SET_QUOTA wire commands.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/xenstored/core.c   |   4 ++
 tools/xenstored/domain.c | 106 +++++++++++++++++++++++++++++++++++++++
 tools/xenstored/domain.h |   8 +++
 3 files changed, 118 insertions(+)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 8a06b35808..e283d47184 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2034,6 +2034,10 @@ static struct {
 	    { "GET_FEATURE",   do_get_feature,  XS_FLAG_PRIV },
 	[XS_SET_FEATURE]       =
 	    { "SET_FEATURE",   do_set_feature,  XS_FLAG_PRIV },
+	[XS_GET_QUOTA]         =
+	    { "GET_QUOTA",     do_get_quota,    XS_FLAG_PRIV },
+	[XS_SET_QUOTA]         =
+	    { "SET_QUOTA",     do_set_quota,    XS_FLAG_PRIV },
 };
 
 static const char *sockmsg_string(enum xsd_sockmsg_type type)
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 8e52351695..c0bc8a3eb7 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1363,6 +1363,112 @@ static bool parse_quota_name(const char *name, unsigned int *qidx,
 	return true;
 }
 
+int do_get_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in)
+{
+	const char *vec[2];
+	unsigned int n_pars;
+	unsigned int domid;
+	unsigned int q;
+	unsigned int idx;
+	char *resp;
+	const char *name;
+	const struct quota *quota;
+	const struct domain *domain;
+
+	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
+
+	if (n_pars > 2)
+		return EINVAL;
+
+	if (n_pars == 0) {
+		resp = talloc_asprintf(ctx, "%s", "");
+		if (!resp)
+			return ENOMEM;
+		for (q = 0; q < ACC_N; q++) {
+			if (!quota_adm[q].name)
+				continue;
+			if (quotas[q].val[Q_IDX_HARD] != Q_VAL_DISABLED) {
+				resp = talloc_asprintf_append(resp, "%s%s",
+					*resp ? " " : "", quota_adm[q].name);
+				if (!resp)
+					return ENOMEM;
+			}
+			if (quotas[q].val[Q_IDX_SOFT] != Q_VAL_DISABLED) {
+				resp = talloc_asprintf_append(resp, "%ssoft-%s",
+					*resp ? " " : "", quota_adm[q].name);
+				if (!resp)
+					return ENOMEM;
+			}
+		}
+	} else {
+		if (n_pars == 1) {
+			quota = quotas;
+			name = vec[0];
+		} else {
+			domid = atoi(vec[0]);
+			domain = find_or_alloc_existing_domain(domid);
+			if (!domain)
+				return ENOENT;
+			quota = domain->acc;
+			name = vec[1];
+		}
+
+		if (parse_quota_name(name, &q, &idx))
+			return EINVAL;
+
+		resp = talloc_asprintf(ctx, "%u", quota[q].val[idx]);
+		if (!resp)
+			return ENOMEM;
+	}
+
+	send_reply(conn, XS_GET_QUOTA, resp, strlen(resp) + 1);
+
+	return 0;
+}
+
+int do_set_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in)
+{
+	const char *vec[3];
+	unsigned int n_pars;
+	unsigned int domid;
+	unsigned int q;
+	unsigned int idx;
+	const char *name;
+	unsigned int val;
+	struct quota *quota;
+	struct domain *domain;
+
+	n_pars = get_strings(in, vec, ARRAY_SIZE(vec));
+
+	if (n_pars < 2 || n_pars > 3)
+		return EINVAL;
+
+	if (n_pars == 2) {
+		quota = quotas;
+		name = vec[0];
+		val = atoi(vec[1]);
+	} else {
+		domid = atoi(vec[0]);
+		domain = find_or_alloc_existing_domain(domid);
+		if (!domain)
+			return ENOENT;
+		quota = domain->acc;
+		name = vec[1];
+		val = atoi(vec[2]);
+	}
+
+	if (parse_quota_name(name, &q, &idx))
+		return EINVAL;
+
+	quota[q].val[idx] = val;
+
+	send_ack(conn, XS_SET_QUOTA);
+
+	return 0;
+}
+
 static int close_xgt_handle(void *_handle)
 {
 	xengnttab_close(*(xengnttab_handle **)_handle);
diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
index 62ce3b3166..6a06b0d1af 100644
--- a/tools/xenstored/domain.h
+++ b/tools/xenstored/domain.h
@@ -93,6 +93,14 @@ int do_get_feature(const void *ctx, struct connection *conn,
 int do_set_feature(const void *ctx, struct connection *conn,
 		   struct buffered_data *in);
 
+/* Get quota names or value */
+int do_get_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in);
+
+/* Set quota value */
+int do_set_quota(const void *ctx, struct connection *conn,
+		 struct buffered_data *in);
+
 void domain_early_init(void);
 void domain_init(int evtfd);
 void init_domains(bool live_update);
-- 
2.53.0


