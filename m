Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D5606A331
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmTZTIXZ
Received: from list by lists.xenproject.org with outflank-mailman.1474991.1681830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzii-0002bS-7U; Thu, 05 Nov 2026 15:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474991.1681830; Thu, 05 Nov 2026 15:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzii-0002bL-3P; Thu, 05 Nov 2026 15:49:44 +0000
Received: by outflank-mailman (input) for mailman id 1474991;
 Thu, 05 Nov 2026 15:49:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOzig-0002bF-R9
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:49:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzig-000prv-7f
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:49:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeca595-bab6-0a2a0a5309dd-0a2a4503a1a4-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:49:42 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeca595-fae8-0a2a45030019-d155802fb074-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:49:42 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso14354035e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 07:49:42 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56f5e65c8sm72372095e9.12.2026.11.05.07.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 07:49:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793893781; x=1794498581; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J047WjMHdDMrCWtz3p27qJxTeAq4st8ln7LaPoieiYY=;
        b=TmTZTIXZDC3MudHriNcWi8y/qeISBEYiVdt/QGgG8xzLoJqytaUHmhMXjwMVTtUDsj
         Y2a+8W9cjmNU0Krxp3dFFCNhgzo6efN9j/19D7LSuKNTs3LzCUS9eVnmdGXmCdW7j70E
         sRds3AaqDCx/y0a/Wm8bMKV13RJZcL5SNfIlrVZGyULW3U3zO3x35WTlj77IYLeH7G89
         IUMKuBxlEpI4JlDwtQ1FqgiFEYpPNWyQWRPBhlVXXbBF89cVs0hFx54AT0xRPse4lWaB
         ZMmxvzanJuCK9dURj9BpaObU3Z+aXoV9NvZx32gtQNMf4v6VCa2KPLAOyer0Y/nesIC7
         iujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893781; x=1794498581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J047WjMHdDMrCWtz3p27qJxTeAq4st8ln7LaPoieiYY=;
        b=GhXw8HUynPawlt/s3DxClgzHu0rPjhKo24Uq4S+nL+GXbFPT4GEaZQyJlnHJ7v2WxN
         SufhcIymnPMSEiX9qCmUFJ9iMe7Ojqn9VXgOlpxd1G/Oat63WRd1fnCV2zeg2kcT8HgD
         9CxsJqy7Mwl1DM4EJkR9kpsPG66e7Mg1MsPV9DVn2BVmIGyNac+pYSPTMNWKBmNiUEgL
         LqtyR2dSkkAaIfC+7+gpktj3ytjdD+UEfBM1nC1nAVZO5S3b0MZiCnqBYNYATuNq2JkO
         Iy+RdM3fOoHABNLQ5FXIxK8NwHz8GP9Sj44QyPw+D40TWzn3JByu6xrCVIhFXZAhTqmr
         60CA==
X-Gm-Message-State: APuU4Z//0JXCxyOrZhagaGdcNOCMlSP0mgXzrga5MEOOnSUYhI+U4lBY
	swIW46RqWXn55yd44dnz6sqSX7JeJH6uXB19kMnxk1la0YYY5aDv4End
X-Gm-Gg: AYBFou3x/WUpTovTw57TyiQWnkB/rDirLaf2P8NAnE/5EeFEGwkKiH+2Z/CN3SNrYd2
	4ackyA7rbD7MziMcosQDmoO0VgGT/pdFCVSzaaburFA1PzpZb/uhkXqhHRtJBqv0AOIP3sVJA3q
	vjKY2eUYV8dqf1RQpYflcfmjLJwS2A+QRk2iMOp9SuP8rzhy4uRboD9sYlzAw2DO2x2+ZaKgyC7
	aLei5KlLDUct+cPz/H47oFm6F6sQhOSEkSD1qVdeQBfRoUjrZfCk8Mg1TJQfih5a0MzVAlHLn4Q
	hdEPEP+mey3VCSF+cpGvKrTLWmMHUwjoDOcDTCe+oB1WPEQNNHD/Z8Ll2GNkjDj9zikVGQcRbmQ
	BC5kyto4sjgsMPHohKwD8OEWc9+aRvlSQryH+VmOY/l7oylM8uuWOGERygDLMAJAAiWA7DsRLBd
	G88kDGC8WNnH+sv60vlGhnzV3SNhCdRAe7XIyjJOtT5j2gqyJyb9Of4YJRcpfDdzp43ueRlo4QJ
	nJwEF6QgRm1Ikvb9kWYYax/lfVsgjIMVWaB8JIG5FpIA7IZIKoj10eZgW3g2vewd5iP5nulAQu1
	hZTIQvJ/8MIGmUXIYqQH3h+z8fc3vE5RTQ5A4zj4CiNN2aQWAlbjLX9d/Gv1vSfM9z63n6vcf//
	n
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr421531135e9.2.1793893781536;
        Thu, 05 Nov 2026 07:49:41 -0800 (PST)
Message-ID: <1ff766a5-3d49-45fb-9c46-d781cfaf4b6d@gmail.com>
Date: Thu, 5 Nov 2026 16:49:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync
 barrier for vCPU migration
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
 <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
 <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
 <cf206b92-88df-4f51-b10b-960e0c141d9e@gmail.com>
 <1793892730.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793892730.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793893782-6DAD44E9-DCA8056E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1230
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 4:32 PM, Baptiste Le Duc wrote:
> On 2026-11-05 15:21 +0100, Oleksii Kurochko wrote:
>> [ ... 348 lines skipped ... ]
>>> LGTM, but I wonder why, as I said in the original patch, sync_id is
>>> really needed.
>>>
>>
>> I think that I am not understand your response. Could you please
>> re-phrase it?
> I'm questionning the need of the sync_id field as it will always be
> equal to imsic_cfg.nr_ids, couldn't we drop it?
> 

It's equal to nr_ids by choice rather than by necessity: which identity
gets reserved is decided in a single place, imsic_parse_node(), and all
the users (the genmsi write, the pending bit the barrier spins on, the
limit on the APLIC sources and the ASSERT() in imsic_irq_enable()) refer
to it by its role rather than as "the last identity".

Basically if one day someone will decide to come up with EIID allocator 
instead of using static allocation then it will be harder to find a 
places where to change.

So yes, it could be drooped but at the moment I think it is useful to 
have separate field or ,at least, as an option in asm/imsic.h:

static inline unsigned int imsic_sync_id(const struct imsic_config *cfg)
{
     return cfg->nr_ids;
}

~ Oleksii

