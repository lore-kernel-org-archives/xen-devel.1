Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78BC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:47:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412240.1642780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3y2v-0005qj-3w; Tue, 08 Sep 2026 15:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412240.1642780; Tue, 08 Sep 2026 15:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3y2v-0005qc-19; Tue, 08 Sep 2026 15:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1412240;
 Tue, 08 Sep 2026 15:47:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3@swg.vates.tech>)
 id 1x3y2t-0005qW-7h
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:47:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3y2s-004YPJ-Cn
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:47:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3@swg.vates.tech>)
 id 6aa02e17-bab6-0a2a0a5309dd-0a2a4505b926-6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:47:38 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3@swg.vates.tech>)
 id 6aa02e19-4cb1-0a2a45050019-b9ff1c229485-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:47:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a081b40589000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 08 Sep 2026 15:47:33 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0EF7E81E3D;
 Tue,  8 Sep 2026 17:47:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iobqbY4hXcgl0TKnlbtRriDRQECHZAFhR21sU2egqo8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=M77+4bfeJKBHs1i4JrFEU/y33odOEEHf+CVU+JKewss7AsLK65CkHDNZstBW89t4A0R9rjXP/
 xWzNE2OEudGUT5g606CpxC8wBW5z+38l/r+lQ1I3JW9rTi85m2yYpoKp5gADrHpFfyXXzAypaBX
 Vt2Xbb0wYFMl2M1A6dCJtnnLQVvK1J2LRlpnxr4CnTOVNEJ5HIMbwZDgOyMF/wXAWFQTipAFiT/
 l1YNtRDTpqfLUHQeJ+kJ7Jt1U6RhKTiwhUxgVCg5RsD2SEx0IB+pYLwCLuJuJxL/T1XlBAouu+g
 DaVblQ/795DA2a71lf9NTxcj7+NBLAFOr42lwqq08FtQ==
X-Zone-Loop: 970be37ace34271542d862f43924bebadcc113fba6b1
x-campaign-type: default
x-transaction-id: a4c5344e-8a63-4b2c-a7a8-2ba981e482a5
x-swg-uid: 01-8ca27ab0-8393-4503-b7a4-20a5be144845
X-Mailer: Sweego
Message-ID:
 <1788882453.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3@vates.tech>
x-swg-bid: 1788882453.8631fc262581453bbf619ec5b2062170.1a081b40589000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a
 guest
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
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
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
In-Reply-To: <da081e7c-eca8-48bc-b62d-bc84a9c09d7f@suse.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c96862b000c4f3@vates.tech>
 <2f734f0a-7f3e-4e27-82ed-52ccf72fe49a@gmail.com>
 <72b89a0c-ad0e-4c1d-97f7-92f49ede7a55@gmail.com>
 <da081e7c-eca8-48bc-b62d-bc84a9c09d7f@suse.com>
Date: Tue, 08 Sep 2026 17:47:27 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788882453; l=2072;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=uRTs1NB5ei0hRJUPFWWuFHGD3/kb2+HU9VJNB94eJB0=;
 b=BCr0SMUn08tyEsLZRlDyLA9W2rb5XPa0z6+BNe/xmOIeQpR/2Za9vcCVumPPIfYk5GVWpXCJ9
 RmqpyLKl1/cDEURihL+na/Q0R4on3by0fm6ZAkIxdevoEGpwODJQU4d
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788882453275
X-purgate-ID: tlsNG-c201ff/1788882458-720AA2A1-FA8700D6/0/0
X-purgate-type: clean
X-purgate-size: 2076

On 2026-09-08 17:05 +0200, Jan Beulich wrote:
> On 08.09.2026 16:58, Oleksii Kurochko wrote:
> > On 9/8/26 12:01 PM, Oleksii Kurochko wrote:
> >> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
> >>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> >>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> >>>> @@ -109,6 +109,12 @@
> >>>>   #define SIP_SSIP            MIP_SSIP
> >>>>   #define SIP_STIP            MIP_STIP
> >>>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
> >>>> +#define STVEC_MODE_MASK            _UL(0x3)
> >>>> +#define STVEC_MODE_DIRECT        _UL(0x0)
> >>>> +#define STVEC_MODE_VECTORED        _UL(0x1)
> >>>> +#define STVEC_BASE_MASK            (~STVEC_MODE_MASK)
> >>> Nit: STVEC_MODE_DIRECT and STVEC_MODE_VECTORED aren't used anywhere in
> >>> this patch (only STVEC_BASE_MASK is). Either use them where you decide
> >>> exceptions always target BASE regardless of MODE, or drop them until a
> >>> patch that needs them.
> >>
> >> IMO it is fine to introduce *_DIRECT/VECORED here as they are used 
> >> implicitly through STVEC_BASE_MASK and thereby it will be better to 
> >> introduce them here now instead of open-code them and then just update 
> >> STVEC_BASE_MASK again when *_DIRECT/VECORED will be re-introduced.
> >>
> > 
> > Oh, sorry, you are right. STVEC_MODE_DIRECT and STVEC_MODE_VECTORED are 
> > really not used here (in this implementation). I planned to do:
> > 
> > #define STVEC_MODE_MASK (STVEC_MODE_DIRECT | STVEC_MODE_VECTORED)
> > 
> > But I missed to do in that way.
> > 
> > I will update the defintion of STVEC_MODE_MASK in suggested above way.
> 
> But that's yield a mask value of 1, when you want it to be 3. That ORing
> together looks bogus to me anyway.
>
Yes I agree. It might be enough, for the moment, to only keep #define
STVEC_MODE_MASK _UL(3) and drop the others defines (even STVEC_BASE_MASK as Jan
mentioned the comment in the caller is already precise enough).
> 
> Jan
> 
> 



