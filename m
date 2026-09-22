Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EC3C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:32:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428344.1651068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vuv-0004oK-EP; Tue, 22 Sep 2026 08:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428344.1651068; Tue, 22 Sep 2026 08:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vuv-0004oD-Be; Tue, 22 Sep 2026 08:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1428344;
 Tue, 22 Sep 2026 08:31:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8vuu-0004o7-MG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:31:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8vuu-004tUI-30
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:31:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab23ce9-2eae-0a2a0a5409dd-0a2a4503cc10-46
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:31:56 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab23cfb-fae8-0a2a45030019-4a7de14cf476-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 10:31:56 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350faaso2085473f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 01:31:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdaaf97e2sm19216765e9.2.2026.09.22.01.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 01:31:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065915; x=1790670715; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgcJQ1EkTs4OdwdBZBzk1zepujWAGbFG1iorfIXmLPU=;
        b=Bs4ha95jl2nDJBO0/LjTpDzngMXT7Ug0ZVYDddkoixsLQMGhU1Slq7whxVeMChUIFH
         mM+kbYgIq3GSbVhc1/O84Pzy7YnZcn/7HzMNYHz8v+lwL6AK4BkjLxHmxhKOyqO52zSo
         5AweWoQKE6OEpHelTRymFNvsZalCWTJj+8Rdo/QbD13vy9hTeUSXDFdLDzbVihBO7zsz
         UUz/ka9+fm3NsrzCSxBGf3O10k1/5QX5MSMiKZPEI3bjOwN1h2BPPmM1FJJTZtCpGOiJ
         if/c43/OaMPKvJ/uN5DKB4+pYl0szmN2wkR+CTJrAPh8csgeukdeAc5ptkiaWaTbAxs5
         6iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065915; x=1790670715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgcJQ1EkTs4OdwdBZBzk1zepujWAGbFG1iorfIXmLPU=;
        b=d5lbd8RgxdWsW//Ayl8Qm8R+3JIDTJ08uu1HpCqyu8+NrXzVGBkCqFRXLKNSUx22Uc
         upDFLZtodYx0eTFZpez68Ycg+OfeSoLm1XQWG0SrZs36No1MkS5M4zAknk/hp/VzU9gD
         7CcI1m6/goepukgDBlK+IBRadBCiqdhoZbXzHV/gOX7B/SUlNZCH/mb4NWiunL60vVRT
         AsIK+nVEG/PDNSABZme1PVrrIB7MWmmK9fcOqALOLu6WoXDXjJkpcY19e6vnsmc8IJLl
         EaeIbAHFtM05K+I4TWV64lNJLsIY+atqpzfD+c8riOfsI8btemD7Rpae7JiyA9Oz3TWs
         hW/w==
X-Forwarded-Encrypted: i=1; AKwUvByrxMgz+9RTIuuxWeXhWx2mUl9cxefU3VC5/9+AhrP//OQJI5sKSTFsg5vJpt34C1W0ULOhlJZVa4g=@lists.xenproject.org
X-Gm-Message-State: AFuF++nnUw2AdFN8VgCo95zs+gQyftIQddI2ogZswR4z53tG217XHj9G
	N1F2YXq7m4yGQzKaq5QD2joGZJ62Vd6+Kpk/OtSgj+FkAv2swdJqYNlI
X-Gm-Gg: AYBFou1FiQafvbCwEPJeZTjpgHjs7DcKSFo24NheVqaJO51YYwZllf4mClsd7Q9J/JI
	3d+dgAUFOZ2Jt5udVpKBNVhDy7TXCs++2xaqUWsT5uK6qu0GByOjT5mlMNgebI2OxGhmAy4uMps
	eGP4Ep2pxaIpZ3F19sLP6EQwvCNjgiiv+QNwVtK27ecn4K10qXMyXJu28QDNnwMMFfnkmaJ21Xq
	31R5A7KEyn/wtpWFNnVtoeV+NljK7NAGInuPwmYFI9bxT4WSgHysvz6bDsDiXoHJ0ws5q1nWbfg
	D8i7tys61kivxIpFM0xIMTJyNZUEFUPKLjPkuAhEfMKEtaEsSWh/7yn7RRva2bMWk0umG0eesKH
	/fmVnIzmCwcoNvmJgwpFXPbi/GMJMwTvkesKMJzFg1J/brKJ/ys2AosVRF2DhSoeNWE+nhELjum
	AZHseqwS69SvTntjzSai760BOBF/k9RMB+qt/6SLJyAM1HUl3T1FrnBLtqZXpRCslSdMV0WNZa3
	5bY+KvI30uo15F1fC+QPx77BCYci1iFrlI=
X-Received: by 2002:a05:600c:4505:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49fc56db92fmr189278855e9.7.1790065915272;
        Tue, 22 Sep 2026 01:31:55 -0700 (PDT)
Message-ID: <1b7b29da-bc22-4fff-8e1a-92cedcd0cf22@gmail.com>
Date: Tue, 22 Sep 2026 10:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
 <bbaaa4f9-a1c4-4ad0-9fae-7fecf1568086@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bbaaa4f9-a1c4-4ad0-9fae-7fecf1568086@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790065916-6CADC4E9-A719443A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1293



On 9/21/26 2:32 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> Introduce imsic_vsfile_attach() to initialize the AIA-related state needed
>> for a vCPU to have a working guest interrupt file.
>>
>> A guest (VS) interrupt file must be mapped to one of a pCPU's
>> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
>> run on needs to be known first. arch_vcpu_create() is therefore not a
>> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
>> vCPU can still change before it is first scheduled. To avoid
>> reassigning the VS interrupt file id and remapping it to a different
>> pCPU's hardware interrupt file, imsic_vsfile_attach() is called from a
>> later point in the scheduling path (e.g. continue_new_vcpu()).
> 
> Hmm, why does first-time handling need to be this different from the
> handling of a vCPU moving across pCPU-s? The sole difference should be
> "no state to load" vs "load state that was saved on the old pCPU".
> 

Generally I think it could be the same but not all the steps done in 
migration functions aren't needed for new vCPU (despite of the fact they 
aren't harmful). For new vCPU it seems to me it is enough only to attach 
h/w interrupt file to vCPU.

~ Oleksii


