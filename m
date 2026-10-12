Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B0CCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:22:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445932.1661812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBIj-0001dw-LB; Mon, 12 Oct 2026 08:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445932.1661812; Mon, 12 Oct 2026 08:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBIj-0001dp-IA; Mon, 12 Oct 2026 08:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1445932;
 Mon, 12 Oct 2026 08:22:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBIi-0001dc-C3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:22:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBIh-008dsg-OY
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:22:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc98b2-bab6-0a2a0a5309dd-0a2a4507d932-46
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:22:27 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc98c3-b4ea-0a2a45070019-d155802ce833-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:22:27 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so9743465e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:22:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf214a1sm311753545e9.7.2026.10.12.01.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:22:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793347; x=1792398147; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hE/SXNVKI/0qWDwe9Mw7V0YXt4dz6aAjn4Zm0MO3tsw=;
        b=M/1h30q63zjPCY97yk1NVLJO3vnCjVFisrcqNQ7hd7sjEPZxuU46HFJHVdh7xwTW0b
         XyjtWHITkHfYzn+LF+zyy48zxt0uOKpSz2rK9Ft2LWhVknPWFALGBtTRQELPxcxjbhh/
         5JcMrv8mO/wms7WCpJnSGHtAq99gpUBo6c1mZoAcW+0oWBj+QQCWDcfIG3cWOUCdb/YG
         4hDKwJ/s6yAc5JMJbXS31IKE9e8WYkXcW5eebZxmO3eCJjTjnWy269LeqAkUGvrfGwMy
         g+6TU2SFsQYOeizMIL8yi5jYVGV0XcLIVrnpZNHjGah7BgZUh8C1KluxKtUK3z4not60
         EtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793347; x=1792398147;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hE/SXNVKI/0qWDwe9Mw7V0YXt4dz6aAjn4Zm0MO3tsw=;
        b=cSefES+UeewkXaLlo9DycF2S56OmlVq4J3qgboKQKc8b0w8GzAR5xjzx9/egHDB6Pj
         4oTRr+rXLQW9k7vj7SSxsCdrCx4VZ/2aTxZitWHivncKN5yqQAxUBeYDerZJ4NfO1+He
         Lpg1lc4WZLNvf6C6J70bvU6jORJcT0EESzP73OpO0B8jjgXYFrq4EEumhYgSa6qClvuX
         novO07BFprdx706iWywIYrLbW1nFesGBINebxSxL23btCI8iNO3knH4htgkNKhgs3YkU
         Gcm6DxVL2pQ7RgnTHW9IDRfEdVN+CdMtdyWHy0fRUO4xVyPgqJSWXxKp2N07DmkMhzr9
         y85Q==
X-Gm-Message-State: AFq9FYJDR1/GHzyz9e3WseTuD3wpW2m2NJhjkgRx9+fpf1os9udqc3aG
	er0taTf4zDDxa8MpRPOxbDGwOU2f0816OMjBwYH+sASi6csg0N78SRVxht/IngX1waHkdphMOp5
	f/ACHyg==
X-Gm-Gg: AYBFou1G7s4UTe6lj/SpYtf8LN64hjL5G9/AnbYNIth3BlMQNJpP/0X8bsXsOzE47Ov
	ZGzoQdizID1VYtlQjgYs2T883GI1ylIIBujGfjjheCgWZRo4qvr3XlIwObQbeiKQ6HH4jdTQ8Hp
	glG8u3szGAaYjzHPPNuGTEWlFnManBoRj8mCoFNVfuydwyytNxj4GYHTEPjj3NTiG7Jl1SpB3zh
	hMxOrlASHSg2AE81uKdPf3HnFmmfzXSPJfdvypnWtFioGgeapxGqhLPaUjVsMErTuKezu9Dxz+M
	jf8NBfDM1899K6m/+TdpXnsY0YvpfaRop1e3iv71jgNf1GrkEX2V73wHGjPCRsD+kM7G11yuEns
	lNlscs0I5FG42gXWMttrrU/2T0muYt6hh03y1yF0pNjt//zr/5sDOi2TuHGnegHar6rdTGqpJQk
	9SMZj9QUcSYXscZxis7C6twaXQhTVs1FTF4pBUg3mhawSsQv4aKR8Ry8h5NHUOMO4ShNf+Fesgi
	cgWnPfdMz7LWlk0Zb+4fufTe8jRIjm7BQxo1bartuXzlQGUeF+qD60GxJd/jGc=
X-Received: by 2002:a05:600c:83c4:b0:4a1:7367:5395 with SMTP id 5b1f17b1804b1-4a18e446f4amr159958945e9.2.1791793346987;
        Mon, 12 Oct 2026 01:22:26 -0700 (PDT)
Message-ID: <a28959f9-a832-45ae-9c81-350e43f23c91@suse.com>
Date: Mon, 12 Oct 2026 10:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/15] x86/PVH: lift E820 alignment requirement
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
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
In-Reply-To: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791793347-364DBAE4-F5C670E9/10/78276251493
X-purgate-type: spam
X-purgate-size: 2254

Before reordering things (to move in particular pvh_steal_ram()
invocations ahead of the pvh_populate_p2m() one) drop an undue (and as it
turns out unnecessary) assumption: find_memory() doesn't really depend on
E820 regions to end on page boundaries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really the assumption towards the start of regions doesn't look to be
relevant either, yet I thought I'd limit the change to the minimum needed.
(In fact the statement immediately ahead of the assertion arranges for
page alignment, so the check is dubious altogether.)

We also could consider whether kernel_end really needs rounding up to a
page boundary: Technically there's no need, but the question is whether it
would be a good idea to have the tail of the kernel region share a page
with metadata (or, as things still are at this point of the series, the
initrd).

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -365,6 +365,9 @@ static __init void pvh_setup_e820(struct
          * that's the minimum granularity of the 2nd stage translation. Since
          * the p2m code uses PAGE_ORDER_4K internally, also use it here in
          * order to prevent this code from getting out of sync.
+         *
+         * Note that this is only for pvh_populate_p2m().  Subsequent uses of
+         * pvh_steal_ram() will break the length part.
          */
         start = ROUNDUP(entry->addr, PAGE_SIZE << PAGE_ORDER_4K);
         end = (entry->addr + entry->size) &
@@ -506,8 +509,8 @@ static paddr_t __init find_memory(
     unsigned int i;
 
     /*
-     * The memory map is sorted and all RAM regions starts and sizes are
-     * aligned to page boundaries.
+     * The memory map is sorted and all RAM region starts are aligned to
+     * page boundaries.
      */
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
@@ -519,7 +522,7 @@ static paddr_t __init find_memory(
 
         start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
 
-        ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
+        ASSERT(IS_ALIGNED(start, PAGE_SIZE));
 
         /*
          * NB: Even better would be to use rangesets to determine a suitable


