Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170D606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 18:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=BRs+t4ks;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Vx/K0IlD
Received: from list by lists.xenproject.org with outflank-mailman.1501450.1697517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvfP-0004I9-P1; Tue, 24 Nov 2026 18:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501450.1697517; Tue, 24 Nov 2026 18:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVvfP-0004I2-M7; Tue, 24 Nov 2026 18:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1501450;
 Tue, 24 Nov 2026 18:54:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arnd@arndb.de>) id 1xVvfO-0004Hs-3G
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:54:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVvfN-006MKl-8g
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 19:54:57 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arnd@arndb.de>)
 id 6b05dd48-8faa-0a2a0a5109dd-0a2a4508c55e-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 19:54:57 +0100
Received: from [103.168.172.139] (helo=flow-a4-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arnd@arndb.de>)
 id 6b05dd80-f659-0a2a45080019-67a8ac8baa73-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 19:54:57 +0100
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
 by mailflow.phl.internal (Postfix) with ESMTP id C8B5813806FB
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:54:55 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
 by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 13:54:55 -0500
Received: by mailuser.ams.internal (Postfix, from userid 501)
 id 1964B32A0099; Tue, 24 Nov 2026 13:54:21 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=arndb.de header.i="@arndb.de" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-Id:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795546475;
	 x=1795553675; bh=zzADWq2A9f6U6Ncm9LM291Imr7Nwrsax19gq4eW/i1s=; b=
	BRs+t4ksTqnTtE1oYjJwDc1C9K5jlphfaup5bA8IjY07JdlXNr3LnaRbvngocT+l
	0s8mpcGjn2w5BH00n8m4unx2HOzBIssG9G0cRWhbuMv2TLmdp1NalygFp5oxuPtJ
	wTAJP5SGdhazfnxYVfevwxTV6el91PqN32OZosleJtIwlS9tg7bn57xISyTR2cV2
	w8mchKYS54UTYuQdinubggxyt/E11YV+y1DBfPwx09QgOMJyBy4X/e1dzVXEdCLQ
	UfkpU0yQ7iyBQzG/lrKYkD+WJELv9rYSdR8XNg8Icg5Xi7DvSz7qRf9OXV3LCBtL
	CSzbMSwdg5Yc27rprTFHxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795546475; x=
	1795553675; bh=zzADWq2A9f6U6Ncm9LM291Imr7Nwrsax19gq4eW/i1s=; b=V
	x/K0IlDvDMzIOh6ytEGzD9KXK48W6+PlY63Pkk5C4LqO8corTR1AOL6M3C0HEOEt
	RnYztbOsrj/0nf6VZ7GNoKO3ESw2hQALr88flIWiz5nE2Vis9yZo/Ns4DfYzZ8gs
	HGrNVlz/fNpZlQyjnvQnlw9skxNMOmJEBOYaR4LGyOZQhwF7fyOi5lto72PKc/d5
	FXgv4UzC3YmDb9P8JTElHIgUuk8lUDGbXOVIkdWbLNNQrV65HVYiNE+VAzlmo2Mr
	249vwFX/TxOavA6UatGb13UOmLI4UeYjVkP4zkYTEoRL1UdTk0BTJTgoKHcSuG8k
	+lq6xcKwaH/EuXoPJowQg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795546475; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:LmaUisbum0w5qZZvte+4iUwdL9VNm5st16BnIEmWFnIeJJA
	Ug68as+LIFUzLzCiLwxABGgd9BMJ3sRRMYQaK9QhIccP86JwoltPo4h16d5rcoaa
	tcWrzjSYZpXdqSbD+YHBeoTkiAQv6yS6d5X57D/5j2QJDcrdTkwm9gsxDCHVuBPa
	6XL0Lm7A8fYnpuZiJKRXLGauS+2R8kz2iXJvGHSo2eBzjwX6jt/5Ctryp4PaOtfs
	c23HGWIbLKiL1R1+qDloCJhJs9xAiMx8Q8DOvbmd678VK0+fxocvGdIl7RgUuzZo
	G1t2L4Pj4uKINPnfFLB1UEkhyRCp5vWeTrVvkVg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LzM4tAbzweW+mDyb/1r3509G6pq6a3/4tE8KTO1Vt/k=:zzADWq2A9f6U6Ncm9LM291Imr7Nwrsax19gq4eW/i1s=;
