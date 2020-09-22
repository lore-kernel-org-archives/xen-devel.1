Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B88DC4363D
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 06:08:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B0E23A84
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 06:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuUH7P98"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B0E23A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKbT4-00088i-TA; Tue, 22 Sep 2020 06:07:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6bK=C7=gmail.com=natechancellor@srs-us1.protection.inumbo.net>)
 id 1kKbT3-00088b-IX
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 06:07:57 +0000
X-Inumbo-ID: 6ea5e337-fec7-4892-be40-604232c9c58e
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ea5e337-fec7-4892-be40-604232c9c58e;
 Tue, 22 Sep 2020 06:07:56 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id h1so8941090qvo.9
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 23:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YtWt5LT1rZHUieitxqoZL94pXE9Kni8HrVa9DLq6ra8=;
 b=iuUH7P98MAjsRlYJLK0TJlVvZeCzmYl9RV4YJokXxQqlQv7Wl7kR5ZHCp9MtlOlzKk
 /1RP01X5p+SM3kTFYgEvk62jz44d/piRqzh8EXdfCfQmyBgRRa3jZ0xJgGBfL2TYW6tn
 ede/YsJq2RHhP6OjTLHxVUg/RHQ1nexItE8RxNdloYtrMpaYRUzbXPWF7VnOLjpzZums
 CY/p2InTF6IIF4O6CRVc14nFUBzT4GmCjfKIYzruKsehGb+bT4uXZzhSESh7tX6yA1Cj
 L4hsw6xW7izWpTL7qRTsyjLb9Wnwa1exn47NZ3C9KFSk/ArtkDmN9SScS3ZUa1kEKfmM
 R/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YtWt5LT1rZHUieitxqoZL94pXE9Kni8HrVa9DLq6ra8=;
 b=nW+a1Fcf51aUtTeB/ab5BOjWoJ3tFK6x2HoQqGf/ITUFAq0S45/im4YF1QlJHljBKT
 3m7cemebaiI49RE3HWhHyPYDNDE7s1OVecd8Hd7uXS9FiMdBHiIdjMAJ0ovppsmiZubf
 yNQPZPcoolkSJs23SanhIWXfRBh5DXHPVAFPkRuZbh0GVH/qjFgc4qJJ4Roak6YJn1wv
 v1fDaqFRwrPty4POhqx+IVvMbEXoa03f+GjYNlYP1WefINOGuKHY7ISNX2gJ/kz6Rtd8
 q1FrkG42Nd3AVSgJZ5y4u3ZkUjSIj3cJoccj0kho0ObKKGuk59vfbSwJRk9uv2XirrkT
 8MKg==
X-Gm-Message-State: AOAM530PIhwFQi0j7WC0bL4YnhZGEKJtMH6/X0VZPhADRwSFNmYoI5qQ
 siNkfj5KOXwI11CmRYmc6AA=
X-Google-Smtp-Source: ABdhPJzYAkkRErXQKS5nPd9e9nFfwFnEtBGJUL1AQh/5PWzM/3iOlyBSVL9xx1MY6K5RCdOgRUtuYQ==
X-Received: by 2002:a0c:8b02:: with SMTP id q2mr4425388qva.48.1600754876169;
 Mon, 21 Sep 2020 23:07:56 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id x3sm12523533qta.53.2020.09.21.23.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 23:07:55 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: david@redhat.com
Cc: akpm@linux-foundation.org, ardb@kernel.org, bhe@redhat.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, keescook@chromium.org,
 linux-acpi@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, mhocko@suse.com,
 pankaj.gupta.linux@gmail.com, richardw.yang@linux.intel.com,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] kernel/resource: Fix use of ternary condition in
 release_mem_region_adjustable
Date: Mon, 21 Sep 2020 23:07:48 -0700
Message-Id: <20200922060748.2452056-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911103459.10306-2-david@redhat.com>
References: <20200911103459.10306-2-david@redhat.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Clang warns:

kernel/resource.c:1281:53: warning: operator '?:' has lower precedence
than '|'; '|' will be evaluated first
[-Wbitwise-conditional-parentheses]
        new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
kernel/resource.c:1281:53: note: place parentheses around the '|'
expression to silence this warning
        new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
kernel/resource.c:1281:53: note: place parentheses around the '?:'
expression to evaluate it first
        new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
                                                           ^
                                              (                              )
1 warning generated.

Add the parentheses as it was clearly intended for the ternary condition
to be evaluated first.

Fixes: 5fd23bd0d739 ("kernel/resource: make release_mem_region_adjustable() never fail")
Link: https://github.com/ClangBuiltLinux/linux/issues/1159
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Presumably, this will be squashed but I included a fixes tag
nonetheless. Apologies if this has already been noticed and fixed
already, I did not find anything on LKML.

 kernel/resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index ca2a666e4317..3ae2f56cc79d 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1278,7 +1278,7 @@ void release_mem_region_adjustable(resource_size_t start, resource_size_t size)
 	 * similarly).
 	 */
 retry:
-	new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
+	new_res = alloc_resource(GFP_KERNEL | (alloc_nofail ? __GFP_NOFAIL : 0));
 
 	p = &parent->child;
 	write_lock(&resource_lock);

base-commit: 40ee82f47bf297e31d0c47547cd8f24ede52415a
-- 
2.28.0


