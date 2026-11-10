Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692EA606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=NGqQxcFM
Received: from list by lists.xenproject.org with outflank-mailman.1482018.1685896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnpO-0002El-Rw; Tue, 10 Nov 2026 15:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482018.1685896; Tue, 10 Nov 2026 15:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnpO-0002Ea-PP; Tue, 10 Nov 2026 15:32:06 +0000
Received: by outflank-mailman (input) for mailman id 1482018;
 Tue, 10 Nov 2026 15:32:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQnpN-0002ER-UJ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:32:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnpN-000u3B-3q
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:32:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af338e2-e002-0a2a0a5209dd-0a2a45088108-26
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:32:04 +0100
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af338ef-f659-0a2a45080019-d155d029b8ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:31:59 +0100
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6b581b6b0e9so952924a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:31:59 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbfc6sm5969444f8f.41.2026.11.10.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 07:31:57 -0800 (PST)
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
        d=citrix.com; s=google; t=1794324719; x=1794929519; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR4l60N1gxFGiAdFCO4sRr0rSUxLIjzWSueO3356r28=;
        b=NGqQxcFM03kZvOVu68XmKQVoQyASS080JKFB1F7GZjx15fVGHlB2f8NeJKbb/DUT8U
         S8zPue5Ir10d3pjsR1E8QYBviejdJeDBNh9Prc/77/c3stnZCgPsCttBe6TBInk2Da7q
         Qk0UZHU0sxQ2L3Hpz7MFR6eRjNKeu/YTpoHe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324719; x=1794929519;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZR4l60N1gxFGiAdFCO4sRr0rSUxLIjzWSueO3356r28=;
        b=kifJFecqzNGP8aEaQTTTxHRY2qHxsQ/0shxzNQu5xFJ7wB/f1bHAlKQWxKjARDjM+H
         hSgR04i8G8uGt9E7EXAgUVdMmE0ghKJ6wBtvHM5w1Js/TCZLfhihJg+pBgFXdG2APOfe
         3bp/QgF9nJ/za39FknIBRFPHiZkUWd9PotV8/dFB59AArSk6EYXCQkIufhpMMwzr9FYQ
         p3c58V5aSGGWnIgIrVOXULubU9npjl4Ia5QiGQa2wqHG6YUQHy02+BI3sH14Gpm7uN3b
         ZlFUHxjWTP9D16YntxrGm589x6Ekw+rc/JHIxP8B5OBG4fTH1LHagrPhngwh/EheLuqh
         zWkw==
X-Gm-Message-State: APuU4Z+4Pl9WPk6632C/1+8GJFwoL51fgLqKnsqXTKCFAKDvPzUPpXVb
	zuLXlcw0V/+D90rEkRkVZg34dZavhEn4GngYKudvZLcLbBUYWpD64HvVLozu+4lHXQtlvMyRDwt
	zJAl86cA=
X-Gm-Gg: AYBFou0Jv1cy4LaSHYwvnjEOluOrdEWe/r66749VSRtvwaj1pbYIqpKWlEJWUsF0UFW
	Az3fs9CqqqbhumYErOC0numPrAhgR9hUl090rWovtC+DjtLcEYRAur10EyQBSJzPYla7Em+SxY7
	5hmLWXdqI1VBW7wiNkPgh1KRK2urAJejweQM5aEw9RrcgdD2IufK6bFFMR4kbnNc8qD+1+EhWwT
	rfSs81jUc0FioAxDXg1sUhtriJ8/DaUXnrlnUbUWY+2zSKJuShCnX+LIo92jNS0RWaI0inI5t0i
	Ce846kT7E2qRjidjCfe0szCunSCJsJXBBI+lJULJx64RWQN7VH34pc10Lmm5I7P4AgewGChq3gA
	lnPSYwDxZbGBKZYX3qOD71CjdZrPTaBbDiwC+ahChIFBspZcrghZIvinCL9NTDBY+NaPhMMz+dQ
	vmqqxApA3eRimwLScpiCbV5Gu/wZZFtqoJbC/Es8OV9b2Vqev7Bb8ad2hyHtbgGiS+N/jjY0eqH
	LdV7Vcnp3EuyKW1EcDiFEzr58l12106kifVKGPHmZ0tr7td6DzImX4Wf8yb+Rxa8hIz68Qy/xh/
	yFx/CC2eVh/XfqfWmzxnZE3tx8HWW3X1DN2ZTU8SB9cRwhqjzs/Y2vLwUcLv/LwVqeUd3BQei3y
	OISXf
X-Received: by 2002:a05:6402:322a:b0:6ab:6e:a8e4 with SMTP id 4fb4d7f45d1cf-6b756b1fb47mr2347712a12.44.1794324718104;
        Tue, 10 Nov 2026 07:31:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/bitops: Replace __scanbit() with a simpler tzcnt()
Date: Tue, 10 Nov 2026 15:31:56 +0000
Message-Id: <20261110153156.3162601-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794324724-D5B4987B-0DA56081/10/78276251493
X-purgate-type: spam
X-purgate-size: 7041
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There are 4 remaining users of __scanbit(), and they're capable of dealing
with max being BITS_PER_LONG.  Switch to a simpler tzcnt() helper, which also
removed some alternatives from behind the scenes.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Supercedes "x86/bitops: Improve code generation for __scanbit()"

