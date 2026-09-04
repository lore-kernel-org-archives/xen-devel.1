Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34898C79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 09:54:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408087.1640795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Qcv-0003VC-Vt; Fri, 04 Sep 2026 09:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408087.1640795; Fri, 04 Sep 2026 09:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Qcv-0003V5-Sq; Fri, 04 Sep 2026 09:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1408087;
 Fri, 04 Sep 2026 09:54:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bd7377a000c4f3@swg.vates.tech>)
 id 1x2Qcu-0003Ur-Py
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 09:54:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Qcu-0092Ov-6d
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:54:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bd7377a000c4f3@swg.vates.tech>)
 id 6a9a954d-8faa-0a2a0a5109dd-0a2a450ab106-22
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 11:54:28 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bd7377a000c4f3@swg.vates.tech>)
 id 6a9a9553-f2d2-0a2a450a0019-b9ff1c128dbd-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 11:54:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06bd7377a000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 09:54:21 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 118EB81EB6;
 Fri,  4 Sep 2026 11:54:21 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=uZD6jJUcLoY+mEEZW5wJpobOUMsM9W/orYnzbQB9pGA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=LY+f5ytmquDM501jpoACTM9p0pesthwiegjiUDDTHrzC2fAt/vxTWnqWDqgIPVKPqUK6dQFQX
 XC245nUKIHfDtBP8sJhr/9ex31YqMqGF2ehNzFbpSCd/Cnx8s9Icdp69POKzzqsV/vt95ynMcNS
 f41bExHS1N2NdLLawRBwtuOUr/2CZnnPHG5crDlHdyqMK1FF0lwJ2nW2V37cPCrG8E4kP3lL9QU
 k2061TPota4L4/41Qosrs2JkEcypb9nOEKCai4G7OM0aikgAtwiKl4JpIbegSeUG77n5+jV9NJ/
 r7QPxIjKVza9JBlGJLNuqYveqozb1hblMexDOMmNN+Zg==
X-Zone-Loop: 14f1b4d8c55f5ebc9f2e112a1f4219ec9097393cb9a1
x-campaign-type: default
x-transaction-id: 904923c1-51b9-4678-8e45-08dda6e60329
x-swg-uid: 01-71ceb5c2-3b67-4765-ac14-4cabadabbe9c
X-Mailer: Sweego
Message-ID:
 <1788515661.8631fc262581453bbf619ec5b2062170.1a06bd7377a000c4f3@vates.tech>
x-swg-bid: 1788515661.8631fc262581453bbf619ec5b2062170.1a06bd7377a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
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
In-Reply-To: <879f5184-351e-4f12-947b-d66eef5fee77@suse.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
 <879f5184-351e-4f12-947b-d66eef5fee77@suse.com>
Date: Fri, 04 Sep 2026 11:54:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788515661; l=3112;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=K50ozWfZ0P41kpUGQt1K6dV1u1eFyXN7s/k/WlXl3bk=;
 b=YCMXznEfqWTzs7gv1S0wTDYMreUyTNYn1BUFxEqaZYGFklLZnK0WpHrbb6BhtF+rEpGZrMC9T
 g7Ti5r/z7//Bi18HdYpg14t/B9Rz2soV4Rnxd86/03I8n/qie2iU05A
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788515661260
X-purgate-ID: tlsNG-4011c0/1788515668-5ABD8CFC-81469E43/0/0
X-purgate-type: clean
X-purgate-size: 3116

On 2026-09-04 10:33 +0200, Jan Beulich wrote:
> On 04.09.2026 10:26, Baptiste Le Duc wrote:
> >> @@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
> >>      return rc;
> >>  }
> >>  
> >> +static void save_csr_regs(struct vcpu *vcpu)
> >> +{
> >> +    /*
> >> +     * There is no need to save these CSRs as only hypervisor writes them in
> >> +     * restore_csr_regs() and guest can't access them so they shouldn't be
> >> +     * stored here. Keep them commented here just for symmetry with the
> >> +     * restore CSRs register part.
> >> +     *
> >> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
> >> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
> >> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
> >> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
> >> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
> >> +     *
> >> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> >> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
> >> +     */
> >> +
> >> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
> >> +
> >> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
> >> +    vcpu->arch.vsie = csr_read(CSR_VSIE);
> > 
> > 
> >> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
> >> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
> >> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
> >> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
> >> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
> >> +}
> >> +
> >> +static void restore_csr_regs(struct vcpu *vcpu)
> >> +{
> >> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
> >> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
> >> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
> >> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
> >> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
> >> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
> >> +
> >> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> >> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
> >> +
> >> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
> >> +    csr_write(CSR_VSIE, vcpu->arch.vsie);
> > 
> > 
> >> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
> >> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
> >> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
> >> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
> >> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
> >> +}
> >> +
> >> +static void ctxt_switch_from(struct vcpu *p)
> > Is it expected to have diverse names for the vcpu arg? Above it's vcpu,
> > here it's p (I assume it's for `previous` but I think the _from alone is
> > enough to understand) and below it's n. Shouldn't be better to keep the same name?
> 
> Context switch code is special, and using p and n can be warranted there.
> Everywhere else it should be v, nothing else (and I said so to Oleksii
> more than once before). Unless, of course, multiple vCPU-s come into play
> at the same time.
> 
Ok noted, thanks for clarifying that.

> Jan
> 
> 
> 



