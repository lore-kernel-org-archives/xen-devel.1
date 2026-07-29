Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F7C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:32:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376073.1623043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5K1-00028M-46; Wed, 29 Jul 2026 14:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376073.1623043; Wed, 29 Jul 2026 14:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5K0-00028F-W3; Wed, 29 Jul 2026 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1376073;
 Wed, 29 Jul 2026 14:31:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wp5Jz-000285-Ps
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:31:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5Jy-000WyZ-M3
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:31:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6a0ecb-2eae-0a2a0a5409dd-0a2a4508b6a2-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:31:46 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6a0ed2-f659-0a2a45080019-d155dd2ccc17-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:31:46 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so998525f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:31:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45c338fsm161752875e9.8.2026.07.29.07.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 07:31:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785335506; x=1785940306; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n8FzEXahxTT2oA5nPR8NeIcjAvEXQFVgoeQBHxfVpeo=;
        b=A2IlZN94QEcMz0NGbhzfS68yUYtnI+p4u+riTjuCOIviahjdBHPZgo3DmRNC53Gzzg
         SKaqwpkLcTufsL1WqaDOJEWIx6NrYypEJr2c6CY1ncZRUX2xmbfACW++Ql5veTutrVsD
         +QU6pTI+Bg9NiEGpSmfTv1eqWbjVYsCJI6h+GmDPSIwlbUjq4WdxIEK1oJJ89765EK+1
         hQlPAsLsirBN+YqJy84Nji1BgP4hbJ0TmH9ykUlO4ypp310IqBopwtCIjKwjzPzai/6c
         6+a+o1n6ghBgElX/Q7F8YRWvpAc9J2bjppPBJo7rkTAS82DBHK4wBYSQPaBkROCTgbR4
         C2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785335506; x=1785940306;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8FzEXahxTT2oA5nPR8NeIcjAvEXQFVgoeQBHxfVpeo=;
        b=jHcanP7YL8d+HMC791ycYvfj1wyWzVWRJzQDeHNHgUY2Gk4egC+6cTseuDxuVIOVZS
         DIl89q7wNdx67Dv6X9n6TU9WsbnY0OwYzeK9zRw8zF3nk0KnT4GpDaM/rg8rO/AHux4e
         rrrWM5L7AIOZAJ8DNtnJhLzvzXdK3N7qC3oEMoUrnzX05CTnnp6UsDL2rBp1gypJJSkG
         wQalKiRJAP4Tdz18BPeuLdLirfMX8irMojJBZSs941iS/e8pdDPLY1VMU+F/j5DlFbNw
         ECRCAY3B0NEe33xSC2r8zM1kGctnba0VagIO0TN6p/AIanVCu4KidImsMRfm66uQ7epm
         GsgQ==
X-Gm-Message-State: AOJu0YxAqWenUIO9RWL5cv9Sw7Yu255wYwJ1rHDTFQndI84FDe/Ignbb
	RcBFOVQDMmZIf0g4iYb2K/vtaD1lZvhi0O45kHMJ6VWsgUfM+PsdrcF4TnLP5t3PrFNu6q9jgUz
	rcMcDuQ==
X-Gm-Gg: AR+sD10eDQc7tmLXhSzy1KIC7AVohLScJ/nKUit0xwM/Qzl4qgSmhMtyNi/FzpiPTKo
	SQR+fRO6msFMATaxgdHcfXglq2O5aBHc5jgmuYUDqjMdMvjmfccZ5vTiRw4wMBpPPLmuf5eW9iE
	luJbo/kLW86RVaMtGh6wFBk/8ORlacTl/W3LnWK65nsB/Jq3LtwFcsLOhTM2BWbOR6JMs+R1Kpp
	ttQ1jO7xG7ZG6aTKP82nmsoQmsOj8l0aT1pCjUe7qz/Pk4lLdtktzzGvDGz9KWTHR7VnkLKixa5
	xq5VQXHcLzHMoA8JuBnszcqGeCXz/ELII1EGYYGygKUNaEYvWs24oIrRQ4e2bEju4YslYRHBHio
	WkAHRWeVUwzRaAooMw1niOC0cUeVDfCIs1GpOKz158ytbGWTOR9kQ5jJ6Bmhimh+Vjl+gvyd9ni
	RqijwDQJsb97c2fHCWdCwhoqe6J2m/rDPxuup2/uXrjNU0VeCKObZthWC88vLCGd8Sx7ukZ4PDQ
	D+K83lvkDYThm5OEfmpIYExvnSuMwQg1aCnNG6ROsfVteWT7UXe
