Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0BC606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=o6ijaJ6g
Received: from list by lists.xenproject.org with outflank-mailman.1477172.1682867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPNU1-0006mA-P6; Fri, 06 Nov 2026 17:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477172.1682867; Fri, 06 Nov 2026 17:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPNU1-0006m3-MS; Fri, 06 Nov 2026 17:12:09 +0000
Received: by outflank-mailman (input) for mailman id 1477172;
 Fri, 06 Nov 2026 17:12:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPNU0-0006lx-A1
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 17:12:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPNTz-000g73-NB
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 18:12:07 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aee0a48-8faa-0a2a0a5109dd-0a2a450195dc-14
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 18:12:07 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aee0a67-5984-0a2a45010019-d155802ab0c8-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 18:12:07 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso7981105e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:12:07 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b5725fb0d1sm149835425e9.8.2026.11.06.09.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 09:12:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793985127; x=1794589927; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHAOy5FpfpaET7Y35Hu3UvJesMi1ZTQmg8RFyYCANRI=;
        b=o6ijaJ6goScUmp/vox8AcscEY9V+hVhfWSwDpScbyfuJUpdqvRkcYF84uPvIeJU5yM
         3t3AVvR/bWS3hNYakO9m6yupihQBIFIeQ160B/LdlrY5J2kbhKprju++smQF0iUF/QEN
         FWK2cH6OqJp4u9Bo57TPz5eGlq6QRpXpp4p5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985127; x=1794589927;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHAOy5FpfpaET7Y35Hu3UvJesMi1ZTQmg8RFyYCANRI=;
        b=Syjn6nwZKfTkpComf2KTPxY4umgckdg0US72FRQgCJpD2iftb6g4YIRJ+4LdLVY4z3
         GGoL52ocwkq/moC2hFfquvveHcwUnQSt773t5wLPjaeadQEk42nBjDvVrxdsLJwTgcny
         mz8SFx7pzfcbZ2vZEWIgRdbtTTEXGsnIlcXfir3plL1skDs0cdl/9AFcwE4K5NwwPh6L
         fQ3eqTEBHQfF4gIsZ0B0NPfdkBx6Ej5jyaQuGOSXqXq0qYU6bOg0uX3E2v7/B8kBZRg/
         Dae28vOZQS+kzxvT/OTPDJWE2baK1L0Uq9cSIcaY2rcmmKZveivPZ0kFmqAE2C9fT2Wx
         RdIw==
X-Gm-Message-State: APuU4Z9p4kEgbNNE2TDvIN7SxfkOy3Re7pcsBhK8Au4PAKFqhgmBGtSp
	ofABfMv0E5KvL/0vy3dB/cgyaw2KA7AtQsomuT/cWjcg9/PEEcFjo5in/DRuA9p7SpaSxo3cgUi
	//rCHTLY=
X-Gm-Gg: AYBFou3NpEpjIDcXKdxQvcoeqYYpZ03JWMv+ni6P82zTWpOdPsIXjYx5tPnge9Gyhv/
	uIlJkDj0IanRDaHutkYgP0rTcAXDOxRvOxR89QPeQ8G9rE0eXh++hJMjQiHyzEDRwVDdiur1AW9
	SfQ/r8fOIJIWl0ZmkCdW8IY60uIqXYkQUKqhHTM/ArZRTkVgRmBTqdeUF/hxzbN06iSoQI2Qx6h
	FpGMYfreYGTSaaOGMrifS/rRpq71P9V8gLRtrQsVt4L/9IsV71Phc+n8vhg9ge4ngZ5Dqk4M9c5
	5e26cW7ZHg9jLWmKAHcqhLysUqqLUdaUr4Emvh/Qokleul6+SIFttN8qLT1Hd1NKheHPsiTiWly
	m9hk7tWxdH/VN664tWUQnpKpcXwk0plYyXeXYsxB/AbJ6i1YV5z0kHIRSO3JPJPwa1il7WIE+18
	kfmze5RBpg+FgUbm4Xn2eBvPk2HtXWZeaME5aFLWcEpOI8yhVLWpMuAcMoWGfXa/MLluG6kWvAC
	yhAGp0CPKn/aPovj9CyTXiaF+KzYhU/vTwjkl11iGNHSB8nmcm9d4UkxOo9svJVRR5zTzHm6JFD
	4nsXBPvr7qIokXFAo8Bk1q3SxURI/vZZOGOkuZKkiU5fmmy/d6k/Teyh75MSJkaRvrBJyr+G/AZ
	10nTP
