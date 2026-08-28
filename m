Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50A4C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:04:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401640.1637205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqdj-0005qD-9v; Fri, 28 Aug 2026 07:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401640.1637205; Fri, 28 Aug 2026 07:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqdj-0005q6-6X; Fri, 28 Aug 2026 07:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1401640;
 Fri, 28 Aug 2026 07:04:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqdh-0005o5-Rj
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:04:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqdh-00DmdV-8H
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:04:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9132f4-8faa-0a2a0a5109dd-0a2a4501e002-44
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:04:37 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913305-5984-0a2a45010019-d155802de834-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:04:37 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b8be0409fso2935395e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:04:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49c44feb966sm4170955e9.6.2026.08.28.00.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:04:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900677; x=1788505477; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/fuBmCCJ5a1zaL+2kWjQQLEuHgPrkNDDGBZHEQWcC0=;
        b=ENPJ3ZH5ZEz8gzJ8U0LVuJfR9/0Zz5UJLfsK9x7sBR4pteT+SQ9q7pYjQTVi9nAVnp
         EiYQfRivPyeDg/31vMlYU9SyBqO6EOaqbtipvgr/KEFxANJAVksGwMAZR7Wm2x4O4T8D
         qBzvnR/o8rDx+6eWAvFlYyWiqHJDBElb1SGL8BT8Je4efZWRJknHx+VIWIIc76DFqLw+
         tOqsRKKHBPSit85QaQK9imM7WpHk+fJt3d/w6KK5J7cDBLnhRn2E9K0Prie8aiWu5VmU
         aBxsz332LUw/fLq1LCbdCfEdZbdI2t4OoWd6J6sEK3E/EHa0V0e+fUfVn05+YQygdXCc
         89mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900677; x=1788505477;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m/fuBmCCJ5a1zaL+2kWjQQLEuHgPrkNDDGBZHEQWcC0=;
        b=UAA+vUSCnzkTsJZ+DQLz/t/3dQrtAT4h75Opv79C2HnUMel3PnDYK77XX+9k1Wd+wF
         CUHPQz50pSznQyTPt9DRiNm4RcwOIqLpTf4CGL/Y8hhMS3gRh04w7hyPIhKiCJnKdQTS
         glLEChsc4J3tmfoj6dmhx50WQOW8GJpCUfDuZ14DU7IvFPbDSnFa/ni4koW1Vh0i630s
         bV2SUxZmj/6POvapwOaQD/mKjuyhRbdzCOPRXU39ioj7oftKxFfhFEJ0gy+XUIdHFaGC
         IrkCofPl9NmQyGdJqAgynGAmAaGFBBYF8UXQQNbdysNDi1fLf50OuGVeyxp4X9DcBlHh
         Mdow==
X-Gm-Message-State: AFuF++mq26poplI5WwwQymMBeN9Mbf9oNIU1pKYU5kUMjlPYrxQ5mUIs
	lkXmzeqSo3nh9K621PpDqwQ2yjApMEo3sMs0spEwV2iRLy9qS3272JzKSvqDQfznUVc27JGvRZS
	n/OS6gQ==
X-Gm-Gg: AR+sD121KTJHVRaZ1+ZJgEr4hr3As463Q2EgkKTdvDXp6HRZyWTX3J4uZF+FtSiPzHw
	PBsYXmK2v1VKcZHIqG+000I4cQgRH4eUG0SyE1VWZt7GB7qYTz4iMRoqrDH6NBvo64zltTPlce3
	K5MgydcUQDO27DtxvZRKF8t0ibFXZVykCIJNaUmZ3nOMKdbFOWqm8e4NzVToFkGTBMJBW43EVUs
	C/xXRL+tH3kkLc6ai5YwYv2xc+yEbRna9tauuJpOhwYmz2HsaBOExGjdtkAsK3o9G8ANy4Ihbl7
	zhhVkuRT4xBwhDLxn0PiVHIfn6sEF1zVSJ+pi089zVwxbz6AEgyJ000Xr8VYPxoxEzsnIe5V1NX
	8vpGQ2MhYshb7Vxg+oq0BqQglcAan4V1xTQ0iZj7UM3sCx7Vy8Z9Wy+CW4MsMhdZrx2Ul4NiX0f
	8A/1jRO27b2q+kDP2+fWp+wmkghVoxBe/NvnXgMiU6x4jkvDr0SOcM5AEZ2UZS6UwoMI9UV9U9I
	d5tR832Q0lPpt9pnORJWaGvfj0tucJcTVHd3nMYqlrLfRt6GFpWhP0fTPKyh/w=
X-Received: by 2002:a05:600c:6215:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-49b91c1bb18mr67259705e9.3.1787900676675;
        Fri, 28 Aug 2026 00:04:36 -0700 (PDT)
Message-ID: <06c5efc0-e130-417f-8333-b8eacd1c6d77@suse.com>
Date: Fri, 28 Aug 2026 09:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/12] Eclair: deviate BUILD_ERROR() wrt rule 2.1 and
 introduce variants
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787900677-1F86F757-E8D1E3E7/0/0
X-purgate-type: clean
X-purgate-size: 2567

BUILD_ERROR() is even stronger a guard than assertions in general, and
ASSERT_UNREACHABLE() (or BUG()) in particular. Deviate it just like those
to allow use for marking unreachable portions of code.

In some cases code being unreachable is dependent upon configuration.
Introduce two variants, as constructs like

    if ( IS_ENABLED(CONFIG_...) )
        BUILD_ERROR("...");

results in the if() still being reported as unreachable. Sadly these two
new macros introduce a new 20.12 violation each, which hence also needs
deviating.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -19,6 +19,7 @@ Constant expressions and unreachable bra
 
 -doc_begin="Unreachability inside an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
 -config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
+-config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(^BUILD_ERROR(|_IF(|_NOT))$))))"}
 -doc_end
 
 -doc_begin="The asm-offset files are not linked deliberately, since they are used to generate definitions for asm modules."
@@ -667,6 +668,7 @@ deliberate."
 to the # or ## operators within the following macros are deliberate, to provide
 useful diagnostic messages to the user."
 -config=MC3A2.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||RUNTIME_CHECK)"}
+-config=MC3A2.R20.12,macros+={deliberate, "^BUILD_ERROR(|_IF(|_NOT))$"}
 -doc_end
 
 -doc_begin="The helper macro GENERATE_CASE may use a macro parameter for ordinary
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -64,6 +64,21 @@
  */
 #define BUILD_ERROR(msg) asm ( ".error \"" msg "\"" )
 
+/*
+ * Like above, but conditional upon @cfg (not) being enabled.  @cfg must be
+ * suitable to pass to IS_ENABLED().
+ */
+#define BUILD_ERROR_IF(cfg)                               \
+    (IS_ENABLED(cfg)                                      \
+     ? ({ BUILD_ERROR( #cfg " unexpectedly enabled"); })  \
+     : (void)0)
+
+#define BUILD_ERROR_IF_NOT(cfg)                           \
+    (!IS_ENABLED(cfg)                                     \
+     ? ({ BUILD_ERROR( #cfg " unexpectedly disabled"); }) \
+     : (void)0)
+
+
 /* Hide a value from the optimiser. */
 #define HIDE(x)                                 \
     ({                                          \


