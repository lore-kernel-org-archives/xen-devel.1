Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC166606A335
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=b8qWuXzb
Received: from list by lists.xenproject.org with outflank-mailman.1471639.1679893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYNG-0003Up-DR; Wed, 04 Nov 2026 10:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471639.1679893; Wed, 04 Nov 2026 10:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYNG-0003Ui-Aj; Wed, 04 Nov 2026 10:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1471639;
 Wed, 04 Nov 2026 10:37:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d@swg.vates.tech>)
 id 1xOYNF-0003Uc-3U
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 10:37:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOYNE-00BkEd-DV
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:37:44 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d@swg.vates.tech>)
 id 6aeb0aed-2eae-0a2a0a5409dd-0a2a450be2c0-48
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:37:44 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d@swg.vates.tech>)
 id 6aeb0af7-b7e8-0a2a450b0019-b9ff1c229bad-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:37:43 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a622ce02000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Nov 2026 10:37:41 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 46374830F0;
 Wed,  4 Nov 2026 11:37:40 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=rlQ6QYU5x1DF39EqjWg2Wo1P45aHvdDyQ6CCfPnER1U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=b8qWuXzbdI376Xo15IHgEVR34HI/5XsMTzqsqYLb0EDB7MTM4TPBX4uuFjbcQPiwFc8vwl+bA
 0TzVp5t5ktn+48zSYcsCVcKQUrE4y1lvJxyb18DCsNZDGdALDniM1PhRzdmCENEL/fv27nBznC3
 948eiVedN4+Xm+monvKTZLyO/sC4HORtrPONLfjsw4bjWGJYoL0gh32wkMPCGVvHI8YY9WCsJOk
 iGZCYw8ajpbvmEnxiWc+ZcxM5TL71RcqwS0RjhiWh9W5T86JKfAv4NeoTCXUs03eR3C7HTyYSZF
 /fIWt4LgV5NUz9J2uYsaG7UN8cmon+PYKKbZtx++n+iA==
X-Zone-Loop: 65e10794f9f8623fadfe017a4c2149dd23cf23b549c3
x-campaign-type: default
x-transaction-id: 6cfe9d27-be46-40af-8534-5ee17a3dc164
x-swg-uid: 01-15326072-e535-46c3-870e-9fee0aefbcdc
X-Mailer: Sweego
Message-ID:
 <1793788661.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d@vates.tech>
x-swg-bid: 1793788661.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 35/39] xen/riscv: wake up a descheduled vCPU on a
 guest external interrupt
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <4e78b90482e23b049774eb00b19422d8c147970a.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <4e78b90482e23b049774eb00b19422d8c147970a.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 04 Nov 2026 11:37:33 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793788655; l=5875;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=TRDt494DvO0qsCruWvOukShsue6ftFlJ2yj7tmfogA4=;
 b=XqJOydAAbrQ5UUwusP6/lTTt6WwBOMmnkEVzSpeI4YykIRVFtxpIJWmR8kI56qkUQkWOVRCgq
 oRIPg9u1sAEAuGAnCDWXbx66rlu8yhvXF8a1GigHQF/NQgomn9VBif/
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793788660492
X-purgate-ID: tlsNG-42698a/1793788664-196C29EA-688B1BA3/0/0
X-purgate-type: clean
X-purgate-size: 5875
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
> file are delivered straight to VS-mode. Once the vCPU is descheduled
> nobody observes that file anymore, so a guest blocked on such an
> interrupt would stay blocked until some unrelated event happens to
> schedule it again.
> 
> Let Xen observe the file in that window: on deschedule set the vCPU's
> bit in HGEIE, which turns an interrupt pending in its VS-file into an
> HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
> reports an interrupt file number, so to find the vCPU to kick, keep a
> per-pCPU owners[] array indexed by file number and updated in
> vgein_assign()/vgein_release() together with the VGEIN bitmap. The SGEI
> handler clears the HGEIE bits it has seen before kicking their owners,
> so that the interrupt doesn't keep firing until the vCPU is switched in.

Please explain why this is enough for a descheduled
vCPU to never miss a wake-up: an interrupt pending in a VS-file always
shows up in HGEIP, but it reaches VS-mode only if hstatus.VGEIN selects
that file, and traps to Xen as an SGEI only if the file's HGEIE bit is
set. While the vCPU is descheduled, HGEIE is therefore Xen's only way to
notice it. And as HGEIP reflects the file's current state rather than
being latched, an interrupt which arrived before the bit got set still
raises the SGEI once it is.


