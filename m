Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA79606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Ns0ocBa9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VyCHGOD7
Received: from list by lists.xenproject.org with outflank-mailman.1501443.1697508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVveo-0003rd-H3; Tue, 24 Nov 2026 18:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501443.1697508; Tue, 24 Nov 2026 18:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVveo-0003rW-EK; Tue, 24 Nov 2026 18:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1501443;
 Tue, 24 Nov 2026 18:54:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arnd@arndb.de>) id 1xVvem-0003rQ-Hf
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:54:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVvel-008qjB-Iy
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 19:54:19 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arnd@arndb.de>)
 id 6b05dd53-e002-0a2a0a5209dd-0a2a450ad690-6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 19:54:19 +0100
Received: from [103.168.172.139] (helo=flow-a4-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arnd@arndb.de>)
 id 6b05dd5a-f2d2-0a2a450a0019-67a8ac8bb31d-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 19:54:18 +0100
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
 by mailflow.phl.internal (Postfix) with ESMTP id A38DE13802F8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 13:54:17 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
 by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 13:54:17 -0500
Received: by mailuser.ams.internal (Postfix, from userid 501)
 id 4968232A0099; Tue, 24 Nov 2026 13:53:40 -0500 (EST)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795546436;
	 x=1795553636; bh=iJ0bZtF+M32WhmItWYj3FSa2ZiQSpvoOogcaFVHVH5I=; b=
	Ns0ocBa9uuJQNTtG3QfiU8sUxKT2BVab79oK6XioPic07HNY7BbGUro4492vDSKa
	taWSB3j0rahIlRO5r8ZoxMAmIeofQrkEd2O7X1OMQEOOEmHkNvuaEYSDts/UAM8w
	fED4InNTr0trVvSv57ETj3yHni+DAOQy8IgrUckr5I1xjqbrfGUxOwoJi0smwrAp
	nxVmvZkiOxgeZLtuxZuUgSTF8HOJ38Mrh+Szpuf5yDk9lzFD74nKhq2IZnhfVZN/
	vyB/Gl1S/ltyMKRNSc+WiurJ6LH/MJ4UcyvYBvhtsIXVP/k06hqmaXkoDI11XeA7
	wlXBDaQ5dfB4kxGI+OVvoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795546436; x=
	1795553636; bh=iJ0bZtF+M32WhmItWYj3FSa2ZiQSpvoOogcaFVHVH5I=; b=V
	yCHGOD7HZXf+kTkcfTRyN6yTdKP309423KicUoIMqFh/OtFm+5uIv1vysvBFedjV
	XJFPWePPRM0CnxRFksiKelXDd4qxik7aQ3mMcyBCJjLxhyAF1/B4D21N2RNJubIz
	u5cBy+nZv7B/NkDxHFeW1hHCDPsd2Yncp7NFyXICp+R3pT0Y5ellhwQTcSjOD4Is
	qcejxkzW8ihZzqAnjwKGNkFDJQStwnjJ8vVNe8gpcx5sVF8NLwPxyCUUnJOe3iXr
	77Djsuz/1kfq3wwkXcMCZm5S41gIGVWAkWq3DEPG3YLiO4EDE4ry1FhRdzsZiw+Q
	+pL5WKOI4leoxTvwkIf/g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795546436; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:NwzcYQyYWLJaHSe62jA+NRI3ylgV6WPuaHVMfgzqs9gk2sY
	HfbWuNnrnfqmLUQY6UOixc+zM2N9mSqlLZGrlQsRJmKlhXwGHDKbsJt80tuEKZVt
	9KYw+HsU483Y1nVB08jCtRZ+aF+LsOT0W4ROQUWW2r04E1RibwJPE/d1o5IBsX9L
	fxQ61E/mg96AE97vClkmBewdwPV3rADW6mIBm2tBf4vXBxuCILxJ48OAtBEUKzjy
	Q7Gwz8YWmKdSphTFGkghh2R6MLDpbGQTwqrqEFM5dnAbhzym3jSLXnZ0pRqZigeb
	+HXQ1Om0DmaIhBmK6kxUrpjeRi7396HnPtdJbEQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JE9Pf+dIuvBMDyw467eQ/Tr4tyY4SBvJ9vbnWlDmBbU=:iJ0bZtF+M32WhmItWYj3FSa2ZiQSpvoOogcaFVHVH5I=;
