Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D576C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 08:54:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422475.1647874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6lP6-00042M-Do; Wed, 16 Sep 2026 08:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422475.1647874; Wed, 16 Sep 2026 08:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6lP6-00042F-Ag; Wed, 16 Sep 2026 08:54:08 +0000
Received: by outflank-mailman (input) for mailman id 1422475;
 Wed, 16 Sep 2026 08:54:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1x6lP5-00041s-Jx
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 08:54:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6lP4-0054r3-Dk
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:54:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aaa5916-8faa-0a2a0a5109dd-0a2a45078d1a-28
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 10:53:59 +0200
Received: from [159.226.251.81] (helo=cstnet.cn)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aaa5925-b4ea-0a2a45070019-9fe2fb51a0c0-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 10:53:59 +0200
Received: from [10.213.11.11] (unknown [36.110.52.2])
 by APP-03 (Coremail) with SMTP id rQCowABHUT8gWapqgfLfBw--.13937S2;
 Wed, 16 Sep 2026 16:53:52 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/6] xen/riscv: set A/D bits in Xen's page-table
 mappings under Svade
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
Date: Wed, 16 Sep 2026 16:54:24 +0800
Message-Id: <178954886474.200919.8556627169956989747.b4-review@b4>
X-Mailer: b4 0.15.2
X-CM-TRANSID:rQCowABHUT8gWapqgfLfBw--.13937S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWDGrW5Xr1UZryfAry5urg_yoW8Zr4UpF
	97Kwsayrs5A3WxArn7Za17XFyDWa1xJ3ykWr90g347uFsIvw1xGr4I9a4UJayDuwsakw4j
	vr4qvryrWrsYyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07befHbUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-ef75cf/1789548839-3C610AE4-22F95A95/0/0
X-purgate-type: clean
X-purgate-size: 1972

# Add your code comments below. There is no need to trim or delete
# any existing content -- just insert your comments under the relevant
# lines of code. Lines starting with "> " are quoted diff context and
# lines starting with "| " are comments from other reviewers.
# The final email will be reformatted automatically to include only
# the sections that have your comments.
#
> The previous patch set A/D bits in case of the Svade extension for G-stage
> mappings. Xen's own S-stage mappings need the same fix as both
> setup_initial_mapping() (the boot page tables) and arch_pmap_map() (the
> fixmap) build leaf PTEs directly instead of going through
> pt_update_entry(), which is what adds A/D bits. So with Svade, both would
> fault on first access.
> 
> Add PTE_ACCESSED to all PAGE_HYPERVISOR_* and also PTE_DIRTY to
> PAGE_HYPERVISOR_RW as it needs to be set during a write to avoid a fault.
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and for the temporary root entry
> built by check_pgtbl_mode_support(), instead of the equivalent raw bit
> lists. The latter drops PTE_WRITABLE, going from RWX to RX, but this is
> harmless, as that entry only has to make the current instruction stream
> fetchable between the two CSR_SATP writes used to probe SATP mode support,
> and nothing writes through it.
> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> A PTE is a table entry iff PTE_VALID is set and R/W/X are all clear, so
> update pte_is_table() and pte_is_mapping() accordingly.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Tested-by: Zheng Zhang <zhangzheng@iscas.ac.cn>

-- 
Zhang Zheng <zhangzheng@iscas.ac.cn>


