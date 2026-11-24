Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A69606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ny8QRtuJ
Received: from list by lists.xenproject.org with outflank-mailman.1500939.1696988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqbp-0002XX-Tf; Tue, 24 Nov 2026 13:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500939.1696988; Tue, 24 Nov 2026 13:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqbp-0002XQ-QF; Tue, 24 Nov 2026 13:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1500939;
 Tue, 24 Nov 2026 13:30:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVqbp-0002XD-ET
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:30:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVqbo-007v3F-Qt
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:30:56 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05918d-8faa-0a2a0a5109dd-0a2a4509d18c-14
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:30:56 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b059190-be1a-0a2a45090019-d155dd2be0f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:30:56 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4aa5833c263so4339264f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:30:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d60sm28743687f8f.3.2026.11.24.05.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 05:30:54 -0800 (PST)
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
        d=suse.com; s=google; t=1795527055; x=1796131855; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=efQMg8ccz53MW7JwG/28Z6uF2wC4RfyLzCsVqji7zXM=;
        b=Ny8QRtuJZ0yHLPjmV3u7AOMYfUfF2hDFp3yqU9qAwTgMswncGZKgHlXgHBZcUQVmRz
         Nj9UcthO8fHrwYonzUcJj7KRxF3LEEUpprbECBnvDXYkjAl7Y+j+zxMhzQE/k8iMxlt+
         x/c44CLH4NWRdWfd0LaLDtAnumwa5PS3PW6ieggLvJTWOSK9rENz9HdhcV26+AiguVr/
         zQe4+jVW/kyl1IqjM3g/VPX2gqTLQHwidYPNo46683T7jMiXdJIptIU8ictbZJgquxH4
         kv+t1sNt5MUcrgpeQ8FH3E1v4cDgxiy81giTSijVZNR0RsZxMcvITLBgBWta88dkkZ/j
         5a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527055; x=1796131855;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=efQMg8ccz53MW7JwG/28Z6uF2wC4RfyLzCsVqji7zXM=;
        b=bKqWMS2BVHmdn3IDAhcvzV9XPGtmZfyp6uHB+prBi+mOrKRzi9A041RTm2suXTmWJs
         n2oVGfpWD/peCvLgB001Mu2T5rPq6NynkanmVETXWTvCeObf9M1gnCLiNkJYNK28lh8J
         r90T9amjV/5a4ZILhGtn5zgxz39cz6MEXJy1BzLdD+K2ChLa6l9PUy1uf8XYIMrB6CMU
         EHmI4hLe8W8aJu49gR+EwIC5gxgeVZx6yGaZMB7kEu/5w7imxZhgzXBdDgMXOVXzUktF
         GH1dONAR7RxkrEG2AtLKOqxC3rjQGepnuj8B/KxfA6NvPgLpnXCf93CMBnM0Emx33Bmz
         IDLA==
X-Gm-Message-State: APuU4Z91L7Gn/xQA9Kd0oNYKfdcu0vELCXFgCqEPvQ3E1UukSCpLD572
	/Es5ihkJlKrCk1N++PXNDI1Xh0XnxDO/rbBV0bb2EJQpu2GgKUcS29lNODD0WYiTOOyGwliIxKR
	fYwP4og==
X-Gm-Gg: AZFdTZe2ioGu2aP8OZRNpJ8hHdirsZzN2tipp/s2Omr6JzdwVRKMutCtCwLJmFlGmeW
	6yjXYyV+1TfRyNzvqPm8OIvfrL6YeFIsOrd3CdfJ86KYLDfk0kiD+c/kKIMGLioQ3G/zkoYX9ko
	2GyRO+Q00VtFlRpfZigL67TWxX1xSbBDfMesCOWMonYJwSGoWB6emwfQfOKnKENh2pzcthiXtMj
	SnH4kAGpGINKaLPj5knWUPILaJRRD86veT1i0VIXKGKC8vISKoh4SFXQgDjnuLC5FHUwvylVJnx
	NvM0aldAjyczO8AhsvZ2unteCPDyRrvphYJgOOCigxRRfIaX7XMsTuvjSUcSqzJsMnmTaloolEF
	FC3xSu9xh/93624eP/BIjtL7HnuQYsQEwM6apBEM0kVaGDsKGrs9/BeWF2bW3HiqSBIDPCWsNBl
	7nUiyOPuUh6YOPVxOAm0tmkVkqN3aTZqzX65oQCc6h3RyOP4yurysXFE2AXvh4wJCzGc1ln9Z7X
	USnuHHq/Ptvqf23eDiIbxKPvauw7uZvgX8Ef7jk5EoqG/bOAVVAkU19TDx4SwA/ddfEAxVsERaP
	FU7gPM7bWFvegk5PWzVbYMQp1OWdMR0jvumL5S3VWewtDx3Cd64yXbx2vrlRuhPJwv6865WSJ26
	Q6PIYh6gGw+ZL0uVOMoRDeyoLyYcj/Hz8jFvdYA==
X-Received: by 2002:a05:6000:1847:b0:4ad:d65:ab13 with SMTP id ffacd0b85a97d-4ad0d65aed2mr26035543f8f.51.1795527054608;
        Tue, 24 Nov 2026 05:30:54 -0800 (PST)
Message-ID: <f1be8280-ee73-466c-bcf9-cbc1c00eda07@suse.com>
Date: Tue, 24 Nov 2026 14:30:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/PV: modernize descriptor read sanity checks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
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
In-Reply-To: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795527056-BEAD8034-F6BC60E0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1649
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

First of all use ASM_FLAG_OUT() for better codegen with new enough gcc.
Then further change l's type, such that the compiler no longer has a need
to emit an extra MOV ahead of the CMP: LAR zero-extends the result just
fine.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Imo the #ifndef NDEBUG (soon to be switched to CONFIG_DEBUG) could be
dropped altogether, by using ASSERT() in place of BUG_ON(), and by
dropping the volatile from the asm()s. Then the compiler ought to be
able to eliminate the entire if() in release builds.

--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -52,17 +52,20 @@ int pv_emul_read_descriptor(unsigned int
 #ifndef NDEBUG
         if ( sel > 3 )
         {
-            unsigned int a, l;
-            unsigned char valid;
+            unsigned int a;
+            unsigned long l;
+            bool valid;
 
             asm volatile (
-                "larl %2,%0 ; setz %1"
-                : "=r" (a), "=qm" (valid) : "rm" (sel));
+                "lar %[sel], %[ar];" ASM_FLAG_OUT(, "setz %[zf]")
+                : [ar] "=r" (a), ASM_FLAG_OUT("=@ccz", [zf] "=qm") (valid)
+                : [sel] "rm" (sel));
             BUG_ON(valid && ((a ^ desc.b) & 0x00f0ff00));
 
             asm volatile (
-                "lsll %2,%0 ; setz %1"
-                : "=r" (l), "=qm" (valid) : "rm" (sel));
+                "lsl %[sel], %k[lim];" ASM_FLAG_OUT(, "setz %[zf]")
+                : [lim] "=r" (l), ASM_FLAG_OUT("=@ccz", [zf] "=qm") (valid)
+                : [sel] "rm" (sel));
             BUG_ON(valid && (l != *limit));
         }
 #endif


