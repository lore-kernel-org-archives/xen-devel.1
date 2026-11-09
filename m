Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36206606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 05:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=egf84Gcq
Received: from list by lists.xenproject.org with outflank-mailman.1479514.1683463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQILf-0000Ay-NF; Mon, 09 Nov 2026 05:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479514.1683463; Mon, 09 Nov 2026 05:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQILf-0000Ar-JQ; Mon, 09 Nov 2026 05:55:19 +0000
Received: by outflank-mailman (input) for mailman id 1479514;
 Mon, 09 Nov 2026 05:18:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew@codeconstruct.com.au>) id 1xQHmI-0006uK-Fa
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 05:18:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQHmG-009rKu-Ib
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 06:18:44 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew@codeconstruct.com.au>)
 id 6af157ae-e002-0a2a0a5209dd-0a2a4504e7ca-4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 06:18:43 +0100
Received: from [203.29.241.158] (helo=codeconstruct.com.au)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew@codeconstruct.com.au>)
 id 6af157b0-b57f-0a2a45040019-cb1df19e8140-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 06:18:43 +0100
Received: from [192.168.68.117] (unknown [180.150.112.139])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 083566E9E9;
 Mon,  9 Nov 2026 13:18:31 +0800 (AWST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2022a header.d=codeconstruct.com.au header.i="@codeconstruct.com.au" header.h="Subject:From:To:Cc:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794201519;
	bh=inbRv9rqETpvmrvWY+hsNFNboYN1tmYS0qnuK2Kr/gs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=egf84Gcqai+t2RbzRcp/hsSqUjhQHhjh3vyzhBpm8hV2KWxqDFJxnPUahIU113EcT
	 BgLm6wqU/Euo4rhk1oHtIX3Z9zvOL05mtWbK6K/L7+70zAOa6b9LxPeqiMFkTfAyXR
	 sJ6r+I/RKBuOwB8hQ4kh0KzVB0J735kCbnMQRQlA7QvM+MYWUHFrMnQcdvVsUlq4qL
	 OrhgI7yGlCRf9GdwPQCvkWPbpW6LqMolW9oQ7mrzBne/qL9+nOjj/aqp3F164dsqk2
	 7rLero/HB4L0DSs1r+ug01+7VgG2RcG87tSeq7M4AqhpAUCMcl+W2qQMRVuMpXb4J2
	 kfa7LW520ih5Q==
Message-ID: <4848c58f3152233477c4fa4786de2a49c9261c9c.camel@codeconstruct.com.au>
Subject: Re: [PATCH 09/14] soc: aspeed: convert LPC and P2A control mmap
 hooks to mmap_prepare
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Juergen Gross
 <jgross@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Madhavan Srinivasan	
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,  "Ritesh Harjani (IBM)"	 <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Haiyang Zhang	
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui	
 <decui@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang	
 <jasowangio@gmail.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>,  Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jarkko
 Sakkinen <jarkko@kernel.org>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar	 <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Jan Kara <jack@suse.com>, Paul Moore
 <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej =?UTF-8?Q?Mosn=C3=A1=C4=8Dek?=	 <omosnacek@gmail.com>, Joel Stanley
 <joel@jms.id.au>, Ryan Chen	 <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Abel Vesa	 <abelvesa@kernel.org>, Jens
 Wiklander <jenswi@kernel.org>, Sumit Garg	 <sumit.garg@kernel.org>, Scott
 Branden <scott.branden@broadcom.com>,  Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Cochran
 <richardcochran@gmail.com>, David Woodhouse	 <dwmw2@infradead.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller"	 <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski	 <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-hyperv@vger.kernel.org, 	virtualization@lists.linux.dev,
 linux-sgx@vger.kernel.org, 	selinux@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, 	op-tee@lists.trustedfirmware.org,
 netdev@vger.kernel.org
Date: Mon, 09 Nov 2026 15:48:30 +1030
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-9-c56aadfbab8a@kernel.org>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
	 <20261105-late-2026-mmap_prepare-v1-9-c56aadfbab8a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-ebf023/1794201523-520D5B50-494F5A72/0/0
X-purgate-type: clean
X-purgate-size: 489
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-05 at 21:05 +0000, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook for both
> the LPC control and P2A control drivers.
>=20
> Both remap a range of their reserved memory region, so use the PFN remap
> mmap action to do so, retaining the -EAGAIN error on failure via the acti=
on
> error override.
>=20
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

