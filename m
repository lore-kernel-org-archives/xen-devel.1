Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173EECD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 09:29:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339947.1600987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZma9-00071s-H9; Wed, 17 Jun 2026 09:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339947.1600987; Wed, 17 Jun 2026 09:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZma9-00071l-Ec; Wed, 17 Jun 2026 09:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1339947;
 Wed, 17 Jun 2026 09:29:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZma8-00071c-6l
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:29:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZma7-0007kR-Jn
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:29:11 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3268df-5cb7-0a2a0a5109dd-0a2a4508cfda-30
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:29:11 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3268e7-63b5-0a2a45080019-d1558030d144-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 11:29:11 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso52917595e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 02:29:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm49825591f8f.15.2026.06.17.02.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:29:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781688551; x=1782293351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GCO0RssdVVdHttUb3yjvyoLU2Z9nQ5JVjDGHgFk6qrY=;
        b=AvE5SHtd7cLiz/xeD1YqYaL6rNL9+9Fvx+W5IS2HLmYz8UlZL5CqpnAr4WYJ9pUKGU
         L//NBdm3F5rGpRvYQmhShHytTWogOb9Ic1Zq9hkcQWb2bLnz4lg3UEgcNoBZiiUt7AnA
         p+Zc8CazxPDrVzFVjq0S/caLa+lkzXbbzboDobx7qyWlDKutWSltFW7wq7Gf36TLE4ws
         p2VzH09DGDTfukgZscVdAbTa2GX/8isSEA5++NDtp3Q0MvA2B72i07JiQDFGlZ1w/SUS
         TSWvxc/8ZagfR/S1YxsNZPTW04Khdbf/Cimtp5EtZGBe/G4tJxdk1Bja8mpVrhLr6E05
         ClzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688551; x=1782293351;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCO0RssdVVdHttUb3yjvyoLU2Z9nQ5JVjDGHgFk6qrY=;
        b=VCG1s9ZzSiRTRyoainkHGiq/sS/7hMwpaLJScmX59K40vXJ39mj59f95z9HspQthkC
         2mzTAF8ML3NRYwG2/I9WKjvWku6U/91KFu7O1uY0Y6n8RjlQZt91OuYvJ0G7VJJvrNjW
         rfTCnHyOLIFZ9R5SD2Yq/P9NKIDMLGwMXIjQsD2O0BABChwpb5daw91wHTL1Z9ya5Bkb
         QCOOFRAptzCbUt68xCrUrWvPEqWgvTaDk6yyXNXDl207pJr0IXHfXGBj4/ww0wqPnf0W
         FNX+3TxCJ7w/5GIbb7hLTC227DlQod3Y9gvZRvwnDpmrjZfiGYD3gYLi76rVEmkt/Zm+
         l1mQ==
X-Gm-Message-State: AOJu0YwJ7PZ/d65DAhEdhErSXYTDwvl5x1RyQmEuMF5tS6b5kUDXsZhN
	LE/F5zF7IAA4utbmmzUVrMXo+2fyJIYxN1f7PCMR1y9gnWJ470EA3IsgGQMQOPWwhc6vFAVUe8P
	3DWg=
X-Gm-Gg: Acq92OEPRMX3Y330Wxz04FLvoc5p/Dg/UtUIUq5fXZNjdq3+72PA1k9Kfq4eWAEZuoD
	wCUwF2CUsOfWSbg/5WMAsThxo5aE3DFXWmJFpa5dHdXZqK8hrTLGCG+D7bZZC77mfx8n1kU6ab0
	70lu/iHM4tyWIcH40Ow1RV6fkkw/Ba9oBS+yeI2uVpjnZa6qxfcrlucQ7syLR5R5P3LsFZxik6W
	o9oQVIGA/zluiCz+lPrHTuIOfeB00synkb+eC52BCa/p4ksmLjKldmzrh9l0zUjbLijwKg/jVcm
	ssBAFW0US+KrVd6UNdTa90QwYPVE9UW+CrYlv6eDK9Mz50+LaMiDtaLN1YY7Le2uNzjIXMXPjnq
	i0FS4zwE/ZCNaDQV2wWIE4Skj0trQQB5yF/+hAAocuvHcY1GFCtx6Xs5y5nEEnlhhKg5a3xJ00s
	EOLpqyOyeLQoRNZayfxkkDssfSIlpQMi7YBFu71yqT3cxIVVFJi2zOsxLbTQ0f+HA/rV2uhnC1y
	eZUI5V+phe05Nw=
X-Received: by 2002:a05:600c:a104:b0:492:3347:12a9 with SMTP id 5b1f17b1804b1-492334712camr40164685e9.26.1781688550942;
        Wed, 17 Jun 2026 02:29:10 -0700 (PDT)
Message-ID: <f223d669-d61f-4110-88aa-e2e71bee1f14@suse.com>
Date: Wed, 17 Jun 2026 11:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.22? 5/7] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
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
In-Reply-To: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1781688551-BC965DB1-5C22FF44/10/73395122804
X-purgate-type: spam
X-purgate-size: 3275

cpumask_to_xenctl_bitmap() may return errors. Clearing the error indicator
of an earlier such call by a (successful) later call is misleading the
caller. For "set", keep setting soft affinity if the hard affinity copy-
back fails; only accumulate respective errors.

While fiddling with return values, also drop a redundant clearing of
"ret". This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead
code") violation.

Fixes: 6e4ecc6d5884 ("sched: DOMCTL_*vcpuaffinity works with hard and soft affinity")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v2: Consistently return first error. Integrate into series.

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1708,7 +1708,7 @@ int vcpu_affinity_domctl(struct domain *
 {
     struct vcpu *v;
     const struct sched_unit *unit;
-    int ret = 0;
+    int ret = 0, hret = 0;
 
     if ( vcpuaff->vcpu >= d->max_vcpus )
         return -EINVAL;
@@ -1746,19 +1746,17 @@ int vcpu_affinity_domctl(struct domain *
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_FORCE )
             vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
 
-        ret = 0;
-
         /*
          * We both set a new affinity and report back to the caller what
          * the scheduler will be effectively using.
          */
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_HARD )
         {
-            ret = xenctl_bitmap_to_bitmap(cpumask_bits(new_affinity),
-                                          &vcpuaff->cpumap_hard, nr_cpu_ids);
-            if ( !ret )
-                ret = vcpu_set_hard_affinity(v, new_affinity);
-            if ( ret )
+            hret = xenctl_bitmap_to_bitmap(cpumask_bits(new_affinity),
+                                           &vcpuaff->cpumap_hard, nr_cpu_ids);
+            if ( !hret )
+                hret = vcpu_set_hard_affinity(v, new_affinity);
+            if ( hret )
                 goto setvcpuaffinity_out;
 
             /*
@@ -1766,7 +1764,7 @@ int vcpu_affinity_domctl(struct domain *
              * cpupool's online mask and the new hard affinity.
              */
             cpumask_and(new_affinity, online, unit->cpu_hard_affinity);
-            ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
+            hret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
         }
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
         {
@@ -1804,14 +1802,14 @@ int vcpu_affinity_domctl(struct domain *
     else
     {
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_HARD )
-            ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard,
-                                           unit->cpu_hard_affinity);
+            hret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard,
+                                            unit->cpu_hard_affinity);
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
             ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft,
                                            unit->cpu_soft_affinity);
     }
 
-    return ret;
+    return hret ?: ret;
 }
 
 bool alloc_affinity_masks(struct affinity_masks *affinity)


