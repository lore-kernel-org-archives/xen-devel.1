Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804F4CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:20:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437474.1656379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx21-0006Ab-L0; Wed, 30 Sep 2026 16:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437474.1656379; Wed, 30 Sep 2026 16:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx21-0006AQ-GJ; Wed, 30 Sep 2026 16:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1437474;
 Wed, 30 Sep 2026 16:19:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx20-0005vf-4F
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx1z-006NIu-HZ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3692-2eae-0a2a0a5409dd-0a2a450ca994-30
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:43 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd369f-f479-0a2a450c0019-4a7de18dc38a-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:43 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so31226555e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:43 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790785183; x=1791389983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFod2chJ8fMlZWxxt1ZDOupdRNyKNPgUaDsct9SpfCs=;
        b=A907fe2pWlEcoleUDzAYBCUvS5im46UtIPRv9qusFK5SoOWulbJsb2m+Li2BnnFk9j
         VAHpLBvdWES+3n1gRVjQwETmzV8V//w73jXed/ln/MbesXc1agHYA8cBLXpo0F9NieRQ
         /SOhPLTZkp4y5NBfqknKEC2uXXl/1B75YpRJk6gkUCkx+UiKh2Ft2QHSqYWrYByNtkgw
         yrhtg8jaHRwAA+t3g0Ua3HBztJQEpLa3z+DmBneK7E42smCUq+8OFC2bnaipBaJiuOUY
         dvKfj+YatSvkqAmo+ssQiyDNydMEnMvGxsEcaIsqbI/dQ4rOdrskKQS6ams5VuUhnr9r
         7Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785183; x=1791389983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFod2chJ8fMlZWxxt1ZDOupdRNyKNPgUaDsct9SpfCs=;
        b=FoisrMwodvO2MCU+38nXezqT6olBY3BVnkvdDHIGQFUCWGYI5AICZu54m13lRObhbU
         kLOlgOF9pnayFkn6S+gk5IlwqIVUanE2zrUVPz9EnfwNMRTnDuctfW+J1dK8iIpCiShL
         NMFpppuB+E/YDLd7RhCPnFoZMqh5nGBooffM5VmJ2YNAq44ndMZzNF3E+DFgeu95eVcQ
         MsVkn/kZUhTk0kC4YWPUT4vphPuE7QFRlrshDcJ+AVBqK92C49+t4LWy/HUDB4YJXKoF
         7tzCkcZJ28j3wgJ/Fb3n9dNsQcfb2Ys65z1ql10ICQN9Gf1xtH7LAJV4tdzKflsMazdY
         rCiQ==
X-Gm-Message-State: AFuF++nWZJfeMTVUCaQ0311TNsQI7A4tpO6nS+WKLk5ZOJ5lyMS7HLrW
	7SVNrSSq4OUNk85P5ZOhuVvKyhQmFMNCxl5PpVRjRh4Ytr/VxPxYLvAJeHySaw==
X-Gm-Gg: AYBFou35KSyQZUuA+jF2R8JvcInjvmoV0FrcX81HbEmbNJUmV7RrQdodZzW1aBZBxB+
	OXQ4Qgyv3IdtA8W6ZoYVFMjc+30G82MPi/1QGQseGD9oAg/je++A0glotsa7EKcuLZqdydcqyue
	kNhhjX6h9kD1iHXVjqQT174onk/AajgygYQMnyi9Q7fCWGBOH8VJ7T/P/lMRdIJjxj5jqIIPvnI
	/yPvKGNkAgX5DYtn4IiZCEQHZUlZMTmXQFoSJ9BH5EBtYpedbnM7x3fCmo/PMQXcYwpYRuztEAG
	SkB4sltrOwEb8CzWxrWgzCnGkm0FXX3vzHqT2ZlpPapMQvm/N4e+WJKAEXtTnLlaD3do/VoeoNG
	b9UYR+UBoo3Li+LGow8jVNaMCX9VmCuYe2qSkWRybwq+WWOkDOtkkuZRpDOhT/sNBulUZ/Kqr8S
	IuC6twJgnbtASkDzIMGph8zeQ6NHHC2GXayNNp+g9Z26AuvHPOCKGZAY5Muma1v4szJYueFQn53
	qPjLCym+wdp21UFABq6O8Zhdcw0gTsAkzoIdWE4W4wOdAmxLMg=
X-Received: by 2002:a05:600c:1c28:b0:4a0:1d1a:6067 with SMTP id 5b1f17b1804b1-4a01d1a619amr15602695e9.34.1790785182845;
        Wed, 30 Sep 2026 09:19:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 04/39] xen/riscv: request a G-stage flush on vmenter when VMIDs are disabled
Date: Wed, 30 Sep 2026 18:18:46 +0200
Message-ID: <7b3e9a486b348470b3c3b371b6a8d3f7afe0e53f.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790785183-776D6A5B-43E1CFB0/10/73395122804
X-purgate-type: spam
X-purgate-size: 2388

vmid_handle_vmenter() reports that no flush is needed when VMIDs are
unavailable (e.g. vmid=off, or hardware with no more than one VMID bit).
Every domain then runs under VMID 0 with nothing flushed in between, so as
soon as a hart runs more than one domain, a domain entered there can use
the G-stage translations left behind by the domain which ran before it.

Report that a flush is needed on every entry instead.

Update the comment in p2m_handle_vmenter() accordingly: without VMIDs the
VS-stage TLB doesn't need a separate flush either, as the G-stage flush now
done on every entry already covers it.

While at it, spell the other early return as a bool literal.

Fixes: bff3b9ea4696 ("xen/riscv: introduce VMID allocation and manegement")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/p2m.c  | 4 +++-
 xen/arch/riscv/vmid.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1cea86512c8c..de25607247a6 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1584,7 +1584,9 @@ void p2m_handle_vmenter(void)
     /*
      * There is also no need to flush the VS-stage TLB: even if speculation
      * occurs (VSATP + old HGATP were used), it will use the old VMID, which
-     * won't be reused until need_flush is set to true.
+     * won't be reused until need_flush is set to true. When VMIDs aren't
+     * available there is no old VMID to rely on, but then need_flush is set
+     * on every entry, so the flush above covers that case.
      */
 }
 
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
index 11c7e9d6d6c8..93714b359534 100644
--- a/xen/arch/riscv/vmid.c
+++ b/xen/arch/riscv/vmid.c
@@ -141,7 +141,7 @@ bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
 
     /* Test if VCPU has valid VMID. */
     if ( read_atomic(&vmid->generation) == data->generation )
-        return 0;
+        return false;
 
     /* If there are no free VMIDs, need to go to a new generation. */
     if ( unlikely(data->next_vmid > data->max_vmid) )
@@ -164,7 +164,7 @@ bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
 
  disabled:
     vmid->vmid = 0;
-    return 0;
+    return true;
 }
 
 /*
-- 
2.55.0


