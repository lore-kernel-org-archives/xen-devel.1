Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E29A606A33E
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 13:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=YtxB7N8Q
Received: from list by lists.xenproject.org with outflank-mailman.1476637.1682658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPKEl-0001QR-Ra; Fri, 06 Nov 2026 13:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476637.1682658; Fri, 06 Nov 2026 13:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPKEl-0001QK-OS; Fri, 06 Nov 2026 13:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1476637;
 Fri, 06 Nov 2026 13:44:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b11a2e1a000403d@swg.vates.tech>)
 id 1xPKEj-0001QE-OA
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:44:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPKEj-003kTF-4e
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 14:44:09 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b11a2e1a000403d@swg.vates.tech>)
 id 6aedd9a8-8faa-0a2a0a5109dd-0a2a450383a0-4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:44:09 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b11a2e1a000403d@swg.vates.tech>)
 id 6aedd9a8-fae8-0a2a45030019-b9ff1c23ab21-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:44:08 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b11a2e1a000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 13:44:05 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 909D580416;
 Fri,  6 Nov 2026 14:44:04 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=/TvEk6rbEzKdLV7NSF3EKKc1FjauMKggJXhhVgSjG3Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YtxB7N8QmAy0nWbAA9yMe/ZU+JWYEVXoke1esJT8lWm/3iDbhyDcdR+cmxDHNs4tWhbTpKEA1
 9lPCtHHOzk7lIGso3OiarNdDxP0kOfdGp2Chn/qEX/aC5lLNh7lwIad6VtQcB8yLK/fLvyCeLSh
 v28ZPIBXLiTWZLOO8WlMPdyecu3QZd3Nyh5iKzjCzFrd4PbzYWbQL5CwJmGRMAqdyhCEVRErV0T
 pZiV70qwVjJkWvqQIY4GOwx9BALguW/V+UY8P0f9CYfjxKXG1gSRp2BVDKNDtWLUZKFShDsd8lp
 DbfX7WmIOz+qAEYODy9MxVjxXg05FXYNzZYVPbFNIdzg==
X-Zone-Loop: 4f466094ccd2f5746281ceffb4782a637957f3cf2f9a
x-campaign-type: default
x-transaction-id: 0260ac0f-d97f-4a57-b0ea-3c9220e62fdd
x-swg-uid: 01-49daab48-3d64-40a6-a8a5-ef7cf5ec4695
X-Mailer: Sweego
Message-ID:
 <1793972645.8631fc262581453bbf619ec5b2062170.1a1b11a2e1a000403d@vates.tech>
x-swg-bid: 1793972645.8631fc262581453bbf619ec5b2062170.1a1b11a2e1a000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 38/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
In-Reply-To: <ac014a57-5a77-41aa-a3e3-39e5764acf2f@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <0c65801cec7cdac1556abc610e076f33c1500d1f.1790779209.git.oleksii.kurochko@gmail.com>
 <1793803069.8631fc262581453bbf619ec5b2062170.1a1a6fea90d000403d@vates.tech>
 <ac014a57-5a77-41aa-a3e3-39e5764acf2f@gmail.com>
Date: Fri, 06 Nov 2026 14:43:59 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793972639; l=1197;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=5Hg6cDvlpRb2O9uDkxiPlTO04RYjyWGwyieZ0el42JE=;
 b=Aa3XLjVKqrRQBNtrMhQKL51o5RL1RKI9CLtlU952ie7oc0cSWR09HkImdBLgEgXFD8DTjm8PY
 9VCa1RWAvuyDg+Kqjrf239LxDrHIRp4Lxos+FT2vwDjuZ/Bp/HhOe+6
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793972644817
X-purgate-ID: tlsNG-33051d/1793972648-756834E9-15F413F5/0/0
X-purgate-type: clean
X-purgate-size: 1197
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-06 12:59 +0100, Oleksii Kurochko wrote:
> [ ... 33 lines skipped ... ]
> I'd rather not: d->type is an enum, and for those Xen deliberately omits
> the default label, as -Wall enables -Wswitch, which breaks the build
> (-Werror) if one of the enum's values isn't handled. 
I didn't know that, so yes, you're right it's better to keep without default.
> A default label
> would silence exactly that check. MISRA-wise this is covered by the
> R16.4 deviation for switches on enums.
> 
> I'll move the explanation into the switch() itself, though, and mention 
> -Wswitch there, which should make the intent clearer:
> 
> ...
>      case DOMAIN_64BIT:
>          return XLEN_FIELD_64;
> 
>      /*
>       * No default case: -Wswitch then fails the build should a new
>       * domain_type (a 128-bit one, in particular) be added without
>       * updating this mapping.
>       */
More clear, thanks.
> [ ... 44 lines skipped ... ]
> Your suggested rewording looks good to me. I'll take your wording, and 
> name kernel_probe() in the commit message as well, which has the same 
> ambiguity.
Agree, thanks.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

