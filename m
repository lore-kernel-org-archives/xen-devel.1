Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15C7606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 02:37:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1458776.1670816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK59V-0008PP-Ip; Fri, 23 Oct 2026 02:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458776.1670816; Fri, 23 Oct 2026 02:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK59V-0008PI-G4; Fri, 23 Oct 2026 02:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1458776;
 Fri, 23 Oct 2026 02:37:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xK59U-0008P7-Ag
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 02:37:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK59T-00B5NI-Cm
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:37:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6adac81d-bab6-0a2a0a5309dd-0a2a4506a7da-16
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 04:37:03 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6adac84b-195a-0a2a45060019-9fe2fb15d096-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 04:37:01 +0200
Received: from [10.213.11.11] (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowABXKu4+yNpqo_iFCw--.1153S3;
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
Subject: Re: [PATCH v7 3/4] xen/riscv: panic if the device tree advertises
 neither Svade nor Svadu
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
In-Reply-To: <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
Date: Fri, 23 Oct 2026 10:37:21 +0800
Message-Id: <179272304115.337595.14865693414645755406.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=zhangzheng@iscas.ac.cn;
 h=from:subject:message-id; bh=So+yot9otXL5vbasQ7K/8eO8HyI+tia4WGs8od+lik8=;
 b=owGbwMvMwCWmtfXriinfWuMYT6slMWTdOpEhL3hZtHGWY73HeymT08xHTWILFpkKHtWvX6wwq
 e9UzJllHaUsDGJcDLJiiiz8XvfMfc7/3MgRFrIPZg4rE8gQBi5OAZjIPD+G/wk3/wr/+cNozF53
 py11UuPdPwEvv+67cCN4w5GFtSa/12swMmzn6y01cLQr/32D0+tx3Mx9XtMv7RYR+6vOl56l9W7
 tSm4A
X-Developer-Key: i=zhangzheng@iscas.ac.cn; a=openpgp;
 fpr=0F4ADE374CCFF9B1085654BE2AB5F5A894F6855E
X-CM-TRANSID:qwCowABXKu4+yNpqo_iFCw--.1153S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWktrW8Cw13tF1fJw4Dtwb_yoWftrX_XF
	Wv9F18C3ySgF1rCan3JF15AF1xJrsrK3y8XrZ0grs3G34aqa45WFyFgryF9r1UJw43JF95
	u34qqrsxGwsFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUYKsjUUUUU
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-16d1c6/1792723022-FE87577B-14976A82/0/0
X-purgate-type: clean
X-purgate-size: 970
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 17:34:19 +0200, Baptiste Le Duc <baptiste.le-duc@vates.tech> wrote:
> p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
> RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.
> 
> The privileged spec allows exactly two schemes for updating the PTE A and D
> bits: hardware sets them on access and on write, or accessing a page whose
> A and/or D bit is clear raises a page fault so that software can set them
> (ratified as Svade). Every implementation uses one of them, but platforms
> designed before Svade and Svadu were ratified, such as the HiFive Premier
> P550, may advertise neither. Xen then cannot tell which scheme is in
> effect, so rather than guess, panic in riscv_fill_hwcap() when the device
> tree advertises neither Svade nor Svadu, so that the device tree gets
> fixed.
> 
> [...]

Tested-by: Zhang Zheng <zhangzheng@iscas.ac.cn>

-- 
Zhang Zheng <zhangzheng@iscas.ac.cn>


