Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAD4CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 11:35:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451685.1666597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgDc-0001vD-Mq; Fri, 16 Oct 2026 11:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451685.1666597; Fri, 16 Oct 2026 11:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHgDc-0001v6-KE; Fri, 16 Oct 2026 11:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1451685;
 Fri, 16 Oct 2026 11:35:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@swg.vates.tech>)
 id 1xHgDb-0001v0-LT
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHgDb-00B3tI-08
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 13:35:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@swg.vates.tech>)
 id 6ad20bf9-8faa-0a2a0a5109dd-0a2a450396fa-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:35:22 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@swg.vates.tech>)
 id 6ad20bfa-fae8-0a2a45030019-b9ff1c228af7-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 13:35:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1447ec1cc0008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 11:35:20 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5C3DD810D3;
 Fri, 16 Oct 2026 13:35:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=rCqdoei7QDft3v50+XHoD9FEzWx+F20GdvbObtj+Jpo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ea/rW1LOVZdJROksOEN+yzruUS85PAThr+P/wiixFZC0JpDvjT6HYbUxmdy6hL9YKeD665dbb
 Q0EtqvV60/ng2Aw3ul7EyV/u2HXqdSLEfRZEh33cgTt/tdExDooaYXpRnmyoBzwaOAoO0vjG79f
 IZ9IdCGrpAu0PpH0V7bjEFRo6ONOOagmbuombxCoyRTvJxmTisLb6hRXrubPLlsr50mquOHy1JZ
 Ukzc8qKENRoSob2vQ+Q3Ge/Dp7+GYWFdOmYHBnni4hmmoWtzErTjCrL1o0KXcKXbmeT3KTXo31F
 RdcZ2WA5wiWN+DdWXjx09ez/8lyckm19L4L4sNBJir/Q==
X-Zone-Loop: 218d19ffa0ad5a36055a5d2944f8fa436181f37fcf54
x-campaign-type: default
x-transaction-id: 20c40629-04e1-452c-b92d-8f1bafed6526
x-swg-uid: 01-145c1ab0-900a-45d3-929f-3a2f1f9b75be
X-Mailer: Sweego
Message-ID:
 <1792150520.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@vates.tech>
x-swg-bid: 1792150520.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme
 at boot
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 xen-devel@lists.xenproject.org, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
In-Reply-To: <2f04c46d-f533-4eda-9bd1-8b8e100dff07@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
 <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
 <2f04c46d-f533-4eda-9bd1-8b8e100dff07@suse.com>
Date: Fri, 16 Oct 2026 13:35:13 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792150514; l=4315;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=G0VZ2xZeVAh0/4el30Bh5qsA70o0dVS8ZVY02/9BGtc=;
 b=uwreui9yhPE86IHoa7e6dY8NXODS52Asm+PaoGBw5jTxrBTe1Zzf4wj26utBCVkEDj6Sd/JMl
 ilqJjM45bYuCpDr8knwgD2B6qG397bDcQ298fNe3N0TlO5DscUbThhh
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792150519578
X-purgate-ID: tlsNG-33051d/1792150522-754844E9-343F06F2/0/0
X-purgate-type: clean
X-purgate-size: 4315

On 2026-10-15 18:04 +0200, Jan Beulich wrote:
> That's what I suggested earlier, yet from replies I concluded it wouldn't
> be overly practical to have people edit DTs.
> 
> Jan

Hello Jan,

Based on Andrew's answer to your question on GitHub [1], I see two options
for handling a DT that doesn't advertise the scheme in effect. Please
feel free to choose one.

1) Trust the probe and fix up riscv_isa on a mismatch. This avoids having
people edit their DTs, and is safe as, per Andrew, the spec has only ever
allowed these two schemes:

/*
 * The privileged spec allows exactly two schemes for the PTE A and D bits:
 *  1) hardware sets them on access and on write.
 *  2) accessing a page whose A and/or D bit is clear raises a page fault,
 *     so that software can set them (ratified as Svade).
 *
 * Hence an implementation without Svade uses the hardware scheme (1), and one
 * that faults on clear A/D bits implements Svade, whether or not it says so.
 *
 * Rather than trusting the DTS alone, probe the scheme in effect with a write
 * through a PTE whose A and D bits are clear. If the DTS does not advertise
 * it, replace it by the probed scheme. As the spec has only ever allowed
 * these two schemes, this is safe even on implementations that predate Svade
 * and Svadu.
 */
static void __init check_ad_scheme(void)
{
    bool has_hw_scheme = probe_hw_ad_update();
    const char *scheme_name = has_hw_scheme ? "Svadu" : "Svade";
    enum riscv_isa_ext_id ext = has_hw_scheme ? RISCV_ISA_EXT_svadu
                                              : RISCV_ISA_EXT_svade;

    /* Fix DTS in case of mismatch */
    if ( !riscv_isa_extension_available(NULL, ext) )
    {
        printk(XENLOG_WARNING
               "CPU implements %s but the DTS does not advertise it\n",
               scheme_name);
        __clear_bit(RISCV_ISA_EXT_svade, riscv_isa);
        __clear_bit(RISCV_ISA_EXT_svadu, riscv_isa);
        __set_bit(ext, riscv_isa);
    }

    printk(XENLOG_DEBUG "CPU is using %s A/D bits scheme\n", scheme_name);
}

2) Panic on a mismatch, requiring the DT to be fixed. Same function, with
the last paragraph of the comment and the check becoming:

 * Rather than trusting the DTS alone, probe the scheme in effect with a write
 * through a PTE whose A and D bits are clear, check it against what the DTS
 * advertises, as described by the DT binding, and panic on a mismatch.
 */
[...]
    /* The probed scheme must match the DTS. */
    if ( !riscv_isa_extension_available(NULL, ext) )
        panic("CPU implements %s but the DTS does not advertise it\n",
              scheme_name);

Either way, Svade ends up set whenever the CPU faults on clear A/D bits,
so p2m_set_pte_flags() only has to check Svade:

    /*
     * A RISC-V implementation can either:
     * 1) Update the 'A' and 'D' PTE bits in hardware.
     * 2) Generate a page fault when 'A' and/or 'D' is clear, so that
     *    software can set them.
     *
     * (1) needs nothing more as it is handled by hardware. For (2), set 'A'
     * and 'D' up front: OpenSBI delegates such page faults to a lower
     * privilege mode, so they would be raised in Xen, which has no handler
     * for them.
     *
     * check_ad_scheme() ensures Svade is set whenever the CPU faults on
     * clear A/D bits. If both Svade and Svadu are advertised but the CPU
     * updates A/D in hardware, presetting them is harmless.
     *
     * TODO: Xen on RISC-V currently makes no use of the information that
     *       handling such page faults could provide, which would be useful
     *       for several use cases such as demand paging, cache-flushing
     *       optimizations, memory access tracking, etc.
     *
     *       To support the more general case and the optimizations
     *       mentioned above, it would be better to stop setting the A/D
     *       bits here and instead handle the page faults that occur due to
     *       unset A/D bits.
     */
    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
        e->pte |= PTE_ACCESSED | PTE_DIRTY;

Thanks,
Baptiste

[1] https://github.com/riscv/riscv-isa-manual/issues/3450#issuecomment-6201235555

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