X-ME-Sender: <xms:NN0Fa_Dh16pBjRQMtmAQtpYpz28UEZAAlNWef9QDlR230iNPWwpgaA>
    <xme:NN0FawWnt_cU2zPqxwlF3kn6lXR865LwUWDq-4TBjsqjqIqfahALCgQWW-0jyO7G3
    I2uTFidD6Jk0Jt_ZRZrrybQhsZmf0PkwLrG07cX5Ey9rp4FNHu-UqM>
X-ME-Proxy-Cause: dmFkZTFsQKpYLoHX3KE6zope7Xly27EYv6AQYyIF3Qau4aRC0vSHzWA0jMBeGZ/9+uCniy
    PTkF5Fmn4ClSCnUsMdxXtnQhtPNPNvOPsMvdctlUYyw6p+0jhYlfcnMwYC+ka8/fLSpuKw
    3YLhivPgri0MvBEeHeehNeV5wiFAsJv2bcNaHD7UboTSW+RjgcB42VuUlh1hahI0iQExPr
    +XuV8lAvetVw7YfrG+rkJKl9bl6k1+Pc6YG1mdIQsn8HBaASQD8dGrUNem4yjy4NNXFr2o
    l0vAJfxG5EW/9uTEMy9av1oYJYPAqHBvhuaThuRz9ZxrEhJBnZZaNefPyOfbd5a857jzji
    xS3AH0yNi27nlGbP2enOJqlf9wVeoOUs7OcWrHRUnaD4wGX3BucglKw1DWVVHUPxhfMt+c
    yYMsv9QYzlu0IncPWVnqsNMz+WiqY0HZprQifxi/zsPZ8ChkJiSCAB7jX698jdmSQw7t0Q
    wldIOTkPNxc4rzT0CMfulFrj4Rm5L/cie4t1IvZQrqsjE2CBRn8iUu7yiZ0dS2UrGJdlIv
    HMXP1d1uGpGRgLQ/rxCRTkol4EEsKGIX1Iz0tWkHIV/hA4OOaUelQC0/ml5S6Hx7O/VRRR
    HHsnZozZEW2a8iAqfQuYUL98uV7rqteWCN+bZ4WQQO+0dMzPuH8W8HlVGiTA
X-ME-Proxy: <xmx:PN0Fa_OfkSf0I2gz53d1q87MSYiyija7o2MtMOioAI-ZeTkir1jV5A>
    <xmx:PN0Fa6p4AcKgvKj7Nxl2i9GHjEd2VbenjcJEjgY_FbTxdjTIKHGJeg>
    <xmx:PN0Fa5WDuMRF3QKr7uInN4TtUt9GYOr8jpLSEeuwpRljz5xEyg6WqA>
    <xmx:PN0Fazu29G7Wm_IQCdCnlJY6WRkfF9-85rVjBcVYL-WZQOkOQNyjOA>
    <xmx:RN0Fa7HuB9LonHDmNq2kLPdcfAnhX1Syf3plWTxAvus5eCvT9QG1bsct>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ai76fMdDSoMo
Date: Tue, 24 Nov 2026 19:53:19 +0100
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
 Netdev <netdev@vger.kernel.org>, linux-mm@kvack.org
Message-Id: <3208cde3-c5cf-4888-88f7-c77d7b0e5940@app.fastmail.com>
In-Reply-To: <20261124-late-2026-mmap_prepare-v2-8-0b0d99d655f9@kernel.org>
References: <20261124-late-2026-mmap_prepare-v2-0-0b0d99d655f9@kernel.org>
 <20261124-late-2026-mmap_prepare-v2-8-0b0d99d655f9@kernel.org>
Subject: Re: [PATCH v2 08/13] soc: aspeed: convert LPC and P2A control mmap hooks to
 mmap_prepare
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795546459-5A5DBCFC-6E73EB08/0/0
X-purgate-type: clean
X-purgate-size: 520
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026, at 15:02, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook for both
> the LPC control and P2A control drivers.
>
> Both remap a range of their reserved memory region, so use the PFN remap
> mmap action to do so, retaining the -EAGAIN error on failure via the action
> error override.
>
> Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

