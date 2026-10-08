Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E2CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 09:29:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443088.1660467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEkQp-0000H2-Ih; Thu, 08 Oct 2026 09:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443088.1660467; Thu, 08 Oct 2026 09:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEkQp-0000Gu-Fw; Thu, 08 Oct 2026 09:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1443088;
 Thu, 08 Oct 2026 09:28:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEkQo-0000Go-7r
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 09:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEkQn-0049km-7H
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:28:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7624f-e002-0a2a0a5209dd-0a2a4508e5b0-36
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 11:28:53 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac76254-f659-0a2a45080019-d155802ad820-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 11:28:52 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so21289825e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 02:28:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d123b5sm9930222f8f.24.2026.10.08.02.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 02:28:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791451732; x=1792056532; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5TXs4tm9M71FUzuIHR7e3tnd6xBqprQJ5FUBQIYQts=;
        b=ewKdn65c4Do1TY0AGgH9xBfphl1ps1ZTxw20k+hHL5lwUwSFnYWa8yCcUfLgnlennG
         8oxdKnilDtsRXPvmKS+OiWLyoC2l6fpgK6pK+CmkI8yiWu3AmJblR4xbWc1k035o1a7K
         Vdk+QDsmF5PY39HGElIJuz/kpTnoI1Ax+XjdqbiWS4Q+6j1H2i/xP6iIe+Ya4DEQ07RP
         H5U/a+u7LowfNwkR1eb+Tgz7TmCPF31S3ZdirAhZo/64af1cbp0iF62+jEMRmuXTxWYk
         ZjgBKh7WaORd9qYq9TNo1GHXcYGFCuOMjU+S6H+8TiAWp3JdGiUcgiN1+DatcgXMjxrj
         Hf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451732; x=1792056532;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5TXs4tm9M71FUzuIHR7e3tnd6xBqprQJ5FUBQIYQts=;
        b=bwWb9UuCruIvoO9FR07WiqZcyFu6KY/4/0znabH/XzUUeuNBhysax87mfw83s1cr3W
         4+hPbvU72eyvuFQNkL5YDum8PZZH//S3RvN4Z0rpRJlxMvzapP6x/ZRQOmgyvWrLTC44
         A7GVx0K+vaYyT8i6KUZ4ZewAMUoU0ACVPCLKp860GGlK552VjHujy+9Gm5q9OC8fAQ9n
         clAhyEnw8RjTESTFGaJPropfG1B3F0cgu4y+PCzVD7lHTyWBXK/SrLe1d2cjrwjCPtuQ
         3qd7Y0PHCSXn31EjbbZiujJOj4EA5wB539BGi+tL8lU0AvQbpEaCcu8mgz9v8Q09ecVQ
         1tUg==
X-Gm-Message-State: AFuF++nJxVTlOzOJVf+aiL3sJxvaDOnOv2bCs4SWrDR7hXkeJfM3/jBq
	Rs8kMMpYybOWKw7BbJGuaC44Q6JONymoS2GsEQofg8mlW4TQMQ9bcK2BlUGVW5E7vOkhWozjLGl
	b25Tvuw==
X-Gm-Gg: AYBFou331AnmKVLW6vPlF1VxuBoly3wzsMDyYGZVQ4QwKOapW66fPEsNXGXQ29BklX0
	u2KFr/AHxERG0GAJh4C5fpKkx7YFQX8CVX5KyGncurbeSZl4phTVcaed1stFYiVYjV6OaAuYD/k
	MM2W0CSJ99XkEsKWTrcwpFSuYAJ+rsIjUvJn3QN1xU7BBIfHNixK1vPHca95THmfudTdaWCgRGW
	Q4eY0HMxw2PeAscUl9teGLbZCMsDWeyeIFIIOoNMW72QAHqfiSUsO+VyNF9/Y1Cbplc7EuqpZI5
	AauUhJ+26ftLO6XEjc6870Wy7NMHyLmDzOXqIE9N+bF/pojsptSCkpg8A0cXPykN2Bmhrbo3Rm+
	hFgEcor3ClzcrEItCuWDLCWe8raHk5ZAZK6rgb9CIterxS9Jt6iUTuMZndUm4rw6Ol4aKFUOH3o
	WdEbf5nWx5WurmiW2p6MVi7+/Wx6Fg58zR89+NjRuO2nSMIzJOmH0Cv9WU6xaBI4rlPc2PJdcT8
	6WxKN7bzPRSWfxavZhQueJnbEbueS1gcd2d2RYsIXVEWKmM9F9vo/hpJDi2VEgYEhBJ3yV4tQ==
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a180648d69mr89183895e9.24.1791451732053;
        Thu, 08 Oct 2026 02:28:52 -0700 (PDT)
