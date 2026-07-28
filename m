Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E41C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:52:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374265.1621307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiDn-0007gt-L6; Tue, 28 Jul 2026 13:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374265.1621307; Tue, 28 Jul 2026 13:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiDn-0007gl-H6; Tue, 28 Jul 2026 13:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1374265;
 Tue, 28 Jul 2026 13:51:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiDm-0007f2-Ja
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiDm-00BRgj-01
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:51:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3f0-bab6-0a2a0a5309dd-0a2a45029e8c-44
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:51:49 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b3f5-6ca4-0a2a45020019-d155802cf133-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:51:49 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so28917165e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44afaecsm91547275e9.2.2026.07.28.06.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:51:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785246709; x=1785851509; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUqQLSl9FHIBU5/My3xhEwCWgDaa9Jd42rl/ByxW6kQ=;
        b=MxvLZcwYmXivdiEQumix3L4dVZYhRuaBkGWx1Q0ZJ2vSeX+dhOE5YEE/eooQds258U
         YyaQqYA9FZmDV0IWbtJV3dVjclYm2wsSFUGXGgM4W5wVKvO/I8HtXQGO9gk79WmDStz1
         yqmCNw1jqa+Kodz9+4uSwvyZxcC+oQmp2HYuOmDPkoyBcAv3Ucfzl6ePkHtm3JtbUegH
         Od42ISpvp6v6uDh25Wbz22LTpoo+PGS5ornvpPVF3YHKIVdGYHNvt1Cw4BIa06Y4TPKz
         Y9jyhtVrRpEW7xOAxh+K/e5GzqI3AqL8Pwk3QmUFtYdWiGS/eH0sxgnDlm6kS3lfgdI+
         oO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246709; x=1785851509;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wUqQLSl9FHIBU5/My3xhEwCWgDaa9Jd42rl/ByxW6kQ=;
        b=OACL3oI/a3TUastLxURcz57PK5RapGvVRLuSiwY7GpO1cItA6y7hlrf6dy8dQ3xBe/
         A3D2a+WwNGY/bh3zFV9GzjI/OoByI/nj7nREMFSUzM7hYIicVy8xqY1RUJIuFR+fCvi7
         NpNLWqD42r7jASqn8V/qRIY5DvLCuU2gKKsT6oHH9h+ODWNJZaH8jlssLhjn/u9Tjhl9
         kDOFTMwIBPDFNTMv4dXTB3O57QwDUuUCHfK35yBuK5ZZjdxqLh0VQCjcG1si9smCIQL2
         Z7tVIBHNOBNjZ45xe8+eN38G+bB+07ybduo790jE+ySL1dtAjIjMFDZf5hfRNXkQBY2D
         TiYA==
X-Gm-Message-State: AOJu0YyiMqzjyJ5yKuuNRniFSapYwK+qCCiC9NMyhMO36G0eAswy0uPy
	PoEuQ0cnQCgOjtpUdEDj9fdcg2xcIKH/WM2BBz286Deme+I9N4/TaIbvyOmJ5QJl6QYUBo6Kc99
	Qpzm2Xg==
X-Gm-Gg: AR+sD11U+800tUHHQ9dohDwBMnTsHFMNOiBEXZfvBFH24GuKcRIy5euEavIuND5lJHg
	oqqoiXtyu9mHGvYsaJnJrIebEEiPf9jWQJFYJYXhKPDg+u093ohpQVwxDgpT1tvH+uYm78z4TtC
	z0+BXI0/QYoZ8xq165J7pt+IJdsMRPqEwBTd4OJBXRu5VsDt30EiVpyt+6BGTMgWjubMox8P4J0
	EHhqjtosN2ejaA2aBjbdNl+u6ROEwgo4eqwy/XdDkAOqVM8fpbjvU0TtQtid/+o7QhoapE2eu8g
	wwrX3JMbB5MHrV+5H16wUPXgsGPYrGmgcGTh8LEdYzOqcVFrabU5xnj5GA8llp6VUpOgEuygolK
	IcSvwA3UQ7wws+bst9mAITW0LDL8ymraPS0KPvk/VNb6DCoVuIvji6p99/hmSDUOy2bFPmxs5/Y
	FcwHtWi2tI3ytNL0SxEyLODBR8Jw9fDReViUO7bai2plnzvQ/byXnNrscqWyZM/3qqsw==
X-Received: by 2002:a05:600c:3f10:b0:495:7278:95c3 with SMTP id 5b1f17b1804b1-496c657de59mr26303885e9.26.1785246709449;
        Tue, 28 Jul 2026 06:51:49 -0700 (PDT)
Message-ID: <6e9d7bc5-3e1d-4262-b806-e59595f3584f@suse.com>
Date: Tue, 28 Jul 2026 15:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/7] gnttab: drop local "ld" from unmap_common_complete()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785246709-668B42AC-45990A5F/0/0
X-purgate-type: clean
X-purgate-size: 1080

It's used exactly once, and even then only conditionally. No need to
establish the value in all cases.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1606,7 +1606,7 @@ unmap_common(
 static void
 unmap_common_complete(struct gnttab_unmap_common *op)
 {
-    struct domain *ld, *rd = op->rd;
+    struct domain *rd = op->rd;
     struct grant_table *rgt;
     struct active_grant_entry *act;
     struct page_info *pg;
@@ -1618,8 +1618,6 @@ unmap_common_complete(struct gnttab_unma
         return;
     }
 
-    ld = current->domain;
-
     rcu_lock_domain(rd);
     rgt = rd->grant_table;
 
@@ -1656,7 +1654,7 @@ unmap_common_complete(struct gnttab_unma
         if ( pg )
         {
             if ( gnttab_host_mapping_get_page_type(op->done & GNTMAP_readonly,
-                                                   ld, rd) )
+                                                   current->domain, rd) )
                 put_page_type(pg);
             put_page(pg);
         }