X-ME-Sender: <xms:Xd0Fa55FOfcfIgivK7gDT2s90l8T2iyzgndSBP-plhfJtABFXfc8Eg>
    <xme:Xd0FaxtsJcVSGFN5HVXn38MtsB8YALAp-Wx8fFhFezYcs-M83HeSNrRFesiuboQoW
    5UfpbOJWqvvpnAVz9GZ53DVxThH7R3ev1eLeyVj0ZpYxdoXqLzoT860>
X-ME-Proxy-Cause: dmFkZTFIFQbDkqPixxG6ZmbrNqWja0iBmS0t+/2OXw3Hr68jTmofYge70Jd2C8rdOHxiEX
    pUSI1QmY8wa8hdAn9aHQtwJQbrzJ92rRcp5Lj4ZnT7lqds2vmNLcn0UUOnmmP8hv3V6w+/
    4jmHwhmrL8ACMwHSGKtRy9Vnn1gbC9jBuNuwnrpPjs09zdYgYnDdJ7dHlbs8/Vq3FaRIg2
    harjfzAY/2DUVwFrNAo5sJTbPVeYuXkjeFTXI2vNrndIhUaMB0WHtTD9Snytzp1zPIggcK
    0Qu1xi+ImflvZSyP3jJ4f+Pj22kJds4yfs5MDHkxWsLhkYz/NB/2cV/kiMtdUnvlRqpyL2
    pa8DmP1PV2q7BXbNlBMb0LKR9J0cg5zWatj1ewFm/B4wUeq2NcKYG3p/wiHSLf/7MZkJPo
    55VBqztvGKRmqQhHsRaalq/b5qWlczTjuaCR4KHYJNMSuYr6Ue5sGaBM73CTNL8k5C+HeS
    6yw7flTH1KDfWZ2D/nTRJ3KwclHeIC555NIo/fbXlsIZrqs/aZ2GTd67CpM9d+D1a0dou3
    PxTyuQMHWomu85N198NFQNJkn2rRVPia1CBEDpS4YilQB2ja7EgRCyk+GRsdfBsMdfvj61
    iX1Tevck3x163pXwovYHvcc+KWnNS+6vzDYjKokt0XM2OTPlrT2Sqf+0nrGw
X-ME-Proxy: <xmx:ZN0FawFxheCN-x8-0Vbv0XSt5auhNbm68w5nEL_E_IUlqy9inlE7gQ>
    <xmx:ZN0Fa_SMlpnS-VL9ozFnJwNMSJnC9TJbQVcM28ytDW_qtr-tXAFROg>
    <xmx:ZN0Faz1H8jdefJwCblcNEhWmtX8FBEPKunscTBgHdHefzx5f7AFpNw>
    <xmx:ZN0Fay5HgQNFfUBXh7L8tyhCYUmn3ZM-G7JVXw9IVM5_sFauYfaajA>
    <xmx:a90Fa4VKd0seXJsIkfqSaHH9e6lytGZcnkXlwXg5yWyhKLyy-Iftp9hP>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: ADzkAynZlS63
Date: Tue, 24 Nov 2026 19:54:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Stoakes" <ljs@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Shrikanth Hegde" <sshegde@linux.ibm.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Jason Wang" <jasowangio@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 "Xuan Zhuo" <xuanzhuo@linux.alibaba.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Jan Kara" <jack@suse.com>,
 "Paul Moore" <paul@paul-moore.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 =?UTF-8?Q?Ondrej_Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>,
 "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Jens Wiklander" <jenswi@kernel.org>, "Sumit Garg" <sumit.garg@kernel.org>,
 "Scott Branden" <scott.branden@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Richard Cochran" <richardcochran@gmail.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-sgx@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 Netdev <netdev@vger.kernel.org>, linux-mm@kvack.org,
 "Jens Wiklander" <jens.wiklander@oss.qualcomm.com>
Message-Id: <9a87f9a4-4299-4a9f-97db-578d7687a848@app.fastmail.com>
In-Reply-To: <20261124-late-2026-mmap_prepare-v2-10-0b0d99d655f9@kernel.org>
References: <20261124-late-2026-mmap_prepare-v2-0-0b0d99d655f9@kernel.org>
 <20261124-late-2026-mmap_prepare-v2-10-0b0d99d655f9@kernel.org>
Subject: Re: [PATCH v2 10/13] tee: convert shm mmap hook to mmap_prepare
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1795546497-CCF4F87B-9D883039/0/0
X-purgate-type: clean
X-purgate-size: 359
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026, at 15:02, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the shared memory.
>
> Reviewed-by: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

