Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54540606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ebJrcgiK
Received: from list by lists.xenproject.org with outflank-mailman.1474721.1681722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxdi-0000z8-Kb; Thu, 05 Nov 2026 13:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474721.1681722; Thu, 05 Nov 2026 13:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxdi-0000yz-Hf; Thu, 05 Nov 2026 13:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1474721;
 Thu, 05 Nov 2026 13:36:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxdh-0000xK-N6
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:36:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxdh-000ODP-3o
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:36:25 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8651-bab6-0a2a0a5309dd-0a2a4503a2f6-24
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:36:25 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8658-fae8-0a2a45030019-d155dd2dd5e2-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:36:25 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e47347279so1118731f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:36:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed45d71dsm10037875f8f.36.2026.11.05.05.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:36:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793885784; x=1794490584; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bROrBCXMpePIikYQv5ywyJaqpPy7JdaGnAckdlts9Cc=;
        b=ebJrcgiKWhjKbUC4Sj4ggy0pwyWITZUgq2vc3GuBD21c8VWSkMheechn2RcO1u7icn
         JXGME/OTpbmT4rqTDJXM3FA464CTWu2oECpE2FSUCGWzO0IVdzLC+HT9kOGe6AnucCfY
         husQwFMLetLSf1aaLIXC7npSjqaiUUGNrbEgRFwsfxUKQ03o5G9u4IGI2Tmb4EXKsxSX
         VQhIKQQTbQ9RAz/ixgrH/vWS+VnXCpx3mX+PyacFaUX49oH0FZwLD4XX2tqWZD66oiAe
         b04UbGa8/E/zBQI80Tc7PJtkw4TNpNJeXLrin3EARjkgjQuS4UfafFKom1b4ue0lYRyN
         HB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885784; x=1794490584;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bROrBCXMpePIikYQv5ywyJaqpPy7JdaGnAckdlts9Cc=;
        b=IXf417AUguGiwvzx3lvPNvZQaoAym0tH1KR3U7o0X526RaxP3m735VHKz0hMsscpvN
         gemvZ7uDPD6fshqo4zkUUdg/LYF7KO56HbTn042DmRSCP3n/up4HDfrKbS36iFP2F2tb
         0vomc/xfVG18fd4lGnjNU+Hwkd45D2BRpsJxLWuasDF7yIwhfd8J866fBIy3ha+mpOpB
         HflOB0C/w4Tcz94UT8OfN9PGVMJ35LgoSGa0VVVh3DaB83hRqwCrb/KDVxr6zX5/uhBh
         fArw9uQJiVkog7qR+I6w6EG8uxYWhXy9nW2KMaFcx3oKXSi0pyFOXgWsxtbTKDtBF4FX
         fLvQ==
X-Gm-Message-State: APuU4Z+PZp8omQhdZFemq4P6/dSCY/YrjXTRt1hcFHwt6wcea7+8I5W2
	PXIO2QxzSIJyyulq97JxDikmdjEmzhAFjhMkhMn85oS4vSR2AHfIWRs7SkbBa3pH27g6gewfijj
	m8WCzgA==
X-Gm-Gg: AYBFou3eSk+/YWISYwbVtGxamhxW8iId+FebFPUY7q2yTWoUsyHCaiYdpzg6NCdToBi
	rJ4l2Ivm/uoMI18dXI32HecxJqBjHDw/sM45XqWa2UmcDDH8uySzsX87d86mxsBwgyFgER3Cdzu
	iEWeO4/G8qnPWEyfTgCn9TIS4D/Ce3sT3uqTgjjwqbGfVKjQLZhUVrMlJRhccbqOt4MCLuotbBE
	HC3JubRV/Ja+mm9G2NAW0+e8TQQvKxB/oufCW3x3TKGzh1LDvAdeOVgDLBFZtPefIvPJK2Qa/yN
	fi50gWG1wNiIaHqbR7xc6TaRIXCte2nvL8DqxIw8vE0ahWxp3jG/ZngLshfnF1Z1Hdn8LvRlqvs
	pvhcl3qhdHSHzS0wxnaA2fpJ+MIzAusb5EHVLSsVqymfoicQ1nElIfbiVNhtifrN5gzmZTXhqjy
	z2Mk3B5Dsm3r/a3CiLH84fDKGS6YVuZ414XwQ4KxcBghHZ/QuYC0O6ae32pZcAon1mpGABFEpeq
	z6rZgrnL6QOhWogOwX2GkM0RtA/scbBFWAe0U9EaH75GK+iIsI+TeTIVol07rlmgRRBC3ahGkg/
	dVl/dxLDsQLNv4Ctgyl1X6XfgecPY/WYq2SeOgYZtBvshZbmfFGuHKzDljPKr55JpNYaplrXwcP
	m0R1DLTaBFrtHwPfLPHLULMB2yFOPyKJPFOuYuA==
X-Received: by 2002:a05:6000:4a16:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-48e6e2fab79mr41873743f8f.18.1793885784510;
        Thu, 05 Nov 2026 05:36:24 -0800 (PST)
Message-ID: <bde988ea-35c9-4876-9c67-af505f794e8f@suse.com>
Date: Thu, 5 Nov 2026 14:36:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 11/14] x86/PVH: prefer smaller E820 regions for stealing
 from
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
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
In-Reply-To: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793885785-752854E9-B6462698/10/78276251493
X-purgate-type: spam
X-purgate-size: 1867
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Nibbling from the end of large regions tends to split full 2Mb (or even
full 1Gb) ranges, which Dom0 may otherwise be able to use superpage
mappings for (when, like Linux, it e.g. has a direct-map).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
On one of my test systems this doesn't work as neatly anymore as it did
before. In v1, since the kernel range wasn't removed from the candidate
set, the (relatively large) E820 region covering it wasn't used for the
small ACPI ranges we need; instead a range of about 2.5Mb size next to
the host's ACPI data was the best candidate there. Now, with the kernel
starting at 2Mb, the 1Mb range [1Mb,2Mb) is the smallest candidate, which
is a little unusual a place to put ACPI data.
---
v2: Re-do from scratch, due to changes earlier in the series.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -184,8 +184,9 @@ static int __init pvh_populate_memory_ra
 }
 
 struct steal_info {
-    unsigned long size, align;
+    unsigned long size, align, region_size;
     paddr_t addr, end;
+    bool nosteal;
 };
 
 static int cf_check __init find_ram(
@@ -197,10 +198,12 @@ static int cf_check __init find_ram(
     {
         paddr_t addr = (e + 1 - info->size) & ~(info->align - 1);
 
-        if ( addr >= s )
+        if ( addr >= s &&
+             (info->nosteal || e - s <= info->region_size) )
         {
             info->addr = addr;
             info->end = e;
+            info->region_size = e - s;
         }
     }
 
@@ -219,7 +222,9 @@ static int __init pvh_steal_ram(struct r
     struct steal_info info = {
         .size = size,
         .align = align ?: 1,
+        .region_size = -1,
         .addr = INVALID_PADDR,
+        .nosteal = !end,
     };
 
     rangeset_report_ranges(ram, MB(1), limit - 1, find_ram, &info);


