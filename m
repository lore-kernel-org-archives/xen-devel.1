Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B5860A260C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MFzBNqob
Received: from list by lists.xenproject.org with outflank-mailman.1483923.1687299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9MK-00058W-T3; Wed, 11 Nov 2026 14:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483923.1687299; Wed, 11 Nov 2026 14:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9MK-00058M-O6; Wed, 11 Nov 2026 14:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1483923;
 Wed, 11 Nov 2026 14:31:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9MJ-00057E-C3
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:31:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9MI-00B1sr-P4
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:31:30 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c38-e002-0a2a0a5209dd-0a2a4505c58e-30
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:31:30 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c42-4cb1-0a2a45050019-d155dd2ad1cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:31:30 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so2159415f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:31:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c9b1sm10478076f8f.6.2026.11.11.06.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:31:29 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794407490; x=1795012290; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pUGNRAl5tkW1l/8MRWpP51gfKfaRwiaXpngx89O8Pjg=;
        b=MFzBNqobBHT7CJJOjv+raFViBc0SIasazFerIKSbHc7quZhP9e3C/HrAgS0JuiGgXF
         UAXnQeSrfOFPpg1rybgyFfaUkYbXAOghETVgxohxT5mz+GnQZR49fzdQ+7R3ANMrxXFJ
         RZNERYfaAEp+aAv092p+MlEtB+TPD6Eb1IBKFfAxspljZhkGF0sKA5KXHZda/DxjafGN
         lu+hMG7BKqxv905NgNboZN5HNcxuFAAPb3Q0+8wLT9MGvoNgQ9BipPVVih18su0f2+2f
         +05JeHck9m9y2FiZnlaDjOHiKhopV9NX8LQhZ1TYGRyUIVOhAbYvyO3jNdgr+qFw9L9o
         wT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407490; x=1795012290;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pUGNRAl5tkW1l/8MRWpP51gfKfaRwiaXpngx89O8Pjg=;
        b=DaIMCVGU6J6Jp/P7lD/Jw5jj+wKwls8tF4VXbhjPDt5eN3Vk6NCQhXGMCAUnjC/8+5
         EqPrbLTnhXPGL52j647GfIQr7aUkQPYcDUS+Qxbx4tsl/B85DkjLbcxqUhiIFBhcdlkB
         uuGCac85BPBX8WAoC/ZB2aMECpr9e3MePZyPyQawCIP5ZHEUq91OrCOiEiXpACDyVDlx
         F13C2ygQJmTmC4UMOgi2WuvzFq63xtMHEbt+6rg16OOyeig9VP/w1yU8QEMOcYMRzDw7
         SJ0sNehZdsPA6gnD+z3f48F6zXC9znJMuRyUbfL9CByQ76+KplzoukmwojMMZL2lMFDl
         GSyg==
X-Gm-Message-State: APuU4Z9cucdc4ik/7K/7JNx7StyfguqpfE2lhwcAzqJPO+RsRev/uxn1
	v/nyR0zqrQIp6s18bu1uvxfGyYOYgTeugKnvJHxx6LSRkH/HIttTW0y6jGaqbmdeHxYR3nfePOA
	gmyR8Dg==
X-Gm-Gg: AYBFou230TSsSMsXaBsTaZHj1/8k1eBJ2IhZWv0rvMnsyhRmsAyCO8HRUkPZZs0wszi
	otF8G5OcWvG0hFzrz3KvmNsZYUBAxK3TBDOmRFf4k+39fdq2+1BjwNZbMrVJhow1u8gqkm/sgYs
	ygMFh7dmoarUFs4pRchVnxfOfAYfgHzL41jQaYKza6f9o7cDwRNsFpKPbgJ/FQLaVnx051Am6o3
	R32J5KlRDZ7atVNYimeG2Ct6DaSt33u0Gof5rwZ03dI3gAHFSb9FJJWOziSC4exOoYt4KwjHX6z
	DAsfTzeXc9LRK4WNn/80H6hLiC4sU+Jxsm2XLrXi19atlxtoXUu3tyNkStDm8eoVCXZy9/Y9k2W
	E+bGK1vMSp3bn5gUSqgv9+bgYtBhrpFTdpDrmPljagk5TFJm8BpKEfE78fGpcDWoSF2kbKNnv31
	hi28WYpG+LWdiRWvQtJsHzk0bwjNcjCtNLKZ31ZpwEHSs7qSO33aj3nMYjFcCLewTPWLBws4VSx
	iSXhzfr2G5n0mYmLL6ns0JK3DkIHcYzFtwEbJPnur0+n5MHL7tiyXjiIqg/+o9SikHw8Gx4pw7Z
	EPZ+TdQMgMSvplBdtcQzYH6fnYaDdwy6KzeSYpSYLwJi0VXFxnZNsPZGXAlvf+RSk1bWllxEM/M
	AxOvjbQnfPhwNykPC
X-Received: by 2002:a05:6000:310f:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-499c7a24909mr4648770f8f.43.1794407490026;
        Wed, 11 Nov 2026 06:31:30 -0800 (PST)