X-Received: by 2002:a05:600c:8b27:b0:495:7303:e38c with SMTP id 5b1f17b1804b1-496c6586ab9mr79088155e9.28.1785335505656;
        Wed, 29 Jul 2026 07:31:45 -0700 (PDT)
Message-ID: <dafa7422-eae1-44f8-af49-9ed70cc2c5a4@suse.com>
Date: Wed, 29 Jul 2026 16:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: lift macro machinery from XTF to aid EFLAGS handling
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
X-purgate-ID: tlsNG-c1860d/1785335506-D6B4187B-454B0160/0/0
X-purgate-type: clean
X-purgate-size: 25364

Sequences of X86_EFLAGS_* ORed together aren't very readable. XTF has a
nice way of improving this - adopt this for the eumlator as well, with a
few minor tweaks.

No change to generated code, except of course for embedded line numbers.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course in principle this could be put in xen/include/macros.h for use
elsewhere in the hypervisor. That would, however, require duplicating
everything into e.g. tools/include/xen-tools/common-macros.h, for test and
fuzzing harnesses to still build.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -308,7 +308,8 @@ x86.h := $(addprefix $(XEN_ROOT)/tools/i
                      x86-vendors.h x86-defns.h msr-index.h) \
          $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
                      cpu-policy.h cpuid-autogen.h)
-x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h x86_emulate/private.h $(x86.h)
+x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h \
+                 x86_emulate/macros.h x86_emulate/private.h $(x86.h)
 
 $(OBJS): %.o: %.c $(x86_emulate.h)
 	$(HOSTCC) $(HOSTCFLAGS) -c -g -o $@ $<
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1,4 +1,5 @@
 #include "x86-emulate.h"
+#include "x86_emulate/macros.h"
 
 #include <errno.h>
 #include <limits.h>
@@ -813,7 +814,7 @@ static struct x86_emulate_ops emulops =
     .put_fpu    = emul_test_put_fpu,
 };
 
-#define EFLAGS_ALWAYS_SET (X86_EFLAGS_IF | X86_EFLAGS_MBS)
+#define EFLAGS_ALWAYS_SET X86_EFLAGS(IF, MBS)
 #define EFLAGS_MASK (X86_EFLAGS_ARITH_MASK | EFLAGS_ALWAYS_SET)
 
 #define MMAP_ADDR 0x100000
@@ -1179,7 +1180,7 @@ int main(int argc, char **argv)
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
          (*res != 0x11223344) ||
-         ((regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_OF|X86_EFLAGS_AF)))
+         ((regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(OF, AF)))
           != (EFLAGS_ALWAYS_SET | X86_EFLAGS_PF)) ||
          (regs.eip != (unsigned long)&instr[4]) )
         goto fail;
@@ -1194,8 +1195,7 @@ int main(int argc, char **argv)
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
          (*res != 0x2233445D) ||
-         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS_ZF |
-                          X86_EFLAGS_CF)) !=
+         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS(ZF, CF))) !=
           (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF)) ||
          (regs.eip != (unsigned long)&instr[4]) )
         goto fail;
@@ -1211,9 +1211,8 @@ int main(int argc, char **argv)
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
          (*res != 0x2233445E) ||
-         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS_ZF |
-                          X86_EFLAGS_CF)) !=
-          (EFLAGS_ALWAYS_SET | X86_EFLAGS_ZF | X86_EFLAGS_CF)) ||
+         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS(ZF, CF))) !=
+          (EFLAGS_ALWAYS_SET | X86_EFLAGS(ZF, CF))) ||
          (regs.eip != (unsigned long)&instr[3]) )
         goto fail;
     printf("okay\n");
@@ -1228,8 +1227,7 @@ int main(int argc, char **argv)
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
          (*res != 0x2233445C) ||
-         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS_ZF |
-                          X86_EFLAGS_CF)) !=
+         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS(ZF, CF))) !=
           (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF)) ||
          (regs.rip != (unsigned long)&instr[4]) )
         goto fail;
@@ -1481,9 +1479,8 @@ int main(int argc, char **argv)
          (regs.eax != 0x89abcdef * 0x12345678) ||
          (regs.edx != (uint64_t)((int64_t)(int32_t)0x89abcdef *
                                  0x12345678) >> 32) ||
