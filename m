Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9F606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=AdGqESOl
Received: from list by lists.xenproject.org with outflank-mailman.1461412.1672419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLLY-0006GZ-Fj; Mon, 26 Oct 2026 14:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461412.1672419; Mon, 26 Oct 2026 14:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLLY-0006GS-D3; Mon, 26 Oct 2026 14:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1461412;
 Mon, 26 Oct 2026 14:06:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@swg.vates.tech>)
 id 1xLLLW-0006GM-Ov
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:06:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLLLW-000c5A-5V
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:06:42 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@swg.vates.tech>)
 id 6adf5e71-e002-0a2a0a5209dd-0a2a450be02a-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:06:42 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@swg.vates.tech>)
 id 6adf5e71-b7e8-0a2a450b0019-b9ff1c12a95f-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:06:42 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a17888e252000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 14:06:39 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5500982EC5;
 Mon, 26 Oct 2026 15:06:38 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=djw2QxPds94pGLugen6+El3ECWShTp8nUm5eIsTN8/4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=AdGqESOlKnjJrDXEiRb7GJWB6D3XTs12bHKr5RVjKZ2utnUNhWdK/v8JJrIyJ6+rhkfSSwhaa
 XIZIpjdtZ8TDOaUaXnSi6N9tMoIIW8gOQ8scMQ3+ys4LXfodrtdmztS24aM/8k5bb2PeKXMGqFI
 B5kReBQTvRyjVvdEYiM/+sUKkAsy0T6HjBEwS5mHP0qCbrMCIBKFjoiziSmA0kHCn1BR0wYNqHz
 MyPxTLyjWPEFXQPwPTa7j0mxKth2N0hWb4P7LS0tLW6WrGY0clyGLYrrzODUqnN6FKAf+0E9ZhT
 1KfEpCC3ZIHtMLr+tac1ONMD4/LoMjeI4u+TCEtN4ApQ==
X-Zone-Loop: 443a7e1da17fe878ed71ad2153ebae0473ca668f1620
x-campaign-type: default
x-transaction-id: e0ba788d-5ff4-4b3e-9ae2-69e890530320
x-swg-uid: 01-42c11d37-ede3-4281-bb04-111bbc591ecf
X-Mailer: Sweego
Message-ID:
 <1793023599.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@vates.tech>
x-swg-bid: 1793023599.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f
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
In-Reply-To: <45011daea86267b8f4b707bc7de6357b0712fb08.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <45011daea86267b8f4b707bc7de6357b0712fb08.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 26 Oct 2026 15:06:29 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793023593; l=3944;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=viqPS50PsFoz/TkblGzIMI54ljn0gloQUKzoXBVka3c=;
 b=Sp+u2rPvy7J5VqE/tF3imPcnwhnGayedeMzC8yUVnLSqb3Ol21wwX7PFnrReYYkuq2u0q7KjT
 e0mzpOVwzGQB8UiFf3qIVBsDiXzw/exETyGybwDOTSHDJqphiCoUbpI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793023598552
X-purgate-ID: tlsNG-42698a/1793023602-A94C39EA-5AB75359/0/0
X-purgate-type: clean
X-purgate-size: 3944
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Once the new IMSIC VS-file has been zeroed out, it has to be mapped into
> the guest's G-stage in place of the old one. Also, if any interrupts at an
> APLIC are forwarded by MSIs to the old interrupt file, reconfigure the
> APLIC to send them to the new interrupt file.
> 
> Taking a h/w guest interrupt file (assigning it, zeroing it out, mapping
> it into G-stage and recording it in the vCPU's IMSIC state) is factored
> out into imsic_vsfile_acquire().
> 
> The relevant translation tables at all IOMMUs would also have to be
> updated so that MSIs for this virtual interrupt file are sent to the new
> physical interrupt file, but that is skipped for now as there is no IOMMU
> support for RISC-V.
> 
> Synchronize with the APLIC to ensure that no straggler MSIs will arrive at
> the old interrupt file by running imsic_aplic_sync() on the pCPU which owns
> that file.
> 
> If the new file can't be mapped into the guest, release the guest
> external interrupt number imsic_vsfile_acquire() took for it instead of
> leaking it. vgein_release() takes the pCPU explicitly instead of relying
> on v->processor, as on migration v->processor already refers to the new
> pCPU while the number to be released may belong to the old one.
> 
> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> against silent incorrect behaviour or unexpected panics in guest VMs until
> the function is fully implemented.
> 
> Implement imsic_update_state(), which records the vCPU's guest
> interrupt file id together with the pCPU owning the file. The two are
> read as a pair, e.g. by imsic_migrate_vcpu() and the IMSIC context
> switch hooks, so they are updated under vsfile_lock as a single unit.
> 
> imsic_map_guest_file() and vgein_release() are stubs for now.

I have the feeling this patch does more than its subject says: besides
retargeting the APLIC and adding the sync, it introduces
imsic_vsfile_acquire() (assign + clear + G-stage map + state update),
imsic_update_state() and the error path, which relies on two stubs,
imsic_map_guest_file() and vgein_release(). At this point vgein_assign()
is still BUG_ON("unimplemented") too, so none of the new code can
actually run, and the error path can't be reviewed against the real
vgein_release().

Also, until "introduce IMSIC h/w interrupt file attaching to vcpu", no
vCPU ever owns a h/w file, so imsic_migrate_vcpu() can only hit the
CPU_NONE check.

Wouldn't it be simpler to move the two already-acked patches and the
attach first, so that no stubs are needed and each migration step is
written against its real callees when it lands:
- Add basic VGEIN management for AIA guests (real vgein_assign() and
  vgein_release(); the reason for the explicit cpu argument of
  vgein_release() would then have to go into this commit message)
- Map IMSIC interrupt file for vCPUs (real imsic_map_guest_file())
- Implement continue_new_vcpu() and set hstatus.VSXL
- Attach a h/w interrupt file to a vCPU on its first run, introducing
  imsic_vsfile_acquire() and imsic_update_state() with their first user
  (acquire, vaplic_reconfigure_target(), set hstatus.VGEIN)
- Prepare new IMSIC VS-file (on top of imsic_vsfile_acquire())
- Implement APLIC-IMSIC-hart sync barrier for vCPU migration
- Remap interrupts to the new IMSIC VS-file (APLIC retarget + sync)
- Save/clear old VS-file, restore, SGEI wake-up as today

A side benefit: attach no longer has to be squeezed into the finished
migration code, so imsic_vsfile_move() with its first_attach argument
and the goto set_vgein go away. Attach stays a plain sequence, and
imsic_migrate_vcpu() simply reuses imsic_vsfile_acquire().

Migrating a vCPU which has already run would still hit the trailing
BUG_ON("unimplemented") until the restore patch, but that is no worse
than the panic() it hits today.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

