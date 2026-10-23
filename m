Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64656606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 02:37:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1458777.1670822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK59V-0008Rm-Ql; Fri, 23 Oct 2026 02:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458777.1670822; Fri, 23 Oct 2026 02:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK59V-0008Re-MM; Fri, 23 Oct 2026 02:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1458777;
 Fri, 23 Oct 2026 02:37:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xK59U-0008P6-Ah
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 02:37:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK59T-00B5NI-AO
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:37:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6adac81d-bab6-0a2a0a5309dd-0a2a4506a7da-14
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 04:37:01 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6adac84a-195a-0a2a45060019-9fe2fb159b12-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 04:37:01 +0200
Received: from [10.213.11.11] (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowABXKu4+yNpqo_iFCw--.1153S2;
 Fri, 23 Oct 2026 10:36:53 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 2/4] xen/riscv: fix A/D bits in Xen's page-table
 mappings
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>
In-Reply-To: <1792164866.8631fc262581453bbf619ec5b2062170.1a14559aa020008425@vates.tech>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164866.8631fc262581453bbf619ec5b2062170.1a14559aa020008425@vates.tech>
Date: Fri, 23 Oct 2026 10:37:21 +0800
Message-Id: <179272304115.337595.12904917917015859560.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=816; i=zhangzheng@iscas.ac.cn;
 h=from:subject:message-id; bh=kc2zaGKYmCiccjH+nPyaXAH+en1p1LJ02E9kHLIMX5k=;
 b=owGbwMvMwCWmtfXriinfWuMYT6slMWTdOpHU5VCnI3EmU+vduV8x52MfZbTdX7ctVvxwxIxpG
 xZlvvli01HKwiDGxSArpsjC73XP3Of8z40cYSH7YOawMoEMYeDiFICJhNsx/K9pvfF4q8HlhbuL
 ftnbasgvfzQ7onXPh4scukWLeAXPemcwMuw5Ucegs/KS79mjFjbL+9fcjGuUauN+UP3zhsTZ/IV
 mP9gB
X-Developer-Key: i=zhangzheng@iscas.ac.cn; a=openpgp;
 fpr=0F4ADE374CCFF9B1085654BE2AB5F5A894F6855E
X-CM-TRANSID:qwCowABXKu4+yNpqo_iFCw--.1153S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurW7Cr13try7tr18uw45Jrb_yoW3urg_u3
	ZYkFWkKa43Wr4FvanxtF1xCF4Skr4jgw45XFyq9rn0yasxKr47CF9IvrySkF18Ja97Jr1x
	ur17ur4Fgas3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU7nmRUUUUU
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-16d1c6/1792723021-F6C7777B-1CE82341/0/0
X-purgate-type: clean
X-purgate-size: 818
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 17:34:18 +0200, Baptiste Le Duc <baptiste.le-duc@vates.tech> wrote:
> Xen does not handle page faults caused by clear A/D bits, so it presets
> them when creating PTEs. pt_update_entry() does so, but three places build
> leaf PTEs directly without going through it: setup_initial_mapping() (the
> boot page tables), check_pgtbl_mode_support() (the temporary root entry
> used to probe SATP mode support) and arch_pmap_map() (the fixmap).
> 
> On implementations that fault on clear A/D bits (Svade), all three fault
> on first access. For check_pgtbl_mode_support(), the fault is raised by the
> instruction fetch right after the SATP write, before any trap handler is
> set.
> 
> [...]

Tested-by: Zhang Zheng <zhangzheng@iscas.ac.cn>

-- 
Zhang Zheng <zhangzheng@iscas.ac.cn>