X-Received: by 2002:a05:600c:1d05:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b6dc6deb82mr52285845e9.1.1793985126768;
        Fri, 06 Nov 2026 09:12:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/bitops: Improve code generation for __scanbit()
Date: Fri,  6 Nov 2026 17:12:04 +0000
Message-Id: <20261106171204.2783260-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793985127-BC95A757-174E43C1/10/78276251493
X-purgate-type: spam
X-purgate-size: 5225
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no need for an alternative.  Use the same technique as arch_ffs() by
pre-loading the destination register using the caller chosen "zero case"
instead of -1.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Slightly RFC.  I don't particualrly like forward-declaring ffsl(), but I don't
see another option while maintaining a non-tangled common/arch header split.

This change is definitely a win at a micro level (it's removing a CMOV
instruction from every case, and removing an alternative from every
BITS_PER_LONG case), but causes an awful lot of churn which makes it hard to
judge at a macro level:

  add/remove: 3/0 grow/shrink: 7/20 up/down: 525/-1143 (-618)
  Function                                     old     new   delta
  cpumask_any                                    -     153    +153
  sched_set_res                                  -     132    +132
  csched_schedule                             3691    3819    +128
  __next_node.constprop                          -      41     +41
  do_microcode_update                         1014    1038     +24
  memory_add                                  4036    4049     +13
  csched2_alloc_domdata                        476     487     +11
  numa_init_array                              153     161      +8
  find_non_smt                                 320     328      +8
  dump_execstate                               221     228      +7
  fixup_irqs.cold                               49      47      -2
  csched2_res_pick                            1351    1349      -2
  psr_set_val                                 2270    2264      -6
  vmx_sync_exit_bitmap                          73      65      -8
  numa_emulation                               487     479      -8
  __find_next_zero_bit                         145     137      -8
  sched_unit_migrate_finish                   1255    1246      -9
  get_free_buddy                              1014    1003     -11
  node_to_scrub                                533     517     -16
  heap_init_late                              1659    1643     -16
  dom0_compute_nr_pages                       1424    1408     -16
  sched_init_vcpu                             1811    1791     -20
  dump_numa                                    471     443     -28
  runq_tickle                                 1753    1721     -32
  dump_numa.cold                               977     942     -35
  null_unit_migrate                            743     655     -88
  get_outstanding_claims                       198      74    -124
  _assign_irq_vector                          1571    1431    -140
  null_unit_insert                             694     542    -152
  fixup_irqs                                  1655    1233    -422

3 functions get out-of-lined, which has a large knock-on effect.

cpumask_any() has absolutely no buisness being inline in the first place, but
ends up with 3 callsites here (two from fixup_irqs(), one from
_assign_irq_vector()).
---
 xen/arch/x86/include/asm/bitops.h | 33 +++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 557cee03baeb..43a553d45257 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -320,18 +320,35 @@ extern unsigned int __find_first_zero_bit(
 extern unsigned int __find_next_zero_bit(
     const unsigned long *addr, unsigned int size, unsigned int offset);
 
+static attr_const unsigned int ffsl(unsigned long x);
+
+/*
+ * Search for the first set bit in @val, returning @max if @val was 0.
+ * See arch_ffs() for safety discussions.
+ */
 static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
 {
+    unsigned int r;
+
+    /* If the compiler knows val is nonzero, use a plain ffsl(). */
+    if ( __builtin_constant_p(val > 0) && val > 0 )
+        return ffsl(val) - 1;
+
+    /*
+     * If the compiler knows max is BITS_PER_LONG, use TZCNT directly.  The
+     * destination register still needs pre-loading for pre-TZCNT CPUs which
+     * will execute the instruction as BSF.
+     */
     if ( __builtin_constant_p(max) && max == BITS_PER_LONG )
-        alternative_io("bsf %[in],%[out]; cmovz %[max],%k[out]",
-                       "rep; bsf %[in],%[out]",
-                       X86_FEATURE_BMI1,
-                       [out] "=&r" (val),
-                       [in] "r" (val), [max] "r" (max));
+        asm ( "tzcnt %[val], %q[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (val), "[res]" (max) );
     else
-        asm ( "bsf %1,%0 ; cmovz %2,%k0"
-              : "=&r" (val) : "r" (val), "r" (max) );
-    return (unsigned int)val;
+        asm ( "bsf %[val], %q[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (val), "[res]" (max) );
+
+    return r;
 }
 
 /**

base-commit: c4a09c112c391ffc1aea33afff49ffb28156fbdb
-- 
2.39.5


