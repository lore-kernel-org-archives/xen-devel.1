Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C430606A31D
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=GaTDUl4H
Received: from list by lists.xenproject.org with outflank-mailman.1458073.1670539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJrwU-0003DY-NE; Thu, 22 Oct 2026 12:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458073.1670539; Thu, 22 Oct 2026 12:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJrwU-0003DQ-KN; Thu, 22 Oct 2026 12:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1458073;
 Thu, 22 Oct 2026 12:30:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJrwU-0003DK-0K
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 12:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJrwT-006w1Z-5j
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:30:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163979000000f79f@swg.vates.tech>)
 id 6ada01e0-2eae-0a2a0a5409dd-0a2a4502c096-46
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:30:45 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163979000000f79f@swg.vates.tech>)
 id 6ada01f4-6ca4-0a2a45020019-b9ff1c12b075-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 14:30:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a163979000000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 12:30:39 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C5FEB80D94;
 Thu, 22 Oct 2026 14:30:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=mF8488MbfF8zVdg2/+fG2MAaEhbtML2nMUv3PaZkE+0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=GaTDUl4H+11uR2OuD6CbyoMkplrm17VAJQzAqsjqxqAs/uVLzPJWwtxypCcQ5oou/knfGgGJ9
 uaYbK4/hyfNZpEoj1zCdA4i+T/mMe/6jYng6bC43UeiguJzLa1BmLVyu46IAk1yCynoBy8auDEG
 o6KYMjInF+jrHWlNSp5q72OPEu1/MEcY0V/uvb4sTFzpsKBmJ4UnKu7ouZSaCDkMG2mkpcwbJps
 3ZUtEj38UpxnHbWeCGT3cQR48bHfYtJZSVnCtmoSXr1OFGvLZC3HAclsp6gMTPEVxJNglTxq60P
 sC6Jrf+If90MUlASPANGueux7tsz3qJNmy39kdssutmA==
X-Zone-Loop: fc5168f07cd00d66317f8d4169e46ad8ae101b9f6c4c
x-campaign-type: default
x-transaction-id: bfcce7fb-dbc8-4d03-b99a-083e476a9354
x-swg-uid: 01-0eb51cec-642f-4784-8ada-d6e6a1a1cfe4
X-Mailer: Sweego
Message-ID:
 <1792672239.8631fc262581453bbf619ec5b2062170.1a163979000000f79f@vates.tech>
x-swg-bid: 1792672239.8631fc262581453bbf619ec5b2062170.1a163979000000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 24/39] xen/riscv: add guest load emulation for
 trapped MMIO accesses
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
In-Reply-To: <9943b1f4-1890-4917-ae39-bf9c70fc36c7@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d4304a157181d8a8432b8f65f92019e0ead3bec7.1790779209.git.oleksii.kurochko@gmail.com>
 <9943b1f4-1890-4917-ae39-bf9c70fc36c7@gmail.com>
Date: Thu, 22 Oct 2026 14:30:33 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792672233; l=3454;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=LFT/3z68hIrfjTjnlmTNtU1afYZWLx19wL/Hqh5QnMU=;
 b=bcArfGBMM+RwySao7F3JGEDdeVmSE3ztzH6Q43ES9CTsHolnKdvcb5oIg8a9eKfSEw7jxGaYi
 DOqHyUGxRIFDDQJqn0UqYbkv8KjSNzvJtsv9MYk7/YhKwRe5ETR5HPi
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792672239019
X-purgate-ID: tlsNG-720697/1792672245-67ABD2AC-6C31AC06/10/73395122804
X-purgate-type: spam
X-purgate-size: 3454
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-15 16:59:53+02:00, Oleksii Kurochko wrote:
> On 9/30/26 6:23 PM, Oleksii Kurochko wrote:
> 
> > Implement emulate_load() on top of the decoding interface introduced by
> > the previous patch: fetch the trapped instruction, decode it, dispatch
> > the access to a registered MMIO handler via do_mmio(), write the result
> > back into the destination register and step over the instruction.
> > 
> > Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
> > KVM RISC-V there is no userspace exit/return step and no equivalent of
> > the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
> > split; the result is consumed in place.
> > 
> > Sign extension is done here rather than in the handlers: a signed load
> > is normalized by a shift pair, so a handler need only report the value
> > it read.
> 
> This part of commit message should be updated. Suggestion look below...
> 
> > At the moment vINTC is the only backend registered with the MMIO
> > dispatch, so in practice this only covers vINTC traps. An access which
> > no handler claims currently crashes the domain; injecting an access
> > fault into the guest instead is left for later.
> > 
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> 
> [...]
> 
> >   static int emulate_load(const struct guest_fault *gf)
> >   {
> > -    /* Transient, until the helpers gain their users. */
> > -    (void)advance_pc;
> > -    (void)guest_xlen;
> > -    (void)guest_gpr;
> > -    (void)insn_fetch_faulted;
> > -    (void)decode_ldst_insn;
> > +    struct cpu_user_regs *regs = gf->regs;
> > +    mmio_info_t info = { .is_write = false };
> > +    struct decoded_insn di = {};
> > +    unsigned int shift = 0;
As shift is always computed, I don't think it makes sense to init it.
> > +    int rc;
> >   
> > -    return -EOPNOTSUPP;
> > +    /* A fault taken re-reading the instruction is redirected to the guest. */
> > +    if ( insn_fetch_faulted(gf, &di) )
> > +        return 0;
> > +
> > +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
> > +        return -EOPNOTSUPP;
> > +
> > +    if ( !di.is_unsigned )
> > +        shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
> > +
> > +#ifdef EMULATE_LOAD_DEBUG
> > +    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
> > +             regs->sepc, gf->gpa, di.len, shift);
> > +#endif
> > +
> > +    rc = do_mmio(&info, gf->gpa, di.len);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    /* A load into x0 discards its result. */
> > +    if ( di.reg )
> > +        *guest_gpr(regs, &di) = (long)(info.data << shift) >> shift;
> 
> It would be more correct to have here:
> 
>      shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
>      ...
>      if ( di.reg )
>          *guest_gpr(regs, &di) = di.is_unsigned
>                                  ? (info.data << shift) >> shift
>                                  : (long)(info.data << shift) >> shift;
> 
> and update the commit message part "Sign extension is done here…" to:
> 
> Sign and zero extension are done here rather than in the handlers: a
> shift pair drops whatever lies above the access width in the value read
> and, for a signed load, sign-extends it, so a handler need only report
> the value it read.
this LGTM.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

