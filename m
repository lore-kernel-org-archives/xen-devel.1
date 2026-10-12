Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C3CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:19:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445902.1661768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBG2-0006aO-Av; Mon, 12 Oct 2026 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445902.1661768; Mon, 12 Oct 2026 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBG2-0006aF-6u; Mon, 12 Oct 2026 08:19:42 +0000
Received: by outflank-mailman (input) for mailman id 1445902;
 Mon, 12 Oct 2026 08:19:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBG0-0006Yl-L1
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:19:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBFz-009Avp-NY
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:19:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9812-2eae-0a2a0a5409dd-0a2a450ad75a-28
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:19:39 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc981b-f2d2-0a2a450a0019-d155dd31bc09-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:19:39 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso842116f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:19:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9463499sm17335044f8f.3.2026.10.12.01.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:19:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793179; x=1792397979; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ne1we7oWBnWjye1X1yXvq3Rk57Agg+SPNNApBuN6AbA=;
        b=ZwDY9OygvvmW66jhiSiK++vcedPm0VMw2OrQOppRUvO8N0+FypbsgGeMDi2sILap5f
         BTlwi9IJqlU7Tkn4p4QXbdb9HnWlTphGFG2fe5EGqyJNwWxPq1puHdVX6rrfM+Jq8iVD
         glZIDbsX+Qya/VtsAOmib1YV0IIw6/y9i1JPIGuzYb8IFdHDVqVhYsIabhC4pODcs0aB
         3inZeZk4XAYA6iOyx/5qejq3Ney1lG7+a6fZvkCwMxZncxPApcgt2AfgNSqSV12FZkV1
         dI7F/l6AJNJLWCvBXdjJ6+3Nnsgs1XSflSuZbn/kLT3yxdstJBE61a5ag+bzSEpXoS6y
         pzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793179; x=1792397979;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ne1we7oWBnWjye1X1yXvq3Rk57Agg+SPNNApBuN6AbA=;
        b=L+2vpkLqDnPUXOo8Kb//A6tpn5GeLlNMjxCH6xlmFsE2wGtNhL1cH096X8NIPdB6eF
         GpieN2HtuWx26uN3jB2nEs75QnfXY9XA6OCwwZakQP+GCYhby6viCkA3I9xX8/ru60iY
         hAjkRXhGxZL/wXeRFtmjmbtLCP8Mm6scOhj4ymVEpXX6vf4sAseA+FctggWRrcFXe0GZ
         DZfRwlSHi7dH6WrRIr0A3sbQ9rbtkZQYxu/WmA9HDWpvGGs3madsNFRscWNfGDntZwI0
         InckEsx3YKU4SJeqrC5D3ftAyhJDVeiF1XbnG3orp1/Uv6Uulg19Ttfr3TXdzN1D7Ps6
         yplQ==
X-Gm-Message-State: AFq9FYKzqtpyJ8vbgcVCcFXjPiPe9l8DXX2XOG4JkacKJAz6KuE0BeHS
	74EZyEoxlMGNWF/wrV/dsjq3TAxMWpPc7wsfFieF1GRq0l4v+Z5Cue2hb3pvhS2DLa0gDeiUbzU
	YAs2m0A==
X-Gm-Gg: AYBFou1ckr8KaASDUZzeksXLu++A4fr3evbr191SWVSIuZMwQipgMdpz7J1hz2yYIcc
	tRmbuWmcLysUs3W0r0Sc2GjHIJdL2dFHbuxfnYTVdoRCt15cewxOqO/EB7e51DcfZlA37tGeIfN
	GFKBy2oQUuWczuVzfwiqDnoy+i8AInZnNbVyuU9SowD0QV3Bru4dm1CxV2hBAPrg7h9GL5UM+nW
	LXt6/ew2N9V+7VwqJ5pVfjQ1XR2wZZxGJdCQK26XqvoOeVv+0vGNen09dwj8bn4OzdCYJUly4Xz
	12hu9kRfErAG9ES4Lz+ZLZ5U6LkJ+F6WJA4w0paOUyHVk7C0E/b6b6Goh9ehKU0ns6/1v5FguqU
	0V1Tp2FIW47SfYfPfC3ZG4eJke7M7sXzC0MK/bqcJLTk7aR8pUUKBwdmIuSLU8Dmo73ruKoO3eT
	qGDt1Tq3RBMXvckMRdU+ahpf11FcTIfBYl5IHzk5GBiFLNrUftqEl8VdbvrcOM2QPShhRkfMxDJ
	aaO8hVWrZUoskx0MFNP+SQkM9cVccU63F6WDnQpfyz8mI9M6dyUUC6YSdEsmh4=
X-Received: by 2002:a05:6000:29ce:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-48dbaadb050mr10446761f8f.12.1791793179001;
        Mon, 12 Oct 2026 01:19:39 -0700 (PDT)
Message-ID: <0c6f1d50-9eb2-44c1-aea5-c366204316e3@suse.com>
Date: Mon, 12 Oct 2026 10:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 02/15] x86/PV: make better use of assign_pages()
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
X-purgate-ID: tlsNG-4011c0/1791793179-520C1CFC-BE8775AF/10/78276251493
X-purgate-type: spam
X-purgate-size: 1598

As of the referenced commit there's no reason to open-code the loop
anymore. With that replaced by a single call, there's then also no point
in using the local "mfn" in this code.

Amends: 5260e8fb93f0 ("xen: re-define assign_pages and introduce a new function assign_page")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -618,12 +618,12 @@ static int __init dom0_construct(const s
                      (vinitrd_start - v_start) >> PAGE_SHIFT :
                      domain_tot_pages(d);
         initrd_mfn = paddr_to_pfn(initrd->start);
-        mfn = initrd_mfn;
         count = PFN_UP(initrd_len);
 
 #ifdef CONFIG_PV32
         if ( d->arch.pv.physaddr_bitsize &&
-             ((mfn + count - 1) >> (d->arch.pv.physaddr_bitsize - PAGE_SHIFT)) )
+             ((initrd_mfn + count - 1) >>
+              (d->arch.pv.physaddr_bitsize - PAGE_SHIFT)) )
         {
             order = get_order_from_pages(count);
             page = alloc_domheap_pages(d, order, MEMF_no_scrub);
@@ -648,9 +648,8 @@ static int __init dom0_construct(const s
         else
 #endif
         {
-            while ( count-- )
-                if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
-                    BUG();
+            if ( assign_pages(mfn_to_page(_mfn(initrd_mfn)), count, d, 0) )
+                BUG();
             /*
              * We have mapped the initrd directly into dom0, and assigned the
              * pages. Tell the boot_module handling that we've freed it, so the


