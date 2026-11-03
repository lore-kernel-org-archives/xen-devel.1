Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873EE606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=D5sTFiHS
Received: from list by lists.xenproject.org with outflank-mailman.1470180.1678923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGyM-0001aq-Kh; Tue, 03 Nov 2026 16:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470180.1678923; Tue, 03 Nov 2026 16:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOGyM-0001ai-Hk; Tue, 03 Nov 2026 16:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1470180;
 Tue, 03 Nov 2026 16:02:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@swg.vates.tech>)
 id 1xOGyL-0001aX-Ft
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:02:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOGyK-007nhZ-Sq
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:02:52 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@swg.vates.tech>)
 id 6aea05a5-2eae-0a2a0a5409dd-0a2a450ae1c0-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:02:52 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@swg.vates.tech>)
 id 6aea05ac-f2d2-0a2a450a0019-b9ff1c229d0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:02:52 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a22617dd000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 16:02:47 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id EDBF781AA4;
 Tue,  3 Nov 2026 17:02:46 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=30RxQ8s0wMaca35vxviO/z/j9KjB0c2DjKRet1qcY+Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=D5sTFiHSJZV4gwyIY5vDJcV9FH0LVVMIzP4BnJwENufP2cbczsV16Flk+VHIIjkc+H3EQu9GE
 IC199gvWWjWU7xWCZC58lsYd+q8woYg1OuvKYVpq95IXeiPAIdAEmg8XhWOvzURHq7s7D69uNV6
 vzuNu74lWFzvCPi6LHoCijkeZaQRRpFSgz3U+ACZf1VbjHgF6RytA3gfw1kx80WCJ6Zzei1eavV
 MKJaYsKWAgDg03ZB5ZWHqWfXz4G6bHJ/xnSzjHO1mFuTxxeKio2n5vEJaArcamZlpQJ+i5s6sBL
 s/DU2wrW/ApgOr2/IC0aZqQW7vf/FO+TKgCXuwHRvveg==
X-Zone-Loop: d4a61b740a06d8bc4db20e78c32d518c3aa899d881b7
x-campaign-type: default
x-transaction-id: 1f175964-50db-46ce-8922-34577fd54598
x-swg-uid: 01-e7e1f6e5-1d9b-44d5-a465-b34fc8ab7941
X-Mailer: Sweego
Message-ID:
 <1793721767.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@vates.tech>
x-swg-bid: 1793721767.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 32/39] xen/riscv: save and clear the old IMSIC
 VS-file on vCPU migration
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
In-Reply-To: <e2cf140c63b1f1cff8e63988f82fff7e2b063c84.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <e2cf140c63b1f1cff8e63988f82fff7e2b063c84.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 03 Nov 2026 17:02:40 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793721761; l=2898;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=oKl4ZLdirArBDD95V5/IzDUaA4VL6lO3rMdDHziwS+0=;
 b=sbFsPPb/fo0D/+X0UW1RKZyQRX8KsKzI0WUmVjr6Tixra6nQorg3aIyyGjitvZJOaVwcp7y4q
 N+a6l6FI9GyCZJfHr6tkmwEKEyWr4/NqYPMUurhujU4eV0dV7J5JrYe
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793721767189
X-purgate-ID: tlsNG-4011c0/1793721772-50ACCCFC-274BFFDD/0/0
X-purgate-type: clean
X-purgate-size: 2898
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> When a vCPU migrates to another pCPU, its guest interrupt file has to
> move as well: the eidelivery, eithreshold and eip/eie state of the old
> IMSIC VS-file has to be carried over to the newly acquired one.
> 
> Once all interrupt producers have been retargeted to the new VS-file,
> so that nothing can reach the old one anymore, read the state of the
> old one and clear it at the same time. This has to be done on the pCPU
> owning the old VS-file, as a guest interrupt file is only accessible
> through vsiselect/vsireg with hstatus.VGEIN selecting it. After that
> the old VS-file is no longer in use and its guest external interrupt
> number can be released.
> 
> The state is saved into struct imsic_mrif. Its eix[] array follows the
> layout of a memory-resident interrupt file (MRIF) as defined by the AIA
> specification: pairs of 64-bit interrupt-pending and interrupt-enable
> doublewords, each pair covering 64 interrupt identities. eithreshold
> and eidelivery aren't part of an MRIF and are stored next to it as they
> belong to the interrupt file state too. Using the MRIF layout allows
> the same structure to hold the interrupt file of a vCPU which doesn't
> own a guest interrupt file, which is how the AIA specification
> describes MRIFs being used by a hypervisor.

I think it's worth mentioning that this MRIF structure could be reused
for software interrupt files later.
> [ ... 172 lines skipped ... ]
> +static void cf_check imsic_vsfile_local_read_clear(void *data)
> +{
> +    unsigned int i;
> +    const struct imsic_vsfile_data *idata = data;
> +    struct imsic_mrif *mrif = idata->mrif;
> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> +
> +    /*
> +     * The file is reached by retargeting hstatus.VGEIN, and
> +     * imsic_vs_csr_swap() alters vsiselect. Both belong to the vCPU running
> +     * on this pCPU, so restore them before returning.
> +     */
You're saving the registers here, not restoring them. I'd use something
like:
    /*
     * vsiselect/vsireg only reach the guest interrupt file selected by
     * hstatus.VGEIN, so point VGEIN at this file for the access.
     * hstatus and vsiselect hold the state of the vCPU running on this
     * pCPU; save them here and restore them before returning.
     */

> +    old_vsiselect = csr_read(CSR_VSISELECT);
> +    old_hstatus = csr_read(CSR_HSTATUS);
> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> +    csr_write(CSR_HSTATUS, new_hstatus);
> +
> +    /*
> +     * No atomic accessors are needed to store the values into the MRIF here,
> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
> +     * temporary MRIF on the stack.
> +     */
Nit: is this blank line really needed?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

