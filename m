Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D5DC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:44:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406915.1640084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25rW-00025v-MX; Thu, 03 Sep 2026 11:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406915.1640084; Thu, 03 Sep 2026 11:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25rW-00025o-JC; Thu, 03 Sep 2026 11:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1406915;
 Thu, 03 Sep 2026 11:44:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25rU-00022w-Ry
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:44:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25rU-00EqIn-8t
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:44:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d7d-bab6-0a2a0a5309dd-0a2a4502cf56-34
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:44:08 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995d88-6ca4-0a2a45020019-d155dd36a92a-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:44:08 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48442ea8f59so677983f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:44:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea5b4sm13617612f8f.27.2026.09.03.04.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:44:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1788435848; x=1789040648; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17ue7Vld/bnWjJ/A94iqMxMtWI0yvKdE4RVC/9sdtiw=;
        b=LfgGPTQQZ3+NY2yBvd2Ivz7Q2XgLDklUWzLkZMQlhsxUTNw6Msz3pMYlUun4YNVbCZ
         ctNLLn78t0uUYFyCXrmleawslLcTMN/ZObJDIUgFCFEwSSNPbliJqwLbnMYF8cYCdGFF
         BgD7MjO4TCe4g7geX3CUKwjO+nhR4OCzzZskP8sTnuczar5Hxi9dI3JdFFKxPHKgJVnO
         fH8ESk/8LggcyL7ZPGAxNd+zMAmbLdPcdGB+H0fL19yMgYqGuV4ud+fmUHXVzcPqDRTA
         P8Yrkidj2VCxCSVhcNgVg+lsOlWX1gVZ/UCeVzQycoOCJySouj06hia2U1OjEkYBOuGO
         qiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435848; x=1789040648;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=17ue7Vld/bnWjJ/A94iqMxMtWI0yvKdE4RVC/9sdtiw=;
        b=qd8jVPICEwNgWqVFWuYBUJnWqezgkqa1FvAuGYTOeBM/DeXKCw6srPbDKE+SzP6WcV
         0G+/2WkPxTslBcqZ6ZDy0RRztT5GBDjtEgkc1y+AF1Fub4X+csq4XyZ4td5sZt30EDs4
         Fp4pFKbnFXlK2FvVS+irOahvgzf2kgz3JPYSm5RZIG+r/bInV1kIU7JhIs+ZN92lyKWc
         u4B7YPMAhPUPJcTE3rk+dHhXZTo2mRvhue+VYcQ1cdXrG9VPDRElPlPcN6d9cjPosjsu
         hl8IJDggGVFnJv8iynkZwY+AcPhxXblvyPQY9+27zp8bmhBwL7rsSY5xWQMsNS82M9oO
         /Skw==
X-Gm-Message-State: AFuF++lRdRR+JhCY4yZ7akaaCvg2crPsdnV8TDwqaPukhDs44RrOKofy
	P2zGb0kklRtQblqEqEcubdrdsbrRScN30OtLnt75jsSpTwaIdgbmwVdKNiFhLFepr2xf6Fjd+X1
	dLcqUUA==
X-Gm-Gg: AYBFou1rUkEsV///YFg+iVVuGc8Qe0yjMoyJ77rHWuDybV77/SMxPvu0PxaoK4BF76a
	e9Ttlwjr8URa9ZUmBbElPwrjAZgHN8vM5lV42ixRDAvV0mkw4M9xa2aDx0pNrNpxI2lIPvgE+7H
	kL8YIeIinEXwunvgk8Hjlvv2ASCxqe1f54TANIOheAIJryxCl0hT+WVXP5tevqPMa/5OQoud6zD
	NoBPKH3aU5hk/ZmsjhF6sGdvHLdcmQdvgEGYO3ZxffmSFF1eH8Ej991SyYveXbLshUukbgzDJW9
	Nern5iBoaHfjO/Yp+o0i6kGA7aXK8XhHvPfaN93eW9AegljbEAs/bURusA1yu3dFf5N7VPbHvho
	MIXWJmtkIyhXTTGVDA8+K7m6xZ0GpfAC5VAC/dzvy0i9CzA0D8poy9WQsV1gv8kR1od6T+jN44P
	CkKQEF2s0/IC6MBmvmc9BvtacZIDIgme/nbTMSHlQxbCWxC2dz3irY6EZ7YDalh6SkwvOpuFBCW
	k/O3hHQqvkSs8vPYj0by4WjA1/i8oJQGigDWSBnebQUD9oR9S8J
X-Received: by 2002:a05:6000:64e:b0:485:8226:c69c with SMTP id ffacd0b85a97d-4858226cab5mr4184583f8f.27.1788435847594;
        Thu, 03 Sep 2026 04:44:07 -0700 (PDT)
Message-ID: <4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com>
Date: Thu, 3 Sep 2026 13:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] Eclair: relax "noreturn" function-pointer conversion
 deviation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
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
In-Reply-To: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788435848-F34BE2AC-0915C079/0/0
X-purgate-type: clean
X-purgate-size: 1720

Like misra/rules.rst says, function arguments other than "void *" are okay
as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I can't explain why this covers the violation in mce.c:mce_callbacks'es
initializer, but not the one in mce.c:default_handler's.

As a result of 6852334f8416 ("Arm/GIC: add noreturn in a few more
places"), vgic_v2_lpi_to_pending() and vgic_v2_lpi_get_priority() (both
returning non-void) would also need covering. (As said in a remark there,
non-void together with noreturn is somewhat odd.)

Really before and after this change there's no checking that parameter and
return types actually match. I have no clue how one would express such
checks.

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -391,11 +391,11 @@ constant expressions are required.\""
 }
 -doc_end
 
--doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *)' is safe
+-doc_begin="The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' is safe
 because the semantics of the 'noreturn' attribute do not alter the calling convention or behavior of the resulting code."
 -config=MC3A2.R11.1,casts+={safe,
-  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
-   ref(property(noreturn)))))"} 
+  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))))))&&from(expr(skip(!syntactic(),ref(property(noreturn)))))"
+}
 -doc_end
 
 -doc_begin="The conversion from a pointer to an incomplete type to unsigned long does not lose any information, provided that the target type has enough bits to store it."