Message-ID: <e604cb44-8827-435c-b1e7-7e9b28f18fa3@suse.com>
Date: Thu, 8 Oct 2026 11:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gnttab: avoid use of raw_shah and union grant_combo in
 _set_status_v2()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791451732-CE34587B-C68E68AE/10/78276251493
X-purgate-type: spam
X-purgate-size: 4586

The main issue here being the cast to establish raw_shah; where possible
such casts are best avoided. (The (ab)use of unions is an issue as well,
but we have uses like this all over the place.)

With shared and status entries separated, we don't really need to mirror
_set_status_v1() behavior here. The shared entry fields can be accessed
normally, merely using compiler barriers to ensure checks are done on
stable local copies. In particular, torn reads (not that we expect the
compiler to emit such, i.e. this is a purely theoretical concern here
anyway) are not a problem.

While there also avoid unnecessary use of a fixed-width type for the
"mask" local variable (which wants to match "flags" anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm puzzled by gcc's codegen with uint16_t vs unsigned int for the two
local variables: Use of unsigned int in principle would allow to generate
better code, if only the compiler wouldn't (as per observations with
gcc16)
- emit redundant MOVZWL,
- needlessly clobber a register variable, thus causing use of %ebx (and
  hence saving/restoring of %rbx).
Overall there's no change in size of compiled code (when really it could
shrink). Note that no similar odd effects are observable for Arm.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -832,26 +832,26 @@ static int _set_status_v2(const grant_en
                           domid_t  ldomid)
 {
     int      rc    = GNTST_okay;
-    const uint32_t *raw_shah = (const uint32_t *)shah;
-    union grant_combo scombo;
-    uint16_t mask  = GTF_type_mask;
+    domid_t  domid = shah->domid;
+    unsigned int flags = shah->flags, mask = GTF_type_mask;
 
-    scombo.raw = ACCESS_ONCE(*raw_shah);
-
-    /* if this is a grant mapping operation we should ensure GTF_sub_page
+    /* If this is a grant mapping operation we should ensure GTF_sub_page
        is not set */
     if ( mapflag )
         mask |= GTF_sub_page;
 
+    /* Make sure all checks below are done on stable local copies. */
+    barrier();
+
     /* If not already pinned, check the grant domid and type. */
     if ( !act->pin &&
-         ((((scombo.flags & mask) != GTF_permit_access) &&
-           (mapflag || ((scombo.flags & mask) != GTF_transitive))) ||
-          (scombo.domid != ldomid)) )
+         ((((flags & mask) != GTF_permit_access) &&
+           (mapflag || ((flags & mask) != GTF_transitive))) ||
+          (domid != ldomid)) )
     {
         gdprintk(XENLOG_WARNING,
                  "Bad flags (%x) or dom (%d); expected d%d, flags %x\n",
-                 scombo.flags, scombo.domid, ldomid, mask);
+                 flags, domid, ldomid, mask);
         rc = GNTST_general_error;
         goto done;
     }
@@ -862,7 +862,7 @@ static int _set_status_v2(const grant_en
     }
     else
     {
-        if ( unlikely(scombo.flags & GTF_readonly) )
+        if ( unlikely(flags & GTF_readonly) )
         {
             gdprintk(XENLOG_WARNING,
                      "Attempt to write-pin a r/o grant entry\n");
@@ -876,26 +876,30 @@ static int _set_status_v2(const grant_en
        still valid */
     smp_mb();
 
-    scombo.raw = ACCESS_ONCE(*raw_shah);
+    flags = shah->flags;
+    domid = shah->domid;
+
+    /* Again, all checks below need doing on stable local copies. */
+    barrier();
 
     if ( !act->pin )
     {
-        if ( (((scombo.flags & mask) != GTF_permit_access) &&
-              (mapflag || ((scombo.flags & mask) != GTF_transitive))) ||
-             (scombo.domid != ldomid) ||
-             (!readonly && (scombo.flags & GTF_readonly)) )
+        if ( (((flags & mask) != GTF_permit_access) &&
+              (mapflag || ((flags & mask) != GTF_transitive))) ||
+             (domid != ldomid) ||
+             (!readonly && (flags & GTF_readonly)) )
         {
             gnttab_clear_flags(rd, GTF_writing | GTF_reading, status);
             gdprintk(XENLOG_WARNING,
                      "Unstable flags (%x) or dom (%d); expected d%d (r/w: %d)\n",
-                     scombo.flags, scombo.domid, ldomid, !readonly);
+                     flags, domid, ldomid, !readonly);
             rc = GNTST_general_error;
             goto done;
         }
     }
     else
     {
-        if ( unlikely(scombo.flags & GTF_readonly) )
+        if ( unlikely(flags & GTF_readonly) )
         {
             gnttab_clear_flags(rd, GTF_writing, status);
             gdprintk(XENLOG_WARNING, "Unstable grant readonly flag\n");