Message-ID: <7fe1d6a3-05d8-452e-ad96-7e7fc379591e@suse.com>
Date: Wed, 11 Nov 2026 15:31:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 27/30] x86emul: support APX+MOVRS insn
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794407490-F7EB92A1-10487BE8/10/78276251493
X-purgate-type: spam
X-purgate-size: 4330
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides adding table entries and case labels there's once again very
little to do here; generic map 4 handling takes care of things.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -dmr

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1181,6 +1181,12 @@ static const struct test movdiri[] = {
     INSN(movdiri,     , map4, f9,    el,   dq, no),
 };
 
+static const struct test movrs[] = {
+    INSN(movrs,       , map4, 8a,    el,    b, no),
+    INSN(movrs,       , map4, 8b,    el,   dq, no),
+    INSN(movrsw,    66, map4, 8b,    el,    w, no),
+};
+
 static const struct test popcnt[] = {
     INSN(popcnt,      , map4, 88,    el,   dq, no),
     INSN(popcntw,   66, map4, 88,    el,    w, no),
@@ -1801,6 +1807,7 @@ void evex_disp8_test(void *instr, struct
         RUN(movbe);
         RUN(movdir64b);
         RUN(movdiri);
+        RUN(movrs);
         RUN(popcnt);
 
 #undef RUN
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2266,6 +2266,9 @@ static const struct evex {
     { { 0x85 }, 2, T, R, pfx_66, Wn, L0, SCC }, /* ctest<scc> */
     { { 0x88 }, 2, T, R, pfx_no, Wn, L0 }, /* popcnt */
     { { 0x88 }, 2, T, R, pfx_66, Wn, L0 }, /* popcnt */
+    { { 0x8a }, 2, T, R, pfx_no, WIG, L0 }, /* movrs */
+    { { 0x8b }, 2, T, R, pfx_no, Wn, L0 }, /* movrs */
+    { { 0x8b }, 2, T, R, pfx_66, Wn, L0 }, /* movrs */
     { { 0x8f, 0xc0 }, 2, F, R, pfx_no, Wn, L0, ND }, /* pop2 */
     { { 0xa5 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shld */
     { { 0xa5 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shld */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2356,6 +2356,22 @@ int main(int argc, char **argv)
             goto fail;
         printf("okay\n");
 
+        if ( cpu_has_apx_f )
+        {
+            printf("%-40s", "Testing movrs 6(%r31),%r30w...");
+            instr[0] = 0x62; instr[1] = 0x4c; instr[2] = 0x7d; instr[3] = 0x08;
+            instr[4] = 0x8b; instr[5] = 0x77; instr[6] = 0x06;
+            regs.rip = (unsigned long)&instr[0];
+            load_egpr(30, 0x8888777766665555UL);
+            load_egpr(31, (unsigned long)res);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rip != (unsigned long)&instr[7]) ||
+                 !check_egpr(30, 0x8888777766668877UL) )
+                goto fail;
+            printf("okay\n");
+        }
+
         cpu_policy.feat.movrs = movrs;
     }
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -738,6 +738,13 @@ static const struct map4_table {
         [vex_np] = { },
         [vex_66] = { },
     },
+    [0x8a] = { /* MOVRS (byte) */
+        [vex_np] = { .byte = true },
+    },
+    [0x8b] = { /* MOVRS ({,d,q}word) */
+        [vex_np] = { },
+        [vex_66] = { },
+    },
     [0x88] = { /* POPCNT ({,d,q}word) */
         [vex_np] = { .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nf = true, .nci_ndd_nf = true },
@@ -1420,6 +1427,11 @@ decode_map4(struct x86_emulate_state *s,
         nf = map4_table[(s->modrm_reg & 7) << 3][s->evex.pfx].nf;
         break;
 
+    case 0x8a: case 0x8b: /* movrs */
+    case 0xf9: /* movdiri */
+        s->desc |= Mov;
+        break;
+
     case 0xc0: case 0xc1: case 0xd0 ... 0xd3: /* Grp2 */
         /* rcl/rcr do not allow EVEX.nf to be set. */
         nf = (s->modrm_reg & 6) != 2;
@@ -1463,10 +1475,6 @@ decode_map4(struct x86_emulate_state *s,
         s->op_bytes = 0;
         break;
 
-    case 0xf9: /* movdiri */
-        s->desc |= Mov;
-        break;
-
     case 0xff: /* Grp5 */
         switch ( s->modrm_reg & 7 )
         {
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6807,6 +6807,9 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f38, 0x8a)
      ... X86EMUL_OPC(0x0f38, 0x8b): /* movrs */
+    case X86EMUL_OPC_EVEX   (4, 0x8a): /* movrs r/m,r8 */
+    case X86EMUL_OPC_EVEX   (4, 0x8b): /* movrs r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x8b): /* movrs r/m,r16 */
         vcpu_must_have(movrs);
         dst.val = src.val;
         break;


