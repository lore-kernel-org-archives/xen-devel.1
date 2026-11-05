Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02702606D831
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gSywKm74
Received: from list by lists.xenproject.org with outflank-mailman.1474634.1681641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxaS-0004iP-4M; Thu, 05 Nov 2026 13:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474634.1681641; Thu, 05 Nov 2026 13:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxaS-0004iI-0v; Thu, 05 Nov 2026 13:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1474634;
 Thu, 05 Nov 2026 13:33:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxaQ-0004ht-VR
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:33:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxaQ-00Aj8S-BO
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:33:02 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8580-8faa-0a2a0a5109dd-0a2a4506831e-44
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:33:02 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec858d-195a-0a2a45060019-d155802bd4ff-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:33:01 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so13351095e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:33:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57317cae5sm103423815e9.12.2026.11.05.05.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:33:00 -0800 (PST)
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
        d=suse.com; s=google; t=1793885581; x=1794490381; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YuPU3a8IBBvMhUzOW5Q9jnXRThErt0mAuRAL2YchLs4=;
        b=gSywKm74J5m1Cs5SvUIN3mDAJ5WVZRGGBA7Z0aAWtEEDF34MZRWDlFlSLIklSXFbxz
         k99iw4y8SV1U6UEBVcO8SKM2UJ7Q3dkYyKXAoTcYUVLtV0naaqRonbA1Mm9k6YbI7hBz
         DcjtLmGSCgj+ORKoEuC1jfTWjxmdscT9KshOjnesyk8Wdj1yfVgeLXfRulxuI3Ibx890
         joBhI5gUGkSqqY7GM8hpSNb/JCLgPBIhPjYUa/3xay2qQ7t8z+aCCx5GpdOSL13wazZ0
         zAir1IjhMQCjISbGEriwOsrFUC3wGE61j5Fgj/cag8NOCYHbRWHthf7xcDA/QHQmTFs4
         PlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885581; x=1794490381;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YuPU3a8IBBvMhUzOW5Q9jnXRThErt0mAuRAL2YchLs4=;
        b=euXUYxoeZwzC24nX64f6XTeQoTtWI7fFwM3TG9fPMiSR3yDOt70YgWZ+t3TU7Xp0NB
         3AtxtGmbSIMIy8a0p1Vy8Ly0nlshrNeCWlA9/eOncdLALdg8GEyJYsRgMtnLsbIaOzYX
         N0KXR9FKMA2F04iMxkpLJD66OP+lSfyWSm+HFKDEwNKohzhLbGOYCuhYKzk652o/ccNJ
         TIBwTkvQvFkq69vnOVYW3SS+B77KT4hdS714xZG2X78VmDcJqy74tavwjzfM57xX1XTY
         h1qD/laO36vEr99vT5C8OoOj/jxM4YodT3FQeTOismfj5uBJ5Si/f4q73pPCdIUVZOaX
         W7Ag==
X-Gm-Message-State: APuU4Z/rY+x09UdqzzSFYWlvB0bgpBK5c/5oyNf1FL06MMp9NIMqDipA
	ZmZOXTb32heUvJYWTbiEZNN9fpF7aM/03q98ily1xhLUrTrt/kD+mdV3lDQYuHcgFiZofm7H45e
	NQuMM3Q==
X-Gm-Gg: AYBFou28EwZ16ao4AM7KEmwqh5IUWRwi5PjnZAA3fc68Hf7JEju4TwjUCj1FyMzF8D3
	FrfluecKdV2KcPERUqj5pnnEgcez8YgbUs6HSgS6NqUkaI5xshHNkIYETK/GWtCQgYBwSQ6f/vb
	c2LhdMtZKA6lAZIQWVtxodlDCdrW5TrkSpqJ1/vzdSDScv+skQkGvX0CLS/VDcu/Nn9ZyAntcQJ
	VOyz6+KuSIUQq0zglh77Fjbh8zjpZi5SG8QJFPMBBqtTsdqTFbuSklb1i744e8GFeUhbFe2Rlxm
	2SKFCNIQp1fjKCUZ8/uCkndDR/u2Flq388IUeKxc/C1wYK6BYqOrD9OX+PW02IYtG8uI9wiksnO
	RP0c5cKTkYMeTbSLJrnIRaXPhmbMhZS4e/CpRag0GKmDi9CyF3QpKYljD5ydk+qS/DxgwA1Zdnd
	yecdWBLxl96LOwWZyc6YtdM1HXzxmtmGSbfYfboWT1KCUG60JXWXgaMKp6dVdTJALCDRQzAGi7W
	eZqCUiGyGeNlqGaHJdlD+SnI2sWfloi/Ygz/l22NSqBTFcais6p96qZr3FIWfJ3FFJqN4hXqhsb
	v3fCMlaOBxOJzWRFuYnoAn3UxKFkM5BDG1/K5iax+h5cIJK2tpG+l0nozUBrp4ddrhceTfP1iJJ
	5YIK0413ppEcYbPM=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr431783145e9.10.1793885581330;
        Thu, 05 Nov 2026 05:33:01 -0800 (PST)
Message-ID: <ca7b7cc5-fecb-4215-aec3-8c70b0c51e3f@suse.com>
Date: Thu, 5 Nov 2026 14:32:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 02/14] x86/setup: widen consider_modules()'es size
 parameter
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
X-purgate-ID: tlsNG-16d1c6/1793885581-FD40B77B-5516A196/10/78276251493
X-purgate-type: spam
X-purgate-size: 712
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Eventually we will want to lift the restriction on module size anyway.
Right now what we (subsequently) need is a way to express at least
"exactly 4G", when rounding up valid sizes below 4G to the next 1G
boundary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -690,7 +690,7 @@ static void __init noinline move_xen(voi
 #undef BOOTSTRAP_MAP_LIMIT
 
 static uint64_t __init consider_modules(
-    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
+    uint64_t s, uint64_t e, uint64_t size, const struct boot_module *mods,
     unsigned int nr_mods, unsigned int this_mod)
 {
     unsigned int i;


