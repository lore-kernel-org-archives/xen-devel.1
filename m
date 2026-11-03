Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B1606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QAmasKLE
Received: from list by lists.xenproject.org with outflank-mailman.1469919.1678682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFJ2-0006SS-9I; Tue, 03 Nov 2026 14:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469919.1678682; Tue, 03 Nov 2026 14:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFJ2-0006SL-6m; Tue, 03 Nov 2026 14:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1469919;
 Tue, 03 Nov 2026 14:16:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d@swg.vates.tech>)
 id 1xOFJ1-0006S9-2k
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:16:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFJ0-00750q-FD
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:16:06 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d@swg.vates.tech>)
 id 6ae9ec8e-e002-0a2a0a5209dd-0a2a450ba400-48
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:16:06 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d@swg.vates.tech>)
 id 6ae9eca6-b7e8-0a2a450b0019-b9ff1c228ee5-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:16:06 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1c44b87000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:15:58 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A7EE380C20;
 Tue,  3 Nov 2026 15:15:57 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=yeWa5vJScDdbzVneSr0wfdM9M8MEHAvVD0jdPPMIzTQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QAmasKLEq/QAcfNPqnpHvjo2I4xtE5L5rvqbsmPFm+v+BaHyABAbvtucsPTYAs27hlWo6yAUT
 RDgxLLGo5nytzBuhP4Eb4ULnmJ8qpNf/SpS9diACdtl3wimqIgcHZowXYpdBFpZDrjAXJK3I8Pm
 Y6QNRegAXL3C5eNNTbh8qwMk9ZUNYsRFprZK0z16aOhtzjZYyxVILcMGA/wBAmAOmyxzxw2/Fjt
 Zf8l+O85PSQX+r6jMnGeCHhV2pVQhK+NFvoYl4/lK+8M1cf+/U7JB8kiap/S66ApPXc2kk+rQel
 yKD71v8vNX0joK/8BXdgPs4Ft3r9r2y6HrvHQ3XfojeQ==
X-Zone-Loop: e74429844a4fd8262ffc65dadc6e5210a10271968d79
x-campaign-type: default
x-transaction-id: 97b2185a-d887-4960-afd6-712a175d0500
x-swg-uid: 01-fbe9df10-262d-467d-909d-597e16e10164
X-Mailer: Sweego
Message-ID:
 <1793715358.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d@vates.tech>
x-swg-bid: 1793715358.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
 Zhang Zheng <zhangzheng@iscas.ac.cn>
In-Reply-To: <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
Date: Tue, 03 Nov 2026 15:15:52 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715352; l=311;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=76suPJMBoluOEgv7yB3N+dLfGmMPKTY49CBjmitjPSA=;
 b=FaIyTlWUQgJENXrkjpKBptrc9go48hjKU7yhsMiUfZUfOk8bD/QxIGvGx2AAaajAYs6SHOlVM
 y75P4Xh344RB4/IRFY5Q1QexwNFndpZ+wHFc2KHNK4NkEguiHZiDF6y
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793715357854
X-purgate-ID: tlsNG-42698a/1793715366-A9CC79EA-D5AD5C76/0/0
X-purgate-type: clean
X-purgate-size: 311
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 15:08 +0100, Baptiste Le Duc wrote:

The cover letter did not get threaded with the patches, sorry for the
noise. It is here:
https://lore.kernel.org/xen-devel/1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

