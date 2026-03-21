Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F38109446A
	for <xen-devel@archiver.kernel.org>; Sat, 21 Mar 2026 11:02:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1258638.1552416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3u5R-0004UM-83; Sat, 21 Mar 2026 11:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258638.1552416; Sat, 21 Mar 2026 11:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3u5R-0004UF-5Q; Sat, 21 Mar 2026 11:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1258638;
 Sat, 21 Mar 2026 11:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oq+7=BV=smail.nju.edu.cn=kexinsun@srs-se1.protection.inumbo.net>)
 id 1w3u5O-0004U9-6X
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2026 11:01:43 +0000
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e12da6a-2515-11f1-9ccf-f158ae23cfc8;
 Sat, 21 Mar 2026 12:01:31 +0100 (CET)
Received: from localhost.localdomain ( [116.172.93.199])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 21 Mar 2026 19:00:40 +0800 (CST)
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
X-Inumbo-ID: 4e12da6a-2515-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090849;
	bh=arcVQdd5qWDE7k3IhE0LZZWperzfs+0HGppYUGehWyQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=oQ7cYtyxIKTZ2aI4CkWAPBOk+8wVnfe9TXpprzP2x3cExqioB1H+M2o4k2mq8FBwf
	 PYZSSq7ZtXSbXlGtCI74Rs97gmQXYGzQxhjH5peX2Ykt6SyLS5g+DnZByXQv3J2si9
	 m3bYI65/XGOFPRYvghAGR+aYk62hwukY7bvbw7Bg=
X-QQ-mid: esmtpgz11t1774090842tbb43ee6a
X-QQ-Originating-IP: mv5myG0ehU1YlIZvh6KahtgfL6eeQwVXKmoi3TDFisc=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4390190608562230099
EX-QQ-RecipientCnt: 11
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] xen/swiotlb: fix stale reference to swiotlb_unmap_page()
Date: Sat, 21 Mar 2026 19:00:39 +0800
Message-Id: <20260321110039.8905-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MQYXLRAkMyaepRQYOQpwixejF+q32fFP8BysH9VnPTG/7rQkVgNs2Dqe
	3DevTitA2Rwupx8sTy8czw5lzItvfbw4EqDnq0zRtdUXRL0cKzmiK/0g7dS5wcyjNbSSJYP
	z7SBKv8t3dIG+DUPiIGZK9uEBaWAEF38d1AE1+NidD4/0zrH2N2cK2JMvnGpq9pTspDkJpP
	AMjY0KLVzt971Lk5hJaJB4bQPgUKZkXayxFKaPdGDT/pskSc77pTEmwg19n3MAjiKdTMAg3
	olmwGKQyrA5sGp3etdnDOFURKcjH673RZROTUyBSgxEYX7f/tBTjsGH/bz6B6FvseFKnUjt
	bueSpjjBby8fm6O9Oaf+QcGxSCbDeQJG+MW1uALy2EhG4f4PmsbM7wv4/2mGxcmKefGAB7l
	JswOts48VFqhmRtR/Iu7603L8TeRJ3b38q1BPE6RHdf17SfGEG58UIih2tCWCLu+JnP98vE
	id+Lapr9GaoAKb1AiFzsplJbL5eoJ/7rX2niQP8WVFjwyR8nfa+Vu0uv3cGeRyr21o3Aj3l
	fsN8jQD7qHYJXObqeiVy5vhQHEEBz3vV6fm1nhqgQSRN/duO4WfImPoRB383/eunT6k3I8G
	djJa+XuVymCrC0UCFnvswCOkntdzeyUHLv09tE/6/a5FTfODvB7hbVdCHwe0HU8+RHGWRJx
	B2fhtixHfYYLrU/sjossO9vYBEuz968aCQ3Q/5QpcWzvZgxEIR7bYrTdtHcOOYWqiYYhH6q
	I6sgNbfrEV1A1cWtgiRXW/grD/DHfnmiP6pHAmPiOR7V8QduT5JkmXLgWq9OjDLywbdLwo2
	tDnmrnY5i0BEs9o266LNVUiaOPX/U7Lkl6lT1rLJFqJfHoenHWOWM0oSQXZpizqmBhuOajy
	Mb7KtT1YJUKCnJw4EdBb6jE4eqT6tMj+Apblzfku/FovJ2z+0r9Ao17psVwtDr6kVtXEJbW
	dUOqiYeKZIejcar80g+Spml8YaRr1rlAJ7xSmSJyqEMgfFqPj05tZj9ghcWWjBi0/xZFun9
	NWU4qEdHfrLG/sRkWDSGyT2zr2efIsEHj+V4no9FpzHwjfIUcBmalr2WbR382ReiWz6EUk7
	t/PSKzpqpvu3+AYdVAtj/wsS53jBubHVQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Commit af85de5a9f00 ("xen: swiotlb: Switch to physical
address mapping callbacks") renamed xen_swiotlb_unmap_page()
to xen_swiotlb_unmap_phys().  The comment in
xen_swiotlb_unmap_sg() had already been missing the xen_
prefix (reading swiotlb_unmap_page()), and the rename only
changed _page to _phys without correcting this, leaving it
as swiotlb_unmap_phys().  Fix the reference to use the
correct function name xen_swiotlb_unmap_phys().

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index ccf25027bec1..4a734ee38994 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -340,7 +340,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 
 /*
  * Unmap a set of streaming mode DMA translations.  Again, cpu read rules
- * concerning calls here are the same as for swiotlb_unmap_phys() above.
+ * concerning calls here are the same as for xen_swiotlb_unmap_phys() above.
  */
 static void
 xen_swiotlb_unmap_sg(struct device *hwdev, struct scatterlist *sgl, int nelems,
-- 
2.25.1


