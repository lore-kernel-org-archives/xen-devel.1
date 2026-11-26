Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B228606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P0MLxmZ9
Received: from list by lists.xenproject.org with outflank-mailman.1503410.1699116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZdd-0001gW-GD; Thu, 26 Nov 2026 13:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503410.1699116; Thu, 26 Nov 2026 13:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZdd-0001gP-DV; Thu, 26 Nov 2026 13:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1503410;
 Thu, 26 Nov 2026 13:35:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZdb-0001gJ-Ni
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:35:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZdb-00Fukf-40
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:35:47 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0835a3-8faa-0a2a0a5109dd-0a2a4506b2c0-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:35:47 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0835b2-195a-0a2a45060019-d155dd2ea894-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:35:47 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4a5024b3c28so4626537f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:35:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989eesm41028609f8f.50.2026.11.26.05.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:35:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700146; x=1796304946; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3OzYqaOSt5hmjVQn89vcBD2hR0nuewhaUSDsOtgH/o=;
        b=P0MLxmZ9KUBVYbS4Cd5BqmQG7YdxgeCHlaFjbmj/BGH4Jb9spGkTNzgUGB7n5xqf5V
         yFp3d2Y3pfHRNkCoO+4izmE+lJQuIE3yalriRE0GRIkAykNGm2wUsJ68d2i7LC078SRu
         sGDXQMjN4nC4oPkrwEtw6Ptjii3+gS2YPz48FFZdsDsMGMijhUPggD5C3fvlET1bdGwM
         9msUXgl1+WbkYplrm7gdUSfhplwkWUt1aXt/EdbM1Ql1f4+xBuJGDXr+t2DatHqsDX99
         Pk6Gwb2FwzxoNca8znrhEW755Uo8RONttpdAxwzPTXjhrzmjBUdkRVQFmwMo62XBuuCY
         hLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700146; x=1796304946;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3OzYqaOSt5hmjVQn89vcBD2hR0nuewhaUSDsOtgH/o=;
        b=kjYi+mmDWx4pTH//jWObSGSI09Xb2T60lB4I1B49PROp+FdU9qZo1xJ9GqGjo8ltK6
         Z6V2DXBdkpKboSltNpef+Fyzh0V9rAdx9Q2Vaw7xvLeD4vkCKx++yes5/aFMFm5ianJq
         dUirDQFjjItdv7vxrS+/RmOYs3oU/tjkoA+np7X89mGNVt9Pwe7B3JjUdZgA6Zdtb3dX
         foR0oxYsRRCZxbv6OjsJudspavYd0v05Il1V9yu+iT8DdehiHwJiETRBFI0ddJOPyd3T
         dZNVcTcRLrxrIa4ZpS691gCy4EoCwxy6fE1GFSF6vOjnrLqtKkuWGH5yy0/lDBIsQiT7
         /T5A==
X-Gm-Message-State: APuU4Z/v7xwgiXR+W83AAfsoO9XHXJK/pohk5Ru8qKjAWbtCMvzOMTAg
	/6d98lo2cEEqXF2XuEDJ49T0kY9hvF4jrXRH5Sf+qYXBsxUzxfINuCVL5x3R6vjLvFzlhNz4Yst
	UA9wvWg==
X-Gm-Gg: AZFdTZeVFPkQpxMq5EevOTvySaFJLEAD1py4VGvYF+2rt861KoE5k5JZtdNkI1mrged
	xkFZ5RkVJneOuVTzvCWsnLC3Yo2SiQUShYGLExiQRfXFH6FrzG43pnxQw474guplkebTTt3n0pp
	nis5R5I18v+8d5lMcYFK2a4tSUHfy/6/58bTGVFeZsF/lCbpmRMcytDSC3FM7ELGvkLdMfly+Mb
	jj9hft9tJiY0Jw41K9C2ja0NZpCjTBt1VLJMmvYCVr1RubdCktiHYS2HZd+o5GIL1eHsSiiXiGY
	3Dtf93VifunLk6kD36m8EGdRlavME4pNqJ01i+W2riX/ztBPc3xn2+Ka/IOX8HpnD1nKBabcyZG
	uR1gT1XSfIl336RXt/li2ayVbQsAyrhsGDR7V3c1p0nEwx71ZeIEt3cYlbp5lqOrqPNXRmN91NU
	IP71+jsJPppNyXLL0IlvQmJ2/DNFW8bJtSP9G2i0HiAgrbhRsVHacSYUpf8RY5lEP42395SaeRc
	sdK5WNbQkcSpEvSFJaw+tWQHKD7wqCAIU7rEpgE6siFDiWm3hd14fP1Lqkz4Sr1/5JXSYzfVasP
	fMffSVDQsYSpbjMWazDZRIa4+r0yBPXwc+DuLz+egCh7snJeaDktlMfXzLHDfFwpjr6Xuz1Z/HS
	3h4qjqLYO8V6RPCR5ww==
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr49435703f8f.11.1795700146394;
        Thu, 26 Nov 2026 05:35:46 -0800 (PST)
