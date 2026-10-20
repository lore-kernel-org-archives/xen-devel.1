Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9A606A324
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=eIz/40Oz
Received: from list by lists.xenproject.org with outflank-mailman.1455961.1669572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBJl-0008V4-A2; Tue, 20 Oct 2026 14:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455961.1669572; Tue, 20 Oct 2026 14:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBJl-0008Ux-7I; Tue, 20 Oct 2026 14:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1455961;
 Tue, 20 Oct 2026 14:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJBJk-0008Ur-Lt
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 14:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJBJk-00DbrN-2i
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:59:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d355ee000f79f@swg.vates.tech>)
 id 6ad781dc-bab6-0a2a0a5309dd-0a2a4502e3c2-32
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:59:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d355ee000f79f@swg.vates.tech>)
 id 6ad781eb-6ca4-0a2a45020019-b9ff1c22a9f3-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:59:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a159d355ee000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 14:59:44 +0000
Received: from [10.235.238.14] (149.173.185.81.rev.sfr.net [81.185.173.149])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 58B1F82C93;
 Tue, 20 Oct 2026 16:59:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=t9wbN/2AA5muZyQtX251zwAhFK6rWAPKQApJ4Pd5M2s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=eIz/40OzXV/Mq+bsv/O1yvjUWfsUbaDkpx/FQ/XlgHetItGN0bDmMK80WpOXgAtEfA03B3XgI
 wbUf3PaA98/aLIssUkKPW73ggpINhcD+BUvR0a5KmHYLxltpgLHCwDIfT8E8PsdjkTEK105iDiH
 L+MGjYxu0pZpaarH5K8QiFfQZsivKxEW5c8X85yVPCRNzA5O7GY0CoBDxNMbBaQUJIqqsB67DuF
 gqFoFtapuGNCOAhkBnJttFOmsqzn96WKpaqqvJoXZv4rpFxyXQ9fBF/uGtvCb67n5Slse6H1hT3
 CtyxIRvUMN+D5/1bEUgunCd3NHKC3DL5asEgiVPgpFiw==
X-Zone-Loop: 97a14402183efeeaee22a08beb62303e42f76dbfa4cf
x-campaign-type: default
x-transaction-id: c612f015-b0f1-490f-a367-377fa780c720
x-swg-uid: 01-e9f974b9-7d30-40da-bcc5-110e62601fc4
X-Mailer: Sweego
Message-ID:
 <1792508384.8631fc262581453bbf619ec5b2062170.1a159d355ee000f79f@vates.tech>
x-swg-bid: 1792508384.8631fc262581453bbf619ec5b2062170.1a159d355ee000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 16/39] xen/riscv: decouple INSN_PSEUDO_VS_* from the
 hypervisor's XLEN
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
In-Reply-To: <198c5d8b140fb156b914eae007582ec3b0e83cba.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <198c5d8b140fb156b914eae007582ec3b0e83cba.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 20 Oct 2026 16:59:35 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792508376; l=936;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=FkshxL7v1IQwBJVln9Xlm09mUGf1Z1rNv628cddjKhM=;
 b=au5EgGwKB61ZdFkI3VMcGZiLxO5hawE0YQIj/soxOzDze0SgJEXezOlLst4Pl0OGubo5Qg5Le
 Y7iEV7DXAKBA1mZzTEJAGHLvf1P6LcDLMO2dzXwQen6UA9jE5UCVJ2t
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792508384337
X-purgate-ID: tlsNG-720697/1792508395-319CB2AC-B2BBCBEE/10/73395122804
X-purgate-type: spam
X-purgate-size: 936
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 30 Sep 2026 18:23:35 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> htinst reports a pseudoinstruction when a guest page fault is taken on an
> implicit memory access done for VS-stage address translation. Four such
> values are defined, differing in the access type (read or write) and in the
> access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).
> 
> That width is the width of a VS-stage PTE, i.e. it follows the guest's
> paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
> to do with the XLEN Xen itself is built for. Yet only one pair is defined,
> selected by Xen's XLEN and named as if it were the only one, so the 4-byte
> forms, which a guest running with VSXL=32 and Sv32 in vsatp produces, can't
> be named at all on RV64.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