-         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF |
-                          X86_EFLAGS_OF)) !=
-          (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF | X86_EFLAGS_OF)) ||
+         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS(CF, OF))) !=
+          (EFLAGS_ALWAYS_SET | X86_EFLAGS(CF, OF))) ||
          (regs.eip != (unsigned long)&instr[3]) )
         goto fail;
     printf("okay\n");
@@ -1498,9 +1495,8 @@ int main(int argc, char **argv)
     rc = x86_emulate(&ctxt, &emulops);
     if ( (rc != X86EMUL_OKAY) ||
          (regs.ecx != 0x89abcdef * 3) ||
-         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF |
-                          X86_EFLAGS_OF)) !=
-          (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF | X86_EFLAGS_OF)) ||
+         ((regs.eflags & (EFLAGS_ALWAYS_SET | X86_EFLAGS(CF, OF))) !=
+          (EFLAGS_ALWAYS_SET | X86_EFLAGS(CF, OF))) ||
          (regs.eip != (unsigned long)&instr[4]) )
         goto fail;
     printf("okay\n");
@@ -1663,8 +1659,7 @@ int main(int argc, char **argv)
              (regs.r9 != 0x0102030411223344UL) ||
              (regs.rbx != 0x0101010101010101UL) ||
              ((regs.eflags & EFLAGS_MASK) !=
-              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
-               EFLAGS_ALWAYS_SET)) ||
+              (X86_EFLAGS(CF, PF, SF) | EFLAGS_ALWAYS_SET)) ||
              (res[0] != 0x12233445) ||
              (res[1] != 0x02030405) )
             goto fail;
@@ -1694,8 +1689,7 @@ int main(int argc, char **argv)
              (regs.r9 != 0x0102030411223344UL) ||
              (regs.rbx != 0x02030405) ||
              ((regs.eflags & EFLAGS_MASK) !=
-              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
-               EFLAGS_ALWAYS_SET)) ||
+              (X86_EFLAGS(CF, PF, SF) | EFLAGS_ALWAYS_SET)) ||
              (res[0] + 1) ||
              (res[1] != 0x13253749) ||
              (res[2] + 1) )
@@ -2089,11 +2083,10 @@ int main(int argc, char **argv)
 
         *res        = 0xfedcba98;
         regs.edx    = (unsigned long)res;
-        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
-                      X86_EFLAGS_ZF;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 8 || *res != 0xfedcba98 ||
-             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+             (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
               (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF) ||
              !check_eip(blsi) )
             goto fail;
@@ -2111,11 +2104,10 @@ int main(int argc, char **argv)
                        :: "d" (NULL) );
         set_insn(blsmsk);
 
-        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
-                      X86_EFLAGS_ZF | X86_EFLAGS_CF;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 0xf || *res != 0xfedcba98 ||
-             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+             (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
               EFLAGS_ALWAYS_SET ||
              !check_eip(blsmsk) )
             goto fail;
@@ -2133,11 +2125,10 @@ int main(int argc, char **argv)
                        :: "d" (NULL) );
         set_insn(blsr);
 
-        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_ZF | \
-                      X86_EFLAGS_CF;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, ZF, CF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 0xfedcba90 ||
-             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+             (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
               (EFLAGS_ALWAYS_SET | X86_EFLAGS_SF) ||
              !check_eip(blsr) )
             goto fail;
@@ -2151,11 +2142,10 @@ int main(int argc, char **argv)
         memcpy(instr, blsr, blsr_end - blsr);
         instr[2] |= 0x80;
         regs.rip = (unsigned long)&instr[0];
-        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_ZF | \
-                      X86_EFLAGS_CF;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, ZF, CF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 0xfedcba90 ||
-             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+             (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
               (EFLAGS_ALWAYS_SET | X86_EFLAGS_SF) ||
              (regs.rip != (unsigned long)&instr[blsr_end - blsr]) )
             goto fail;
@@ -2181,12 +2171,11 @@ int main(int argc, char **argv)
 
         regs.ecx    = (unsigned long)res;
         regs.edx    = 0xff13;
-        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
-                      X86_EFLAGS_ZF | X86_EFLAGS_CF;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ebx != (*res & 0x7ffff) ||
              regs.edx != 0xff13 || *res != 0xfedcba98 ||
-             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+             (regs.eflags & (EFLAGS_MASK & ~X86_EFLAGS(AF, PF))) !=
               EFLAGS_ALWAYS_SET ||
              !check_eip(bzhi) )
             goto fail;
