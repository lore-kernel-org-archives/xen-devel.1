Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C076C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 20:56:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF832256F
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 20:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF832256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74489.133904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l48uU-00051s-1D; Mon, 25 Jan 2021 20:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74489.133904; Mon, 25 Jan 2021 20:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l48uT-00051l-To; Mon, 25 Jan 2021 20:56:29 +0000
Received: by outflank-mailman (input) for mailman id 74489;
 Mon, 25 Jan 2021 20:56:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l48uS-00051g-Bj
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 20:56:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfa28446-76f2-4d95-a74d-5c85c7d01fd5;
 Mon, 25 Jan 2021 20:56:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B49B022513;
 Mon, 25 Jan 2021 20:56:26 +0000 (UTC)
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
X-Inumbo-ID: dfa28446-76f2-4d95-a74d-5c85c7d01fd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611608187;
	bh=Z9CHsSmHqrpm+3+bBi+YUZ5x9bExTaKJpemIuLcqKMo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iTFwAlI42fUR5VFH+wGXj7TZXvuYaZknWSo9sGib6WAufrJcrnyNnlDNdYKG3NuWd
	 rqsifLuAsp5GK8YQ00ZivzA625WbDxskTT1Qcz+sDszeXTJZHb5VjLZanOSjjzk7hv
	 IJ6WCzxBUsdk1tgTsGMZ04HjPTsl6zTi0gxdMeXTJUB0ziTyfkfyYU9ul9lsqHKeBT
	 A0sgWNUWQ6RVW1YeV1mndDhmbmC9k9ILjNXq71Dug+6mLmmBAB+9vYp4In5BkAoIhO
	 EDGE6hM9/Wlf3M13LwNRr7dkwP3KUZ7SchmnW3JKRlfLdnfpqGUm/0Vc4hRo1AjFSv
	 D0Y9PH+OgXq5A==
Date: Mon, 25 Jan 2021 12:56:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: famzheng@amazon.com, sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
In-Reply-To: <161160798888.13183.15031685460985886988@c667a6b167f6>
Message-ID: <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
References: <161160798888.13183.15031685460985886988@c667a6b167f6>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Julien,

This seems to be an arm randconfig failure:

https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044


On Mon, 25 Jan 2021, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline near the end of the report below:
> 
> Type: series
> Message-id: 1611601709-28361-1-git-send-email-olekstysh@gmail.com
> Subject: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===
> 
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>  * [new tag]               patchew/1611601709-28361-1-git-send-email-olekstysh@gmail.com -> patchew/1611601709-28361-1-git-send-email-olekstysh@gmail.com
> Switched to a new branch 'test'
> 51c66995c4 xen/arm: Add mapcache invalidation handling
> ac18dce945 xen/ioreq: Make x86's send_invalidate_req() common
> bff65c909c xen/arm: io: Harden sign extension check
> db7d33509b xen/arm: io: Abstract sign-extension
> 49d920436c xen/dm: Introduce xendevicemodel_set_irq_level DM op
> 9f750615ff xen/ioreq: Introduce domain_has_ioreq_server()
> 8bcf50987f xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
> 54b6d5517d xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
> c54d6b6a4c arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 955655a87c xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
> ff3da51e59 xen/ioreq: Remove "hvm" prefixes from involved function names
> f2d022b8d2 xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
> dc137ff63c xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
> da63f74717 xen/ioreq: Make x86's IOREQ related dm-op handling common
> 53ed326f85 xen/ioreq: Move x86's ioreq_server to struct domain
> 6eb4a9b103 xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
> 9198aac40e xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
> 64669ca3f1 xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
> 64ed7b62fb xen/ioreq: Make x86's IOREQ feature common
> 8fc382a03b x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
> 1aac704b38 x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
> ab818a53dc x86/ioreq: Prepare IOREQ feature for making it common
> 
> === OUTPUT BEGIN ===
> [2021-01-25 19:28:41] Looking up pipeline...
> [2021-01-25 19:28:42] Found pipeline 246632953:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
> 
> [2021-01-25 19:28:42] Waiting for pipeline to finish...
> [2021-01-25 19:43:46] Still waiting...
> [2021-01-25 19:58:50] Still waiting...
> [2021-01-25 20:13:55] Still waiting...
> [2021-01-25 20:29:00] Still waiting...
> [2021-01-25 20:44:04] Still waiting...
> [2021-01-25 20:53:07] Pipeline failed
> [2021-01-25 20:53:08] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'qemu-smoke-x86-64-clang' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'qemu-smoke-arm64-gcc' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'qemu-alpine-arm64-gcc' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'build-each-commit-gcc' in stage 'test' is skipped
> [2021-01-25 20:53:08] Job 'debian-unstable-gcc-debug-arm64-randconfig' in stage 'build' is failed
> [2021-01-25 20:53:08] Job 'debian-unstable-gcc-arm64-randconfig' in stage 'build' is failed
> [2021-01-25 20:53:08] Job 'alpine-3.12-clang-debug' in stage 'build' is failed
> [2021-01-25 20:53:08] Job 'alpine-3.12-clang' in stage 'build' is failed
> [2021-01-25 20:53:08] Job 'alpine-3.12-gcc-debug' in stage 'build' is failed
> [2021-01-25 20:53:08] Job 'alpine-3.12-gcc' in stage 'build' is failed
> === OUTPUT END ===
> 
> Test command exited with code: 1

