Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188B510ED674
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2026 14:40:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1265780.1556529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w68Li-0004xM-83; Fri, 27 Mar 2026 14:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265780.1556529; Fri, 27 Mar 2026 14:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w68Li-0004xF-5Z; Fri, 27 Mar 2026 14:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1265780;
 Fri, 27 Mar 2026 14:39:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w68Lh-0004x7-7U
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 14:39:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w68Lg-0074aP-J5
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 15:39:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c696a8-bab6-0a2a0a5309dd-0a2a45048808-22
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 15:39:44 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c696b0-c823-0a2a45040019-d1558030c1ed-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 15:39:44 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso17927325e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 07:39:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9f0afsm174396405e9.10.2026.03.27.07.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 07:39:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774622384; x=1775227184; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BIapZxRnDOssXgnv5RJRZMWVrnwBRoUenD8zoanxkCE=;
        b=VFX6w1m4CHFk/aRzsH1zQCNrYyUeUys7/TvrdL/W/2xmAYcl/OFCt+X7VDWuDfYz0v
         cmuzFegYeHJbDOvWqzyhs0x/OJjjLtWQvhF6br76QVc5koBiavcbJISaM6sj48/WXAZC
         u1QeHI98l9gCkwVVpAYTpYbUjeHykvPcJaIFwGYZifUbexcj5M6h9VTCLhqM1WIIPYqF
         o+H4E1dN/+KJM4ir/O3sHbfBullzWQ4jr9C2/qEva/YiaY06PsJSUbM9TuatXNUluvYq
         l8Orrb7kqz+0u4VOF0bVPJBPe4KY41G9tsuVK5ORVu6w7wL5QYuTS3/Dd52ze65/OV9W
         r1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774622384; x=1775227184;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIapZxRnDOssXgnv5RJRZMWVrnwBRoUenD8zoanxkCE=;
        b=bHEXQHo/+S1Lsl1/w+aqtqtZI1lzIjic/NRK+CdJ/dgNMTyHRjNhYdOcqTcV9rVyZO
         3tcG7Tcq64K9BHDLjHlCJN9YI+Re6EiNS8BPokPhDLNruVMZUo7hd5HajK+LJQclq5n1
         jMPzrshYLOfNCpXb7pCcg9l4QMeSmt5eubDxqZOyc94a62CpDB1htdCQRqEEdUbaseE2
         csDUUKhQY/RKUzYT0Ok0ldDBPtBouda/Y8dac8xP9d07GvOpFzUn+ZycMzgn+YoP//A1
         vcMsIvd9N5t2kFDyjZ63EbTF8IHkPc2wOi7LIz1w6bBSO9dkAIxM3ko38hloUQead7h+
         J6Eg==
X-Gm-Message-State: AOJu0Yx5DzEkAZEJvhZfIxIDhpYoaAaiOtaCYYkVxsLKHMMsPymo6/+a
	l5+6GMMX8kbnGZacinXXErvH+s5RfJbfhkL7i95E4cKTI7eQP80gu17FFY0KCqTqaQQUNtbjjDH
	9qxOl2w==
X-Gm-Gg: ATEYQzxZanrVB/womGck7haPGwTNkKa9WWtm7Z07jTVv9TGmCi5W5KQFLuC0cdar/V8
	xRD/HvUSeznW8LHP+3yh9m3ZRIvGdx7lofL766ePYF19G8AYFNM9U9XN4VeRYZ+Xxe2uY7E9CLE
	7MV+b+vxPdTOLvx/+MGnMpCVFbe03r+qwCpd/LpDSaT9mdbTGnPp4d62zEVHrYfENgkDls/P1VO
	JMy0DmNSA4TzsbNf81OyZfklVWJdoCA7IAf56+ofOCO24cDch0Rx1TegGYMDQ5dtja8QG92E8BI
	p/QDkE/p+FlSE1YhD6xy0eB8KKKpAhw2sPC5X9qmAZpLR90WxDQgWFoYGqXEpa1LDwxWAV3UQp8
	1CSpaHU+1KBvpb8uebZ/0ZVOvaARY1sWJqfYGl0pNBv4ZG/G2kxmLc5HG9DVkQa1I3jS3/gMs4G
	KdgEH9FhR68+c+DU4RbnpmoWE5Wt2P/9j4DK8TofnI9BWC3tsbjKHJtuJQuFaRIeFWfBt5BGAqw
	7KgRWkeRZSF6Eg=
X-Received: by 2002:a05:600c:529b:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48727d84100mr43438075e9.15.1774622383708;
        Fri, 27 Mar 2026 07:39:43 -0700 (PDT)
Message-ID: <df31ece3-2c42-43b6-b97c-0867255e58b1@suse.com>
Date: Fri, 27 Mar 2026 15:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/time: adjust handling of negative delta in stime2tsc()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1774622384-B908B9D1-49E60D5D/0/0
X-purgate-type: clean
X-purgate-size: 2558

When we cap negative values to 0 (see code comment as to why), going
through scale_delta() is pointless - it'll return 0 anyway. Therefore make
the call conditional (and then also the one to scale_reciprocal()), adding
a comment as to why there is this capping.

Modernize types used while there, and switch to usiong initializers for
the local variables.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Adding likely() to the conditional here does make a difference. Question
is whether to do so, seeing that there looks to be a possibility (of
unknown frequency) for the delta to be non-positive.
---
v2: Make delta unsigned. Add comment to function decl. Make the function
    decl also use uint64_t.

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -50,7 +50,12 @@ void force_update_vcpu_system_time(struc
 
 bool clocksource_is_tsc(void);
 int host_tsc_is_safe(void);
-u64 stime2tsc(s_time_t stime);
+
+/*
+ * Note: This function "caps" times ahead of the local CPU's stime stamp,
+ * supplying the corresponding TSC stamp in that case.
+ */
+uint64_t stime2tsc(s_time_t stime);
 
 struct time_scale;
 void set_time_scale(struct time_scale *ts, u64 ticks_per_sec);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1176,20 +1176,26 @@ uint64_t __init calibrate_apic_timer(voi
     return elapsed * CALIBRATE_FRAC;
 }
 
-u64 stime2tsc(s_time_t stime)
+uint64_t stime2tsc(s_time_t stime)
 {
-    struct cpu_time *t;
-    struct time_scale sys_to_tsc;
-    s_time_t stime_delta;
+    const struct cpu_time *t = &this_cpu(cpu_time);
+    s_time_t stime_delta = stime - t->stamp.local_stime;
+    uint64_t delta = 0;
 
-    t = &this_cpu(cpu_time);
-    sys_to_tsc = scale_reciprocal(t->tsc_scale);
+    /*
+     * While for reprogram_timer() the capping at 0 isn't relevant (the returned
+     * value is likely in the past anyway then, by the time it is used), for
+     * cstate_restore_tsc() this is relevant: We need to avoid moving the TSC
+     * backwards (relative to when it may last have been read).
+     */
+    if ( stime_delta > 0 )
+    {
+        struct time_scale sys_to_tsc = scale_reciprocal(t->tsc_scale);
 
-    stime_delta = stime - t->stamp.local_stime;
-    if ( stime_delta < 0 )
-        stime_delta = 0;
+        delta = scale_delta(stime_delta, &sys_to_tsc);
+    }
 
-    return t->stamp.local_tsc + scale_delta(stime_delta, &sys_to_tsc);
+    return t->stamp.local_tsc + delta;
 }
 
 void cstate_restore_tsc(void)

