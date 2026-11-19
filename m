Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821260A2603
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L/TocwgC
Received: from list by lists.xenproject.org with outflank-mailman.1496290.1694917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU165-0005HX-P9; Thu, 19 Nov 2026 12:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496290.1694917; Thu, 19 Nov 2026 12:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU165-0005HQ-Lt; Thu, 19 Nov 2026 12:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1496290;
 Thu, 19 Nov 2026 12:18:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU165-0005HK-8b
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:18:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU164-009GMs-L9
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:18:36 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afee912-2eae-0a2a0a5409dd-0a2a4501e4dc-42
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:18:36 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afee91b-5bcc-0a2a45010019-d155dd2ad52f-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:18:35 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48e47347279so1293510f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 04:18:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb84cc09b1sm30048975e9.0.2026.11.19.04.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 04:18:35 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795090715; x=1795695515; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/V7h4VfDJfdh8sMFXjdeeK8yg5apsPqsfOak51YSFxg=;
        b=L/TocwgC474FZUpbF/ddO6OM9JWpAwY0qw1ZZIW6omAXP9VYWZlU/tkSRk17CAKFRw
         yXKbN625vadOy5IwbNDyr0VvLnS/ot7uQdUy2hQpmw3c+vjBJmBT3XmvA7a3okfvdPBb
         h8F/ZrJfCBcxgeSeFsDDqAIMd/B10rW7gtWPWKFkErxc8jVOFRglY+E2JHfKpdElYekN
         Hun0pm/aEZxRUiwJ2BxditI0YMUaqB0OrUmuZKMm2js1B3BXedKMnnTTJzLVAfALGjMc
         WVE0UmnN0VLanbW5Sf+NdSu2MIDlmGaPwTjw2F/fL4sWFg0ZAbqLnfaAYUF+jpjj4YVp
         240A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090715; x=1795695515;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/V7h4VfDJfdh8sMFXjdeeK8yg5apsPqsfOak51YSFxg=;
        b=xak5DnLTgXj9RGLvbJ8p7RxdrJIbiEp292kWbNMU4mBRSfanauFzOFBB0tFRNqZokG
         Od8OUzR6Gx1sOdU9T9CxOhxj+YbFPduIq1VprrkWwDOF9qhFrh438QnufilF04MFKuHj
         xgXXfQ8UE05TvsSRfGURRJ9i6zEIkLRbDEKorxqL4TPmtcmlFcwRGzw8VZ3OFltEnBpm
         0UQBUI7T369s3dOLAOk6qZZnihoN/239mXriJw5wXmat8E3AJufEMrwvEXwH4QDzNbvo
         lV1Q1/7ZweYl7gbLZGJIgCTQH7nBYhTCqaqY8Gls2tRe4magOUI8TzsX4J6e+zqAyfEr
         35qQ==
X-Gm-Message-State: APuU4Z+hFORfXnxX8w2oRaBjnfnPjDhxkpLlEvnqbqH/AB6HiClOfV7b
	O43X8E0U/ote+YmGJlwu7IyDOF+9fLGgxLyscetJIIz2h+jgdjDATJP1v/i/x9NmDSRnNfqW/1U
	Z03Ojyg==
X-Gm-Gg: AYBFou28MLn33ThRPLv34FIkBsDIfO/1kLavojdd6wjMF1CbomUUb2q1sEgNHBPqZGM
	j0tc6RW9WqT89XpY9La+w+1WA5p/ozmuVRzfAlOibgAB+s36xSZhJEGljXPM8tX7fjI+Z7A6Kjd
	r2A0YRWZjDaEBxVsPhm7BipqzR52y04Ni/RMwKD7+m9yKj5vy5Dkzx7aOlZ1dKB4oK5QtGkOEtg
	ebZ6PI7bsITL7ZJ9uXhsdDrqRgCUYIcbjUFhxuKBfGCyWOM9XDpBlWFhkA3qRcooFAMrFuyGrfb
	O0JuHj5ZWCRQ8ca2dQFKZsxc4cW/mLCDvZc//S0snl/QdCI3L3ZuMHkVcj74o90uea/PGwCv+YR
	Wg1dvNCHs5RQKZIlCjw0w+v3f6ei87p0WHrOr9ItPRDZVoCX8VTKsmyuP/afzXqwNvbQGtXeOPP
	qoejl6CD6kuw0/MGJyUGgz8VfQyqZajP8gCanC4KutXvqrsf44+wnz3QF76JUuL4BDEUelsa+2P
	d+tDkSdZRtJ+W8AE5x2FyYsNyxAJmmRxEE4FTDN3FZ04bEFi9k1pNJUn2khjBDqNa5BOfWAzgQk
	sU8Dn8nDvA2C2MjYzbzykJjGP4F+pE4KiCyR9btlY7/DHMTbaZTYXc/2GPVghb32B22HeqLvZA2
	+wTR6tEAoh3ifna6Odr1X3vULWMz1p9Kk6Jlu8Q==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr134363955e9.11.1795090715294;
        Thu, 19 Nov 2026 04:18:35 -0800 (PST)
