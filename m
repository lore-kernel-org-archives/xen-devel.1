Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FB9C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:16:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405178.1638712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fCI-0000In-Ij; Wed, 02 Sep 2026 07:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405178.1638712; Wed, 02 Sep 2026 07:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fCI-0000Ig-F5; Wed, 02 Sep 2026 07:15:50 +0000
Received: by outflank-mailman (input) for mailman id 1405178;
 Wed, 02 Sep 2026 07:15:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1fCH-0000Ia-NJ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:15:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1fCG-00Gpr1-Jo
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:15:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97cd23-2eae-0a2a0a5409dd-0a2a4503d3be-6
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:15:48 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97cd24-fae8-0a2a45030019-d1558036e4f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:15:48 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso4503875e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 00:15:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed3716sm4469216f8f.22.2026.09.02.00.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 00:15:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1788333348; x=1788938148; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IAYE0qJP8FYYzDWFxQ5So98S6+ES5em+3AjPMWTwRhM=;
        b=DtlHsuhy+6IUb+PibkSjtkkCqZuB9h9olWgQJjPJmo6Z1xyfp8EBReOhPtc4ieBgdm
         GKlbTIQhOn2muI947dmbznA7270yV2ggkHmw68f8madJq2EXaodkyJuEZlR5P6whmedD
         2JD9W8dC600kuLgZfKYUhrXF4vWG4vom400DDbWI13d5YWfLBrZuUp4whDB5FKwENYSS
         10tGiwWtr4k6Hcva7SHWQ6vWraI0ryit4gY5w2HgT6EpgOsnuvGpL4A3pqEAlnISo5Vf
         9UOGpI1d3R17LujA35U3mIYMJhs/N1OYm/rmthFTYgNWD7BovrpO5o5zWUjqthhtiEzW
         8vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788333348; x=1788938148;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAYE0qJP8FYYzDWFxQ5So98S6+ES5em+3AjPMWTwRhM=;
        b=pszT7TZXCFaZlN6VWwySEqXtBlmFTBkFwfbiEg9+oSk3y39qS4n2cj6YMLVgBNNZBJ
         kiyxdsaKS0VxrBQymhdNFWn/89hoFzweDCgUPzV9VY/Bw8PNUWz9OMWH+DX7e7rvcslJ
         6qa6vdbPVrEryUPCc+PCu2BNNtjIsrmijzLwRguNj1TvvdN5rL1fd2NOppT/68uvDITR
         hXcB+37AKzyhvSGbIC8coputSSoyMM9/Gju1DocWiXpJxm6+yfEb2sv2DIBtMrZGAI4B
         K51c1QCaG2/JNKGAWiN/RCb4vlGOG7HX9qix/1Zrga4xoEhdik04DceiymgvZzfX4rZB
         nW/w==
X-Gm-Message-State: AFuF++laWap4eCiybeHWYzln1gyHWdUJq8nOY22sHzKDbH0OECo4Bnfv
	D7FGFMpRS7PA3b8AbJog9kYaTTL0IRH0ne+Eh1RqxSa9zhrNYkOp3cxDVJtqo00F08f98pbY+ws
	c6ltTyA==
X-Gm-Gg: AR+sD11j/8+0/nQbzKka6u/eur3MYyK1Wr80deR44ugKuc5pOo/HtJy1nWgHx/EOHJC
	c+O3rRXc/yHvLx+vfKU1Rg6+hD8f0+nMoCzdpBTYqXtH3XuqiKkaCaf3T/0RHoGIjAArEzl0EoR
	pnM/zpPDqFxCUWMWaHij0YRxk94kgQn9NIrFXoOTNJtcPNNyXewZms2sTALEeLwnt6BuJA7z0Zg
	EjMX5N3zCsXPx6u20ZKdKAb4kIfOVJSf+hvn1f6YYhdSEM/MGpRFsgh9KXxOq7L0QukXjsGT3Tk
	a4IpyNuGuGF8aDILwcQyC/YjOUkTd0zhTd81PELLAbN16Q1ECPduLdEIFd3xhvpQE3Kveoupv6q
	PlJ3k2DptT6u14MhtH7/Nacasn9W8TLKBGTIWxpuN+iw7XjVbX0yAaTOM/gi+jXXX7COlpkwB/5
	ISXznrW7jvuKfFaFv4nyUvp/b9bATtnhtqDAsOeYiVMnKaWQkKndvD2Kcx7LP4uvNaFbN4Z/X2J
	WBNzWuai1ATOpgYu/vnU9fMrRXdHnrwxtMghIUqG/N1TAnGwnfz4A==
