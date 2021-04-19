Return-Path: <SRS0=K98N=JQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC09C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 19 Apr 2021 18:25:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA9D611EE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Apr 2021 18:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA9D611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113144.215581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYYZx-0006da-Kb; Mon, 19 Apr 2021 18:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113144.215581; Mon, 19 Apr 2021 18:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYYZx-0006dT-HS; Mon, 19 Apr 2021 18:25:01 +0000
Received: by outflank-mailman (input) for mailman id 113144;
 Mon, 19 Apr 2021 18:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lYYZw-0006dN-0e
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 18:25:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23c9dfd5-a75d-4d84-a10d-4850bc5870ca;
 Mon, 19 Apr 2021 18:24:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 339A861370;
 Mon, 19 Apr 2021 18:24:54 +0000 (UTC)
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
X-Inumbo-ID: 23c9dfd5-a75d-4d84-a10d-4850bc5870ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618856694;
	bh=Ckd53ZRVukdXyTdKKqcxF2Vz6VC+57XJ03WIbdOLans=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gZYO1zESC3jx51q7Ap3VuMT0b9YR588QnWlz46FnHHo1F8R4EkS4PSLyI9N6Hg2Yz
	 FsMK4LPZm+LkEArElyUdvvQOm8Pq9VvAy+xIAYQGfY9p3kSqHjnAUt6njZ4Z7QJxSF
	 +8ATZWbeEnpkBC6FddArJGgJc6Z/4X6BreOiRpjIm7G+9yGLyYMUFyy6lUTerXlTHT
	 pYqqvwJV79ghf6mRviNwHSyPhqzHhVxsd45M9NMpqX1TLiH51ac6xh7ofHxvVdpE+q
	 TWlqUEg2ocOrfZnTZIQB3kSvrLfl53AYqkkRJ8mO1fsvYGMjNdYKkBmbNqIeNdsuwg
	 XDR3tlKpTlYKg==
Date: Mon, 19 Apr 2021 11:24:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4] xen/arm64: Place a speculation barrier following an
 ret instruction
In-Reply-To: <0433E681-2E59-42B2-88FB-94A56EF2E303@arm.com>
Message-ID: <alpine.DEB.2.21.2104191124440.4885@sstabellini-ThinkPad-T480s>
References: <20210418180334.7829-1-julien@xen.org> <0433E681-2E59-42B2-88FB-94A56EF2E303@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Apr 2021, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 18 Apr 2021, at 19:03, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > Some CPUs can speculate past a RET instruction and potentially perform
> > speculative accesses to memory before processing the return.
> > 
> > There is no known gadget available after the RET instruction today.
> > However some of the registers (such as in check_pending_guest_serror())
> > may contain a value provided by the guest.
> > 
> > In order to harden the code, it would be better to add a speculation
> > barrier after each RET instruction. The performance impact is meant to
> > be negligeable as the speculation barrier is not meant to be
> > architecturally executed.
> > 
> > Rather than manually inserting a speculation barrier, use a macro
> > which overrides the mnemonic RET and replace with RET + SB. We need to
> > use the opcode for RET to prevent any macro recursion.
> > 
> > This patch is only covering the assembly code. C code would need to be
> > covered separately using the compiler support.
> > 
> > Note that the definition of the macros sb needs to be moved earlier in
> > asm-arm/macros.h so it can be used by the new macro.
> > 
> > This is part of the work to mitigate straight-line speculation.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

