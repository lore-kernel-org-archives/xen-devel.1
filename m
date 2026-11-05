Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C9D606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=qmv4zQ5S
Received: from list by lists.xenproject.org with outflank-mailman.1474342.1681475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOtsk-0001ve-Cu; Thu, 05 Nov 2026 09:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474342.1681475; Thu, 05 Nov 2026 09:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOtsk-0001vX-9L; Thu, 05 Nov 2026 09:35:42 +0000
Received: by outflank-mailman (input) for mailman id 1474342;
 Thu, 05 Nov 2026 09:35:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ab105625000403d@swg.vates.tech>)
 id 1xOtsi-0001vR-OR
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:35:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOtsi-003B5q-1J
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:35:40 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ab105625000403d@swg.vates.tech>)
 id 6aec4de5-bab6-0a2a0a5309dd-0a2a4503c7ee-22
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 10:35:40 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ab105625000403d@swg.vates.tech>)
 id 6aec4deb-fae8-0a2a45030019-b9ff1c23b5bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 10:35:39 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ab105625000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Nov 2026 09:35:36 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 37253822A7;
 Thu,  5 Nov 2026 10:35:36 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=TbJs2qfiRB1QJR/1SOip5yCkZeDctP1WaCPZKdlU4y8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=qmv4zQ5SwsH5RdfMuZt+bjmUmOWXvvyh5hDlWi2ZrYuQ9tU/GhH0s0ZhnbSL1G/454+kIgw94
 MezPzt78efaSY7ChSRiZ6AccJL7NEY5GVvIDCZ7XZtxQ7cfGn6Bcvr+I++uO+hkjfGLR06gztTT
 IXXyJlg3YPexic2k7vMn7mupUuF6QCR1bE2Id15M6IoEf0tiahuJtgqjdso5W939+yvSLGbKCct
 QDK/3YY2LIBBWPNMnOoaI8gBrgqhE78Y1IcpOOeYp/B+3Jc7GXSBsRceekNC8NMfmyfeiVAg484
 ZBf0Y9D8jkkIE9/PmagFNl35UZtNGzA5K4xHhfpijvrQ==
X-Zone-Loop: 50198758e2b1a83b0e0a62813211d85891a87a12d990
x-campaign-type: default
x-transaction-id: 413ea06a-2e00-482e-b5a9-f04cc38709ba
x-swg-uid: 01-3efe862d-3878-45cd-ad50-911c2e7b651b
X-Mailer: Sweego
Message-ID:
 <1793871337.8631fc262581453bbf619ec5b2062170.1a1ab105625000403d@vates.tech>
x-swg-bid: 1793871337.8631fc262581453bbf619ec5b2062170.1a1ab105625000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 23/39] xen/riscv: add helpers for decoding a trapped
 load or store
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
In-Reply-To: <8f6c0cd1-f5fc-4a1d-8752-3da42a52a710@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bac190288e65f82ef51d85e32c939558c21776d0.1790779209.git.oleksii.kurochko@gmail.com>
 <1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@vates.tech>
 <8f6c0cd1-f5fc-4a1d-8752-3da42a52a710@gmail.com>
Date: Thu, 05 Nov 2026 10:35:30 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793871330; l=3162;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=2aZhO8tZjKWw5OJNQPyFqsqpLDGN6/5eMuwCyMBi30M=;
 b=QoO2R370WQ34O4AB4eq9FAJXPAAXHI5l0/RehwdC5ro7JXEaFnM1YhDb2tl+kadSjltPPUSkD
 hnMQZNTwG/jDOFIpXWY9rDZ2VWeSxTMpmMn1CAK8WPBSvy9l2m13GCY
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793871336437
X-purgate-ID: tlsNG-33051d/1793871339-752854E9-A8EBCABE/0/0
X-purgate-type: clean
X-purgate-size: 3162
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 17:38 +0100, Oleksii Kurochko wrote:
> [ ... 147 lines skipped ... ]
> >> +        /*
> >> +         * Bit[0] == 0 implies trapped instruction value is zero or special
> >> +         * value. With the pseudoinstructions ruled out above, only zero (or a
> >> +         * custom value, see above) is left: the instruction has to be read from
> >> +         * guest memory.
> > Nit: as the assert would disappears in release build, this comment is
> > partially true. I would suggest something like:
> > ```
> >           * Bit[0] == 0 implies trapped instruction value is zero or
> >           * special value. With the pseudoinstructions ruled out (see
> >           * comment above) only zero (or a custom value, see above) is
> >           * left: the instruction has to be read from guest memory.
> > ```
> > 
> 
> Agree "ruled out" could be read incorrectly. I think it will be better then:
> 
>           /*
>            * Bit[0] == 0 implies trapped instruction value is zero or 
> special
> -         * value. With the pseudoinstructions ruled out above, only 
> zero (or a
> -         * custom value, see above) is left: the instruction has to be 
> read from
> -         * guest memory.
> +         * value. Pseudoinstructions never get here (see the comment 
> ahead of
> +         * the ASSERT() above), so only zero (or a custom value, see 
> above) is
> +         * left: the instruction has to be read from guest memory.
>            */
Agree.
> [ ... 6 lines skipped ... ]
> >> +            /*
> >> +             * If during getting of trapped instruction a fault happen in
> >> +             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
> >> +             * generated. Such faults during this operation is considered as
> >> +             * bus error.
> > Typo: "Such faults ... are considered" (plural subject). Also "a fault
> > happen" above should be "a fault happens", and "as bus error" -> "a
> > bus error". Maybe:
> > 
> >      /*
> >      * If a G-stage translation fault happens while fetching the
> >      * trapped instruction, CAUSE_LOAD_GUEST_PAGE_FAULT is generated.
> >      * Such faults are treated as an access fault.
> >      */
> > I used access fault instead of bus error because the code below sets
> > CAUSE_FETCH_ACCESS which is more like an access fault.
> > 
> 
> Suggestion LGTM with one nit that "... instruction acccess fault" + 
> mentioned of that it is because of hlvx instruction so:
> 
>               /*
> -             * If during getting of trapped instruction a fault happen in
> -             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
> -             * generated. Such faults during this operation is 
> considered as
> -             * bus error.
> +             * If a G-stage translation fault happens while fetching the
> +             * trapped instruction, CAUSE_LOAD_GUEST_PAGE_FAULT is 
> generated,
> +             * hlvx being a load. Such a fault is reported to the guest 
> as an
> +             * instruction access fault.
Agree.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

