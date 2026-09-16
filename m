Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6D3C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 08:54:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422474.1647866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6lP2-0003pb-6w; Wed, 16 Sep 2026 08:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422474.1647866; Wed, 16 Sep 2026 08:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6lP2-0003pU-4H; Wed, 16 Sep 2026 08:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1422474;
 Wed, 16 Sep 2026 08:54:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1x6lP1-0003pO-B2
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 08:54:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6lOz-001s2r-Sf
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:54:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aaa5917-2eae-0a2a0a5409dd-0a2a4503cabc-48
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 10:53:59 +0200
Received: from [159.226.251.81] (helo=cstnet.cn)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aaa5925-fae8-0a2a45030019-9fe2fb51caee-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 10:53:59 +0200
Received: from [10.213.11.11] (unknown [36.110.52.2])
 by APP-03 (Coremail) with SMTP id rQCowABHUT8gWapqgfLfBw--.13937S3;
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
Subject: Re: [PATCH v2 6/6] xen/riscv: fix level_map_mask truncation on
 load_start
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
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>
In-Reply-To: <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
Date: Wed, 16 Sep 2026 16:54:24 +0800
Message-Id: <178954886475.200919.15962926828653940980.b4-review@b4>
X-Mailer: b4 0.15.2
X-CM-TRANSID:rQCowABHUT8gWapqgfLfBw--.13937S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw47JF47AryDZr13JrW8WFg_yoW8Jw4Upr
	WUGry3KrZ3X34DXFZ2y34kZr4YgryDZayfAw17Aryjq3s5JFyUJF9Iyws8WF4fGFy8ZFya
	v3sY93WI9ws8GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfU0wZcUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-33051d/1789548839-770F64E9-B2DD69E5/0/0
X-purgate-type: clean
X-purgate-size: 1368

On Thu, 10 Sep 2026 11:34:54 +0200, Baptiste Le Duc <baptiste.le-duc@vates.tech> wrote:
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 53bebbcabf..e7f2491257 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -180,7 +180,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>      bool is_mode_supported = false;
>      unsigned int index;
>      unsigned int page_table_level = (mmu_desc->num_levels - 1);
> -    unsigned level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
> +    unsigned long level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
>  
>      unsigned long aligned_load_start = load_start & level_map_mask;
>      unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);

This resolves the issue where Xen fails to correctly mask the upper 32 bits of
the physical address. Which make xen failed to boot on the SpacemiT K3, where
U-Boot boots the kernel image located at physical address 0x1_4000_0000 by default.

In sv39, page_table_level=2 :
uboot bootm addr             : 0x0000_0001_4000_0000
                                         ^
unsigned level_map_mask      = 0x0000_0000_c000_0000
unsigned long level_map_mask = 0xffff_ffff_c000_0000

Tested-by: Zheng Zhang <zhangzheng@iscas.ac.cn>

-- 
Zhang Zheng <zhangzheng@iscas.ac.cn>