Message-ID: <0031aac4-59f4-499c-9e6e-32e894d0c6d8@suse.com>
Date: Thu, 26 Nov 2026 14:35:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 01/13] x86/gdbsx: don't blindly assume vCPU 0 exists
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1795700147-F76C877B-516C21FE/10/78276251493
X-purgate-type: spam
X-purgate-size: 2492
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For the PV case, pass domain_vcpu()'s result into the low-level function,
and refuse the lookup there when pgd3val wasn't provided and the vCPU
doesn't exist. Additionally also check whether CR3 was ever set.

For the HVM case, simply use domain_vcpu() in the low-level helper and
bail if the result is NULL.

Fixes: 61f2a440299c ("gdbsx: a gdbserver stub for xen")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -30,11 +30,15 @@ typedef unsigned char dbgbyte_t;
 static mfn_t
 dbg_hvm_va2mfn(dbgva_t vaddr, struct domain *dp, int toaddr, gfn_t *gfn)
 {
+    struct vcpu *v = domain_vcpu(dp, 0);
     mfn_t mfn;
     uint32_t pfec = PFEC_page_present;
     p2m_type_t gfntype;
 
-    *gfn = _gfn(paging_gva_to_gfn(dp->vcpu[0], vaddr, &pfec));
+    if ( !v )
+        return INVALID_MFN;
+
+    *gfn = _gfn(paging_gva_to_gfn(v, vaddr, &pfec));
     if ( gfn_eq(*gfn, INVALID_GFN) )
         return INVALID_MFN;
 
@@ -65,17 +69,21 @@ dbg_hvm_va2mfn(dbgva_t vaddr, struct dom
  * Returns: mfn for the given (pv guest) vaddr 
  */
 static mfn_t
-dbg_pv_va2mfn(dbgva_t vaddr, struct domain *dp, uint64_t pgd3val)
+dbg_pv_va2mfn(dbgva_t vaddr, const struct vcpu *v, uint64_t pgd3val)
 {
     l4_pgentry_t l4e, *l4t;
     l3_pgentry_t l3e, *l3t;
     l2_pgentry_t l2e, *l2t;
     l1_pgentry_t l1e, *l1t;
-    unsigned long cr3 = (pgd3val ? pgd3val : dp->vcpu[0]->arch.cr3);
-    mfn_t mfn = maddr_to_mfn(cr3_pa(cr3));
+    mfn_t mfn;
 
     if ( pgd3val == 0 )
     {
+        if ( !v || !v->arch.cr3 )
+            return INVALID_MFN;
+
+        mfn = maddr_to_mfn(cr3_pa(v->arch.cr3));
+
         l4t = map_domain_page(mfn);
         l4e = l4t[l4_table_offset(vaddr)];
         unmap_domain_page(l4t);
@@ -91,6 +99,8 @@ dbg_pv_va2mfn(dbgva_t vaddr, struct doma
              (l3e_get_flags(l3e) & _PAGE_PSE) )
             return INVALID_MFN;
     }
+    else
+        mfn = maddr_to_mfn(cr3_pa(pgd3val));
 
     l2t = map_domain_page(mfn);
     l2e = l2t[l2_table_offset(vaddr)];
@@ -125,7 +135,7 @@ static unsigned int dbg_rw_guest_mem(str
 
         mfn = (is_hvm_domain(dp)
                ? dbg_hvm_va2mfn(addr, dp, toaddr, &gfn)
-               : dbg_pv_va2mfn(addr, dp, pgd3));
+               : dbg_pv_va2mfn(addr, domain_vcpu(dp, 0), pgd3));
         if ( mfn_eq(mfn, INVALID_MFN) )
             break;
 


