Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4C606A332
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zI+CG/cd
Received: from list by lists.xenproject.org with outflank-mailman.1502189.1698178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB93-0004JA-AP; Wed, 25 Nov 2026 11:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502189.1698178; Wed, 25 Nov 2026 11:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB93-0004J3-7o; Wed, 25 Nov 2026 11:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1502189;
 Wed, 25 Nov 2026 11:26:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWB91-0004Iu-TA
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:26:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB91-005079-9U
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:26:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c5e0-2eae-0a2a0a5409dd-0a2a450be314-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:26:35 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c5ea-b7e8-0a2a450b0019-d155802bacfb-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:26:35 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4bb72b44a97so48617455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:26:35 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989eesm33880637f8f.50.2026.11.25.03.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:26:34 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605994; x=1796210794; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmWNrfSIBJkiHKH6i1Txnc+Ja5dKtR29QkBEE0TVhIQ=;
        b=zI+CG/cd1mwMGLdSbVSmF7WRJ/732U8b3PlCHdXp5k0zzGxGzB/28nYdGgqHOPcK3e
         oPlWCtCpqik7mmLuLpru/0EvRxaD9AQ05WH5VEgszX1Akbgu+ZIdQOG5EiH8ut7RLSDW
         jjswKPUt7PoZE4bOYCAfv+3gNBJGKeF32V/UMv5mSdEQZiL7dqtPIE7vrvwLXF4X96KN
         pX7ZxOiw0Chd6E2EKaWCx3tb8ku/037SbVZwirP01Dvbp9r9bduw9vkBwCVWHa+rLUcq
         6WxGDcVk41OWRaZ3V6X41ZZfh9w8sxdKdei3J3zM2JsZowN0Q/wdOK4JBGxGvjYefddu
         m8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605994; x=1796210794;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmWNrfSIBJkiHKH6i1Txnc+Ja5dKtR29QkBEE0TVhIQ=;
        b=Q1Mofikmf0ISo+p/3UIqQuG8WeGWNRBGxdcpm+yZoxxgo5dIiGXEQhTF8QVJnLsJKL
         b5GLtnKVnp/GeYydeSHB97aVJZF/sQNyX7TNKfsojNAGFOxT2FBLLKfTnysNt0oqMjeo
         Oi/JaamoeXPHzQes2vdGA6ly3eEtemlFGImLNVyo7up4YkyTeRlIFUT8+oGnIhY7w5dR
         qmZOwF0CrviyVoYzECL45MoB19uxDrV0kJrwwy0kQdKGmT7GnymvMOkmjx3IerRAgfDS
         YZ1CHl4DkFwoXw+6xGGoh6rYDRjGi2+48yFGk/WYTNcUD0Rr6nvgVj60iO3Z8dw86Ffz
         LiJA==
X-Gm-Message-State: APuU4Z8TOzJMCgYJOj9PdVa3JJe5qw+T28oWEXvOHmdDhjvgfYQIu5bo
	nSnf6myaEhnDzWiH3Pzqzyb3rELjF4MSJ1hMVuiLlabdY4uLlZCTQ4YN
X-Gm-Gg: AZFdTZfTuDUdTqxZmE8gFq2mnlv1lvG4AeN5aWiY0t7LQqJv3naegBlEJjfawTrbpyy
	99doLHLvnU/Xxq/0qgMH4+QOAvjkmzGC11ePXRYnQvisHJOVcF6E4KuGJACPEiwyq3dkPFCVGhg
	0IHvx0GSaieK4B1LqBi0EoXKc+3UMWxfOj/NIlXWXMgBelxYcsMCEJaqhkFEH9nPLBBcr346dqn
	/2r6GxM9kVTBWMnjoAb/re6CHDyVmclahizVmOxtrMtaGPT/sR6q8V1ktFHDPJAIgS92C9tEhlc
	DgQiqXbkOg/aanaeLGFj4EbQZUifmr5boOzOlhbSFMFGWiOjzelGrDN0KbpXHk/cDZj2roHg9Pq
	p+Gxh+HJmyDvjGQN1zIr8g9K13cGQsK5NQvmU/X8pEe3P8VRt3adYJ6PAnP3I01Zwf6ISNs18Gg
	CXnhuBizAOctKTs/nORlE68wXlsIqUFs3IYHn4/cThkCXQGrmcA6Ylx2b7ZPF3ylhiYLRhBvJlw
	zofEZzHjTxl5SfBniBgMmP36jMwbNoUHj+nCK6rb0tXlDGdb4JG4rJNSF9pKMim4nfKaBm8cdfH
	ZsBLvwUAZm1ztyYmkRGMNMMg6jb7MZQH5Ll/
X-Received: by 2002:a05:600c:83c3:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb8880ad68mr345482245e9.5.1795605994518;
        Wed, 25 Nov 2026 03:26:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <713c164c-1cf0-4daf-891a-90cedef5190a@xen.org>
Date: Wed, 25 Nov 2026 11:26:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/21] hw/9pfs/xen-9p-backend: Use validated snapshot
 for request iovecs
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Hui Peng <benquike@gmail.com>,
 Mark Syms <mark.syms@citrix.com>, Feifan Qian <bea1e@proton.me>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20261124232247.23169-1-dwmw2@infradead.org>
 <20261124232247.23169-15-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795605995-1AEDE9EA-52D1F62A/0/0
X-purgate-type: clean
X-purgate-size: 942
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> xen_9pfs_out_sg() re-read the consumer index from the shared ring page
> when building the request iovecs, so with an index the validation in
> xen_9pfs_receive() never saw, the iovecs can reach past the end of the
> ring mapping. Reconstruct the index from the out_cons/out_size snapshot
> taken at validation time, and split the iovecs purely against the ring
> size.
> 
> Fixes: CVE-2026-123072
> Fixes: 40a2389207fb ("xen/9pfs: implement in/out_iov_from_pdu and vmarshal/vunmarshal")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/xen-9p-backend.c | 43 ++++++++++++++++++----------------------
>   1 file changed, 19 insertions(+), 24 deletions(-)
>
Reviewed-by: Paul Durrant <paul@xen.org>