@@ -4274,13 +4263,11 @@ int main(int argc, char **argv)
         set_insn(pcmpestri);
         regs.eax = regs.edx = 12;
         regs.ecx = (unsigned long)res;
-        regs.eflags = X86_EFLAGS_PF | X86_EFLAGS_AF |
-                      X86_EFLAGS_IF | X86_EFLAGS_OF;
+        regs.eflags = X86_EFLAGS(PF, AF, IF, OF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(pcmpestri) ||
              regs.ecx != 9 ||
-             (regs.eflags & X86_EFLAGS_ARITH_MASK) !=
-             (X86_EFLAGS_CF | X86_EFLAGS_ZF | X86_EFLAGS_SF) )
+             (regs.eflags & X86_EFLAGS_ARITH_MASK) != X86_EFLAGS(CF, ZF, SF) )
             goto fail;
         printf("okay\n");
     }
@@ -4298,15 +4285,13 @@ int main(int argc, char **argv)
 
         set_insn(pcmpestrm);
         regs.ecx = (unsigned long)res;
-        regs.eflags = X86_EFLAGS_PF | X86_EFLAGS_AF |
-                      X86_EFLAGS_IF | X86_EFLAGS_OF;
+        regs.eflags = X86_EFLAGS(PF, AF, IF, OF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(pcmpestrm) )
             goto fail;
         asm ( "pmovmskb %%xmm0, %0" : "=r" (rc) );
         if ( rc != 0x0e00 ||
-             (regs.eflags & X86_EFLAGS_ARITH_MASK) !=
-             (X86_EFLAGS_CF | X86_EFLAGS_ZF | X86_EFLAGS_SF) )
+             (regs.eflags & X86_EFLAGS_ARITH_MASK) != X86_EFLAGS(CF, ZF, SF) )
             goto fail;
         printf("okay\n");
     }
@@ -4323,13 +4308,11 @@ int main(int argc, char **argv)
                        :: "m" (res[0]), "c" (NULL) );
 
         set_insn(pcmpistri);
-        regs.eflags = X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_AF |
-                      X86_EFLAGS_IF | X86_EFLAGS_OF;
+        regs.eflags = X86_EFLAGS(CF, PF, AF, IF, OF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(pcmpistri) ||
              regs.ecx != 16 ||
-             (regs.eflags & X86_EFLAGS_ARITH_MASK) !=
-             (X86_EFLAGS_ZF | X86_EFLAGS_SF) )
+             (regs.eflags & X86_EFLAGS_ARITH_MASK) != X86_EFLAGS(ZF, SF) )
             goto fail;
         printf("okay\n");
     }
@@ -4347,14 +4330,14 @@ int main(int argc, char **argv)
 
         set_insn(pcmpistrm);
         regs.ecx = (unsigned long)res;
-        regs.eflags = X86_EFLAGS_PF | X86_EFLAGS_AF | X86_EFLAGS_IF;
+        regs.eflags = X86_EFLAGS(PF, AF, IF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(pcmpistrm) )
             goto fail;
         asm ( "pmovmskb %%xmm0, %0" : "=r" (rc) );
         if ( rc != 0xffff ||
-            (regs.eflags & X86_EFLAGS_ARITH_MASK) !=
-            (X86_EFLAGS_CF | X86_EFLAGS_ZF | X86_EFLAGS_SF | X86_EFLAGS_OF) )
+             (regs.eflags & X86_EFLAGS_ARITH_MASK) !=
+             X86_EFLAGS(CF, ZF, SF, OF) )
             goto fail;
         printf("okay\n");
     }
@@ -4384,13 +4367,11 @@ int main(int argc, char **argv)
         regs.eax = 0x7fffffff;
 #endif
         regs.esi = (unsigned long)res;
-        regs.eflags = X86_EFLAGS_PF | X86_EFLAGS_AF | X86_EFLAGS_SF |
-                      X86_EFLAGS_IF | X86_EFLAGS_OF;
+        regs.eflags = X86_EFLAGS(PF, AF, SF, IF, OF);
         rc = x86_emulate(&ctxt, &emulops);
         if ( rc != X86EMUL_OKAY || !check_eip(vpcmpestri) ||
              regs.ecx != 11 ||
-             (regs.eflags & X86_EFLAGS_ARITH_MASK) !=
-             (X86_EFLAGS_ZF | X86_EFLAGS_CF) )
+             (regs.eflags & X86_EFLAGS_ARITH_MASK) != X86_EFLAGS(ZF, CF) )
             goto fail;
         printf("okay\n");
     }
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -72,6 +72,10 @@
 # define ASM_FLAG_OUT(yes, no) no
 #endif
 
