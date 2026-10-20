Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1C5606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 03:45:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1455089.1668639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0n4-0006q8-Ut; Tue, 20 Oct 2026 03:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455089.1668639; Tue, 20 Oct 2026 03:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ0n4-0006pK-Qn; Tue, 20 Oct 2026 03:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1455089;
 Tue, 20 Oct 2026 03:45:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xJ0n3-0006nY-Pt
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 03:45:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ0n2-00G7gS-99
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 05:45:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad6e394-e002-0a2a0a5209dd-0a2a4507c31c-36
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:45:25 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ad6e3d3-b4ea-0a2a45070019-9fe2fb15ae9c-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 05:45:25 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowADXrvLN49ZqzdhHCw--.7730S2;
 Tue, 20 Oct 2026 11:45:17 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/2] xen/ns16550: preserve UART operation across firmware handover
Date: Tue, 20 Oct 2026 11:45:41 +0800
Message-ID: <cover.1792467713.git.zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADXrvLN49ZqzdhHCw--.7730S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr48uw13tr4UJF4kJw1fWFg_yoWkAFb_uF
	4vkas8GrZ8XF4DXasayF45KrZ8ArZIqrykta40qrW3Z34IvrsIgF1DGr15Xrn7ur4kCrn7
	Aas0yr93Z3sxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07jbl19UUUUU=
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-ef75cf/1792467925-A7AD0AE4-C9C2D4E0/0/0
X-purgate-type: clean
X-purgate-size: 1115
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series identifies XScale-compatible UARTs from device tree and
keeps UUE set when updating IER. Pending output is drained before the
FIFOs are reset during ns16550 initialization.

Changes in v3:
- Identify XScale UARTs through intel,xscale-uart instead of probing IER.
- Preserve UUE on IER writes and enable RTOIE with receive interrupts.
- Bound the TX drain wait using the XHCI console's raw-counter approach.
- Explain why the drain checks TEMT instead of uart->lsr_mask.

Tested on SpacemiT K3 with Baptiste's preceding A/D bit patches applied.

v2: https://lore.kernel.org/xen-devel/20261010031406.2057735-1-zhangzheng@iscas.ac.cn/
v1: https://lore.kernel.org/xen-devel/20260928023857.1030884-1-zhangzheng@iscas.ac.cn/

Zhang Zheng (2):
  xen/ns16550: identify XScale UARTs from device tree
  xen/ns16550: drain TX before reinitializing the UART

 xen/drivers/char/ns16550.c  | 44 ++++++++++++++++++++++++++++++-------
 xen/include/xen/8250-uart.h |  2 ++
 2 files changed, 38 insertions(+), 8 deletions(-)


base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
-- 
2.54.0