> [ ... 49 lines skipped ... ]

> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -18,6 +18,13 @@ struct vgein_ctrl {
>      /* The least-significant bits are implemented first, apart from bit 0 */
>      unsigned long bmp;
>      spinlock_t lock;
> +    /*
> +     * Guest interrupt file IDs run from 1 to geilen inclusive (0 means that
> +     * no guest external interrupt source is selected), and geilen can never
> +     * exceed BITS_PER_LONG - 1, so indexing this array by the ID directly
> +     * always fits.
> +     */
> +    struct vcpu *owners[BITS_PER_LONG];

It looks like owners[] already carries the information bmp provides.
Couldn't we drop bmp and use owners[] alone, with owners[i] == NULL
meaning that file i is free? That would avoid having to keep the two in
sync, and vgein_release() could then check ASSERT(owners[id] == v)
rather than just that the bit was set. A linear scan over 1..geilen in
vgein_assign() should be fine given geilen < BITS_PER_LONG.

If you agree, it would probably be cleaner to introduce owners[] in
place of bmp in the earlier "add basic VGEIN management" patch, rather
than adding bmp there and replacing it here.
> [ ... 26 lines skipped ... ]
> +
> +void hgei_interrupt(void)
> +{
> +    unsigned long hgei_mask, flags;
> +    struct vgein_ctrl *vgein = &this_cpu(vgein);
> +
> +    hgei_mask = csr_read(CSR_HGEIP);
> +    hgei_mask &= csr_read(CSR_HGEIE);
> +
> +    csr_clear(CSR_HGEIE, hgei_mask);
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +
> +    /*
> +     * Bit 0 of HGEIP/HGEIE is read-only zero: guest interrupt file ID 0
> +     * means that no guest external interrupt source is selected.
> +     */
> +    ASSERT(!(hgei_mask & 1));

Is this ASSERT() really needed? Bit 0 of HGEIP/HGEIE is read-only zero
per the spec, and vgein_init() already relies on that when computing
geilen. Even if it were ever reported, owners[0] is never assigned, so
the loop below would simply skip it.
> [ ... 35 lines skipped ... ]
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -555,12 +555,37 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *p)
>  
>      write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>      imsic_state->vsfile_cpu = p->processor;
> +    /*
> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
> +     * running an interrupt pending in its VS-file is reported through HGEIP
> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.

"instead of" reads as if HGEIP only reports it while the vCPU isn't
running. It always does; what changes is that VGEIN no longer selects
the file and the HGEIE bit set below turns it into an SGEI.

> [ ... 29 lines skipped ... ]
>  int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
> @@ -695,6 +720,12 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>      struct imsic_mrif *mrif = idata->mrif;
>      unsigned long new_hstatus, old_hstatus, old_vsiselect;
>  
> +    /*
> +     * The HGEIE bit imsic_ctxt_switch_from() armed belongs to the old owner
> +     * only.
> +     */
"Old owner" is ambiguous: it reads like another vCPU, but it's the same
vCPU on the file it is leaving. To mirror imsic_local_hgeie_set(), I'd
rather have an imsic_local_hgeie_clear() called from here, documenting
the pairing the same way, e.g.:

/*
 * Stop observing an interrupt file which a vCPU leaves when it moves to
 * another pCPU by clearing the bit imsic_ctxt_switch_from() set.
 *
 * Counterpart of imsic_local_hgeie_set() for the new file.
 */

In that case ...
> +    csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));
> +
>      /*
>       * The file is reached by retargeting hstatus.VGEIN, and
>       * imsic_vs_csr_swap() alters vsiselect. Both belong to the vCPU running
> @@ -1044,6 +1075,21 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>      return fdt_end_node(fdt);
>  }
>  
> +/*
> + * Start to observe the interrupt file from HS-mode, the same way
> + * imsic_ctxt_switch_from() does it for a vCPU which is switched out.
> + *
> + * The counterpart, clearing the bit of the interrupt file which is left
> + * behind, is done by imsic_vsfile_local_read_clear(), which already runs on
> + * the pCPU owning that file.
 ... this wouldn't be needed at all.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

