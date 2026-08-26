Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA874C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 14:41:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399974.1635930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzEnu-0005rs-Qd; Wed, 26 Aug 2026 14:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399974.1635930; Wed, 26 Aug 2026 14:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzEnu-0005rl-Ny; Wed, 26 Aug 2026 14:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1399974;
 Wed, 26 Aug 2026 14:40:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzEnt-0005rf-FA
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:40:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzEns-004D82-Ra
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 16:40:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8efadf-bab6-0a2a0a5309dd-0a2a4503b318-16
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 16:40:36 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8efae4-fae8-0a2a45030019-d155d030eca2-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 16:40:36 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-69fab5a852cso1787223a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 07:40:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea655sm4727760a12.12.2026.08.26.07.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 07:40:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1787755236; x=1788360036; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x/i5WmFJBUVq4Pl1gDWpNV2HVBRbeX+AeaNUt+aYYbY=;
        b=MuLKUOMMXoCDPy0oUvc8SX1iByiVixla1+5mbtSdxEDPk7/f65OwiXdqi1wqYAib+d
         8Mrh5I6clxqb9au8h/ny0VQ8ga7VA1AUWhyr32XuViICZh69P1Kka6zQiVjCBwqN3PA3
         Y3bkXJzfwyNQcClxp2SKFjy3uaR29qsa8k3LphJuZcWT7S80APR0FbumgP8sHzllnP+1
         er3/sdDs8JWhrexGx7axf7MexvWCDMKheO17UiCLkiIPlJutTISK9UgpMfwUsgKFxFAo
         WO/lJb71m1NzBnr9pgqMjRa7lySgs/DWlRsYOzC46bMn3Aq42fcNdVKEwT3ZWROZOMSQ
         rMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755236; x=1788360036;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/i5WmFJBUVq4Pl1gDWpNV2HVBRbeX+AeaNUt+aYYbY=;
        b=IV698mFn2iS8/BpIlQeUL8cZ2sAD1MBqOWtB4b2Raha3+WmZiqJEKt+VPuykJbWfg6
         O0y4RX1T3ogC1bPlvYnx9xCEXgL1DKVQdZrjiNF9oT70hTpcAWH9hDt4CIAaOC5IfFY0
         7xxll+y2tgnAM0UI/YpVKV4OkX8BE5aZppWjsB88I3WHRCvu8n47sWwH6qq2R2Src2f3
         rZeb0/SfPn2xSDe3Zo8CqXc0KeXdvfAwHHCLRa5/kgXME7D+5a0Hz3B6/RsXlFQP4AtR
         iSAAKlCTNYYUTK7mIImxyyBnT+PU2cLY9jS3DZO6ocLLrfVmv7Rf1Leo/Z7i6zOB4BVG
         5aVA==
X-Gm-Message-State: AFuF++nksEsltQzpBSwqCz5XGx0sl27ybD96Ulo7/fvvoxHsZoMzV7FU
	S5oHQBapIT1d2e5UKY9ppHS0/FqcSFlHnYt2mvIDstduaMqXBw5USA76/pVz2jaE/VWK4X7qaHC
	ktJFbnQ==
X-Gm-Gg: AR+sD137ksC4pedO25dyAPcVShqau8QKeqPZXW+NJCjfkca6UDqLpR3KosRa4pFlhnV
	uJO15hvPYoPwWq8vSMMdA5J/ASh1RFAi2v6vxnzrLntBcyk9j+hxx0FkLSEBdzwlipYfK6+qol1
	SYl2baHEl9FCNAQ/k6TXMZgvDaJqLxBBjA+BFDMOoP6srURYpVkVbVmkZN5Y+W8iNBKFiwv9PMi
	1Pl/DxcOLr7AnGCLq3/55ZbBD+yY14qLrCGvVnOKwmrLpxJ3igPnDVfNP/3NLUF+6Il3SL2mmMk
	wqKYxcs/96SouQSP/F2hvqfa4aJZl7qV8VWvAOF4btW1+bZsx+GGjMKhw+kJF+YH5rRn+bto6Mt
	YMnvAzvs4RrB+5LHlQdZ+Miz69Iy4MHRHYBX9Uakce6Tn34SQpPoLARi0kI/DPYtuJGIRzkJngq
	peL8NA4a6ApBoAZfUduNRXMR1Tn4AyPuaB6oRo5OrGBrMQoniq+JM6lpiADBES5DBrkhoV2rJTC
	qCUTqg9U4/DFefMjzXgirc2uXVqzegqXbf/PdL/N9586YQ1/KLJ
X-Received: by 2002:a05:6402:2312:b0:6a5:f202:c1c7 with SMTP id 4fb4d7f45d1cf-6a5f202c2d3mr2378244a12.8.1787755236311;
        Wed, 26 Aug 2026 07:40:36 -0700 (PDT)
Message-ID: <ff35bc09-aa7e-4bc7-b3e8-43fe765c2cda@suse.com>
Date: Wed, 26 Aug 2026 16:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/IO-APIC: replace redundant irq_trigger() call
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
X-purgate-ID: tlsNG-33051d/1787755236-6CADC4E9-FA81AC6D/0/0
X-purgate-type: clean
X-purgate-size: 772

Just having called the function and stored the result, there's no point in
calling it again right away with the same argument; the stored result can
be used instead. And the stored result also doesn't need overwriting again
with the same value.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1089,10 +1089,8 @@ static void __init setup_IO_APIC_irqs(vo
             entry.trigger = irq_trigger(idx);
             entry.polarity = irq_polarity(idx);
 
-            if (irq_trigger(idx)) {
-                entry.trigger = 1;
+            if (entry.trigger)
                 entry.mask = 1;
-            }
 
             irq = pin_2_irq(idx, apic, pin);
 

