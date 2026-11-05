Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9E4606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RzQZZPQG
Received: from list by lists.xenproject.org with outflank-mailman.1474623.1681633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxZs-0004Cw-Th; Thu, 05 Nov 2026 13:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474623.1681633; Thu, 05 Nov 2026 13:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxZs-0004Cp-Q0; Thu, 05 Nov 2026 13:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1474623;
 Thu, 05 Nov 2026 13:32:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxZr-0004Cj-SZ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:32:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxZq-000NaQ-FI
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:32:26 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8559-2eae-0a2a0a5409dd-0a2a4501e258-46
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:32:26 +0100
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8569-5984-0a2a45010019-d155da31b1c8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:32:26 +0100
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso311782466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:32:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e48d0dcsm171112266b.70.2026.11.05.05.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:32:24 -0800 (PST)
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
        d=suse.com; s=google; t=1793885545; x=1794490345; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pu1UgUgWUzi4OHOR1sIfgHhhY81bof5NV4x1QUXUyUA=;
        b=RzQZZPQGxT0HYPgcSgrpqCnsHfWtH9+v9YhgBV1gzNf3BmOKt9sqFqMXRMAe49FDMx
         Ruk+meQo3reTz5EE4QnL9d9HpBJpZpLyq/mWFr78kO3HENyWm5r7iahBJT31XLfDtmBT
         5jsurJ53Vjo1FDpaxKiJXLJ/2p3twK4+CNr2z6O75aJH96DWT8yB4yaw4t622vGK8GF8
         GqA1Fu+w+wkXDnuIS9ZV7SyMvY/vrqQ8dnDCaSOdzShygvBtn0TJUitW526qcllUwxpI
         zTTVVzxExrRB5LsFNc9XEuq6c9bcKmogaKgTiqkYNjzYp3E5e3e9kCBcoNsu4r5hw5VF
         SgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885545; x=1794490345;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pu1UgUgWUzi4OHOR1sIfgHhhY81bof5NV4x1QUXUyUA=;
        b=wykG6C4XnavwYl11Is3cZlIuu9KNnC2QhjwgnJ3DD5bsVRtoztGHnuOo5JqJjhrbI+
         M46oEnPjONZ//47KkzFpE7WXUUIv19pSAu7n7Y7MeZpX8IwxBxZjT1BBwWdaxoEXBTZ/
         SYliTs0MWc1wETyZ1+x05iBVoPL99HyWsoMzHYiEUapVx7INmXuu/kmY/HYtF4BXomoG
         lKZTYu+OCLTX0dUGVF6FCgVvsOgL08xR6HnsJtCp61Fye3IBTcdrtcLWoZi4FKtLtzDg
         dWByrsU0+Dg6qnMvqCDg3rTl4KuODGwotJHySUpjz9H3SbKd4jxT/Y1i1zRPB0NAvPWk
         6cnw==
X-Gm-Message-State: APuU4Z/u8CXT2WlXAaQY9ABLqN3HOFWhg8oB1a12mhXy8seQQEQ4U+Wi
	NOuoHKMIcMpBABNHl2P+1cUDbKANf1SFiKzsW5DFPmEnDProGwmUhNh6tcBeplYqUCUtsL/HedB
	8b/v8Cw==
X-Gm-Gg: AYBFou12Dt894bFHNtgsCx8ed3ytTda9mOlPaRp3mN7kL7LbWzpgFosgCS748xsfgGd
	5yakJzLXCKVqfxXhHYTxren/p5HJxG9ONZlZl2aQVP+MNq3CfZSRjG7BDXFWj5s5fcTd/VcRJBz
	BzOLEMquGKCq+NdQRlxylDgrvmZP9rlf2yJUXgODyLELg8Q4iKBn0t1UwwIwmxxc+MbpbnM1SO2
	DAFPuPCPFHfzYSmJr1Dp8PW28dtqzWzhsQ0AosxAsc98m39vrhPbzscWTLuG6IBbx1qPQXhTokB
	8/JKbGGXn27Mfhns3O0PwqSdl3S0Pv0AGvmtrCY5EYpN90+iTGPlE7oTsaal5AbUfaR11XloHX4
	afJIuPTFl9AmcA6uVvcB0h8yBO2w27PGEGVP6OHESwWxZ4fzV5/YZ5gIrPLgFBfjxUoSEzLZ5mp
	Y+g5Bq7lhvSTgxLHkiFvbuEg7lp6HH1JCQj+2DkduP7KbGovk2ZOD070qlQhLwrCzi0FIbTBeF1
	aC8Cv/BpgkHhndi4rAIwPwTDUMOadhzvYcza87hSh6fuf/MSk2XZILpX1s6Jcd91gLgqcS7Jbwv
	J4juGJhKyFSc9M9tGfpZmnTudY+rR6RN+vBooFd86tz7Boc/s7gGQiuHo67Oxs7fbkcjBCEqkZm
	Jn5hAE3jheBYH7eY=
X-Received: by 2002:a17:907:868a:b0:c40:231:6eab with SMTP id a640c23a62f3a-c4ca7a4e651mr1693952066b.16.1793885545530;
        Thu, 05 Nov 2026 05:32:25 -0800 (PST)
Message-ID: <64ac61c0-f265-4860-bdb0-f142ea9e4a04@suse.com>
Date: Thu, 5 Nov 2026 14:32:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 01/14] x86/EFI: guard against oversized modules
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793885546-BC359757-EF92E473/10/78276251493
X-purgate-type: spam
X-purgate-size: 1040
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

module_t's mod_end field (which we repurpose to hold a module's size)
cannot hold values 4Gb and up. Don't let truncation go silently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <gwd@xenproject.org>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
MB and MB2 also constrain module to below 4Gb. The constraint here may be
possible to drop once hyperlaunch work has progressed enough to no longer
require the intermediate mb_modules[].

--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -736,6 +736,13 @@ static void __init efi_arch_handle_modul
     place_string(&mb_modules[mbi.mods_count].string, local_name.s);
     mb_modules[mbi.mods_count].mod_start = file->addr >> PAGE_SHIFT;
     mb_modules[mbi.mods_count].mod_end = file->size;
+
+    if ( mb_modules[mbi.mods_count].mod_end != file->size )
+    {
+        PrintStr(name);
+        blexit(L" is too large");
+    }
+
     ++mbi.mods_count;
     efi_bs->FreePool(ptr);
 }


