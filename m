Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6EDC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 20:21:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407675.1640625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2DvY-0004Cl-Th; Thu, 03 Sep 2026 20:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407675.1640625; Thu, 03 Sep 2026 20:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2DvY-0004Cd-PE; Thu, 03 Sep 2026 20:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1407675;
 Thu, 03 Sep 2026 20:20:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1x2DvX-0004CX-Ll
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 20:20:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2DvW-004kUU-HW
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 22:20:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a99d690-bab6-0a2a0a5309dd-0a2a4504d712-18
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:20:50 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <tglx@kernel.org>)
 id 6a99d6a0-b57f-0a2a45040019-aceafc1fb2ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:20:50 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C2A740E20;
 Thu,  3 Sep 2026 20:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564641F000E9;
 Thu,  3 Sep 2026 20:20:47 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:In-Reply-To:References:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788466848;
	bh=2p+gZUX1lywqlPgIj4po3j9VmppV3CjsC0U+DQIfxj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nQO5w9M8u/O0h/rNT81unSxjiltu3uhgADJgzfQJmDKoL7io3aqNaZtffq2vbjc7I
	 q2UtZlhWSdBVQQEMGNCbRru5irWASsLl+Ko9DJvHMUgAcZtEpg9/gnfDd7nhpwWTSg
	 SFRomvsXXqfy2hx/yIiHkUMB+GMBw92T43tk4V8JFP0ajhIGm/9fpmXwZ1sFNlcqJB
	 kryC25dRb1rtpj1utmwn8LWv95iRM+XaFQ7xGKPUMizOmk/aSnWEZ9WvZCo4BvPhr7
	 Bx7fCrGhNz+ObSNjjir0c7/XphKv+8j4ewACBpXHQl5QgRsKJSadaFsove9+nu3aKI
	 hcgaWF48Ao6fw==
From: Thomas Gleixner <tglx@kernel.org>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: Daniil Tatianin <99danilt@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Steve Wahl <steve.wahl@hpe.com>, Justin Ernst <justin.ernst@hpe.com>, Kyle
 Meyer <kyle.meyer@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Russ Anderson <russ.anderson@hpe.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Daniil
 Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH] x86/apic: Remove dead disable_esr machinery
In-Reply-To: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
References: <20260902220124.2931854-1-d-tatianin@yandex-team.ru>
Date: Thu, 03 Sep 2026 22:20:45 +0200
Message-ID: <87tso69jdu.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-ebf023/1788466850-524CBB50-572E7F4A/0/0
X-purgate-type: clean
X-purgate-size: 263

On Thu, Sep 03 2026 at 01:01, Daniil Tatianin wrote:

> From: Daniil Tatianin <99danilt@gmail.com>
...
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Seems you can't decide which of your alter egos is author and signing
off on the patch.


