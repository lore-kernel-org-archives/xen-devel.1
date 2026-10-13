Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CF8CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:06:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446791.1662884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYSv-00069z-NP; Tue, 13 Oct 2026 09:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446791.1662884; Tue, 13 Oct 2026 09:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYSv-00069s-KY; Tue, 13 Oct 2026 09:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1446791;
 Tue, 13 Oct 2026 09:06:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGYSt-00069h-U3
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:06:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGYSt-001JZA-Ay
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:06:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdf48b-8faa-0a2a0a5109dd-0a2a4504ad52-42
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:06:31 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdf497-b57f-0a2a45040019-d1558032ec23-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:06:31 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so22765525e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 02:06:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a190344032sm357590515e9.15.2026.10.13.02.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 02:06:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1791882391; x=1792487191; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPUrzZTmhVKr/M+6DGPNI55GA5hLgwRu4wcXea+aI0c=;
        b=IJbZOOs3ZMXjcKZmdzCXE6C4Srz5gYniO3zutcPTMCd9iZ5N1MW1NckgNlIhasX098
         IDZBw6uCJlYCfS39xHa/W4WnvhLUXfjKCZiZLa6sOVDIuwBz6hrv9GnczH/HUgF6kupT
         zQIxdM/oHIQj5zYhLx6cjDtK+DZH9Oyf0Oh5ebeirpJqTYym8E1cEr/wJsNTg44Nd8sY
         rf9T8COZhfribY8pgip6q45Biyl9TxyX9Ug2kZrGb66cwMtr0JsHm1u0s9+w7RC66bTH
         oP6VJtFmjMOTNAvKY220NpyiP4+XCcQW88VeUKkfli59FjgMHlpUmLurypW4e/Hb6jWH
         w04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882391; x=1792487191;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OPUrzZTmhVKr/M+6DGPNI55GA5hLgwRu4wcXea+aI0c=;
        b=Zo+zTtXm3dvZzehu+bGJ1IgDLXi+/y5JGS21i/2JM1e3TW/33A6+DvtaLkFCDm8tR5
         cHFFf0VCVvDF5xX8MPQKpTY5SWSu9v7USJQqj8DaQWP8LZ74Kt6f23PT/iklX2RIvexo
         NesQrnz+vfmIq/87WPHfLSa5Z/jhDp7KFFUC+savY0HDo6zjIqpyAYM44bY4WM3THe0C
         l+ZhTzzVCS/AhPZ+AZOm5mFU7Nnqqim/KcsvZcpPNPTVgn+V0kbW+eHTit8pcnz8xA3y
         xNwPdD/adfDwLoiOrOnJ4MLsD9L6xSyb3qzzPAjdOLlpvyhYnQatbUGtNlQgakW97BxU
         T9ng==
X-Gm-Message-State: AFq9FYKKr8za3szIANMaQg/5KzjqmTIXk9sMXxn96qTeGNiolmkgaxGS
	esQ/DtZgVA6LXlYe0hi3TZGd8fvj/5riRvqe+eqd4I39FodraH0YW3BNnibYCqqUd4kKhdR/uZ2
	F53Bghw==
X-Gm-Gg: AYBFou34LYUPdLGpNfr50yDyublVIJLNGMOQYToPR0vAp7GPg6u872hEF1xMgc1BH3X
	SuqK+1pgftzvvPyFUVTcSf3uOF1GGmMOrbWgXhypgXz7N9HkSyTeJwYSbQbTwalODm+V2u6Jay+
	3jWIU+lwk5l2fh5rpT0d+Tw/C+vPNBdBRLKdH5NLbqfnB2feDEiisQRry2BDcOomfmmyzKawJyh
	9Mf9yKrFNvBthtbb7ufQqrDFx2DsLAdnVyBhWNrBW7Rmp70YixkpnFvb7Mgg58jekXdFlp1O3+0
	DrqQV/bEgzmV3OUTnR+6xG83DyKL0Tt4SoLmRREMwKkbVpBqPJq4law4cAisfVKCYEh0nKnBwd0
	p2sxCUmBuNMi4bZzsQHQRzfxcJ22g9a9LfxUKafj2ZZepj6pfXnlLXvyq+NNfCEJ7s335zrOAYX
	tEsE5a0ElVbx+7DpoG4om39+K8c+U5Fob0mROsJd7D8EPFS3hnJWTwAEZQuzVyxvJ/eHxzM1YGd
	goIICqQmgsM0M1L8DFewa4JJHHHpfpTWDEG56/fbTlPvNxeeWr2kc1QIMN5dQ==
X-Received: by 2002:a05:600c:83c7:b0:4a1:7733:5102 with SMTP id 5b1f17b1804b1-4a18e4a3fc8mr222669895e9.15.1791882390595;
        Tue, 13 Oct 2026 02:06:30 -0700 (PDT)
Message-ID: <f404f8fd-f1ec-476e-bc7b-b6ad8909501a@suse.com>
Date: Tue, 13 Oct 2026 11:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86: replace this_cpu() uses in mapcache_current_vcpu()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
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
In-Reply-To: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791882391-C06DAB50-35FC6238/10/78276251493
X-purgate-type: spam
X-purgate-size: 2240

We have accumulated three of them, plus a hidden similar 4th construct
from smp_processor_id(). Latch the result of the latter into a local
variable and use the slightly more efficient per_cpu() instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
A 5th such construct is "current", yet to replace that we'd need to open-
code both it (i.e. get_current()) and then also smp_processor_id(). I
wasn't quite sure whether that would be deemed acceptable.

Like indicated in the earlier patch, this similarly leads to the function
actually being inlined (and hence generated code size actually growing) in
gcc16 debug builds. In release builds (with older gcc) the function is
being inlined no matter what. Overall, having looked at generated code
differences, I'm not quite sure anymore whether the earlier observed
inefficiency with repeated this_cpu() really is much of an issue (here or
maybe even more generally).

--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -20,7 +20,8 @@
 
 static inline struct vcpu *mapcache_current_vcpu(void)
 {
-    const struct vcpu *v = this_cpu(pgtable_vcpu);
+    unsigned int cpu = smp_processor_id();
+    const struct vcpu *v = per_cpu(pgtable_vcpu, cpu);
     const struct vcpu *curr = current;
 
     /*
@@ -37,9 +38,9 @@ static inline struct vcpu *mapcache_curr
      * change the page tables under our feet an invalidate any in-use mapcache
      * entries.
      */
-    if ( unlikely(this_cpu(curr_vcpu) != curr) )
+    if ( unlikely(per_cpu(curr_vcpu, cpu) != curr) )
     {
-        ASSERT(curr == idle_vcpu[smp_processor_id()]);
+        ASSERT(curr == idle_vcpu[cpu]);
         sync_local_execstate();
         /* We must now be running on the idle page table. */
         ASSERT(cr3_pa(read_cr3()) == __pa(idle_pg_table));
@@ -51,7 +52,7 @@ static inline struct vcpu *mapcache_curr
      * FLUSH_VCPU_STATE IPI has done so behind our back.  Use ACCESS_ONCE to
      * ensure the compiler never returns the locally cached pgtable_vcpu value.
      */
-    return ACCESS_ONCE(this_cpu(pgtable_vcpu));
+    return ACCESS_ONCE(per_cpu(pgtable_vcpu, cpu));
 }
 
 #define mapcache_l2_entry(e) ((e) >> PAGETABLE_ORDER)


