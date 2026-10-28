Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45731606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=evVGXFAU
Received: from list by lists.xenproject.org with outflank-mailman.1463222.1674157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM330-0001rW-7C; Wed, 28 Oct 2026 12:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463222.1674157; Wed, 28 Oct 2026 12:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM330-0001rP-2d; Wed, 28 Oct 2026 12:46:30 +0000
Received: by outflank-mailman (input) for mailman id 1463222;
 Wed, 28 Oct 2026 12:46:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM32y-0001rC-Qf
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:46:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM32y-002HXl-7Q
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 13:46:28 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1828c1ad0000f79f@swg.vates.tech>)
 id 6ae1ee98-2eae-0a2a0a5409dd-0a2a4507bcba-40
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:46:28 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1828c1ad0000f79f@swg.vates.tech>)
 id 6ae1eea3-b4ea-0a2a45070019-b9ff1c22942d-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 13:46:28 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1828c1ad0000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 12:46:22 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6053A82A1D;
 Wed, 28 Oct 2026 13:46:21 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=uQYdS+wl92dLu7h0PgVq9ER68frsYKqeVfd++TYZlMQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=evVGXFAUtrKHhl75AchDEfQcyFfh9py45SB5yE5cfUfP1P8jWAZTwFUZdWstBgD5d3q9uGqbV
 jLvd/CJBTKRWFuFE6tM21w9sKM4vE12NJhORuGGIwXKVjqPf6r4alrlL0/H726A9OHfTvWaujgj
 kXWsjylLi+ZP/J9AYfk8fo9RsWt2XR5K95JTzuV/e+4TiCEcViyCu8c3WrILN6UNyHiGfTKzQTP
 GSPpbCPUyEZx8qlmAOwrThnmqMCmEcxptZrNripXmNCPlL3T9KvyvzhUIy3k6s1v7ooxBm0FiCF
 OmTiWy71B/k2nyVzTO6MIsutsGDQNIOAkA+xnEfa2elw==
X-Zone-Loop: f9ba8675f7d91f378eaea4d62cd6a9350876072ac0fe
x-campaign-type: default
x-transaction-id: af5bbb2f-aa34-4102-a2d8-c63f6e335794
x-swg-uid: 01-028a2fb4-d9dd-48ba-8d49-732d38aef76a
X-Mailer: Sweego
Message-ID:
 <1793191582.8631fc262581453bbf619ec5b2062170.1a1828c1ad0000f79f@vates.tech>
x-swg-bid: 1793191582.8631fc262581453bbf619ec5b2062170.1a1828c1ad0000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/1] xen/riscv: probe the A/D update scheme if the
 DT advertises neither
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
In-Reply-To: <f204acbd-b9a9-4806-80ba-8fb79252ac1f@gmail.com>
References: <1793098984.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f@vates.tech>
 <1793099133.8631fc262581453bbf619ec5b2062170.1a17d0971ae000f79f@vates.tech>
 <f204acbd-b9a9-4806-80ba-8fb79252ac1f@gmail.com>
Date: Wed, 28 Oct 2026 13:46:15 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191576; l=3162;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=dt1OUdXTQV986f0VUbf+dyOok6fM6kLQNWmEbO6EVxM=;
 b=H8wW01r/TXKit075aXnFAZPLKBKwT7FjoXDd4q2fZW7QRTeTZMrAOsk4A6rysp2kKMOjN8Qci
 Wi6oTQP2yDBDBoYWOQxmHxZR6Sxb8IZr6d5OPoKvYT99ssIHpp7HBfm
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793191581594
X-purgate-ID: tlsNG-ef75cf/1793191588-A4ECEAE4-07DA89EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 3162
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 10:25:53+01:00, Oleksii Kurochko wrote:
> [ ... 27 lines skipped ... ]
> fixmap.h asks for xen_fixmap[] to be accessed directly only when
> set_fixmap() is unusable. It is unusable here, as pt_update_entry() 
> always sets A and D, but I think the comment should say so. Otherwise 
> someone may "clean this up" by switching to set_fixmap(), after which 
> the probe silently always reports Svadu, and on a Svade platform G-stage 
> PTEs are then created with A/D clear.
> 
> The current comment also reads as if the page had to be mapped already,
> while what makes using the Xen image correct is that A and D belong to
> the PTE, not to the page, so those set in the Xen image mapping don't
> matter. Something like:
> 
>      /*
>       * set_fixmap() can't be used, as pt_update_entry() always sets A 
> and D.
>       *
>       * A and D belong to the PTE, not to the page, so a new PTE with A 
> and D
>       * clear can point to any RAM page, whatever its other mappings. 
> Use the
>       * first page of the Xen image, and map it read-only so that Xen 
> can't be
>       * corrupted through this alias.
>       */
> 
> 
> I am okay to go with how the comment is written now and apply my 
> suggestion only in the case if v10 will be needed (and likely it will 
> look at the comment about fence below)
I will use that in v10 thanks.
> [ ... 11 lines skipped ... ]
> > +    a_set = read_pte(entry).pte & PTE_ACCESSED;
> 
> I think a fence is needed between the load and reading the PTE back. The
> spec only orders the A bit update against accesses to the same virtual
> page:
> 
>    "Furthermore, the PTE update must appear in the global memory order no
>    later than the explicit memory access, or any subsequent explicit 
> memory access to that virtual page by the local hart."
> 
> read_pte() accesses a different virtual page, and RVWMO doesn't order 
> two loads to different addresses, so on a hart which updates A/D in 
> hardware read_pte() may still observe A clear. That fails safe (Svade 
> gets recorded and A/D are preset), but the message below then asks to 
> add the wrong extension to the DT, and an out-of-order core like the 
> P550 is exactly where this could happen. Ordering the load before the 
> PTE read is enough, as the A bit update is in turn ordered before the load:
> 
>      /* Order the load, hence its A bit update, before reading the PTE. */
>      RISCV_FENCE(r, r);
Good catch thanks, will apply that in v10.
> [ ... 12 lines skipped ... ]
> [...]
> 
> I gave it a try on QEMU 9.0 on top of current staging (virt with
> aia=aplic-imsic, all with svpbmt=on):
>   - default (svadu): the probe doesn't run;
>   - svadu=off (hardware updating, neither in the DT): "probed svadu";
>   - svadu=off,svade=on with "_svade" dropped from riscv,isa: the load
>     faults, the extable fixup works, "probed svade";
>   - svadu=off,svade=on: the probe doesn't run.
> All of them reach "All set up" so:
>   Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Thanks for having tested.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

