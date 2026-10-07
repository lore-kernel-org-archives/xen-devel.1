Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FACCA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 09:12:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442061.1659594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xENge-0000TI-Ru; Wed, 07 Oct 2026 09:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442061.1659594; Wed, 07 Oct 2026 09:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xENge-0000TB-Nw; Wed, 07 Oct 2026 09:11:44 +0000
Received: by outflank-mailman (input) for mailman id 1442061;
 Wed, 07 Oct 2026 09:11:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xENgd-0000T5-8V
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 09:11:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xENgc-008cvQ-LG
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:11:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a115a1f37e0003f66@swg.vates.tech>)
 id 6ac60ccc-bab6-0a2a0a5309dd-0a2a450ad4de-26
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:11:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a115a1f37e0003f66@swg.vates.tech>)
 id 6ac60ccd-f2d2-0a2a450a0019-b9ff1c229b41-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:11:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a115a1f37e0003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 09:11:37 +0000
Received: from [192.168.1.17] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 846FC81DDC;
 Wed,  7 Oct 2026 11:11:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=WRO3g9gRG1WLovFJ+ZYBe4O9w4/UxWnJx8GUWks1gXo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=VXgb4+t7iUPrkxN8ZepfE1pJi6ylYu+gjMI5AIQRLc+TOtSyMJduWz/HcfjWVnDLiKwPgNnWj
 tfIzIwDqRzv1Su4chyhXgbwGcTwYxqgv/b8+yM/v0WaoisQJ+CiZmFIQ4mQWE22II30jcNukzyu
 isoZI5avWQJOOjFjmnhclKoAUqzRlBoFyFle9Q2O20lNPZEH0WnqeIFbriRYoqxaB4R5L2Nsxrx
 Q4aLMM2/9FD+dCsmX0rBO4Rs5qbHllhOYbGBjAirK+qcUNd5Q7SSnKUO/nxoRbISyTS0j77fssW
 hVqIOpXSJXdM884iU4pMKyVE0sb8mD0h8GyGxhrewWwg==
X-Zone-Loop: 9f648b2da2008d5afde89651beb59ccb324e34e3b602
x-campaign-type: default
x-transaction-id: 4db2b20c-102e-45b1-b1fd-5994e78b90ef
x-swg-uid: 01-6b847cc4-5bf7-4d57-b673-2dac810960a9
X-Mailer: Sweego
Message-ID:
 <1791364297.8631fc262581453bbf619ec5b2062170.1a115a1f37e0003f66@vates.tech>
x-swg-bid: 1791364297.8631fc262581453bbf619ec5b2062170.1a115a1f37e0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 13/39] xen/riscv: introduce
 vintc_ctxt_switch_{from,to}()
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
In-Reply-To: <752ca5c3e7af9e4d2037783d7d213a9bc2360c83.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <752ca5c3e7af9e4d2037783d7d213a9bc2360c83.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 07 Oct 2026 11:11:22 +0200
X-Developer-Signature: v=1; a=openssh-sha256; t=1791364296; l=569;
 i=baptiste.le-duc@vates.tech; h=from:subject:message-id;
 bh=DbsrGgsALD7GsKnsa4PdK2X/4zVx4OIJDrDoVpqQUmI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgQKqDblDzOFimZyyhA+RsKnxim2EiA
 60KatQBsuueKYUAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJxSrq4S3LjnlfnQ45zGvgt9+1XnefuluqSltVvDRwDkaRlM2lZ9ipVt27bQWK6iJ8mLohwd4uU
 gbIe7szWINAc=
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=openssh;
 fpr=SHA256:YieMhmvNcCYpeUbL6HuedGp4rwSlu4mQ+D7EJoVHM+k
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791364296787
X-purgate-ID: tlsNG-4011c0/1791364302-4ACDBCFC-7DA5FD87/10/73395122804
X-purgate-type: spam
X-purgate-size: 569

On Wed, 30 Sep 2026 18:23:32 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> Virtual interrupt controller state must be preserved across vCPU context
> switches.
> 
> Introduce vintc_ctxt_switch_{from,to}() wrappers around new
> ctxt_switch_{from,to}() hooks in struct vintc_ops, and call them from the
> context switch path, so that this state can be saved/restored without
> knowing which vINTC variant a domain uses.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