Message-ID: <fcf0446e-3511-4dfc-b1dd-1445f29ec815@suse.com>
Date: Thu, 19 Nov 2026 13:18:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vLAPIC: only accept interrupts on enabled LAPICs
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795090715-4D55D5FD-110276DF/10/78276251493
X-purgate-type: spam
X-purgate-size: 9816
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In hardware-disabled mode the APIC behaves as if absent altogether. In
software-disabled mode it only accepts INIT, NMI, SMI, and SIPI.

Integrate the enabled checking into vlapic_match_dest(), requiring the
delivery mode to be passed in. This way (for vlapic_lowest_prio() and
vioapic_deliver()) the cheaper check also is done first.

Modernize a few involved types at the same time.

Fixes: 7429bfd50dd7 ("This patch provide local APIC support for vmx guest")
Fixes: e03ad58f0b8c ("x86 hvm: Clean up vlapic/vioapic/vmsi delivery")
Fixes: d75c52c50c4b ("iommu: Fix pirq conflict issue when guest adopts per-cpu vector")
Fixes: 023e3bc72dc3 ("x86: Make assigned devices' interrupts delivery to right vcpu")
Fixes: 7242e0dc2c6c ("hvm: Improve APIC INIT/SIPI emulation, fixing it for call paths other than x86_emulate()")
Fixes: 35a1caf8b6b5 ("pass-through: update IRTE according to guest interrupt config changes")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -438,9 +438,8 @@ static void vioapic_deliver(struct hvm_v
 
         /* Force to pick vCPU 0 if part of the destination list */
         if ( (irq == hvm_isa_irq_to_gsi(0)) && pt_active(&d->arch.vpit.pt0) &&
-             vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode) &&
-             /* Mimic the vlapic_enabled check found in vlapic_lowest_prio. */
-             vlapic_enabled(lapic0) )
+             vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode,
+                               APIC_DM_LOWEST) )
             target = lapic0;
         else
 #endif
@@ -463,8 +462,8 @@ static void vioapic_deliver(struct hvm_v
         {
             struct vlapic *vlapic = vcpu_vlapic(v);
 
-            if ( vlapic_enabled(vlapic) &&
-                 vlapic_match_dest(vlapic, NULL, 0, dest, dest_mode) )
+            if ( vlapic_match_dest(vlapic, NULL, 0, dest, dest_mode,
+                                   APIC_DM_FIXED) )
                 ioapic_inj_irq(vioapic, vlapic, vector, trig_mode,
                                delivery_mode);
         }
@@ -473,8 +472,8 @@ static void vioapic_deliver(struct hvm_v
     case dest_NMI:
     {
         for_each_vcpu ( d, v )
-            if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
-                                   0, dest, dest_mode) &&
+            if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode,
+                                   APIC_DM_NMI) &&
                  !test_and_set_bool(v->arch.nmi_state.pending) )
                 vcpu_kick(v);
         break;
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -238,12 +238,28 @@ static bool vlapic_match_logical_addr(co
 
 bool vlapic_match_dest(
     const struct vlapic *target, const struct vlapic *source,
-    int short_hand, uint32_t dest, bool dest_mode)
+    unsigned int short_hand, uint32_t dest, bool dest_mode, unsigned int dm)
 {
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "target %p, source %p, dest %#x, "
                 "dest_mode %#x, short_hand %#x",
                 target, source, dest, dest_mode, short_hand);
 
+    switch ( dm )
+    {
+    default:
+        if ( !vlapic_enabled(target) )
+            return false;
+
+    case APIC_DM_SMI:
+    case APIC_DM_REMRD:
+    case APIC_DM_NMI:
+    case APIC_DM_INIT:
+    case APIC_DM_STARTUP:
+        if ( vlapic_hw_disabled(target) )
+            return false;
+        break;
+    }
+
     switch ( short_hand )
     {
     case APIC_DEST_NOSHORT:
@@ -317,7 +333,8 @@ static void cf_check vlapic_init_sipi_ac
     struct vcpu *origin = data;
     uint32_t icr = vcpu_vlapic(origin)->init_sipi.icr;
     uint32_t dest = vcpu_vlapic(origin)->init_sipi.dest;
-    uint32_t short_hand = icr & APIC_SHORT_MASK;
+    unsigned int short_hand = icr & APIC_SHORT_MASK;
+    unsigned int dm = icr & APIC_DM_MASK;
     bool dest_mode = icr & APIC_DEST_MASK;
     struct vcpu *v;
 
@@ -327,7 +344,7 @@ static void cf_check vlapic_init_sipi_ac
     for_each_vcpu ( origin->domain, v )
     {
         if ( vlapic_match_dest(vcpu_vlapic(v), vcpu_vlapic(origin),
-                               short_hand, dest, dest_mode) )
+                               short_hand, dest, dest_mode, dm) )
             vlapic_init_sipi_one(v, icr);
     }
 
