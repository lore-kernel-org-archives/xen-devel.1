Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CFCC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 17:03:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429272.1652187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x93ts-00036E-Vd; Tue, 22 Sep 2026 17:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429272.1652187; Tue, 22 Sep 2026 17:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x93ts-000367-T7; Tue, 22 Sep 2026 17:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1429272;
 Tue, 22 Sep 2026 17:03:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca1270b600072c4@swg.vates.tech>)
 id 1x93tr-00035y-RS
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:03:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x93tr-00AcQB-8H
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 19:03:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca1270b600072c4@swg.vates.tech>)
 id 6ab2b4be-8faa-0a2a0a5109dd-0a2a450ceb4a-46
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 19:03:23 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca1270b600072c4@swg.vates.tech>)
 id 6ab2b4da-f479-0a2a450c0019-b9ff1c128023-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 19:03:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ca1270b600072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 17:03:21 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C110081BC9;
 Tue, 22 Sep 2026 19:03:17 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ONy15IQp8/c+sWVq7M1U+PHLMkvnpBm1Fx5erVNBUJw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=pBFw+w6hXkIdbxii5REinbr8Qeq9pl0dCA7O13/n3XzmfnlXyMgwU3Pc+O92iw1sAA2Q6wGgl
 2dxgHJfLsfuZQHwkZYZ9Tl+qJJO+xQ5Qsl881KSJwWc1y21Zzmb/3rhkFJI55fxOIP1qc8wz+H6
 iDbFIvw06ELeejPYOv1LT1YXjHKaS+ndZCqZ2Fdi4d4VJkreIZOpjcFoYNcaMC/FQNhBtUauTuX
 YUpvaPgy3G2PwrnwpnRVLkKszsnTyVTQTTXJtjWE7okYqXTZinib8qX5BGzjSaitJXBDBfOSppk
 f8hFky4moUfvXXdnNWfNQKJou6MBOkuxKqmMMez3AB5g==
X-Zone-Loop: 1da72f24e40c9350b51869622d599f8dca9459ab5fa9
x-campaign-type: default
x-transaction-id: 2afd3361-c69d-4012-a82f-db9066d3ecfe
x-swg-uid: 01-b93e5509-bec0-44e7-a8d3-9055e74a5c06
X-Mailer: Sweego
Message-ID:
 <1790096601.8631fc262581453bbf619ec5b2062170.1a0ca1270b600072c4@vates.tech>
x-swg-bid: 1790096601.8631fc262581453bbf619ec5b2062170.1a0ca1270b600072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier
 for vCPU migration
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
In-Reply-To: <2e07e5e8-bd6c-4ec9-b656-6fa8c61bb456@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
 <45f6e417-ea0e-470c-bfae-e163a65b48d0@suse.com>
 <2e07e5e8-bd6c-4ec9-b656-6fa8c61bb456@gmail.com>
Date: Tue, 22 Sep 2026 19:03:12 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790096592; l=2172;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=YvSFGSEofh4TgOJCL12sD2xJouKXuEGsA7+UhywqWEM=;
 b=vIPVlrQ9e0EsxY515hCY/AH4pPndw0xpdRYKFmcaHnl2WHyxM0BGPixOC/5ejg6Js9CYleLgf
 DHtsoowu42WBtfWtlKRbIRhTNSgeT+XotBNPFsjo5gsyHyjV4TXJCh4
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790096597988
X-purgate-ID: tlsNG-d25034/1790096603-02CDBA5B-A35DF6A9/0/0
X-purgate-type: clean
X-purgate-size: 2176

On 2026-09-18 13:53:12+02:00, Oleksii Kurochko wrote:
> On 9/14/26 3:27 PM, Jan Beulich wrote:
> 
> > On 27.08.2026 17:21, Oleksii Kurochko wrote:
> > 
> > Hmm. As indicated, I'm learning RISC-V as I'm reviewing patches. This
> > paragraph, if left as is, would make sure I simply can't ack the patch.
> > I just don't understand what is being talked about. I can guess parts,
> > but for example I don't know what "genmsi" is.
> 
> I will reword then commit message in the following way:
> 
> ```
> When a vCPU is moved to a different guest interrupt file, MSIs that the
> APLIC has already sent towards the old file may still be in flight. They
> must land before the old file's state is saved and the switch is done,
> otherwise they would be lost.
> 
> To wait for them, use the APLIC's genmsi register. Writing it makes the
> APLIC itself send an MSI (an "extempore" MSI) with a given interrupt
> identity to a given hart. genmsi can only target the hart's supervisor-
Nit: supervisor = hypervisor in our pov
> level interrupt file, not a guest one, but the AIA spec guarantees that
> all MSIs previously sent by the same APLIC to the same hart become
> visible at the hart's IMSIC before the extempore MSI does. So once the
> extempore MSI has been delivered, no older MSI from this APLIC to the
> hart can still be in flight, whichever interrupt file it targets.
> 
> The last interrupt identity (nr_ids) is reserved for this purpose.
> ```
> 
> > Along the lines of a question on an earlier patch: What if this ANDing
> > actually chops off bits?
> 
> I will do then the same as I did in aplic_set_irq_affinity() (i 
> mentioned that in the one of the replies connected to this function in 
> this patch series):
> 
>      /*
>       * sync_id is nr_ids, which imsic_parse_node() limits to IMSIC_MAX_ID,
>       * so it always fits into the EIID field.
>       */
>      BUILD_BUG_ON(IMSIC_MAX_ID > MASK_EXTR(~0U, APLIC_TARGET_EIID));
>      ASSERT(imsic->sync_id <= IMSIC_MAX_ID);
> 
>      val = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
>            imsic->sync_id;
> 
> Thanks.
> 
> ~ Oleksii