+#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
+#define count_args(args...) \
+    count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
 #define hweight32 __builtin_popcount
 #define hweight64 __builtin_popcountll
 
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#include "macros.h"
 #include "private.h"
 
 #ifdef __XEN__
--- a/xen/arch/x86/x86_emulate/0fc7.c
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#include "macros.h"
 #include "private.h"
 
 /* Avoid namespace pollution. */
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -5,6 +5,7 @@
  * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
  */
 
+#include "macros.h"
 #include "private.h"
 
 #if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -8,6 +8,7 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
+#include "macros.h"
 #include "private.h"
 
 #ifdef __XEN__
@@ -71,7 +72,7 @@ do {
     invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),             \
                 _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),            \
                 [eflags] "+g" (regs->eflags), [tmp] "=&r" (tmp_)        \
-                : [mask] "i" (X86_EFLAGS_ZF|X86_EFLAGS_PF|X86_EFLAGS_CF)); \
+                : [mask] "i" (X86_EFLAGS(ZF, PF, CF)));                 \
     put_stub(stub);                                                     \
 } while (0)
 
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/macros.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/******************************************************************************
+ * macros.h - helpers for the emulator as well as the test and fuzzing harnesses
+ */
+
+#ifndef X86_EMULATE_MACROS_H
+#define X86_EMULATE_MACROS_H
+
+#define VAR_MACRO__(m, c, count, args...) m##count(c, ## args)
+#define VAR_MACRO_(m, c, count, args...) VAR_MACRO__(m, c, count, ## args)
+#define VAR_MACRO(m, c, args...) VAR_MACRO_(m, c, count_args(args), ## args)
+
+#define TOK_OR1(t, x)       (t ## x)
+#define TOK_OR2(t, x, y)    ((t ## x) | TOK_OR1(t, y))
+#define TOK_OR3(t, x, y...) ((t ## x) | TOK_OR2(t, ## y))
+#define TOK_OR4(t, x, y...) ((t ## x) | TOK_OR3(t, ## y))
+#define TOK_OR5(t, x, y...) ((t ## x) | TOK_OR4(t, ## y))
+#define TOK_OR6(t, x, y...) ((t ## x) | TOK_OR5(t, ## y))
+#define TOK_OR7(t, x, y...) ((t ## x) | TOK_OR6(t, ## y))
+#define TOK_OR8(t, x, y...) ((t ## x) | TOK_OR7(t, ## y))
+
+#define TOK_OR(stem, tok...) VAR_MACRO(TOK_OR, stem, ## tok)
+
+#define X86_EFLAGS(flg...) TOK_OR(X86_EFLAGS_, ## flg)
+
+#endif /* X86_EMULATE_MACROS_H */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -439,16 +439,14 @@ struct x87_env32 {
  * These EFLAGS bits are restored from saved value during emulation, and
  * any changes are written back to the saved value after emulation.
  */
-#define EFLAGS_MASK (X86_EFLAGS_OF | X86_EFLAGS_SF | X86_EFLAGS_ZF | \
-                     X86_EFLAGS_AF | X86_EFLAGS_PF | X86_EFLAGS_CF)
+#define EFLAGS_MASK X86_EFLAGS(OF, SF, ZF, AF, PF, CF)
 
 /*
  * These EFLAGS bits are modifiable (by POPF and IRET), possibly subject
  * to further CPL and IOPL constraints.
  */
