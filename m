Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A597CCA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:12:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446138.1662187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDwl-0006W9-9P; Mon, 12 Oct 2026 11:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446138.1662187; Mon, 12 Oct 2026 11:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGDwl-0006W2-6h; Mon, 12 Oct 2026 11:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1446138;
 Mon, 12 Oct 2026 11:11:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGDwk-0006Vt-2t
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:11:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGDwj-00BgUY-0Z
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:11:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc06f-e002-0a2a0a5209dd-0a2a4505d9cc-36
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:11:56 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc07c-4cb1-0a2a45050019-d155dd30c86d-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:11:56 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so988260f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:11:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e4018sm19213715f8f.11.2026.10.12.04.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:11:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1791803516; x=1792408316; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WB7JnN3Pnr9p97cTZkiKT+bs6AiP8D5jZZ9qQ2uMm24=;
        b=XOExxaIRj86L07l2CFfMMya9akN8lid/Hhn0hp1gfTqbmKNZrLAgYGWlyQOeUZ5RTS
         q4F638Ric9qRbbZxOrseak5n+2iFskshhGfAZeNMNdM4oMuR7+66OYm9e6/wOQcfloTE
         DAa3gx3oqEuFMDixFEEs5qbdoxvmBzkp7jSTZ1YET+2IX5CrfOEEdXG0JEH4aZeI0XZo
         yQd4Wf/xPRWS+m8U0E2CnKOVJAr5CHZkBmzn0NHFSEau1f5OaGLBsk6w2xDQUJoBM/rF
         +gar1FKQn5oA+h/L7j3XfwY2wDnbuIyB3PkbubnH3Ymxvlsxwn7SASdy6Y92z7wS4mHF
         dPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803516; x=1792408316;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WB7JnN3Pnr9p97cTZkiKT+bs6AiP8D5jZZ9qQ2uMm24=;
        b=I3XUzYX3x8EJWfPZFEuH1QBgSVZ9Tfe8++mPtnW/Iwu+3L3xkf8fbgLBwpift9eKYO
         oo9WS07NcNXJAoYJXWLg+jdnMFWKxvj/fK/2NU9qepDOpGD1+RZtgErHWZuog6q7OIqE
         paoB0HQHh72RofgwBGeh4wsut5lN6k5S1v4pqNj8BeW1DZ5jB7vkFDXghBbpVHdg3jO/
         ktS0E9jlEVKcgKoX2xVmSd7Uko+LlZUm5c2dZvFsVDJ7h9hSfzWcOjEadbIZ0uUfBjLf
         krdhbnQWWiYJ+WpTMPU/M/B74L0wdmyfZ/vEvoCYvPr28P016gHe7gp2T6YxcZ1fGaON
         B7gw==
X-Gm-Message-State: AFq9FYKQWvvwf8CbK+9H56mjSED2qSPQSDrCEhbzegcYrojSckwK2hVI
	o3rkxndht7AyN1Au3pE7ss7jlN8vTnvv6Niwj8LzciPLorG0XIgTzJCKeje4Sxa9SPffwhsXxN1
	ykeGcUg==
X-Gm-Gg: AYBFou0yRy0gg0Z+j9REepdVN5d9ZYdD6+0C4FmTQjdeulFBZgPYkY0fEi71xtRQK7u
	XrwmmQt/pRPmi6ralA4mhHm9s0ff44TzrtdXlJSbNsP0feIb5zT0NMvcuABMuql322bAhQc/Skk
	3A4b3FxLd7ovLj/9Czf00aCFt0B2F0lltvdPkn+wpvRS/2Kj/DUulmUATTGBbi9yxBP+Q8d0oZw
	T/dtHLVa44ZXpuT0PaoHqYKsfYJmJK6a9seSb/coY5vnm4kE+Tb0o3UgnDACHcSJk1mjqBrYbRT
	U8OArJV2Hk02mI1mLHSDhF4FvqMh+PtuK5VDXJUQE/Mlvuhqeaxzx6ueX4XiBtRePrboIlNTlp0
	w6JZ1gNgGU1oi6E7dgB0lBYdwqt8dsOu0y3tfOdp3LFBqL692eM3HEWUwglrS90K4BSf9gcIjMX
	CpisfczY4NX3fwPjDw12HJXoCCX2slj7zosN2UHWjCIk5DO1JCK6Ucy7pofBOyewHQwBni5YzIk
	I7UUSxNv4MEcvvZ7xsuKO8xl2dY82gCLpDgQ4fJqnmttmkiy6k/vouPpJYKhw==
X-Received: by 2002:a05:6000:1290:b0:488:83f7:633a with SMTP id ffacd0b85a97d-48dbaaf0096mr11363905f8f.28.1791803515927;
        Mon, 12 Oct 2026 04:11:55 -0700 (PDT)
Message-ID: <ca7cc14c-e860-4626-9d20-820796a91024@suse.com>
Date: Mon, 12 Oct 2026 13:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, George Dunlap <gwd@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: invoke xenheap_max_mfn() unconditionally
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
X-purgate-ID: tlsNG-c201ff/1791803516-253192A1-063D8CA9/10/78276251493
X-purgate-type: spam
X-purgate-size: 1839

Calling the function only conditionally can, when highmem_start isn't set
and when hotplugged memory appears above the boundary where the "short"
directmap ends, result in Xenheap allocations to yield memory which isn't
accessible through the "short" directmap. Accesses from PV guest context
would then either fault or access guest controlled memory.

With this the bifurcation done by 88e3ed61642b ("x86/NUMA: make
init_node_heap() respect Xen heap limit") can also be undone:
end_boot_allocator() can be called from a single place, and system_state
is bumped right afterwards.

Fixes: adc5afbf1c70 ("x86: support up to 16Tb")
Assisted-by: Claude Opus 5.5
Reported-by: George Dunlap <gwd@xenproject.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1908,16 +1908,17 @@ if(j == 1/*bm->kind == BOOTMOD_RAMDISK*/
 
     numa_initmem_init(0, raw_max_page);
 
+    if ( !highmem_start )
+        xenheap_max_mfn(virt_to_mfn(HYPERVISOR_VIRT_END - 1));
+
+    end_boot_allocator();
+    system_state = SYS_STATE_boot;
+
     if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
     {
         unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
         uint64_t mask = PAGE_SIZE - 1;
 
-        if ( !highmem_start )
-            xenheap_max_mfn(lo);
-
-        end_boot_allocator();
-
         /* Pass the remaining memory in (lo, max_page) to the allocator. */
         for ( i = 0; i < boot_e820.nr_map; i++ )
         {
@@ -1936,10 +1937,6 @@ if(j == 1/*bm->kind == BOOTMOD_RAMDISK*/
             init_domheap_pages(s, e);
         }
     }
-    else
-        end_boot_allocator();
-
-    system_state = SYS_STATE_boot;
 
     bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
     if ( !bsp_stack )

