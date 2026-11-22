Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71616606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=omWGEhJf
Received: from list by lists.xenproject.org with outflank-mailman.1499540.1696331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HV-0005r8-N9; Sun, 22 Nov 2026 09:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499540.1696331; Sun, 22 Nov 2026 09:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HV-0005qs-KJ; Sun, 22 Nov 2026 09:54:45 +0000
Received: by outflank-mailman (input) for mailman id 1499540;
 Sun, 22 Nov 2026 09:54:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HU-0005ou-3e
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HT-00ExLX-GR
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:43 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbe3-bab6-0a2a0a5309dd-0a2a450ba4b0-0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:43 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbe3-b7e8-0a2a450b0019-d155802dc960-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:43 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so8751125e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:43 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:42 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341283; x=1795946083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+06NjaglZq8mk0awRMY/bToi0Cqo9lQZF8+CVYtFmQE=;
        b=omWGEhJfNifLZdfvPzDV0WWUucrknd6HuWCct2All5AyFNIKbbSKFgBdOFgCqbmUjG
         n5wYpCu8mu41Dw+GEp/34Tu3SdZfIruuXPsHOeJ09El/j9DKcQnWwm83fHlxm6hXcRUY
         NXBck0YElVYnQhYVppV17920XSa7ODnZKRqjwkdlHz3vMm6Ja8cN6urE/I3ezLvMTE8O
         cWXWvozx9UuoqoSW9bExpC7+PPHpo5PNCPmGc2fQVe1wYKgQ6ePMNIZAlrl1ve6oiIuE
         37GLv0jDFlhSPQaR4S6T/A9Nr9Y+0wOK/iq9//TxzimsOi5nCSsQ4Cvfvw9dTKVi/JXo
         L8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341283; x=1795946083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+06NjaglZq8mk0awRMY/bToi0Cqo9lQZF8+CVYtFmQE=;
        b=zJb7iVO0BsUMygYMg5oW/Y5LkRTULpRSsr6OVBOEG4B6VRBinM+SrIzQ/yujtYvExY
         y+2fnrNhc4l2oKc5fGEEAmjTQ3aWfAFQDhgBu8oFH0sgEPkIY1LkzecWFJoTx+yB0Ppp
         ntauwa4dPw5yyXqJaM+YuCijzbohWAPbTLcK6XEJw4d5440xNcPBoa75IV/LpspMHvDH
         uVkHUiOJcaCuNPi59yiotUL6KuS4ETpl9wyly86L8y/UboLcGySu9kMnTYisaSn3Ab6a
         /QcA7Zk05vO/sZETrgivP3vcBkUXEzJgmztNt9g8eXe58jQU8QobJYrjbwx56Hp+ecSD
         VO0w==
X-Gm-Message-State: APuU4Z9mqa74oyDAlJT0WBytgIkJ03UptU+9jyuTYuBQ04vNR/Auj4bQ
	IWq+u0OTlOHfY5KoooPyXRYTFSb183pDDFKVA2K7+NPse21ec1qOuHA77IehNMd7ET8=
X-Gm-Gg: AZFdTZdyqbfgacPFNQqVzt36TckOzgtruXKtxl8K/bKOLNegMJWaBh2o5dNSnLin0dJ
	fzxqnWTRyCUIwB9QefQOS5mT4owQ4qs8ZYd20QImA2eqsNdbjAUiWfGGhCzP/AGHqOtucdHopTR
	1PMv1QFd7oRHKaE04m8BTpxUMh+3j2adeGPZ/y/YXBNe1Ofd7VuOaqTVfKxVnuz/sLWpP4sKzDA
	ndBNgwz5qeIePk3dzvf0aaBPJH1yChqkrMdBIFahDE+h16djWQ1UYNZaEEoxc0X2frD5CWEZaVP
	ZdGi1eeRipP86mID0iKKwvTk87SvxlTf9mn4EdgMpcTH12NSqn/OOEpt23/bliPpIedKXflVIYi
	IoUxxPkas4Z3MaYtuY7WUGXt/22WDpuVoaBkNQl5FglbHy178+NNBEPT+K/QsFPtjgtwQgEYz8j
	zFRECLdP5HloeCy5jDIJctACN3dEkHi+sDL0qlHCf+o6Xz2as4VoTEWqforeVFG0i92HDEQWtDg
	hhO8YJIteh5kWz0MoDyCC4NzfewlWAumtcRazmdxhGcAyh1ttj+22blAhvGHcp9/xLAYsIA+4g6
	zDLHBlhniJn8Dgnvv7VYorXJl5042OP0el/uOD4emL2mXCDe4BQZJsrT9TsXRuMeFHOHmnLMVLS
	zexIKv9UZLrYdAK6qVeRoIwT5zg==
X-Received: by 2002:a05:600c:5303:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb88785d24mr169700165e9.0.1795341282825;
        Sun, 22 Nov 2026 01:54:42 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com
Subject: [XEN][PATCH v5 5/8] xen/arm: do not flush the TLBs when resolving a translation fault
Date: Sun, 22 Nov 2026 14:54:19 +0500
Message-ID: <7a82afdf1e02b837a8ffc23e61dd68c5bda63265.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795336377.git.haseebashraf091@gmail.com>
References: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795341283-AB2DC9EA-D9855835/0/0
X-purgate-type: clean
X-purgate-size: 2214
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

After p2m_flush_vm() invalidates the root of the p2m, the first
access to every table of the p2m faults. Then
p2m_resolve_translation_fault() sets the valid bit of the entry and
clears the valid bits of the table below it with
p2m_invalidate_table(). That function asks for a TLB flush, so
p2m_write_unlock() flushes all the TLBs of the domain, once for
every table that is walked for the first time.

The flush is not needed. The entry has had its valid bit unset since
the TLBs were flushed after the invalidation, so no walk went through
it and nothing from the table below can be cached. This does not
depend on what Xen runs on. Under nested virtualization, a global
broadcast can be especially expensive and hold the p2m lock while the
fault is being resolved. No separate measurement is available for this
patch.

Keep the flush that was already pending, if any.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
New in v5.

 xen/arch/arm/mmu/p2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 3b1b9b394c..8cbd504fdc 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1450,7 +1450,20 @@ bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
      * If an entry is pointing to a block/page, no work to do for now.
      */
     if ( lpae_is_table(entry, level) )
+    {
+        /*
+         * The table below an entry whose valid bit is unset cannot be in the
+         * TLBs: no walk went through that entry since the TLBs were flushed
+         * after the entry was invalidated. So clearing the valid bits of the
+         * table does not need a flush, and p2m_invalidate_table() must not
+         * ask for one. It would be a flush of all the TLBs of the domain at
+         * p2m_write_unlock(), for the first access to every table.
+         */
+        bool need_flush = p2m->need_flush;
+
         p2m_invalidate_table(p2m, lpae_get_mfn(entry));
+        p2m->need_flush = need_flush;
+    }
 
     /*
      * Now that the work on the entry is done, set the valid bit to prevent

