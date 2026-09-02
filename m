Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B1C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:35:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405117.1638667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eZb-0007S5-SI; Wed, 02 Sep 2026 06:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405117.1638667; Wed, 02 Sep 2026 06:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eZb-0007Rx-Oa; Wed, 02 Sep 2026 06:35:51 +0000
Received: by outflank-mailman (input) for mailman id 1405117;
 Wed, 02 Sep 2026 06:35:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eZa-0007RO-45
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:35:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eZZ-005yng-H0
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:35:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c3bb-8faa-0a2a0a5109dd-0a2a4501ba20-36
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:35:49 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c3c5-5984-0a2a45010019-d1558030e195-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:35:49 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49cd9add88aso3818395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:35:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce3e0desm133583925e9.11.2026.09.01.23.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:35:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330949; x=1788935749; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ukptOfy7Urb2YHUd+l0+4nj0VI7QTd6I8HIWXBvIOE=;
        b=PPNFvwdz/X+dzzqQfrrr9SNTXTgOS0CznNcV71XIbPRwdf43B2q0rKJhRwogxv7NrV
         n9dzFk+OcXIJiotTXyFj331bSd38YUW9h1Rp586p+g6CTZM9bX9/SiUzptbIZMk45bXV
         KA23hAcDRoOP/y/Mz3u4I5LX5q+SvfhlPI0c257f16d++j5azGQqpHFRHi8So3DiH/ra
         2kgmWWR7kLi03MODqOYeOaNVrOyuDnmmbo15qx86ggUDwRbwd/SfCNYdNW3RQKSXC6tp
         bReKZPJYYBTGmi8c9w7iQnMK+24R6pQykWHIXxiPFyPDXcdYyv6tUo49wvAtrQRKEuCz
         w53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330949; x=1788935749;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ukptOfy7Urb2YHUd+l0+4nj0VI7QTd6I8HIWXBvIOE=;
        b=efCrVp2VHt4QFVnRgzEPSnpplLRAKuwcGLnpl2gpev8kf4P35NQ0/wwPWulx1+Ah9z
         W14DPRs5oHHVI+c9M5rroNcSazLc9KfGsNCWaU415tD/QYxWQ+S9MCNEA2i+OKAn8eco
         utsGEO6Y9msiR3pJSxYFLje6wCyF0vMEvhWHQJZVpuY149+1rWFfnKLmZm+6uMdEFwfv
         YtJSoxsTb28LIfbQFlYyfIAd7BTlDkkPkPnUc3a3rdJW7FX0aGVxWOInpw2qo96VevgJ
         eBhfgF7SnP1gQQcWIy7jF6kzwDR8evV42OgD7L3Zn77z2uoP8GE/c9MXBD2bYNG+TyDI
         aRog==
X-Gm-Message-State: AFuF++mgZ5T1ugWoDQxBktP3zTUdm7ryahiv6n+Ndht0C78+pqeTVlP7
	RTsAABux8SES/PFa/FDJiyrYXVHV998WHgM+TYvF0Ur5o2l7TsKTxW53N7DfuxGZj63ScYMR3aI
	7nz0z9A==
X-Gm-Gg: AR+sD13nykA1D3hmgzJaAGpVJlDy1H1DS0v+JodFvdvjp6JiXL8PiGCNPEpav5LYS2+
	QSEIefYOgalaU2dvLpHEV9um75Gt8YJEESnSd3tqklvUtdU9brSexVTcUPQuQ+vt2KCngSeH3CY
	pzYQM6mzubdWo3ePNwfEWDTm2yMUqb1r1wZRyJgMjwOtM4Wip5OJ+t4VWAxG8C/QLni/V9+Notp
	rRcRSDpAVc8wu3/Zp9wDRJwgce36nqrmhndjEMkkTRLUGlT8080Ch/KzYA6xl49urOwESB+Evii
	QmTZgKK8bsJpeTj1uNpJ9PTdpuUqC8eqcWv8hMHfyG2Ca3MfMX7bsj0mIF+T1926z6v/Rf/NeR/
	d6iXCGdvk5v4HMPg1AtRRDoSNJBpPukghOuRUEepxJltB412zOn3IUZdwFUQjOC8SoZZ13utayX
	1wZ+wX5P3HczxEeVa56TSDxJ91rqymlIcboJAYZKOnugACWcFSfKOWKDUVA6hDMVFug1ULPINwM
	eIHBUl5wFirRonM4xWhc7KDTW7fKeZM9iW0h0AsV8gRs3RkDIU7
X-Received: by 2002:a05:600c:37ca:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ce5819a2fmr46114605e9.12.1788330948918;
        Tue, 01 Sep 2026 23:35:48 -0700 (PDT)
Message-ID: <1f55b457-c8cc-4ef9-ba5a-96e52b95fbbe@suse.com>
Date: Wed, 2 Sep 2026 08:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 12/14] gnttab: don't cast away constness
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
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
X-purgate-ID: tlsNG-d62444/1788330949-BF262757-518BC6AA/0/0
X-purgate-type: clean
X-purgate-size: 1751

While _set_status_v2() indeed doesn't alter the grant_entry_header_t it
is handed a pointer to, _set_status_v1() does. Drop the const from the
parameter of the latter (and then necessarily also from _set_status()'s),
while adding const to the local variable of the former.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really I think it would be best if we did away with the raw_shah local
variables (which looks reasonably simple for at least _set_status_v2()).
I'm unconvinced that we really need to use ACCESS_ONCE() here. Torn reads
aren't a problem; what we require is that we look at a stable local copy,
and that can be achieved by putting barrier() after the reads.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -740,7 +740,7 @@ static unsigned int nr_grant_entries(str
     return 0;
 }
 
-static int _set_status_v1(const grant_entry_header_t *shah,
+static int _set_status_v1(grant_entry_header_t *shah,
                           struct domain *rd,
                           struct active_grant_entry *act,
                           int readonly,
@@ -832,7 +832,7 @@ static int _set_status_v2(const grant_en
                           domid_t  ldomid)
 {
     int      rc    = GNTST_okay;
-    uint32_t *raw_shah = (uint32_t *)shah;
+    const uint32_t *raw_shah = (const uint32_t *)shah;
     union grant_combo scombo;
     uint16_t mask  = GTF_type_mask;
 
@@ -909,7 +909,7 @@ done:
 }
 
 
-static int _set_status(const grant_entry_header_t *shah,
+static int _set_status(grant_entry_header_t *shah,
                        grant_status_t *status,
                        struct domain *rd,
                        unsigned int rgt_version,


