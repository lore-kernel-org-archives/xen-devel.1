Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42F2C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:32:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405069.1638621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eWZ-0004qr-Gk; Wed, 02 Sep 2026 06:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405069.1638621; Wed, 02 Sep 2026 06:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eWZ-0004qk-Dt; Wed, 02 Sep 2026 06:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1405069;
 Wed, 02 Sep 2026 06:32:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eWX-0004qP-QZ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eWX-002tla-7C
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:32:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c306-8faa-0a2a0a5109dd-0a2a4506a4e0-6
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:32:41 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c309-195a-0a2a45060019-d1558035c902-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:32:41 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso5068835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:32:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10153sm133662375e9.4.2026.09.01.23.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:32:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330761; x=1788935561; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IXAvx/vGULUwovSlnrWpyko7JV6p7KauR+GTHkHN/Os=;
        b=AeQ0noWdemhT3u5hnP8uNsQmTRQNA0jvndZJUqa95uWoE0IKNkdkMkbrl8jap227Ec
         4eNaHGlrwuvSgGcuNZjvV5o4koLAtf9nJwKJGtJTcrsAcNs2a7aZAQ8pFsfkefOJCngq
         9+UudeC9Rx7mTzLaY03qofA/Rk5j7mkByiw6cDVpVZnfXV8zeD6BfeeMtH3EpKZZOexD
         gA5wG/Ye7ElhTyQlbyt4YQyCXetqCduf3uQF29zeNlY1c4fFnXR2/Vm87f+GeucQa3v9
         RFhMaPA62di6CdzWxkdFC8JWmIusfEdjSj1l0Vzgzk7V0h7iJrP07dzJFNqEBRD2bJO9
         SXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330761; x=1788935561;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IXAvx/vGULUwovSlnrWpyko7JV6p7KauR+GTHkHN/Os=;
        b=RVOM43Zg6jDF/UJgBCHXlRaCzFj7iny7BNmKmtWE1lho8s0xr3/UFy7NE+TimXHAU7
         oHieXZ75P97+Q0u6VWhp8QKJIx4KhiIemYjBcDpz5MQruslLtQXJhBmzQfmXteur/urv
         B6+xcx14nWJ7LlPtjQJ/Cj9OoMOTid9eK9la0f3opzIiubdDvBycpMSLrrcKpacGUxNm
         LUgzwLp2vOLdX2RvRTfT7NBCZhYWJXC40cKszj7UyQnEs7HzLnQwpFAL9Ip3LyWIKMMl
         LmxtkRdOVti48QF6RgUAfUSpD23eGka6Q3ths7BefESzbtSZFPF0VZMtbFxhT5+Xcgbg
         q2zg==
X-Gm-Message-State: AFuF++n/vBOSSTYeQRDUNATcWBmj0R+tOS1YmVtFhCPMejHqALGot+Yg
	sqbRXvT2EckiWdMgKSPOXYTc7cezOq4ONWVyzQYJ2PAOfTgD0Y3oI7d1DAx6SEDZyi0/v3RhLok
	MIsSBew==
X-Gm-Gg: AR+sD13+n9qD1HRRS2zIEvrdnDWKn2lhJMkNRjJhiK/QNHhdlrFNTwdthGfGVW0jiJM
	70dSXbmrJKSlqCgaACAOqzLbZxBRj8bnCNYf8oNuAGMrsNUfz2AgfVLj3x8mNTYZKcRTg0Nn7qL
	A0wg85wO2Dk2V2kM24RuN0vfKYRslULru8NBo4H94XJM/Xa4zO616kESLK+eIplDykyS5Z9HWRU
	01iQucBY6/nLQadfmgOt/JY7gYS3LEdVphp+Ze1gKPluqDInWNBlJIYz0JAoa7qFt01e0ccABaT
	pSVuu0hNqyKhjWtYBcU7/WqNC4IW0S6nbMUDSpHWczYip5vbuFbcsMoqW6ASNErDPWzoHlVjBT3
	iip5kR5qGh5FeHWl8vXtwxoJWO/TJXZT8Z4jfL2lhnQMq9vZ+gLMt3dy86EOYcJS1GszlG6YgqW
	0ApX8QPPJA2pw7k8nqD3HEYZJNEZFOzpKrXXxAqPqMjIYj5uhEBfXQkG3dpUGZy3xn4+MAoUzdo
	VhbF0J+HqHNp31JY7w2psMpVhh5EzC8vBXJY+lpOkIr5HURiipG
X-Received: by 2002:a05:600c:3496:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49ce57fb12cmr43745825e9.7.1788330760666;
        Tue, 01 Sep 2026 23:32:40 -0700 (PDT)
Message-ID: <6b3a3849-304f-423b-a3c3-a614d83858c0@suse.com>
Date: Wed, 2 Sep 2026 08:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/14] Arm/alternative: hide casting away of const
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788330761-F4A0477B-1DF2EDA4/0/0
X-purgate-type: clean
X-purgate-size: 608

We want to patch the original call site, which memory-wise is unrelated
to the struct alt_instr * that we start from.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -134,7 +134,7 @@ static int __apply_alternatives(const st
             BUG_ON(alt->repl_len != alt->orig_len);
 
         origptr = ALT_ORIG_PTR(alt);
-        updptr = (void *)origptr + update_offset;
+        updptr = (void *)(long)origptr + update_offset;
 
         nr_inst = alt->orig_len / ARCH_PATCH_INSN_SIZE;
 


