Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9D606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fkY4LvbU
Received: from list by lists.xenproject.org with outflank-mailman.1462157.1673206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhBo-0002ea-NN; Tue, 27 Oct 2026 13:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462157.1673206; Tue, 27 Oct 2026 13:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhBo-0002eT-Ko; Tue, 27 Oct 2026 13:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1462157;
 Tue, 27 Oct 2026 13:26:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLhBm-0002e4-Pv
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 13:26:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLhBl-007uwB-Va
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:26:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0a66c-e002-0a2a0a5209dd-0a2a4508b364-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:26:05 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae0a66d-f659-0a2a45080019-d155dd2ae51e-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 14:26:05 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso2682850f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 06:26:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f36asm23072904f8f.1.2026.10.27.06.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 06:26:04 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793107565; x=1793712365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8GC62F5OBI5s+qwxFjFkNM08oTK+HZwe67OJQDmjAo=;
        b=fkY4LvbU2MBGnU9SDq+YhqX/dGK/ZhuHSAplhCpPwhGEMzrv2l+ik6lq9V4AxD94qO
         LM4uFlmcgu368KBqFZCJuOY94zNOkq/En2yE2YbHUGEj39JBIe/jFRe/bUrm5YbgwhU5
         nBfof+lFvK+iJmo5mznoxDeILtVlG1YxShfM3GMa21MDAcagN2liBMInClkMVAAP8dT0
         m2RfqEG2s0vtE6Y8GkHANXXmjXu9kNu1FKhsWjEeG9z0pKfVZjjwA9i9FwRZWgUZNmLh
         AnXYibjG11rjeeIcFtxdpd8BK9WFNnuLUyo8R5Q4FW4pvTc69s6mYVAPBBdDDwpm2u2V
         9N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107565; x=1793712365;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8GC62F5OBI5s+qwxFjFkNM08oTK+HZwe67OJQDmjAo=;
        b=WEqfBEooO47Of1RdrwzaunARXo3kU8HyIIMXNCCSkqeTC2BEJ7nmSykoeASIn199kK
         ouxvRMlPuHDJKlWsLmh81IZYFOr69fuXc6Zf3edlg/G4UkEMuV56c1zFvPbmcDPplS7y
         KxTUBUYUmnf5EGR+9ZyGuXWWX3RKHLNgkGAf4vVML0Qo978+L9B8ziZsnjriuALIS65Q
         p6z6rZ6xCmaBSbr+830RQ4b2rm5dpf3s2i6vLGXkA6zK/3iWkvPpQfPa1amx30rKgZH/
         qmhW3WdXqVaAVH480vsuqnDZXgee62OGuzcNY0K9reBsH6Hk7ZR7o+XwTDbninIQg98M
         77vw==
X-Gm-Message-State: AFq9FYJJ8W81sOMhbkKPp64FeCnKRnRwk6nY+1FmIeJA2RjSfGJCckGa
	ojz0pCkdnDwRf1fMdp7YQZP71YZBQgnS0wqATdxIE3il17Q/gdnxKhHLrj9cOavBwvpMAAdZ2Ve
	KqUa6rw==
X-Gm-Gg: AYBFou1xjPhAaaqVJjdqSUDnWcKOYlqLyqm9+WCTMHaWKZB/KD/vRH4aPnLri6WwT/l
	wOzOxPwUXVhTLLTiH8ztb4rqk57fDEoBRQbg8Y3iUsQnmAcaz5O30aVnNvrRfeV2GeamuF9Vtxl
	9NeR8i+vT8xtUHuROYKQdx7eRi9QUlRO3g1GgXuS0hWN+dqTQ4UQSQdABSIuZz0xDCsTeckPoWI
	a06CkIje6bmOEzvDat0lpzC14qYXqJfPHrfmfHluxP4jAUogwvIilpmiBvdlTT20zqJKKIsZXPs
	g1/QPtAsr55n3tPlDHOUJKkblfRHycADs5CNsSTcylp5Mn8BlBghfSOvX0loR0rdjCvk1DZWqtG
	/s+j2PHu2cnGgJkicYkc7Y2XGVJTe6Wjlf8JtkoGeHtwk0wrJuIjhhxlrm2TR0xQgM3c/z69NUk
	uVn36m7sqrI2O7pXFecO90RgrMR+UTtfLKN0rhBp3ceB9SK/CRPUGP+vzjbO+cHekexSTXRxhug
	9sRT9uFYaE/brWEA4YXgPJoopJAsDOFfipkPl3gYggUDDi+3ILMzlrs6rAecj+nWNjpKf3YxLGq
	LcLPLZfpBML813LQ3gCHF3pVG1XUmAAvxh8psm7ByiqP
X-Received: by 2002:a05:6000:298d:10b0:48a:f404:695e with SMTP id ffacd0b85a97d-48e3eba0b4fmr13057242f8f.50.1793107565106;
        Tue, 27 Oct 2026 06:26:05 -0700 (PDT)
Message-ID: <fc12c368-d74e-483f-a17b-8503b3039c17@suse.com>
Date: Tue, 27 Oct 2026 14:26:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: purge mce_amd.h
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
X-purgate-ID: tlsNG-c1860d/1793107565-D6D4087B-595ABBE0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1507
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sole two declarations there aren't needed, as the functions aren't
reference from outside of mce_amd.c. (This also addresses two Misra rule
8.7 violations, just that we apparently didn't accept that rule for some
reason.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If it wouldn't result in more churn, I would have been inclined to also
drop at least the mc_ prefixes of both functions.

--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -56,7 +56,6 @@
 
 #include "mce.h"
 #include "x86_mca.h"
-#include "mce_amd.h"
 #include "mcaction.h"
 #include "vmce.h"
 
@@ -101,7 +100,7 @@ mc_ec2type(uint16_t errorcode)
     return 0;
 }
 
-bool cf_check mc_amd_recoverable_scan(uint64_t status)
+static bool cf_check mc_amd_recoverable_scan(uint64_t status)
 {
     bool ret = false;
     enum mc_ec_type ectype;
@@ -131,7 +130,8 @@ bool cf_check mc_amd_recoverable_scan(ui
     return ret;
 }
 
-bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype)
+static bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc,
+                                      int addrtype)
 {
     enum mc_ec_type ectype;
     uint16_t errorcode;
--- a/xen/arch/x86/cpu/mcheck/mce_amd.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef _MCHECK_AMD_H
-#define _MCHECK_AMD_H
-
-bool cf_check mc_amd_recoverable_scan(uint64_t status);
-bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype);
-
-#endif

