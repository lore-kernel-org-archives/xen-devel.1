Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B02AC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:03:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401618.1637169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqc5-0003nJ-5q; Fri, 28 Aug 2026 07:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401618.1637169; Fri, 28 Aug 2026 07:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqc5-0003nC-2k; Fri, 28 Aug 2026 07:02:57 +0000
Received: by outflank-mailman (input) for mailman id 1401618;
 Fri, 28 Aug 2026 07:02:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqc4-0003n4-CX
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:02:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqc3-002Hwb-PV
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:02:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91329c-bab6-0a2a0a5309dd-0a2a4503db8a-12
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:02:55 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91329f-fae8-0a2a45030019-d1558035b502-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:02:55 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49557167508so5870635e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:02:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c5790csm36127975e9.0.2026.08.28.00.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:02:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900575; x=1788505375; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AAGR8QqK5GSSuw5IrkPcVKUO4dAwD5cpH9pk+9rg2/s=;
        b=an0avKRxzuQ0vOD8sA/X6TH89s8aa3G4HE5TjDltZ1X+gdmuhE4SNL2Y3OCMq9Drlb
         99+bGxY9lTYKanEa68ASq1yYZZtfSG0mEvCLrWLfDxKqUXEVZRjgeghAgc6M1z0VIGjU
         9U2S5yTW297KO9PucED/QSqcVD1ZTYCeDYX/bfVvw/MC++0wfvoYKkd+gj4gngxU+ht+
         li5A8Jk2LzhNwFCuEERniI44chuOZL1qUa2LRipilQk3RhCpwnU+XiaWCJCL8bGHfyBd
         KNa2epiuY6Jy3Mfo3H/9YkoSey+WFnQP47Ocf9q7qmCdbNSnRN/S2p3l1/XVzM5snMiK
         LLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900575; x=1788505375;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AAGR8QqK5GSSuw5IrkPcVKUO4dAwD5cpH9pk+9rg2/s=;
        b=pHzleCSsEJ76a2t0Gwk1I/ZKZtWLFAtG9Vik1AgbV700yPdWlw549inLhxoF37zbEF
         q50PzqErbgzIinFs3FrHZVQmn7JyjHsi9b5A7rWhcsr0X1T0P7y9ealPn/7XW1r05e3G
         I5UrbZwAJ7nrhq+ApCVM/kfXA3BZs1G6UaiF40vbpf9V+zep5BCdRiRMOn6SNlCTW2/Z
         dVHXVfe++5XGmjI+aLd7AzQGK7AZNVBeqBzfUAD1WASyZgayKQICrrYzwHnBwU7EK8if
         LzOzHGEXfqZUXSi/TiundxNcRZi9eNcp/LMTfALJqOuCB+QIYW/Cusur7i5nVajHsWJZ
         58OA==
X-Gm-Message-State: AFuF++nupJ4cL2TgkP9E7DR1qt+b0XHPeA/p3IN1iUt9nYZ1VgkDaCOz
	bteGBvBllqzWt5N8qIJgSqxacj1xNBMfMmedOxtFV0ZBdLLHdzb4pvnokN+LGSfX882/5OFoo3K
	rA9EpNA==
X-Gm-Gg: AR+sD10JP1KLNCoDJYhj5ReVxUJl8uNJYkR8KeF6WciI4ZGjHC1A6ABdznvLST2IIwY
	yi99xpo1LA7nYZAYIgiKtwhVGMoTnrormFxhvoeKFE8qtqFT147yIuc1wxGz1YXbkKDJ4Tvhr0Y
	ECh32+rrqeWMG6Iii7jbyEJKdI53Y+bzpAex6oSHPDy/nte0Dq3PBLxF2QNUWBJ3kX9VcDdxKMH
	lHlO/m9l6bBVuxLYkgc1gT6gIMvzi+cdoiFibEc+qM0u2hZnbbpEYaao/RIBb7bOsFzq27Ku/LL
	xw8DWqG/uZo9g1jgDUYsLO3eBbl4O3LiqxHJvHViMhWLT+2RpnVnevxtF7gW1S1QK1eLH0E5xub
	cyv7K9tTfCvjAA9NXw+PBBlgkzgw+siZx0a3gK7RQU4q9r7Q6YkVuu3MytR694gmJK8yPmHih+H
	OfW5dt9T40FpCEzH7Q6MRGTcAK1xnH26x8ObI0TTHwJnWcxqXPoYQlPvTGM1h3DsAsfLy2b5Vu9
	1QqVKjHz1IvBrDI5h2HdrndRSgT0sKmgxEfBjRtW0gBQFqXafzCogpZFeuKfEg=
X-Received: by 2002:a05:600c:4452:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49b91c2e42bmr63460935e9.7.1787900575240;
        Fri, 28 Aug 2026 00:02:55 -0700 (PDT)
Message-ID: <26fe76ce-db8f-4641-aeea-667fb6ee3932@suse.com>
Date: Fri, 28 Aug 2026 09:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/12] kexec: machine_reboot_kexec() doesn't return
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787900575-6E8CD4E9-D9DE6AAF/0/0
X-purgate-type: clean
X-purgate-size: 1278

Mark it as such, and then remove the code following at its sole call site,
for Eclair flagging that as a Misra rule 2.1 (unreachable code) violation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -401,7 +401,7 @@ void kexec_crash(enum crash_reason reaso
     BUG();
 }
 
-static long cf_check kexec_reboot(void *_image)
+static long noreturn cf_check kexec_reboot(void *_image)
 {
     struct kexec_image *image = _image;
 
@@ -409,9 +409,6 @@ static long cf_check kexec_reboot(void *
 
     kexec_common_shutdown();
     machine_reboot_kexec(image);
-
-    BUG();
-    return 0;
 }
 
 static void cf_check do_crashdump_trigger(unsigned char key)
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -48,7 +48,7 @@ int machine_kexec_add_page(struct kexec_
 int machine_kexec_load(struct kexec_image *image);
 void machine_kexec_unload(struct kexec_image *image);
 void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
-void machine_reboot_kexec(struct kexec_image *image);
+void noreturn machine_reboot_kexec(struct kexec_image *image);
 void machine_kexec(struct kexec_image *image);
 void kexec_crash(enum crash_reason reason);
 void kexec_crash_save_cpu(void);