Bloat-o-meter shows rather less churn:

  add/remove: 1/0 grow/shrink: 9/18 up/down: 244/-279 (-35)
  Function                                     old     new   delta
  is_cpu_primary                                 -      88     +88
  vmap_size                                     38      91     +53
  get_outstanding_claims                       198     214     +16
  csched2_unit_insert                          413     429     +16
  csched2_schedule                            5371    5387     +16
  __cpu_disable                                583     599     +16
  memory_add                                  4036    4049     +13
  csched2_alloc_domdata                        476     487     +11
  numa_init_array                              153     161      +8
  dump_execstate                               221     228      +7
  dump_numa                                    471     469      -2
  csched2_res_pick                            1351    1349      -2
  csched_schedule                             3790    3786      -4
  fixup_irqs                                  1655    1650      -5
  dump_numa.cold                               977     970      -7
  cpupool_assign_cpu_locked                    410     403      -7
  _assign_irq_vector                          1571    1564      -7
  vmx_sync_exit_bitmap                          73      65      -8
  numa_emulation                               487     479      -8
  __find_next_zero_bit                         145     137      -8
  get_free_buddy                              1014    1005      -9
  runq_tickle                                 1753    1737     -16
  node_to_scrub                                533     517     -16
  dom0_compute_nr_pages                       1424    1408     -16
  sched_init_vcpu                             1811    1791     -20
  microcode_nmi_callback                       300     260     -40
  heap_init_late                              1659    1611     -48
  do_microcode_update                         1014     958     -56

  Total: Before=2013616, After=2013581, chg -0.00%
  add/remove: 0/0 grow/shrink: 3/0 up/down: 36/0 (36)
  Data                                         old     new   delta
  symbols_names                             134797  134817     +20
  symbols_sorted_offsets                     69368   69376      +8
  symbols_offsets                            53456   53464      +8

For things like vmap_size() what has happened is that vm_size() has now been inlined.
---
 xen/arch/x86/bitops.c             |  4 ++--
 xen/arch/x86/include/asm/bitops.h | 31 ++++++++++++++++++-------------
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/bitops.c b/xen/arch/x86/bitops.c
index 22cfb6d8ec3a..348e51202465 100644
--- a/xen/arch/x86/bitops.c
+++ b/xen/arch/x86/bitops.c
@@ -35,7 +35,7 @@ unsigned int __find_next_bit(
     if ( bit != 0 )
     {
         /* Look for a bit in the first word. */
-        set = __scanbit(*p >> bit, BITS_PER_LONG);
+        set = tzcnt(*p >> bit);
         if ( set < BITS_PER_LONG )
             return (offset + set);
         offset += BITS_PER_LONG - bit;
@@ -85,7 +85,7 @@ unsigned int __find_next_zero_bit(
     if ( bit != 0 )
     {
         /* Look for zero in the first word. */
-        set = __scanbit(~*p >> bit, BITS_PER_LONG);
+        set = tzcnt(~*p >> bit);
         if ( set < BITS_PER_LONG )
             return (offset + set);
         offset += BITS_PER_LONG - bit;
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 557cee03baeb..f880d16a982f 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -320,18 +320,23 @@ extern unsigned int __find_first_zero_bit(
 extern unsigned int __find_next_zero_bit(
     const unsigned long *addr, unsigned int size, unsigned int offset);
 
-static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
+/*
+ * Search for the first set bit in @x, returning BITS_PER_LONG if @x was 0.
+ * See arch_ffs() for safety discussions.
+ */
+static always_inline unsigned int tzcnt(unsigned long x)
 {
-    if ( __builtin_constant_p(max) && max == BITS_PER_LONG )
-        alternative_io("bsf %[in],%[out]; cmovz %[max],%k[out]",
-                       "rep; bsf %[in],%[out]",
-                       X86_FEATURE_BMI1,
-                       [out] "=&r" (val),
-                       [in] "r" (val), [max] "r" (max));
-    else
-        asm ( "bsf %1,%0 ; cmovz %2,%k0"
-              : "=&r" (val) : "r" (val), "r" (max) );
-    return (unsigned int)val;
+    unsigned int r;
+
+    /*
+     * The destination register still needs pre-loading for older CPUs which
+     * will execute TZCNT as BSF.
+     */
+    asm ( "tzcnt %[x], %q[r]"
+          : [r] "=r" (r)
+          : [x] "rm" (x), "[r]" (BITS_PER_LONG) );
+
+    return r;
 }
 
 /**
@@ -358,7 +363,7 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
     if ( o__ >= s__ )                                                       \
         r__ = s__;                                                          \
     else if ( __builtin_constant_p(size) && s__ <= BITS_PER_LONG )          \
-        r__ = o__ + __scanbit(*a__ >> o__, s__);                            \
+        r__ = o__ + tzcnt(*a__ >> o__);                                     \
     else if ( __builtin_constant_p(off) && !o__ )                           \
         r__ = __find_first_bit(a__, s__);                                   \
     else                                                                    \
@@ -390,7 +395,7 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
     if ( o__ >= s__ )                                                       \
         r__ = s__;                                                          \
     else if ( __builtin_constant_p(size) && s__ <= BITS_PER_LONG )          \
-        r__ = o__ + __scanbit(~*a__ >> o__, s__);                           \
+        r__ = o__ + tzcnt(~*a__ >> o__);                                    \
     else if ( __builtin_constant_p(off) && !o__ )                           \
         r__ = __find_first_zero_bit(a__, s__);                              \
     else                                                                    \

base-commit: 204e45847d5a743b611de989835f651fcfd6ddc0
-- 
2.39.5


