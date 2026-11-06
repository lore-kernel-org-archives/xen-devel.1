Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FCC606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=K/RYsSw5
Received: from list by lists.xenproject.org with outflank-mailman.1476590.1682612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPJxQ-0004MI-HZ; Fri, 06 Nov 2026 13:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476590.1682612; Fri, 06 Nov 2026 13:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPJxQ-0004MB-Ez; Fri, 06 Nov 2026 13:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1476590;
 Fri, 06 Nov 2026 13:26:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@swg.vates.tech>)
 id 1xPJxP-0004M5-7W
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPJxO-00HYVb-8o
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 14:26:14 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@swg.vates.tech>)
 id 6aedd566-8faa-0a2a0a5109dd-0a2a4501d2a0-36
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:26:14 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@swg.vates.tech>)
 id 6aedd575-5984-0a2a45010019-b9ff1c229c81-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:26:14 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b109bd79000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 13:26:07 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1A7E981B95;
 Fri,  6 Nov 2026 14:26:07 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Hmgxji7An4mAochBznqTOQkl4o+11pRrXV6Aur32hg8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=K/RYsSw5DYRKD93vK9p8XaDQhwvY9Od+dx4deaE9C/KUXmg/pWWp38Ma9OgLNrP6S0AmEHGRb
 PvotO3NroxMxs7fCN8Bpf+bGKdFqyGs82cPiJhWI1bJGVPH3fJSP7F70BVkLL7EGa3D00w5Gpt5
 KRY3ql9roKPX/UTLLEYLVGIgG2zmkiPScq5MJd8a4UYQEjAqBg0Byde+MC3zNJfFs2+FbBWJ8tj
 tXNNxuaIUGvajNlej/FPH41PT/h5e/7Q/tJwEXU6xxIBN04OQbNWv2VM8ZnW3QORVm/kYxopCmV
 vTfRrqBtTBv0I/MdZbC7gfjqMeMD0VGHxGJKP6karNyQ==
X-Zone-Loop: 00e2ba4c386efe7d8d29ca7461ea935329c8c697adea
x-campaign-type: default
x-transaction-id: a02dec0c-777f-4b15-9e29-e396507bca9b
x-swg-uid: 01-bca9a514-cc23-4df6-ad55-a523a5484a5f
X-Mailer: Sweego
Message-ID:
 <1793971568.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@vates.tech>
x-swg-bid: 1793971568.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 31/39] xen/riscv: remap interrupts to new IMSIC
 VS-file
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
In-Reply-To: <d272b357-b5cc-42e6-9a84-753f361ad278@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <45011daea86267b8f4b707bc7de6357b0712fb08.1790779209.git.oleksii.kurochko@gmail.com>
 <1793023599.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@vates.tech>
 <d272b357-b5cc-42e6-9a84-753f361ad278@gmail.com>
Date: Fri, 06 Nov 2026 14:26:01 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793971561; l=4248;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=kuM5tW8smaEVGTEfyFm0ZRaxZR+ZvXFPIDpY0dPaKXk=;
 b=Ju/USQ2fgsb1F/Vz56w/Rru/ksYyQgUp18454DRd0IlEX6RYIK5TGfZ8qVNR0f+CX2rU8Sy0d
 GPGh5pxb9K8D5d2U4ApN0dI3ODhfKHjB/1SHaBY7o8IaCvAcYq519Ma
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793971567336
X-purgate-ID: tlsNG-d62444/1793971574-BDC79757-1EB08475/0/0
X-purgate-type: clean
X-purgate-size: 4248
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 17:57 +0100, Oleksii Kurochko wrote:
> [ ... 52 lines skipped ... ]
> 
> > At this point vgein_assign()
> > is still BUG_ON("unimplemented") too, so none of the new code can
> > actually run, and the error path can't be reviewed against the real
> > vgein_release().
> > 
> > Also, until "introduce IMSIC h/w interrupt file attaching to vcpu", no
> > vCPU ever owns a h/w file, so imsic_migrate_vcpu() can only hit the
> > CPU_NONE check.
> > 
> > Wouldn't it be simpler to move the two already-acked patches and the
> > attach first, so that no stubs are needed and each migration step is
> > written against its real callees when it lands:
> > - Add basic VGEIN management for AIA guests (real vgein_assign() and
> >    vgein_release(); the reason for the explicit cpu argument of
> >    vgein_release() would then have to go into this commit message)
> > - Map IMSIC interrupt file for vCPUs (real imsic_map_guest_file())
> 
> I think I have such order before and it was changed becuase for locks in 
> the first patch it wasn't enough context to understand if they are 
> needed or not.
> 
> > - Implement continue_new_vcpu() and set hstatus.VSXL
> > - Attach a h/w interrupt file to a vCPU on its first run, introducing
> >    imsic_vsfile_acquire() and imsic_update_state() with their first user
> >    (acquire, vaplic_reconfigure_target(), set hstatus.VGEIN)
> > - Prepare new IMSIC VS-file (on top of imsic_vsfile_acquire())
> > - Implement APLIC-IMSIC-hart sync barrier for vCPU migration
> > - Remap interrupts to the new IMSIC VS-file (APLIC retarget + sync)
> > - Save/clear old VS-file, restore, SGEI wake-up as today
> > 
> > A side benefit: attach no longer has to be squeezed into the finished
> > migration code, so imsic_vsfile_move() with its first_attach argument
> > and the goto set_vgein go away. Attach stays a plain sequence, and
> > imsic_migrate_vcpu() simply reuses imsic_vsfile_acquire().
> 
> I'm fine with that order. It does mean that "add basic VGEIN management"
> and "map IMSIC interrupt file for vCPUs" introduce functions whose first
> user only comes with the attach patch a few patches later. If that's
> acceptable, I'll add a post-commit note to each of them saying where the
> functions get used (as IIUC, they will first introduced and then used in 
> later patches).
>
Yes, the post-commit notes are fine with me. IMO it's better to introduce
the real functions before their first caller, even if that caller only
lands a few patches later, than to write callers against stubs. That way
each migration step is written against its real callees, and the order
follows how IMSIC actually works: a vCPU gets a file on its first run,
and only then can that file be migrated.

The locks in the VGEIN patch would then get a real user a few patches
later (the attach patch), and that patch's commit message can explain
why they are needed.

What do you think of something like this, after "introduce
vaplic_reconfigure_target()"?

- Set the guest's XLEN explicitly in hstatus.VSXL (moved before
  continue_new_vcpu(), with the vcpu_set_vsxl() call added to its stub,
  so that no commit enters a guest with an undefined VSXL)
- Implement continue_new_vcpu()
- Add basic VGEIN management for AIA guests (acked; the commit message
  would have to explain the explicit cpu argument of vgein_release())
- Map IMSIC interrupt file for vCPUs (acked)
- Attach a h/w interrupt file to a vCPU on its first run, introducing
  imsic_vsfile_acquire() and imsic_update_state() with their first user
=== migration
- Implement APLIC-IMSIC-hart sync barrier for vCPU migration
- Remap interrupts to the new IMSIC VS-file ("Prepare new IMSIC VS-file"
  folded in, as with imsic_vsfile_acquire() already there it is reduced
  to a single call)
- Save and clear the old IMSIC VS-file on vCPU migration
- Restore register state in the new IMSIC VS-file
- Wake up a descheduled vCPU on a guest external interrupt (last, as it
  arms HGEIE in imsic_migrate_vcpu() and clears it in
  imsic_vsfile_local_read_clear())

But I'm not an expert in patch series management, so I may be wrong.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

