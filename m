Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52022C64E8A
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:22:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB2D20872
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB2D20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42502.76437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOKu-0002vO-W4; Wed, 02 Dec 2020 09:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42502.76437; Wed, 02 Dec 2020 09:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOKu-0002vH-Rf; Wed, 02 Dec 2020 09:22:08 +0000
Received: by outflank-mailman (input) for mailman id 42502;
 Wed, 02 Dec 2020 09:22:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkOKt-0002v7-Ec
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 09:22:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkOKt-0004px-6J; Wed, 02 Dec 2020 09:22:07 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkOKs-0006CD-Ts; Wed, 02 Dec 2020 09:22:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=vKZWz15kBurVPlkeTgoU9pGf8p6XxQhWGrIoZqzdY1Y=; b=oiQDxnmwrAIF3w4tm3iFsKizQb
	waNBxZ9qTXlgJoJS6B7Ma07LKIG5oHnd+RxpTJ59ohLctwgXSui30oXwz7krwdeGcuTFHoVtryjFp
	n8BkvC30vWcksXlVYX/dQq2ZK8pgK/ALVOjyv9UEEtdIjsA5oXsfCczxJh4zrcMqZ6Zw=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v4 00/11] viridian: add support for ExProcessorMasks
Date: Wed,  2 Dec 2020 09:21:56 +0000
Message-Id: <20201202092205.906-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (11):
  viridian: don't blindly write to 32-bit registers is 'mode' is invalid
  viridian: move flush hypercall implementation into separate function
  viridian: move IPI hypercall implementation into separate function
  viridian: introduce a per-cpu hypercall_vpmask and accessor
    functions...
  viridian: use hypercall_vpmask in hvcall_ipi()
  viridian: use softirq batching in hvcall_ipi()
  viridian: add ExProcessorMasks variants of the flush hypercalls
  viridian: add ExProcessorMasks variant of the IPI hypercall
  viridian: log initial invocation of each type of hypercall
  viridian: add a new '_HVMPV_ex_processor_masks' bit into
    HVM_PARAM_VIRIDIAN...
  xl / libxl: add 'ex_processor_mask' into
    'libxl_viridian_enlightenment'

 docs/man/xl.cfg.5.pod.in             |   8 +
 tools/include/libxl.h                |   7 +
 tools/libs/light/libxl_types.idl     |   1 +
 tools/libs/light/libxl_x86.c         |   3 +
 xen/arch/x86/hvm/viridian/viridian.c | 604 +++++++++++++++++++++------
 xen/include/asm-x86/hvm/viridian.h   |  10 +
 xen/include/public/hvm/params.h      |   7 +-
 7 files changed, 516 insertions(+), 124 deletions(-)

-- 
2.20.1


