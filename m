Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EFB606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=qrzIIMll
Received: from list by lists.xenproject.org with outflank-mailman.1474946.1681793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzNL-0005NN-Ql; Thu, 05 Nov 2026 15:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474946.1681793; Thu, 05 Nov 2026 15:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzNL-0005NG-Na; Thu, 05 Nov 2026 15:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1474946;
 Thu, 05 Nov 2026 15:27:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d@swg.vates.tech>)
 id 1xOzNK-0005NA-Hf
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:27:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzNJ-00B3o9-U6
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:27:37 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d@swg.vates.tech>)
 id 6aeca049-e002-0a2a0a5209dd-0a2a4507a7c2-36
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:27:37 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d@swg.vates.tech>)
 id 6aeca069-b4ea-0a2a45070019-b9ff1c238bb7-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:27:37 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ac529128000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Nov 2026 15:27:34 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E09DB803C6;
 Thu,  5 Nov 2026 16:27:28 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=L3KjkS7C3H34UZojYf1wtqzN35+uGoJRRtXvZavWavw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=qrzIIMllNsCkRASy40VemjqiAs9xpGDem29MCJaDYva9G/tWzyg+bQXxDzLrtLqRGcqbtF3Ex
 gnnVhUflMXSSfCBjJcd3CBoKWSztz1pWyshYqSjYMUpDQF9Y1cDmzHx1bM4SNvxs9Xwi6q5pz3g
 4jFXecLjtuVO9VVGdqwqwDg+5prpdDvas9z94EGXAX8ns2cJYSOhVMKEpbzsK8hBb3zgVt1XZSM
 BGSYv94faNvXmApPJ/qynElY1sVakLSdWb+Kv+uYJk/Ntndrd15oIPFluF2auCTWKkUiM0sWNuz
 u+C5CqUybqdUMhFiI2BL5hyhjQ7zq6qzsFrVXav5W2Zw==
X-Zone-Loop: 32e6bee551c956cdf796edb312026b7e1c448831d2e5
x-campaign-type: default
x-transaction-id: 9c23942b-da7b-4d2b-9053-9f36883a1375
x-swg-uid: 01-f4bf4d26-8cf5-44dc-829f-7f8899f859f9
X-Mailer: Sweego
Message-ID:
 <1793892454.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d@vates.tech>
x-swg-bid: 1793892454.8631fc262581453bbf619ec5b2062170.1a1ac529128000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 29/39] xen/riscv: prepare new IMSIC VS-file
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <81b0b1fa-1aa4-4646-bdfa-5e773cb876f4@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <7f00946a6b1b67e79f94e3c665f8f0ce9d5d0e5a.1790779209.git.oleksii.kurochko@gmail.com>
 <1792760165.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@vates.tech>
 <81b0b1fa-1aa4-4646-bdfa-5e773cb876f4@gmail.com>
Date: Thu, 05 Nov 2026 16:27:22 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793892443; l=1872;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=1tZzpf6BPXLiCxfAWVtVDWYFaE7Q6xxJ9GrDk92jLFQ=;
 b=1q3dqNrVgzUQMcp0ND0XYygNADLuILqcESeMC47v36SXbKmWDHi0xT5zQZtVEqnion7gdy3be
 IANJFtfKATUAJHbxfjETejLCx64KGGTm74xKsortD7VVYSassT9ptfG
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793892449125
X-purgate-ID: tlsNG-ef75cf/1793892457-A46CAAE4-FF3D0378/0/0
X-purgate-type: clean
X-purgate-size: 1872
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 13:49 +0100, Oleksii Kurochko wrote:
> [ ... 79 lines skipped ... ]
> >> +
> > What does the switch buy? ireg only ends up as the value written to
> > vsiselect, not as a CSR number, so it doesn't need to be a compile-time
> > constant. imsic_vs_csr_write(ireg, val) does the same, without the 128 case
> > labels and the macro pyramid. If there's a reason, it wants stating in a
> > comment; otherwise please drop the pyramid (an ASSERT() on the range can
> > stay if you want one).
> 
> Good point.
> 
> I will drop it and use the following instead:
> 
> /*
>   * On RV64 a 64-bit EIx group is the even-numbered register alone, 
> whereas on
>   * RV32 it is split into the even-numbered (low half) and the following
>   * odd-numbered (high half) register. ireg names the first, even-numbered
>   * register of such a group, among eip0..eip63 or eie0..eie63.
>   */
> static void imsic_eix_check(unsigned int ireg)
> {
>      ASSERT(!(ireg & 1));
>      ASSERT((ireg >= IMSIC_EIP0 && ireg < IMSIC_EIP0 + 64) ||
>             (ireg >= IMSIC_EIE0 && ireg < IMSIC_EIE0 + 64));
> }
> 
> /* Write a whole 64-bit EIx group, laid out as described above. */
Nit: "above" may go stale if the code moves. Better to name the function
you are referring to.

Also, the parameter isn't an *ireg value. It is the register number
written to *iselect; *ireg is only the data window. Per AIA (IMSIC
chapter, "Interrupt files"), values 0x80-0xFF of *iselect select
eip0-63/eie0-63, and imsic_csr_write() uses its first argument that way:

#define imsic_csr_write(c, v)   \
do {                            \
    csr_write(CSR_SISELECT, c); \
    csr_write(CSR_SIREG, v);    \
} while (0)

So I'd rename it to "iselect" (here and in the other helpers taking
the same argument).

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

