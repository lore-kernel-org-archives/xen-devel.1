Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7557BCA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:32:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437016.1655711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrbm-0006hB-91; Wed, 30 Sep 2026 10:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437016.1655711; Wed, 30 Sep 2026 10:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrbm-0006gR-67; Wed, 30 Sep 2026 10:32:18 +0000
Received: by outflank-mailman (input) for mailman id 1437016;
 Wed, 30 Sep 2026 10:32:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBrbk-0006eI-J3
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:32:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBrbj-005zBu-Vw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:32:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abce52a-2eae-0a2a0a5409dd-0a2a4508c430-30
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:32:15 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abce52f-f659-0a2a45080019-4a7de14ca3e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:32:15 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485933b24c3so3244822f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:32:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029bfd2bsm2454922f8f.11.2026.09.30.03.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 03:32:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790764335; x=1791369135; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qvKnWasxUXvvAH0soHc98v/o8YU74epfic9+jmkJ5M=;
        b=aRGk0Fhv/VI/LS22Fp/viF1rpkUG9lPkbOiUNCSl37DxkVklP8orQLw3bQCJvP/X3N
         g7r8CCySQqr6NAhJvLXsCJ5rlz4irH+dlJPfBKljQP9MvPz4EWn3Lp5UcsMfx5khgQHE
         elmFUjACtBjlHtoesnkg9CO+aBCeaCoueicyHuM3iRhhwHoqmcYbs0HL//yhQzNTX1Bs
         up1DkhC3OjGi7CTVXxwjxnPSn4m7huItU3fidQBLC+ot00PX+yEyx43yU0hS3Md9gOQy
         S0T2XWFvgQXJ5H2NaPJnBC2ys+WLf9yx4gwu7a+lowXeGtNM9tpjIUMWIV+9BdUgMEIi
         qf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764335; x=1791369135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qvKnWasxUXvvAH0soHc98v/o8YU74epfic9+jmkJ5M=;
        b=kOA62vtOco1lZhWDrzLWb7vCfYj/8YnxoNKyI+MrkIgd3gZXihfATyLEO3gQqCH/fG
         MXLvvGcDt6F+Ei3x7ArMUUNbTMyhcNZyA23Ro5j+2HQyq+P+5EIlq1j2VxKZahzHTRkr
         g71ql1cEeZdo9KiWS6vRQlZQU4A7MpPAwiSLWZDpClvVx2+wunVHuIDkyps+33F0xlva
         oVdiAUR2M2fK7ofGCpIGuUVJXvvcqD+RF1cM1QpvmZ4U8kbGRF2VO2kQVSiUpNhY9PH8
         5+fCjmjhurzuxfN7jeyjl69ZDdarZzgDRxZqciDmQ61CgOfoL+gGIN3dKAEun410k/1G
         7Trw==
X-Forwarded-Encrypted: i=1; AKwUvBxd28n6rQAlG+DXuLfjCerZSf3QcNu1jBE45/4+6M7fqOUxtD7hi5B3yQHYXChHBH9ydymeLOlBweU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLV6GL3sjaj9paihjrIU6+SUI3AGhUKpmIvxH3wCiq859rPh/e1
	AMxC40iREjZwsTjs/2BhWcWDPhD6chhU0gq5e+AmEG/kUqVAQDBstCCE
X-Gm-Gg: AYBFou2etvgQ7Nzxubds2QAx9euLZ2HizDjuwoAqGCP2v4EefpX1G99ksVKBLf+Ay5R
	vPEY3rGEOCcfcEX/omO8ppCxbCJOvwCtGesp4UYR+DJkeZTVaG74WyKwIQrckvYp73nT9+92m9W
	7orc4xQisAU931Lukc9lGmnK4QwT5dEbXU4eg713kgelCN78dopaSDni2PqvAApPmSFggG4GTMF
	0CaS4VGba1i09wvq6yjFQ54u/sCE5Pw52fCx/N7ElyS2RF2iwm8IHgkiAajwUsP1SwfNAA30H+G
	BAm1L+g4F/aQ5X7lCkhIU0p6AakS5L3ZXo2mBK4vXMCA5tDbXfp9Rcav8Ta1n7oMGEGX76Oyk6p
	L/wsYg0trixD7gkI5zu5+ZJ648lL4xlVZry1pEsNt8s3sgrG2ZZzRiVdob2Um1fuINvAWDt90O8
	iH1xRqX4iec7OcxEUsF8Mon2fCaVvYnP65KCMFY7V9GbaZBX6E1wA8fLQ2AvNskWeJSFQ8LQBRB
	E8Hj5BO6bhwTq6GF6VuWYqDXenbX641SRQXSdw0CT4hYSHwaw==
X-Received: by 2002:a05:6000:268a:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-48b0244ea85mr2423158f8f.3.1790764335199;
        Wed, 30 Sep 2026 03:32:15 -0700 (PDT)
Message-ID: <480e4ac4-588d-463f-8a41-eb3c25e6936c@gmail.com>
Date: Wed, 30 Sep 2026 12:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] docs/riscv: sync required ISA extensions with
 required_extensions[]
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699584.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790699584.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790764335-D634587B-1D1832B1/10/73395122804
X-purgate-type: spam
X-purgate-size: 959



On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
> From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> booting.txt listed only H, Zbb, Zihintpause and Svpbmt as required, while
> required_extensions[] in cpufeature.c also checks for I, M, A, Zicsr,
> Zifencei and, with CONFIG_RISCV_ISA_C=y, C. As the panic message printed
> for a missing extension points to booting.txt, document the missing ones.
> 
> Also add a section pointing to riscv_isa_ext[] for the optional extensions
> Xen recognises, and a comment above required_extensions[] to keep it in
> sync with the document.
> 
> No functional change.
> 
> Suggested-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

IDK if it make sense for this patch but just in case:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

