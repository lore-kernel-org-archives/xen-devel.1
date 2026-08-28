Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827EC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:01:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401600.1637143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqaE-00028V-Dz; Fri, 28 Aug 2026 07:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401600.1637143; Fri, 28 Aug 2026 07:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqaE-00028O-AG; Fri, 28 Aug 2026 07:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1401600;
 Fri, 28 Aug 2026 07:01:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqaC-00026e-F8
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqaB-0015sL-S0
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:00:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a913227-e002-0a2a0a5209dd-0a2a450686f0-34
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:00:59 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91322b-195a-0a2a45060019-d155dd2ebd88-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:00:59 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so413302f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:00:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb20784sm1813269f8f.18.2026.08.28.00.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:00:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900459; x=1788505259; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+m1CwKzFOQuLY7Ed6bVSIiSUHeYqUHSn/bbUY8FHCIs=;
        b=G1c9/lU0+9C43z1fyx3cUGQTa9gsBJm6gYWUxnsieSvnrGPvJ6icb2F1itf0TpGOMS
         JswKz/gtz6WDFn3/sH2pfH+/3VwTvCd5nkiiY/ihz4CZBam6NBe3jL67Yjwxq6c8c9W5
         S/hgs/gq6tU8BEwESP7vI4y/ywWwdJgiNrEQNYoz6cCENr6q33I+NkU7/417vNBPFHhX
         vv4JaCG+s04rEqogfY2pmRaIjn3ah650FSFYm7hmnebMXzQlLYNeFbImEA3nE1oswH/f
         e6ImMbcCZ4s4YIs1EPsdXD1CGfZom1WRLo/CuOzOPxT5KMbxf7K+SniuYHFrfJ+64/VE
         RKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900459; x=1788505259;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+m1CwKzFOQuLY7Ed6bVSIiSUHeYqUHSn/bbUY8FHCIs=;
        b=RlExf13EF0TXjpL8RUsc6g3ob3H47naB8r/gHt0Ct5IhT4KM0nfBsISuqh2HBYKeOK
         +FA4pUZC/OZDlS+xbJfnFdjZsVpJfi0xVAR9FcFDpSQeEATd1tfgLteoSqGDT+TaNq2l
         Zv5XIZr5Wmqrh2wPK3HBRxkUBG/A4M8ET+VDqmLYso2UBZW35leE9MLeZKFeJH6elICJ
         oSbMngG9U9mMnPgSVYcNUMvuSSytm42sJIKyYf8b/9AH3EDI1obEbvCsucJyXwWcye2v
         EYtf/fA0HkDNQtG5y5XIr/uLR26KcKTPaPcPvbW/6Zu3+xRvVVlf11j9dvQacxXWe82r
         Zg0g==
X-Gm-Message-State: AFuF++nH7ETiOW67yM3GjQDlX2Ox+V4qtgF66Bn3REVlrZ8GYDKrhDAd
	o93B5r0aNxYsgmV932ga1lPSChnJMQX6YxulQg+abMLlOXRBZihV/ubd+viyXvL9Q478fQSHi7J
	MT6M26A==
X-Gm-Gg: AR+sD10JtYtwbGIu5yR+dtD8zcO7U9khy+q0aUbA85uiKwFWiWtpRybImJF811q0GfP
	jMew1NNGXrvaQyVkj1uu/uwljPIZ/l2Nji68UYjP4PSUJZmLmJGwwfavd/Gq7GpReUWZ+6p54ph
	tDZTkjGVS1TbMklL2EEKsWuuxT+BAhMIemdcQFWM0ZhsBCDxz6sAFbNWqfJkqfavTD2KPYCh3T/
	csI86xyU6hHBkLdZAjE4aHxFemz2B6Qb67wFkepQ3WvqLdXiq38QOG1Tp2JKlBndgEq3Q7SffyM
	Zd6y8K85pyPNG8uS7n1zXWEyvT41gU1q1+AdjZdxKlLkLgSWz+dGq5S2gVvDZ4IEncDobmxnPTA
	i9V5ivGTt9RA9uid78BTytjTYFNUDO4LVX/lYGl9DybppIEGGFg6kkByca0yFTZHkDDwT0PCfZB
	NShRFFkN1w0nle42aPWRt3CEo6rBIIb/ptb6hgfpnvk8Yte2cslrB96nw4ulqkSvBVkQykBlV5E
	jyHKGULvPMlllqSTjybz1wQrRxPxov/l7b9/8DWyE3ftz2BomPkBeA5YFgs7cE=
