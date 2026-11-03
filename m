Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89578606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=kLh49QIh
Received: from list by lists.xenproject.org with outflank-mailman.1470220.1678949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHda-0002DS-2R; Tue, 03 Nov 2026 16:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470220.1678949; Tue, 03 Nov 2026 16:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHdZ-0002DL-Va; Tue, 03 Nov 2026 16:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1470220;
 Tue, 03 Nov 2026 16:45:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@swg.vates.tech>)
 id 1xOHdY-0002DE-HT
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:45:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHdX-003TIR-Oz
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:45:27 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@swg.vates.tech>)
 id 6aea0fa2-bab6-0a2a0a5309dd-0a2a4504aff4-18
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:45:27 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@swg.vates.tech>)
 id 6aea0fa7-b57f-0a2a45040019-b9ff1c228fcd-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:45:27 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a24d1057000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 16:45:21 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 103C582A6A;
 Tue,  3 Nov 2026 17:45:21 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Ctsk2mEN2HQbi8EMfJxC7E253xF00M+ZALCzzkM3Ydg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=kLh49QIhEo6HXkAIWcZh+e/U0haVLfwAXsEu/7E9oYo0GGr2JvYHLbO6xpSY5/wNZr8V4DyA7
 PhY2gMc7EicRpoELNLM1AIJGDGDqGjh0qRSP5xLyPbVo0SlVcF6ejmHr52HoOL2c7uVKiR/fGc0
 BIUS2iIikKm6m+cUV9Bna2IWmubfGcJZAZN1qdOn0/EjOKUcgTLtKuRCln7aeH/1xs/VTegeEpA
 ZBTqGlfWZUAZ42ol6+ipAicq56bWUdSydsZi7Oi7CrLdYdVVolbbNQCwTji84jLNA2zHYM5m+r+
 woJ9g4sVBhT6unZXZMTlTctH9K5YIqRQzDA9lu06kRBA==
X-Zone-Loop: 69a470ec2d6219cbd348532f1ab5304bda3f2f71e75e
x-campaign-type: default
x-transaction-id: 6b886cb3-4fb7-4dba-a0c9-c9e76b235440
x-swg-uid: 01-e294e592-93e4-47ff-a2c1-b9504767593b
X-Mailer: Sweego
Message-ID:
 <1793724321.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@vates.tech>
x-swg-bid: 1793724321.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 33/39] xen/riscv: restore register state in the new
 IMSIC VS-file
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
In-Reply-To: <9e77a699eb6c99fa8f444d5777da189fdd30679e.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <9e77a699eb6c99fa8f444d5777da189fdd30679e.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 03 Nov 2026 17:45:14 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793724315; l=2986;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=iJlK4Kw1ikvmE5pN7ad38iP/yY/IaVHqAmlKd47zq1I=;
 b=6Mnbsm66ak6+jjW7ciGRC+TRF37ULOp1klp1SgtiWDPLps2bbDUSmpgAvUF5vygS6t5AS31cn
 Ru+e7zCe88nA0By0J2g+j5TpQezdUhaWUwAydbY/ourpaCPxfhp6t9P
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793724321270
X-purgate-ID: tlsNG-ebf023/1793724327-526CAB50-C987CD7F/0/0
X-purgate-type: clean
X-purgate-size: 2986
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Complete the migration of a vCPU's guest interrupt file: move the state
> saved from the old IMSIC VS-file into the new one and make the vCPU use
> the new VS-file.
> 
> The interrupt producers have already been retargeted to the new
> VS-file, so MSIs may land in it before the saved state is restored.

Could we send an extempore MSI to the hart of the new file once the
interrupt producers have been retargeted, and spin until it is received?
That would guarantee that no more MSIs land once we have received it.
> Hence the saved eip/eie bits are ORed into the new VS-file rather than
> written to it, so that such MSIs aren't lost. eithreshold and
> eidelivery are restored last: the new VS-file was cleared when it was
> acquired, so it doesn't deliver interrupts until its pending and enable
> bits are complete.
> 
> As with reading the old VS-file, this has to be done on the pCPU owning
> the new VS-file, with hstatus.VGEIN temporarily selecting it. That is
> v->processor, the pCPU the vCPU is migrating to.
> 
> Finally, point hstatus.VGEIN in the vCPU's saved context at the new
> VS-file, so that it becomes the source of the vCPU's VS-level external
> interrupts and the file the guest accesses through its siselect/sireg.
> With that the migration is complete, so drop the BUG_ON("unimplemented")
Great!
> [ ... 82 lines skipped ... ]
> +static void cf_check imsic_vsfile_local_update(void *data)
> +{
> +    unsigned int i;
> +    const struct imsic_vsfile_data *idata = data;
> +    struct imsic_mrif *mrif = idata->mrif;
mrif is only read here, so it can be const:
    const struct imsic_mrif *mrif = idata->mrif;
> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> +
> +    /* We can only update if we have a HW IMSIC context */
> +    if ( !idata->hgei )
> +        return;
> +
> +    /*
> +     * No atomic accessors are needed to read the values out of the MRIF here,
> +     * as this is always called with a pointer to a temporary MRIF on the
> +     * stack.
> +     */
> +
> +    /*
> +     * The file is reached by retargeting hstatus.VGEIN, and the
> +     * imsic_vs_csr_*() accessors alter vsiselect. Both belong to the vCPU
> +     * running on this pCPU, so restore them before returning.
> +     */
Same comment as on the previous patch: you are not restoring the CSRs
here but saving them, as imsic_vs_csr_*() will alter vsiselect. Please
update the comment accordingly.
> [ ... 32 lines skipped ... ]
> @@ -1152,5 +1222,11 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      /* Free-up old IMSIC VS-file */
>      vgein_release(v, old_vsfile_id, old_vsfile_cpu);
>  
> -    BUG_ON("unimplemented");
> +    /* Restore register state in the new IMSIC VS-file */
> +    imsic_call_on_cpu(v->processor, imsic_vsfile_local_update, &vsfile_data);
> +
> +    /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
Nit: s/VCPU/vCPU/

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

