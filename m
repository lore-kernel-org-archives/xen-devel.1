Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6DCCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:27:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440715.1658149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfug-0008If-4O; Mon, 05 Oct 2026 10:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440715.1658149; Mon, 05 Oct 2026 10:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfug-0008IY-0u; Mon, 05 Oct 2026 10:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1440715;
 Mon, 05 Oct 2026 10:27:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <coolhaoyt@gmail.com>) id 1xDfuf-0008IC-0I
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:27:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfue-00C6Jd-DA
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:27:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac37b61-8faa-0a2a0a5109dd-0a2a45079a54-48
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:27:16 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6ac37b84-b4ea-0a2a45070019-4a7de18cb153-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:27:16 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49fff72474fso10940375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 03:27:16 -0700 (PDT)
Received: from LukeW.mynet ([143.58.214.168]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0394e6c5asm254502245e9.2.2026.10.05.03.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:27:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196036; x=1791800836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pu7co6k1rQENL36cIepR1Ob3aaheC8u3llxMRwyghek=;
        b=XL0bE49RO/WfFy2YoEc49H1lpz3moR9N49c9WGSriJBFQKAN3sXjsb/KrUQTMHhU4C
         qbDDLZVtdzaQLTofLrS0GXk7atsTaeBqoByum1vTsXUrvlAA153FTmMaG9NnL09mq8db
         G5gkTs3yGVwXgLkZ0Yce7yw8xj/V5nqXP6ILNN0FA2PjUxCQoIC0G+OxrDyXRzW6W9dI
         uBPomR0UDKrUoSV6u0RS9v3fiNyZvxFqidtQapc04Ge6ICUdATACdzqqF+GSqKZlbZaI
         A8kp2/C2OaMA8tO0KLpOpMc8IKOowlJUgSlkx+2Sj6zGLKVOKwY15k8c0yhtc9ZSNoy+
         TwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196036; x=1791800836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pu7co6k1rQENL36cIepR1Ob3aaheC8u3llxMRwyghek=;
        b=R/By/e4fCRE5hllBiP61IQ+8O+VRnTOU2xq1jgTdmR08DXKfElbdxBXd8K5bkWie9Q
         ZNZAgFztw0QutnNIN2MoA+ryYqYrU7raG7BHgRYYS4rf1DkVkxcqinSzkUgPrrEgSXMB
         2pjHxohy7lZhpT8FCi9DuIdhl6KRdrjlXsGhB670CegcuP95/3phLnjwzFTlj0NFBsll
         +yQebOcjK93Lci7Cu8MMXn9BQbrTgOwHgwPuBAiVemXtN8qBzm7C4ii5rC3L1N0C3S4h
         Oin0Ql4sG1XdWkARe15so4jV63rjqslR3zdRkEhndb6lrixohl+RU+CxObARZxZN8hq/
         IbhA==
X-Gm-Message-State: AFuF++mBCIv3577rxEn0K4yYit62Mc7o/plBvDcRHAHTMXe8IFEQVq24
	nJYoi9BPMYyrzLWU9X6mq+JTVvPzOmrxrQ7OdXb9/RI2A1jgCjcP9eZv5I6G+yFu5Ps3Xg==
X-Gm-Gg: AYBFou2F6r85dCkzWk27skzgme0Xh4OzsCUMSPOfqUf0Ht9aFxKU9l7o+EfmtjqCJED
	mL3PmzVOueFrcvsbLjZeaf+pE/IuPHUE6urJeMuDMLmx8JiB5LXUXw/dlUaGMN5L4snE/hSf3R1
	mdv8HoWV6ThV5ufIhPCrDsLAexxdytxS2t1OtDRsoFQ+p7QMn7r5Eiu2wmFltY/K8w98zI9qTmg
	xFJfVWXv9xZoYbF5EIOuPgpTotBZJM3lHCrkaSw9bdhdBvzfnqjeCJtgH/2sVRvekEvgEWLqMzK
	PsKbCNs54GtHYBlO+9nWTAA0dfrFUhDo0Ke3jnX7HPWPmwJZwWCffemlmJZU50mkYeLxkHKGxSh
	UIXPi+dfLFad3z/WCpzP0X2SZX6i6gFgShHe7Qm4Tu2vSzfzK6jAPK/OzvYVE2JrdvZmb89VRLy
	KuUKIkJ4a7mCf/+h+KTYVmSI4moumNSxS84gTF3MamziniK/V7YbWfQS3F8W3nlPyVIM74mw==
X-Received: by 2002:a05:600c:638e:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a176581e87mr8450775e9.7.1791196035568;
        Mon, 05 Oct 2026 03:27:15 -0700 (PDT)
From: Weiqi Wang <coolhaoyt@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger@xenproject.org,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	julien@xen.org,
	sstabellini@kernel.org,
	lucas.cordeiro@manchester.ac.uk,
	Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
Subject: [PATCH v2] xen/pdx: fix offset-compression merge of a contained range
Date: Mon,  5 Oct 2026 11:27:13 +0100
Message-Id: <20261005102713.94033-1-coolhaoyt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1791196036-374D3AE4-CA8F57B6/0/0
X-purgate-type: clean
X-purgate-size: 4370

From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

When sorting and merging overlapping ranges in
pfn_pdx_compression_setup(), the merged range is set to end where the
second range ends.  If the second range is fully contained in the first,
this truncates the first range, and the tail of it is then neither
compressible nor translated correctly.

Keep the end of the merged range as the maximum of both ends.

On x86 the ranges come from the SRAT memory affinity entries, and
overlapping entries for the same node are tolerated with a warning by the
NUMA code.  The caller's subsequent coverage check catches the truncated
range, so the effect is that PDX compression is disabled with a "RAM
region ... not covered" message rather than memory being mistranslated.

Add a test case that fails without this change.

Found with the ESBMC bounded model checker.  The counterexample was
confirmed by running it natively against the unmodified code.

Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
---

Notes:
    Changes in v2:
    - clarify in the title that this is the offset-compression instance (Jan)
    - parenthesise the test multiplications against the binary ORs (Jan)
    
    Also seen in a real boot: the hypervisor alone under QEMU (pc, 8 GiB),
    built from defconfig, with no -numa and a hand-built SRAT passed with
    -acpitable.  Memory affinity entries, all PXM 0:
    
      [0, 3G)  [4G, 9G)  [5G, 6G)  [1T, 1T+1G)
    
    The third entry lies inside the second.  The NUMA code prints "overlaps
    with itself" for it and accepts it.  Without this patch:
    
      (XEN) PFN compression using lookup table shift 23 and region size 0x200000
      (XEN)  range   0 [0000000000000, 000000017ffff] PFN IDX   0 : 0000000000000
      (XEN)  range   1 [0000010000000, 000001003ffff] PFN IDX  32 : 000000fe00000
      (XEN) PFN compression disabled, RAM region [0x100000000, 0x23fffffff] not covered
    
    With it, the same output as without the third entry:
    
      (XEN) PFN compression using lookup table shift 28 and region size 0x400000
      (XEN)  range   0 [0000000000000, 000000023ffff] PFN IDX   0 : 0000000000000
      (XEN)  range   1 [0000010000000, 000001003ffff] PFN IDX   1 : 000000fc00000

 tools/tests/pdx/test-pdx.c | 12 ++++++++++++
 xen/common/pdx.c           |  5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index 4de8d43d86..8d271a488f 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -87,6 +87,18 @@ int main(int argc, char **argv)
             },
             .compress = true,
         },
+        /* Range contained in a previous one. */
+        {
+            .ranges = {
+                { .start =                                                 0,
+                  .end   =                          ((1UL << MAX_ORDER) * 1) },
+                { .start = (1UL << (MAX_ORDER * 2)) |                      0,
+                  .end   = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 4) },
+                { .start = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 1),
+                  .end   = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 2) },
+            },
+            .compress = true,
+        },
 #endif
         /* PDX compression, 2 ranges covered by the lower mask. */
         {
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index e7e16e193e..23655ef3bd 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -393,8 +393,9 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
              (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
             continue;
 
-        ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
-                              ranges[i - 1].base_pfn;
+        ranges[i - 1].pages = max(ranges[i - 1].pages,
+                                  ranges[i].base_pfn + ranges[i].pages -
+                                  ranges[i - 1].base_pfn);
 
         if ( i + 1 < nr_ranges )
             memmove(&ranges[i], &ranges[i + 1],
-- 
2.34.1


