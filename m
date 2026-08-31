Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B0DC624A4
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:48:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404016.1637951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RG-0006Zk-IK; Mon, 31 Aug 2026 12:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404016.1637951; Mon, 31 Aug 2026 12:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11RG-0006Zd-FK; Mon, 31 Aug 2026 12:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1404016;
 Mon, 31 Aug 2026 12:48:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x11RE-0006Yy-H2
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11RD-00Dh0a-Fi
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:48:35 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1e4c000c4f3@swg.vates.tech>)
 id 6a957805-8faa-0a2a0a5109dd-0a2a450be97e-34
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:35 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1e4c000c4f3@swg.vates.tech>)
 id 6a957822-b7e8-0a2a450b0019-b9ff1c129c53-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a057dd1e4c000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 12:48:24 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7E5B683D11;
 Mon, 31 Aug 2026 14:48:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=EOuLCnnMzdC6UbIsBnrHPPyIqp1u/156zXfrES2mmZs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=obYodD+Hql/B6ziGAVpsbrTo3BpLxpHEx/XuJph81K0WKaHfooZe4FgFV+Zz6tuQcX0bMiCKQ
 oE2Uoo8Cgmvula9XwdlNORyrx7d8uUaUQBJe05slILIzMG9R8kXds0QMWkcX87oZrGGAuodYJ3d
 rv9XwEhdjcSEz4b19JXbh0QIuRLfow2SNnKAvjf5TPYnirLau1c+eKBAedd4sd5gflMLLJLZ8eo
 /Fp0Box29TL1DthOKLqXESd5dxQIoQMpFJ0dEhq0ZIl5mo01dzbvMCV4mtTX2UVMnee36fjJpzc
 Zd1XB/f+clWRabBbfPdIH7vVslQDN87MgSgcITuGVDsQ==
X-Zone-Loop: 278a4888d7b17e3db4140b556059505f75116c88308d
x-campaign-type: default
x-transaction-id: e49872d1-2edb-445c-8fc5-6ef3f90d3db5
x-swg-uid: 01-74358d06-6299-455c-bbf9-ca3dac17eb5f
X-Mailer: Sweego
Message-ID:
 <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1e4c000c4f3@vates.tech>
x-swg-bid: 1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1e4c000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 02/39] xen/riscv: drop bug.h's duplicate instruction
 length helpers
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
In-Reply-To: <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 31 Aug 2026 14:48:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788180503; l=470;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=vt7iWQzfVTqTPvlN2lvgu7IvQBV8ot4bkuc1bMzCk6w=;
 b=zQgLOqefNz0XV0VS8LYzeo28vp2+a4po0aagsNNnWaIHU3aZPEyFOyIrEHxkib1qSWi6ossAU
 YEiyJ2HLfwBBILzsa7+H9Yj4HVOJxFnXlhYvifP6ft4ytulUXAr/LtO
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788180503712
X-purgate-ID: tlsNG-42698a/1788180514-ABAD09EA-977A812C/10/73395122804
X-purgate-type: spam
X-purgate-size: 470

On Thu, 27 Aug 2026 17:20:46 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> asm/riscv_encoding.h already provides INSN_16BIT_MASK and INSN_LEN(), and
> emulate.c uses them, so the tree carried two spellings of the same thing
> which could drift apart. COMPRESSED_INSN_MASK never had a user.
> 
> No functional change.
> 
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

