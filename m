Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22728C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:31:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405049.1638595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eVJ-0003NV-OF; Wed, 02 Sep 2026 06:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405049.1638595; Wed, 02 Sep 2026 06:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eVJ-0003NK-L4; Wed, 02 Sep 2026 06:31:25 +0000
Received: by outflank-mailman (input) for mailman id 1405049;
 Wed, 02 Sep 2026 06:31:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eVI-0003NA-Pj
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:31:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eVI-001cWT-6N
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:31:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c2bb-bab6-0a2a0a5309dd-0a2a4509c0ec-4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:31:24 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c2bb-be1a-0a2a45090019-d155802fe8b3-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:31:24 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49b8be0409fso4122485e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:31:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm62073415e9.0.2026.09.01.23.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:31:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330683; x=1788935483; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AW5Js8HSLcZBr8DQXofVW/feqCltoKGq3ct/AKTu4nA=;
        b=OYwFPJtVTnD39CnaVinmfV0sE+tMZJgnBJrilCrdL/5a13vN7TQhgLY/+Rfl3dg+7e
         sIAK7Zclgw2buPEOAoGydo9B4BbIE2es8QAQBAyYHbXcskdX6FkyZxi+MPmNP5PoBQ9+
         xZYiDGW/jsrigsfl/ZRmCxcflaiBXPvZwCOMEiFXNZ9yvqLdKiSeqz+5kuSW+qnaBcTG
         TfjCEs5w9/UM7VUjn/b8KsdxZV63FWewlFxBT15cbZOlzF9ctz3fOHXJsualqeUfmzBH
         +od510/RrccBGnGT167EMX+/NVp/X/B31atnoSGc9hGZfia4yOxy7RdQwEXnKNKmMf0D
         9ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330683; x=1788935483;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AW5Js8HSLcZBr8DQXofVW/feqCltoKGq3ct/AKTu4nA=;
        b=Wv5f2hvCyCFz9Xxb+dZNxTsqxtwCpz7KfQ+rgI/0r2VDps7V5+fiq43BOmOI7IkFjf
         mnnTCgVTWBybgHWABMmh959Hbz2AaPfhGdl5wjOYl9122LQIvNHQwDny9vEo/ANnOeAt
         quRhoPxNP6NnsxP3USuv8F0xVgwZx5bPhgdUXTrQOP9Sc815y43C1uP1NGEoF3xvlvoS
         JNx5XEhQ5KLYTge0oeC8As+vsQcxCO6E6arHfKzhWMxxVU6aXUn+cJq0pC9ObxK8nD3a
         8ajdopanIbFAHHlaEG/NDXCdVCRirLUXDN1wA7v15/vnQXpU/TnkbGcea21orUCxuND/
         ELkg==
X-Gm-Message-State: AFuF++lWrT3+Gucw5UOlUy9BjYBNfTRzVAab6jskvKeWQZ7o9mOhO3Vk
	wWCe/rXKoTFzY8bM4JfUDqfvixGrso83Gf/uCDgnFq4a0rZNxy8LeEOqQHYTQRnvNYinDTCJvNK
	605qwxg==
X-Gm-Gg: AR+sD11Wj7e49vLeBj5qQ4Z3Xonog0n11/p9HMZ/PknUjPEU3wyIX5dl+4YwckUpGmH
	zW7+UFsCQo1zbTVMZXYJPPxiJcuI2VOdQo+bXLznfDzLjkQMxErvk3j+qxJ8tf3aQttUEKR32Pi
	H5RWO4y/NRlVaIe2VUZWgCwYF+r+bTA8qkSyWPhSVfNC4F5gQQzNpQBRg+tqMjqd5ypxkrmZKI4
	U1Fr47vIT4OBPc7xO48KQszNV9xGxPEVYXBjNTUaVKQNWAOJSK/5JFIxhMCEXZE6a1oKLjl7pCB
	BQgEwoYWvaUFWau63g0prEiVuwCCP2Pl9aLcBos9sFPdzl+uN1C/G7qzRvQ5KEV0WUPyJ4kdgXQ
	EheEK6yuw88OuAzFOCAf9JBLef3efGHBxYpb4QT5UXTGNGal6zjcS/I0HaU7uNQ2/zJWTffePrU
	I17sOxOC9+xEZOX3gySIuWPEUQ67+9uLwVirE/YBdL8NeuKtIL/A3WRhJkCnKW2aD3m/pD14TfZ
	mdciCfbsgOY0rj9yRyvsOi65Hi5NtapR7alL0blrcbmd7aNV4YB
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr34390275e9.6.1788330683437;
        Tue, 01 Sep 2026 23:31:23 -0700 (PDT)
Message-ID: <8ae3cc08-2011-4689-8530-f3b962ed4d72@suse.com>
Date: Wed, 2 Sep 2026 08:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 03/14] x86: have cmpxchg16b() obey to Misra rule 11.8
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-bad1c0/1788330684-BFAD0034-4119CBBB/0/0
X-purgate-type: clean
X-purgate-size: 762

Casting away const-ness (or volatile-ness) is never a good idea, and
there's no need to in cmpxchg16b().

No functional change intended.

Fixes: e0116acbbd0b ("x86: add cmpxchg16b support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/x86_64/system.h
+++ b/xen/arch/x86/include/asm/x86_64/system.h
@@ -56,7 +56,7 @@ static always_inline __uint128_t cmpxchg
     ASSERT(!((unsigned long)_p & 0xf));                    \
     BUILD_BUG_ON(sizeof(*(o)) != sizeof(__uint128_t));     \
     BUILD_BUG_ON(sizeof(*(n)) != sizeof(__uint128_t));     \
-    __cmpxchg16b(_p, (void *)(o), (void *)(n));            \
+    __cmpxchg16b(_p, (const void *)(o), (const void *)(n));\
 })
 
 #endif /* __X86_64_SYSTEM_H__ */