X-Received: by 2002:a05:600c:e558:10b0:49c:e906:ba16 with SMTP id 5b1f17b1804b1-49ce906bb7cmr1538195e9.15.1788333347853;
        Wed, 02 Sep 2026 00:15:47 -0700 (PDT)
Message-ID: <a16d4079-cd8c-4eca-8a60-3cef40173cfd@suse.com>
Date: Wed, 2 Sep 2026 09:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/alternatives: mark .altinstructions r/w
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
X-purgate-ID: tlsNG-33051d/1788333348-766FB4E9-799702DF/0/0
X-purgate-type: clean
X-purgate-size: 2901

Forever since the introduction of the .priv member it has been wrong to
record the section as r/o.

.alt_call_sites, otoh, is legitimately r/o, hence
__alt_call_sites_{start,end}[] would better reflect that.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -464,7 +464,7 @@ static unsigned int __initdata alt_todo;
 static unsigned int __initdata alt_done;
 
 extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
-extern struct alt_call __alt_call_sites_start[], __alt_call_sites_end[];
+extern const struct alt_call __alt_call_sites_start[], __alt_call_sites_end[];
 
 /*
  * At boot time, we patch alternatives in NMI context.  This means that the
--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -59,7 +59,7 @@
 .macro ALTERNATIVE oldinstr, newinstr, feature
     decl_orig(\oldinstr, repl_len(1) - orig_len)
 
-    .pushsection .altinstructions, "a", @progbits
+    .pushsection .altinstructions, "aw", @progbits
     altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature, \
         orig_len, repl_len(1), pad_len
 
@@ -82,7 +82,7 @@
 .macro ALTERNATIVE_2 oldinstr, newinstr1, feature1, newinstr2, feature2
     decl_orig(\oldinstr, as_max(repl_len(1), repl_len(2)) - orig_len)
 
-    .pushsection .altinstructions, "a", @progbits
+    .pushsection .altinstructions, "aw", @progbits
 
     altinstruction_entry .L\@_orig_s, .L\@_repl_s1, \feature1, \
         orig_len, repl_len(1), pad_len
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -90,7 +90,7 @@ extern void alternative_instructions(voi
 /* alternative assembly primitive: */
 #define ALTERNATIVE(oldinstr, newinstr, feature)                        \
         OLDINSTR_1(oldinstr, 1)                                         \
-        ".pushsection .altinstructions, \"a\", @progbits\n"             \
+        ".pushsection .altinstructions, \"aw\", @progbits\n"            \
         ALTINSTR_ENTRY(feature, 1)                                      \
         ".section .discard, \"a\", @progbits\n"                         \
         ".byte " alt_total_len "\n" /* total_len <= 255 */              \
@@ -101,7 +101,7 @@ extern void alternative_instructions(voi
 
 #define ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
         OLDINSTR_2(oldinstr, 1, 2)                                      \
-        ".pushsection .altinstructions, \"a\", @progbits\n"             \
+        ".pushsection .altinstructions, \"aw\", @progbits\n"            \
         ALTINSTR_ENTRY(feature1, 1)                                     \
         ALTINSTR_ENTRY(feature2, 2)                                     \
         ".section .discard, \"a\", @progbits\n"                         \