-#define EFLAGS_MODIFIABLE (X86_EFLAGS_ID | X86_EFLAGS_AC | X86_EFLAGS_RF | \
-                           X86_EFLAGS_NT | X86_EFLAGS_IOPL | X86_EFLAGS_DF | \
-                           X86_EFLAGS_IF | X86_EFLAGS_TF | EFLAGS_MASK)
+#define EFLAGS_MODIFIABLE (X86_EFLAGS(ID, AC, RF, NT, IOPL, DF, IF, TF) | \
+                           EFLAGS_MASK)
 
 #define truncate_word(ea, byte_width)           \
 ({  unsigned long __ea = (ea);                  \
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -50,6 +50,7 @@
 
 #endif /* __XEN__ */
 
+#include "macros.h"
 #include "private.h"
 
 #ifndef X86EMUL_NO_MMX
@@ -735,7 +736,7 @@ test_cc(
         rc |= (flags & X86_EFLAGS_ZF);
         break;
     case 3: /* be/na */
-        rc |= (flags & (X86_EFLAGS_CF | X86_EFLAGS_ZF));
+        rc |= (flags & X86_EFLAGS(CF, ZF));
         break;
     case 4: /* s */
         rc |= (flags & X86_EFLAGS_SF);
@@ -1699,8 +1700,7 @@ x86_emulate(
         uint8_t al = _regs.al;
         unsigned int eflags = _regs.eflags;
 
-        _regs.eflags &= ~(X86_EFLAGS_CF | X86_EFLAGS_AF | X86_EFLAGS_SF |
-                          X86_EFLAGS_ZF | X86_EFLAGS_PF);
+        _regs.eflags &= ~X86_EFLAGS(CF, AF, SF, ZF, PF);
         if ( ((al & 0x0f) > 9) || (eflags & X86_EFLAGS_AF) )
         {
             _regs.eflags |= X86_EFLAGS_AF;
@@ -1726,7 +1726,7 @@ x86_emulate(
         {
             _regs.al += (b == 0x37) ? 6 : -6;
             _regs.ah += (b == 0x37) ? 1 : -1;
-            _regs.eflags |= X86_EFLAGS_CF | X86_EFLAGS_AF;
+            _regs.eflags |= X86_EFLAGS(CF, AF);
         }
         _regs.al &= 0x0f;
         break;
@@ -2143,7 +2143,7 @@ x86_emulate(
                 src.val |= X86_EFLAGS_IF;
         }
         else
-            src.val = _regs.r(flags) & ~(X86_EFLAGS_VM | X86_EFLAGS_RF);
+            src.val = _regs.r(flags) & ~X86_EFLAGS(VM, RF);
         goto push;
 
     case 0x9d: /* popf */ {
@@ -2151,7 +2151,7 @@ x86_emulate(
          * Bits which may not be modified by this instruction. RF is handled
          * uniformly during instruction retirement.
          */
-        uint32_t mask = X86_EFLAGS_VIP | X86_EFLAGS_VIF | X86_EFLAGS_VM;
+        uint32_t mask = X86_EFLAGS(VIP, VIF, VM);
 
         cr4 = 0;
         if ( !mode_ring0() )
@@ -2473,7 +2473,7 @@ x86_emulate(
 
     case 0xcf: /* iret */ {
         unsigned long sel, eip, eflags;
-        uint32_t mask = X86_EFLAGS_VIP | X86_EFLAGS_VIF | X86_EFLAGS_VM;
+        uint32_t mask = X86_EFLAGS(VIP, VIF, VM);
 
         fail_if(!in_realmode(ctxt, ops));
         ctxt->retire.unblock_nmi = true;
@@ -2514,7 +2514,7 @@ x86_emulate(
             _regs.al = _regs.al % n;
             _regs.ah = _regs.al / n;
         }
-        _regs.eflags &= ~(X86_EFLAGS_SF | X86_EFLAGS_ZF | X86_EFLAGS_PF);
+        _regs.eflags &= ~X86_EFLAGS(SF, ZF, PF);
         _regs.eflags |= !_regs.al ? X86_EFLAGS_ZF : 0;
         _regs.eflags |= ((int8_t)_regs.al < 0) ? X86_EFLAGS_SF : 0;
         _regs.eflags |= even_parity(_regs.al) ? X86_EFLAGS_PF : 0;
@@ -2646,21 +2646,21 @@ x86_emulate(
                 emulate_1op("neg", dst, _regs.eflags);
             break;
         case 4: /* mul */
-            _regs.eflags &= ~(X86_EFLAGS_OF | X86_EFLAGS_CF);
+            _regs.eflags &= ~X86_EFLAGS(OF, CF);
             switch ( dst.bytes )
             {
             case 1:
                 dst.val = _regs.al;
                 dst.val *= src.val;
                 if ( (uint8_t)dst.val != (uint16_t)dst.val )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 dst.bytes = 2;
                 break;
             case 2:
                 dst.val = _regs.ax;
                 dst.val *= src.val;
                 if ( (uint16_t)dst.val != (uint32_t)dst.val )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 _regs.dx = dst.val >> 16;
                 break;
 #ifdef __x86_64__
@@ -2668,7 +2668,7 @@ x86_emulate(
                 dst.val = _regs.eax;
                 dst.val *= src.val;
                 if ( (uint32_t)dst.val != dst.val )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 _regs.rdx = dst.val >> 32;
                 break;
 #endif
@@ -2676,7 +2676,7 @@ x86_emulate(
                 u[0] = src.val;
                 u[1] = _regs.r(ax);
                 if ( mul_dbl(u) )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 _regs.r(dx) = u[1];
                 dst.val = u[0];
                 break;
@@ -2685,13 +2685,13 @@ x86_emulate(
         case 5: /* imul */
             dst.val = _regs.r(ax);
         imul:
-            _regs.eflags &= ~(X86_EFLAGS_OF | X86_EFLAGS_CF);
+            _regs.eflags &= ~X86_EFLAGS(OF, CF);
             switch ( dst.bytes )
             {
             case 1:
                 dst.val = (int8_t)src.val * (int8_t)dst.val;
                 if ( (int8_t)dst.val != (int16_t)dst.val )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 ASSERT(b > 0x6b);
                 dst.bytes = 2;
                 break;
@@ -2699,7 +2699,7 @@ x86_emulate(
                 dst.val = ((uint32_t)(int16_t)src.val *
                            (uint32_t)(int16_t)dst.val);
                 if ( (int16_t)dst.val != (int32_t)dst.val )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 if ( b > 0x6b )
                     _regs.dx = dst.val >> 16;
                 break;
@@ -2708,7 +2708,7 @@ x86_emulate(
                 dst.val = ((uint64_t)(int32_t)src.val *
                            (uint64_t)(int32_t)dst.val);
                 if ( (int32_t)dst.val != dst.val )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 if ( b > 0x6b )
                     _regs.rdx = dst.val >> 32;
                 break;
@@ -2717,7 +2717,7 @@ x86_emulate(
                 u[0] = src.val;
                 u[1] = dst.val;
                 if ( imul_dbl(u) )
-                    _regs.eflags |= X86_EFLAGS_OF | X86_EFLAGS_CF;
+                    _regs.eflags |= X86_EFLAGS(OF, CF);
                 if ( b > 0x6b )
                     _regs.r(dx) = u[1];
                 dst.val = u[0];
@@ -3126,7 +3126,7 @@ x86_emulate(
 
             _regs.r(cx) = _regs.eip;
             _regs.eip = msr_val;
-            _regs.eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF | X86_EFLAGS_RF);
+            _regs.eflags &= ~X86_EFLAGS(VM, IF, RF);
         }
 
         fail_if(ops->write_segment == NULL);
@@ -3224,7 +3224,7 @@ x86_emulate(
             else
                 _regs.rip = _regs.ecx;
 
-            _regs.eflags = _regs.r11 & ~(X86_EFLAGS_RF | X86_EFLAGS_VM);
+            _regs.eflags = _regs.r11 & ~X86_EFLAGS(RF, VM);
         }
         else
 #endif
@@ -3934,7 +3934,7 @@ x86_emulate(
 
         generate_exception_if(!(msr_val & 0xfffc), X86_EXC_GP, 0);
 
-        _regs.eflags &= ~(X86_EFLAGS_VM | X86_EFLAGS_IF | X86_EFLAGS_RF);
+        _regs.eflags &= ~X86_EFLAGS(VM, IF, RF);
 
         cs.sel = msr_val & ~3; /* SELECTOR_RPL_MASK */
         cs.base = 0;   /* flat segment */
@@ -5254,7 +5254,7 @@ x86_emulate(
                 {
                 case X86EMUL_OKAY:
                     dst.type = OP_NONE;
-                    _regs.eflags |= X86_EFLAGS_ZF | X86_EFLAGS_PF;
+                    _regs.eflags |= X86_EFLAGS(ZF, PF);
                     break;
                 case X86EMUL_CMPXCHG_FAILED:
                     rc = X86EMUL_OKAY;
@@ -5266,7 +5266,7 @@ x86_emulate(
             else
             {
                 dst.val = src.val;
-                _regs.eflags |= X86_EFLAGS_ZF | X86_EFLAGS_PF;
+                _regs.eflags |= X86_EFLAGS(ZF, PF);
             }
         }
         if ( !(_regs.eflags & X86_EFLAGS_ZF) )

