Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B23EE9DE7B
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2026 09:21:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276892.1562185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAlZZ-0006if-2e; Thu, 09 Apr 2026 09:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276892.1562185; Thu, 09 Apr 2026 09:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAlZY-0006iY-W4; Thu, 09 Apr 2026 09:21:12 +0000
Received: by outflank-mailman (input) for mailman id 1276892;
 Thu, 09 Apr 2026 09:21:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAlZX-0006iP-Cr
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:21:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAlZV-008Wwm-7A
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:21:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d76f85-e002-0a2a0a5209dd-0a2a45088660-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:21:10 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d76f86-fab6-0a2a45080019-d1558034f076-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 11:21:10 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488d2079582so2577645e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 02:21:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1d171dsm29121405e9.5.2026.04.09.02.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 02:21:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775726470; x=1776331270; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa13bn0iuGxKNch2YqSvPEtnylnjQyMWF9FknEEfDuA=;
        b=T1u7kGuuZqZ9LvQP3bsQNY2yTIZsawFy5aXlb1+h4TbOqZ/xG+aaW7zcIPFiatdji0
         RRJ9GXZ0M1tLHGXzDFa8rt8lglWGNY76aj3XgTuMeLkb1uuUVCxEEuv5hWw02x1JndOZ
         S7nG0Yv3gvHmyI722pFsYBOANPw7sVfsNkrtkcKJ+33QcQbz1fxWUp6Qc2H7z04vIbZp
         NE8ARkaOcritOy3WMKuZpdhhFnMmKH/23O9SwXWVAqAXRNDsBlYnO4ghO+AkM2qmPR0y
         JhO/70yuSQ4+WW48KlMTA0Xf0M2kKrlROqcz1lFE8OIjBqPEgc74d/s6jK14kCVrGQip
         86bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726470; x=1776331270;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xa13bn0iuGxKNch2YqSvPEtnylnjQyMWF9FknEEfDuA=;
        b=aBZL9+VfTKTgneaxibMcjlqj4lpD0rd4iNsMp6JFAR22f3brlArwD0GtwnQizh2J1T
         X/YF9iAiq+TUMZ9eDg8seTknYiCjePhwr3wNQmSknmnd6CGIE1IEXdX8OX4gXF4vdSAE
         oKp9Y9BVx+h1xKdUzBst40t4MvLHt8LO1/8uJxcgio0igUJC5LNxiBBrfJjflAxKToE9
         n+WNuvOvAhSZXTWdOaVYb/B04YfJ7JuC/2rG2UiX8MSVPmuxA3MAWS/4UtiQviSCNAQ+
         Z2TgB7l/Wc+efDZUXWoERtze8OMjkCOR4nSpfMG2epCCfkvAxpKUqDO3aGVv+AFqKpKi
         ggDA==
X-Gm-Message-State: AOJu0Yyz0hgx4DSyic5F7yq7U1XHVjMkJoaGJVqojAlCYUtF+375xsAY
	Ofi/0KuMBsp32EbDpbjA+7r3aP+aMpX0NmvC91FAZJBAKrQ3GS/9AP6gWwgjUcGUs3vfYz8tMAE
	3nl6c4g==
X-Gm-Gg: AeBDiesNcSzCHwKeWjdgSoGhQkJsTJbw6yNDrjW/AZl5oG2VLSBBqEQX5Xx+XEoh+1s
	KaEIdPinQ6rU2WmbeZ2Ryk5FPeljgc6Xo0QXgjCalLfA11uiqyD0qpDjHe1ujfi69NE/fYKrYkB
	WsWBKz4bc2cDGTvpGgo8x9QP+gLbHdFrYdTXGqpt6cK13TNs18Zcs61KFs0WgWaoMbavSVrP3hO
	XB5y6FjLQUYXeXrekNu99HnlYSpKHzYu1IrNjkXDcAe4mi1wlEHzf1bRP31QYJIu5z+/0hxmdRw
	Oxzir/fkw5VbHONVzDLCPKyAUPL5tCsefiEoUNeelQ/vI0JRpjtnBnp8qZnDm1g6q4sWcoNG9As
	CR31Qn6jODcURjAiz873sjEc/Ed+AhI/d9QinUC3WYAwb118quzSGSYtI3wVpws7ktJBlt7KwbL
	UOr3rbx3bfqKWSAfFbChbUvHfqrI7FmlAAQnHi5E3GIBc6l3NTDq4pS3cd8HTIugi4ckcz2zSfj
	MeAuMU91zxIbXQ=
X-Received: by 2002:a05:600c:c0ca:b0:488:c14b:201b with SMTP id 5b1f17b1804b1-488c14b21ddmr93297345e9.10.1775726469981;
        Thu, 09 Apr 2026 02:21:09 -0700 (PDT)
Message-ID: <2fa2fb41-cb62-4a1b-84cf-822b2f97bc2b@suse.com>
Date: Thu, 9 Apr 2026 11:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/APIC: handle overflow in TMICT calculation
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
X-purgate-ID: tlsNG-c1860d/1775726470-7694D497-3B324977/0/0
X-purgate-type: clean
X-purgate-size: 1595

With an expiry value on the order of 20 hours, and with a bus scale value
of 256k (as supplied by qemu), the (signed) multiplication will be UB. As
we've checked that the value is positive, we mean unsigned multiplication
anyway. Yet let's play safe against even larger expiry and bus scale
values, leveraging the compiler builtin that there is for this purpose.

While there also drop the stray cast from the actual TMICT write.

Fixes: 9062553a0dc1 ("added time and accurate timer support")
Fixes: b95beb185810 ("x86: Clean up APIC local timer handling")
Reported-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly neither gcc5 nor gcc15 properly optimize the (effectively) two uses
of the 0xffffffffU constant: Both use a 2nd register to load the constant
(really 0xfffffffeU unless <= is used) a 2nd time.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1224,10 +1224,16 @@ int reprogram_timer(s_time_t timeout)
     }
 
     if ( timeout && ((expire = timeout - NOW()) > 0) )
-        apic_tmict = min_t(uint64_t, (bus_scale * expire) >> BUS_SCALE_SHIFT,
-                           UINT32_MAX);
+    {
+        unsigned long product;
 
-    apic_write(APIC_TMICT, (unsigned long)apic_tmict);
+        apic_tmict = UINT32_MAX;
+        if ( !__builtin_umull_overflow(bus_scale, expire, &product) &&
+             (product >>= BUS_SCALE_SHIFT) < apic_tmict )
+            apic_tmict = product;
+    }
+
+    apic_write(APIC_TMICT, apic_tmict);
 
     return apic_tmict || !timeout;
 }