X-Received: by 2002:a05:600c:3b21:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49b91c3f643mr61587435e9.8.1787900459184;
        Fri, 28 Aug 2026 00:00:59 -0700 (PDT)
Message-ID: <9c4e5674-e79e-4623-b87c-ada690778ffa@suse.com>
Date: Fri, 28 Aug 2026 09:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 03/12] x86/shadow: eliminate unused forms of
 sh_map_and_validate_gl<N>e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Tim Deegan <tim@xen.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787900459-F6C7777B-5CA53083/0/0
X-purgate-type: clean
X-purgate-size: 2390

The L2H, L3, and L4 forms only have GUEST_PAGING_LEVELS=4 call sites, i.e.
their 2- and 3-level forms are unreachable, violating Misra rule 2.1. The
L2H form additionally is unused (call site DCE-d) with PV32=n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1789,35 +1789,30 @@ sh_map_and_validate(struct vcpu *v, mfn_
     return result;
 }
 
+#if GUEST_PAGING_LEVELS >= 4
 
 int
 sh_map_and_validate_gl4e(struct vcpu *v, mfn_t gl4mfn,
                           void *new_gl4p, u32 size)
 {
-#if GUEST_PAGING_LEVELS >= 4
     return sh_map_and_validate(v, gl4mfn, new_gl4p, size,
                                 SH_type_l4_shadow,
                                 shadow_l4_index,
                                 validate_gl4e);
-#else // ! GUEST_PAGING_LEVELS >= 4
-    BUG(); /* Called in wrong paging mode! */
-#endif
 }
 
 int
 sh_map_and_validate_gl3e(struct vcpu *v, mfn_t gl3mfn,
                           void *new_gl3p, u32 size)
 {
-#if GUEST_PAGING_LEVELS >= 4
     return sh_map_and_validate(v, gl3mfn, new_gl3p, size,
                                 SH_type_l3_shadow,
                                 shadow_l3_index,
                                 validate_gl3e);
-#else // ! GUEST_PAGING_LEVELS >= 4
-    BUG(); /* Called in wrong paging mode! */
-#endif
 }
 
+#endif /* GUEST_PAGING_LEVELS >= 4 */
+
 int
 sh_map_and_validate_gl2e(struct vcpu *v, mfn_t gl2mfn,
                           void *new_gl2p, u32 size)
@@ -1828,19 +1823,17 @@ sh_map_and_validate_gl2e(struct vcpu *v,
                                 validate_gl2e);
 }
 
+#if defined(CONFIG_PV32) && GUEST_PAGING_LEVELS >= 4
 int
 sh_map_and_validate_gl2he(struct vcpu *v, mfn_t gl2mfn,
                            void *new_gl2p, u32 size)
 {
-#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
     return sh_map_and_validate(v, gl2mfn, new_gl2p, size,
                                 SH_type_l2h_shadow,
                                 shadow_l2_index,
                                 validate_gl2e);
-#else /* Non-PAE guests don't have different kinds of l2 table */
-    BUG(); /* Called in wrong paging mode! */
-#endif
 }
+#endif /* CONFIG_PV32 && GUEST_PAGING_LEVELS >= 4 */
 
 int
 sh_map_and_validate_gl1e(struct vcpu *v, mfn_t gl1mfn,


