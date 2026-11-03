Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D8606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D+UwLRUQ
Received: from list by lists.xenproject.org with outflank-mailman.1469377.1678212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBB6-0002US-EG; Tue, 03 Nov 2026 09:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469377.1678212; Tue, 03 Nov 2026 09:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBB6-0002UL-BL; Tue, 03 Nov 2026 09:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1469377;
 Tue, 03 Nov 2026 09:51:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOBB4-0002Tp-Ks
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBB4-002ABI-1G
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:51:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9aea5-e002-0a2a0a5209dd-0a2a4505dd3a-22
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:51:37 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9aea9-4cb1-0a2a45050019-d155802cec7d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:51:37 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso24921175e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 01:51:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d5dfsm27963445f8f.3.2026.11.03.01.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 01:51:37 -0800 (PST)
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
        d=suse.com; s=google; t=1793699497; x=1794304297; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yu7a2ic57pWEnD4j7Nht+DNuD+UcR5F9Ux8mUAVGlO8=;
        b=D+UwLRUQISBx0Vw2Iy5JqStmzSFrEuS9ItGQlMksz9enZw5XqB+YUwYyfdBKySTTgo
         EkjRduHsaU+6qj7N1ZCEU2stWfjXV+ScaFln7Khy56SZS8CDrgC/FpRkZem0h8rIADeZ
         RzvrgTLyc6jE6auI7Miq25vtjCu7IGRG2wNZVnLgDmogj/37ZSxEDIPyEJwbuUO5re+u
         MHkiSj72nJPEGB0jlYeEipxoHeVylLNtuaRFXcqoC1TgH8cMvW6Ke4lOrBSOqnBeZLVa
         evJU0JPp73cRd72LSyT4FgMnB2CJ0PZ1n6mlf15+Xg1OWf7NtF3eSCy2iL9A58bcOO19
         avUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699497; x=1794304297;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yu7a2ic57pWEnD4j7Nht+DNuD+UcR5F9Ux8mUAVGlO8=;
        b=Fw1JEndYhEn86cWyI0jTBW8dFRqImoItiqwc2EL3IrRD4tPEe2y9zIZTbgWvQAI9bf
         1ur4GMP2iToNKQHpQwlGYNDcwk7fjD7BKy+3Xt08SuhQnrfk6C+7qWqUmHxzOaqnhquE
         ZHbCFvidQ/WLXoEiC2naai0K/aBr9eCPFPZeH1tDaJWjlbvwn+sZwT1hHD57t/EWPlh+
         fpUss6aLyfW5JlpGRZFUuhNe9RGVfJBsSjqng/b5tt9gV8pKdcmvkzCGXqFmh8W0NIV+
         lzqeyiJCwqbVbkWhwlpXHp/rpfKv4lmVEOavamdyy2NlR2lq3c40QDXVudX51Oq3Ui0a
         qQxA==
X-Gm-Message-State: APuU4Z/vTuuaUF8wEnKEP3a2cb+ymIRKuKbco5tgoGauvyqKchV16hHz
	cUPfpLSagKzIJmazso8/Am4wpY5/rvCdOgYv47K95Z1qj5p2Qyqb3GoFfG5chtOpK/2gPCaYn46
	BVkGEjA==
X-Gm-Gg: AYBFou1238g2VFZ00LzDXoRqgQ3iV7ys09uD5VwnBc4rxNJ7MtlnAjcsDpd/y9TW3G8
	HYrHGlsBLcg2QeqG8UI+reilm9C+hnuIbp8YVL1VGTyu8cGmp1VF8wJnVcGh0QBxS+qQ+ty+3xd
	fFDrd/u+xwlGSo4pU9pcf4nJXFp1UhUJhKNCJGqVHYh794/tbz5c5u2PxXUoozob0lQv86gh9ln
	QsHQvoC7TQjgOet34d4AWSsVr+4o/POacQv6vFC2N2gVAZ4FACLaWXY/rPhVXGviYphn4Fk6Sqa
	NF43ulWmwiU0KQ5TXoPjjT5XUrohvRP8UVka0NV1b9PWxL5n5YgDfNPZIDUNiJgb3LrFwDIsZ8D
	OuTQiv3bvhzURmG/nC0r0cdTNutJRnxOFyBu5fn2VouKTx2uU+uw/oQ02nBJQU49x1qUjt28i2T
	xeOtHozHMhqqTBSaJ0e++vK/WScdKal8dekbIgAWJ4DVyFA1h3ItTAiCTLhkmgsbkeZyRugkn4s
	bKZ9cx12KiXbC72JOHhFw1VmjeXCrTsANKzQpq9Qs7zp7NrhiVNF7SacXSKrPK4mswfxAv2znrw
	Eks2EN6yTSRwWowSt539hHVc5i/s4A5JJPGhxbHv1vJKBgeo1b/vxquu860x5oAfLV52p2PfFM8
	Vh8cDWuJr/21mHkNt
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr108160975e9.20.1793699497335;
        Tue, 03 Nov 2026 01:51:37 -0800 (PST)
Message-ID: <4f8681a3-b35c-4c97-a731-a58e3eaa8770@suse.com>
Date: Tue, 3 Nov 2026 10:51:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/MCE: drop redundant code from mcheck_mca_logout()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <beb9293a-e93e-4965-96d0-43df23b33c32@suse.com>
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
In-Reply-To: <beb9293a-e93e-4965-96d0-43df23b33c32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793699497-F429B2A1-7173858D/10/78276251493
X-purgate-type: spam
X-purgate-size: 1145
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pull out the shared part of a two-way conditional, and use plain "else"
for the remaining latter half.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To my surprise this does change (shrink) generated code (with gcc16;
albeit maybe there would be no difference in release [-O2] builds). This
looks to be a result of the compiler pulling the calculations out of the
loop, for being loop-invariant.

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -353,11 +353,13 @@ mcheck_mca_logout(enum mca_source who, s
             alternative_vcall(mce_callbacks.info_collect, mci, i, status);
 
         /* By default, need_clear = true */
-        if ( who != MCA_MCE_SCAN && need_clear )
-            /* Clear bank */
-            mcabank_clear(i, status);
-        else if ( who == MCA_MCE_SCAN && need_clear )
-            mcabanks_set(i, clear_bank);
+        if ( need_clear )
+        {
+            if ( who != MCA_MCE_SCAN )
+                mcabank_clear(i, status);
+            else
+                mcabanks_set(i, clear_bank);
+        }
     }
 
     if ( mig && errcnt > 0 )


