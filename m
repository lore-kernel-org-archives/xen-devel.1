Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A8606A323
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaN6qMtZ
Received: from list by lists.xenproject.org with outflank-mailman.1502029.1698035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAr5-0001j7-Ns; Wed, 25 Nov 2026 11:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502029.1698035; Wed, 25 Nov 2026 11:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAr5-0001j0-Kw; Wed, 25 Nov 2026 11:08:03 +0000
Received: by outflank-mailman (input) for mailman id 1502029;
 Wed, 25 Nov 2026 11:08:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAr3-0001hl-TA
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:08:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAr3-00BFqI-9L
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:08:01 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c188-bab6-0a2a0a5309dd-0a2a450bddc6-24
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:08:01 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c191-b7e8-0a2a450b0019-d155dd2fc46e-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:08:01 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4a7b8abe209so4329016f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:08:01 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989b3sm33590374f8f.51.2026.11.25.03.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:08:00 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795604881; x=1796209681; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4LbBbtYYoQPuIJYoiViXu4MQ2ajttX0MT+blUePV1A=;
        b=JaN6qMtZ0UJokDnH0aqGHOnKEHOpavpSbJOnaSQSxB/GD/y2PLm4HQo/GXhbo/ltph
         pHJFofb4b+4NfywJf0W6gopdWIrp+boqDyPutrr6cX3WT/xbXF07saOzgSEA4XWMXNFt
         vUW2qIvqxdpjtD5rbvW0gvc2cgtpEJ26SDcGjYQpEsE3WCNfqUSWlyZGa4pv111Psy5X
         DDcyhBVkW9Zml5LFzca7FoNUuzCnzHLjqDrGsB8Rmbgfr45CVFkHwD2Pwe7yGBld+/5L
         wbHUoqRdqfC7iQkfYjJRThs+UXtuxfONWAhi1w2EgK4aNVxqzAd/tn7ahEM/u4a0GTh4
         cAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604881; x=1796209681;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y4LbBbtYYoQPuIJYoiViXu4MQ2ajttX0MT+blUePV1A=;
        b=i/3rURYoRlwPvcbyhrUWvDyA6MszQ3IP1EhoF9Dk4XUUlzAXihdQWfCHOYiyEJHk9d
         u85PLNUA0Cg1asAj0N31XjBf8XKTHCxtTlT3gsq/gBskw+FH0/94wW/XrxPB1iOwk331
         PkEA0gcrPzm/hDt0+5OkP6Ohgh2JIk2ckQJZ6FY8Jkmf57hdIgXVqPjqNV3Qv8WgRCpu
         6KwlfCaENU1z/1M/XR1z96WSGE/gNycGAuLxUpM0+RCA7aXNFIT6DgLG5G7tnfwhPkSL
         r521vOGcBSLwSY7L+QhgELM6R6AyaLAl+h+iMasfYrorpCW9Rd3NdMwgtgrRqJENOV7t
         r9Ow==
X-Gm-Message-State: APuU4Z9ep96JKT6Ds+UoemtlSkrYL8SqQGyHZidrTWgVQqswl7kM1Mn5
	HQFK2fXyrhI52ezWgXSmkS75+Lp9Kh2ZUtV1bqcoQjgonc0Bm/TE7xW7
X-Gm-Gg: AZFdTZcAOOvTOFXwkglDNmEpllgb8FyvBo5h8fhTgwkJQZGqYCBBj8lBFYqq4ohXu7N
	K4n+D6jvQvtxtq2HxgSUJhNxEfNsZrcNKMRLTlLoyH5LIp52fWNbwhUMi0RkCdMbpsnxqRkUiu5
	jA6zJrJhbmVPoTy7823bmpULkFo5s6+zIEcwSBqkPm5x5J+2vJk/cEbpw0LsHXp1+t9MLhr4eXn
	D6/GyYhEvWHuBFpw5+TIvFS41HC95MzSErSKoc5Qaf4iMxcJL2zyGOYxRzDtBr2QZVafGRWiZ5U
	uhDoWm2WMRBlvtXLSMp7jxih3wcNkAwHUwVfQkXjgrNWregABa6ZSmI7tWXFRABjgi/OvVG4egB
	Ju6Ao8ogSDW8zowG4R1JcTg5QChjgHcj4LzuFBrVhi9nTbKrGVn37lOxZ1aRsOr+4zQZvQqkThS
	GF/49ud6y0SJkA3o4t3nAsvju0J6rgxk4Ou9s9YBPxQSuwS1v1TpcAG100OA13f4bzYUUUvCAjQ
	aWcqPsLPMoUo6sRo9Yu3z3oXPzmNVOuhtUB/f2mx8fqqW+CPzBCCmf0S+Z4PPUPSVi91Ie+WTiG
	xC/AJoHOnPJyscPsFMYAcLHWVZPbj9gYG2g=
X-Received: by 2002:a05:6000:2b91:b0:4a6:5086:2df4 with SMTP id ffacd0b85a97d-4abb3d2c096mr19854541f8f.36.1795604880544;
        Wed, 25 Nov 2026 03:08:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b399c8c3-335a-4b39-853d-b21744a43ed2@xen.org>
Date: Wed, 25 Nov 2026 11:07:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/21] hw/i386/kvm/xen_gnttab: Fix error handling in
 xen_be_gnttab_map_refs()
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
 <20261124232247.23169-6-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795604881-A8CCF9EA-83A8918F/0/0
X-purgate-type: clean
X-purgate-size: 992
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
> When the grant's target page cannot be mapped, the failure path calls
> gnt_unref(), which asserts that the map_track[] refcount is non-zero —
> but the refcount was only incremented after a successful mapping. Take
> the reference as soon as gnt_ref() succeeds, so the failure path stays
> balanced.
> 
> Refuse writable mappings, including a write upgrade of an existing
> mapping, when the underlying memory region is read-only, and set errno
> when the upgrade fails.
> 
> Fixes: b08d88e30f06 ("hw/xen: Add emulated implementation of grant table operations")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
Reviewed-by: Paul Durrant <paul@xen.org>

