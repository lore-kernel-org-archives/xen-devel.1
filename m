Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CABC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:44:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406928.1640092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25s4-0002gg-V2; Thu, 03 Sep 2026 11:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406928.1640092; Thu, 03 Sep 2026 11:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25s4-0002gZ-S4; Thu, 03 Sep 2026 11:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1406928;
 Thu, 03 Sep 2026 11:44:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25s3-0002f9-Kq
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25s3-003Vvs-1Z
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:44:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995da9-2eae-0a2a0a5409dd-0a2a450bb5a6-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:44:43 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995daa-b7e8-0a2a450b0019-d155dd29ec07-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:44:42 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-485852d03a4so187534f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:44:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed38cfsm12304727f8f.19.2026.09.03.04.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:44:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1788435882; x=1789040682; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LNHaJDjHDuXLop4BrVnZCh2hHHrrJbmdQU3tdMOSodc=;
        b=g6+z6USB6VLySk4myYqhu5VhvXGI8JQDGplkYodx8h33hZXdQejYNNF1eSNZymNjrF
         xbX0OgXhXVjzY+Uhq5tkjr5dj1bbaLfKiNY6wc6/3CgcCFnxBffxUf9raYUbFGzQol5a
         3oip/cOpye00nf0ruQydGwagEJ8ey2ehsZmN66dN48+B5ukxvBZnrY6kRv+x3gbOrb9o
         dRbN4TX7thrOIRhDpgSGZv4DZ9hDm6GmtblNK+eg4w5bxc2sDBMXagS56ue05QPKNdKQ
         nsEfdvmiAl3ga4iT4irY/b/GLoegRHdGM54OXg1brbIYVid7JRJVzCpYR+CiJAZukkix
         Ly8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435882; x=1789040682;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LNHaJDjHDuXLop4BrVnZCh2hHHrrJbmdQU3tdMOSodc=;
        b=KktlRRIukIswDDLdTdm1IpQI40D7oqy6QlATNimNZVcejDpLxnBQq5RFTyQb3KjxS9
         7cpDhvnb4dX5sAvd6wZWmDa0bRBzo+UsZYc3KDGRkG3ACi3cqBdbozfVVG4fPXC0kmqo
         ZpQFHsQJF349bQT2vrQ//7Z59D2jrGfm5TgIGlwaylFYvuAZKXfR7r8ObUTOzhJklCWC
         0DRpz13rkSDUHI/6+nknuGj9NDa+hubsv/eSYXWUKSfrqm4H6QxacucnnqNr7/x1ObNx
         05ss+H3n4zw3xw0SYlCRL0sD52PENiEgoJeEslmY93OxTxhvfIbUAGln+u+K3P6KPWYK
         Q47Q==
X-Gm-Message-State: AFuF++kLdqJ4+S0oTha4cVk+zfvJGY2XYz26w+6ZiEUpV8KSA/X0lPOP
	7Y/V/4Yybt7717bpm/4xhTzci+GD6w81ALChxLCJiVvwZcYt3gHptZxf2q8YNuOFoB5sNu8gMKd
	qwJ2BhQ==
X-Gm-Gg: AYBFou3DW3vrTmOseMhmqjUq+UQi/J1TnLgUHmv5loE96nDQKcXL5xOQVl8OYqRn0DW
	/1fpli6ij/r287y2fhpCzsoyMFZb5A/dzWQBm+l3idJt0MoyLlZaffoGT8aJl7WqPbasuZINVbi
	+2Z9JY8siIcrA/jNYX655pIcz7X/Bg+OAx4BHNIGYHuS7HlaTtbZhhIssCj5ODOmEzOZ/2nv9n7
	yREjcwFNXdZfKzC7qP8OCzaN98zfQ2l4wCfzBSUhukYZxODy7oNDMkDdH6HDGYx65vkkeQro9Zh
	UG0xqIkgoe3n6+SegiIICOISJIQPpdGxQSpnxfa0xxQqc8N/f+W1tbfR1IXXD8EhM4ZlRX5WVjn
	naU3SXbSIFjp+SI0UvhrMzbChwov2XPmgrqK3FUjCYlF2VZ94tC2k85BWi2rm0zxQIhbOmrD6M7
	8EG8C3ZeoP3FMjhW9nPF2neBhDtOPIC5H8LBAvAlyM3jnoAlEwsrvKaXoK8naqI5HBuYf0rAGfN
	Dz+1fBvgPmZaIIyRhsQv4nPf4bF3FaWE++y1dX3H5QJNXe2RAvy0KH2rblnqN8=
X-Received: by 2002:a05:6000:2285:b0:485:847f:fd82 with SMTP id ffacd0b85a97d-4858480004dmr2911222f8f.8.1788435882459;
        Thu, 03 Sep 2026 04:44:42 -0700 (PDT)
Message-ID: <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
Date: Thu, 3 Sep 2026 13:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] x86/kexec: address Misra rule 11.1 violation in
 machine_kexec_load()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
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
X-purgate-ID: tlsNG-42698a/1788435883-18CCF9EA-02260BBC/0/0
X-purgate-type: clean
X-purgate-size: 698

Misra rule 11.1 demands no conversion to different types at all. We
deviate conversions to long, unsigned long, and void *, though - leverage
that deviation here.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -121,7 +121,8 @@ int machine_kexec_load(struct kexec_imag
     }
 
     code_page = __map_domain_page(image->control_code_page);
-    memcpy(code_page, kexec_reloc, kexec_reloc_end - (char *)kexec_reloc);
+    memcpy(code_page, kexec_reloc,
+           kexec_reloc_end - (const char *)(unsigned long)kexec_reloc);
     unmap_domain_page(code_page);
 
     /*


