Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A9CA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:28:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442031.1659547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN0u-00083m-RZ; Wed, 07 Oct 2026 08:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442031.1659547; Wed, 07 Oct 2026 08:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN0u-00083f-Ou; Wed, 07 Oct 2026 08:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1442031;
 Wed, 07 Oct 2026 08:28:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1157a77720003f66@swg.vates.tech>)
 id 1xEN0t-00083Z-42
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:28:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEN0r-00Bm35-Ko
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:28:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1157a77720003f66@swg.vates.tech>)
 id 6ac602aa-bab6-0a2a0a5309dd-0a2a45079c82-14
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:28:33 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1157a77720003f66@swg.vates.tech>)
 id 6ac602b0-b4ea-0a2a45070019-b9ff1c23a1ed-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:28:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1157a77720003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 08:28:29 +0000
Received: from [192.168.1.17] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 33F2381F2B;
 Wed,  7 Oct 2026 10:28:29 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=qIkZ+a1KoGAxP/lnvgZm+8EOQN8dXV21ZS1R8VY/MMg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=tvnik4BPKuPau6L36RKpzJK9kP6rhRgBzYug97xUD4r9HlVDh5JVfYkRRmlxOmJr5rPZWGSHg
 nxdzBlte7BcQ56RLEhnq78mYweWb4mMJ9SjKtbryAW8NUW4LT9ylyhAFB7CVQdJDFpi0TpJWwny
 5UVh2r+gdl8G6NteCsctFHOvDq2k8ahYEdggRKu4NAkqDyyFElcP8DPHgcBdAZk1rg8h6GQ/GeR
 MnWhl/5XJsws2IjxOfNVkric6DTsQWhROtzu8GfbpvjKbe5ptUpOWSWpG7Ms1T41gq2o+nNpaLa
 dyzizWRTS2eC0AMhBjBSOxsIFWkHC0awJ8OKo1OOQudg==
X-Zone-Loop: 54648ba53d8986a92f9f41d56634693e085a46c26df9
x-campaign-type: default
x-transaction-id: 8cb1486e-4714-434b-a759-a1a819c474f4
x-swg-uid: 01-2100764c-f83a-4b4c-b3ac-9e693dc3d7c9
X-Mailer: Sweego
Message-ID:
 <1791361710.8631fc262581453bbf619ec5b2062170.1a1157a77720003f66@vates.tech>
x-swg-bid: 1791361710.8631fc262581453bbf619ec5b2062170.1a1157a77720003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2d5f2558-e4f7-43d5-888c-36727519270d@suse.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
 <1791305420.8631fc262581453bbf619ec5b2062170.1a1121f8fef0003f66@vates.tech>
 <2d5f2558-e4f7-43d5-888c-36727519270d@suse.com>
Date: Wed, 07 Oct 2026 10:27:30 +0200
X-Developer-Signature: v=1; a=openssh-sha256; t=1791361709; l=1374;
 i=baptiste.le-duc@vates.tech; h=from:subject:message-id;
 bh=B7EBBZ55K7PX7Zp//Piz5dkiUp8tYHWwTqgPL6BclH8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgQKqDblDzOFimZyyhA+RsKnxim2EiA
 60KatQBsuueKYUAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDnXNO6Q3pqnoNYfCUZRKU4+n2YAmAi5APU5ZrSZGq1Id+WZ0ifGg6KN/HzYYXAE0Jvrk5RaLRv
 jFZXMxbFDWAw=
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=openssh;
 fpr=SHA256:YieMhmvNcCYpeUbL6HuedGp4rwSlu4mQ+D7EJoVHM+k
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791361709459
X-purgate-ID: tlsNG-ef75cf/1791361713-366DAAE4-F99999EB/0/0
X-purgate-type: clean
X-purgate-size: 1378

On 2026-10-07 10:04:12+02:00, Jan Beulich wrote:
> On 06.10.2026 18:50, Baptiste Le Duc wrote:
> 
> >> Implement context_switch() and the helpers it needs: save/restore of
> 
> First: None of the reply context above is relevant in your reply. Why
> did you keep it? As indicated before, this way you make every reader
> scroll through many lines, until they would finally find the first
> piece of the actual reply. (I've deliberately kept it all, to show
> the percentage of the overall reply that this occupied.)
> 
Yes sorry, I thought b4 would have trimmed for me. I would be careful
about that in next replies.
> >> --- a/xen/arch/riscv/include/asm/csr.h
> > This violates Misra 20.12 rule (docs/misra/rules.rst) as we use macro
> > parameter `csr` as an operand of ##, while it could be expanded as a
> > macro (e.g. csr_read64(CSR_HENVCFG)).
> 
> Yes. But: You say nothing as to a possible (and plausible) different
> way of coding this. Imo the best way to deal with this is by a
> deviation (iirc we already have a few), yet I don't think we're going
> to add deviations for RISC-V until we actually are about to routinely
> scan the code.
I didn't propose anything because I didn't have any other way to code
this. Concerning the fact to not add deviation for RISC-V I agree that
it doesn't make too much sense for the moment.
> 
> Jan