@@ -399,8 +416,8 @@ struct vlapic *vlapic_lowest_prio(
     do {
         v = v->next_in_list ? : d->vcpu[0];
         vlapic = vcpu_vlapic(v);
-        if ( vlapic_match_dest(vlapic, source, short_hand, dest, dest_mode) &&
-             vlapic_enabled(vlapic) &&
+        if ( vlapic_match_dest(vlapic, source, short_hand, dest, dest_mode,
+                               APIC_DM_LOWEST) &&
              ((ppr = vlapic_get_ppr(vlapic)) < target_ppr) )
         {
             target = vlapic;
@@ -498,13 +515,14 @@ void vlapic_ipi(
 {
     unsigned int dest;
     unsigned int short_hand = icr_low & APIC_SHORT_MASK;
+    unsigned int dm = icr_low & APIC_DM_MASK;
     bool dest_mode = icr_low & APIC_DEST_MASK;
 
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "icr = 0x%08x:%08x", icr_high, icr_low);
 
     dest = _VLAPIC_ID(vlapic, icr_high);
 
-    switch ( icr_low & APIC_DM_MASK )
+    switch ( dm )
     {
     case APIC_DM_INIT:
     case APIC_DM_STARTUP:
@@ -546,7 +564,7 @@ void vlapic_ipi(
         for_each_vcpu ( vlapic_domain(vlapic), v )
         {
             if ( vlapic_match_dest(vcpu_vlapic(v), vlapic,
-                                   short_hand, dest, dest_mode) )
+                                   short_hand, dest, dest_mode, dm) )
                 vlapic_accept_irq(v, icr_low);
         }
         if ( batch )
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -89,8 +89,8 @@ int vmsi_deliver(
         for_each_vcpu ( d, v )
         {
             target = vcpu_vlapic(v);
-            if ( vlapic_enabled(target) &&
-                 vlapic_match_dest(target, NULL, 0, dest, dest_mode) )
+            if ( vlapic_match_dest(target, NULL, 0, dest, dest_mode,
+                                   MASK_INSR(delivery_mode, APIC_DM_MASK)) )
                 vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
         }
         break;
@@ -125,7 +125,8 @@ void vmsi_deliver_pirq(struct domain *d,
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode)
+int hvm_girq_dest_2_vcpu_id(struct domain *d, unsigned int dest, bool dest_mode,
+                            unsigned int delivery_mode)
 {
     int dest_vcpu_id = -1, w = 0;
     struct vcpu *v;
@@ -135,7 +136,8 @@ int hvm_girq_dest_2_vcpu_id(struct domai
  
     for_each_vcpu ( d, v )
     {
-        if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) ) 
+        if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode,
+                               MASK_INSR(delivery_mode, APIC_DM_MASK)) )
         {
             w++;
             dest_vcpu_id = v->vcpu_id;
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -299,7 +299,8 @@ int vmsi_deliver(
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
+int hvm_girq_dest_2_vcpu_id(struct domain *d, unsigned int dest, bool dest_mode,
+                            unsigned int delivery_mode);
 
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -136,6 +136,6 @@ struct vlapic *vlapic_lowest_prio(
 
 bool vlapic_match_dest(
     const struct vlapic *target, const struct vlapic *source,
-    int short_hand, uint32_t dest, bool dest_mode);
+    unsigned int short_hand, uint32_t dest, bool dest_mode, unsigned int dm);
 
 #endif /* __ASM_X86_HVM_VLAPIC_H__ */
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -191,7 +191,7 @@ static struct vcpu *vector_hashing_dest(
     for_each_vcpu ( d, v )
     {
         if ( !vlapic_match_dest(vcpu_vlapic(v), NULL, APIC_DEST_NOSHORT,
-                                dest_id, dest_mode) )
+                                dest_id, dest_mode, APIC_DM_LOWEST) )
             continue;
 
         __set_bit(v->vcpu_id, dest_vcpu_bitmap);
@@ -371,7 +371,8 @@ int pt_irq_create_bind(
         delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
                                   XEN_DOMCTL_VMSI_X86_DELIV_MASK);
 
-        dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
+        dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode,
+                                               delivery_mode);
         pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
 
         pirq_dpci->gmsi.posted = false;
@@ -819,9 +820,11 @@ static int cf_check _hvm_dpci_msi_eoi(
         unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
                                       XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
         bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
+        unsigned int dm = MASK_EXTR(pirq_dpci->gmsi.gflags,
+                                    XEN_DOMCTL_VMSI_X86_DELIV_MASK);
 
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
-                               dest_mode) )
+                               dest_mode, MASK_INSR(dm, APIC_DM_MASK)) )
         {
             __msi_pirq_eoi(pirq_dpci);
             return 1;

