Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C45CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:52:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446847.1662941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZAz-0007rZ-Vy; Tue, 13 Oct 2026 09:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446847.1662941; Tue, 13 Oct 2026 09:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZAz-0007rS-SU; Tue, 13 Oct 2026 09:52:05 +0000
Received: by outflank-mailman (input) for mailman id 1446847;
 Tue, 13 Oct 2026 09:52:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZAy-0007rM-DW
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:52:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZAx-007KT8-Qg
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:52:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdff3a-bab6-0a2a0a5309dd-0a2a4501cfb6-10
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:51:59 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdff3e-5984-0a2a45010019-d155dd33c524-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:51:59 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so584949f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 02:51:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc6ddcsm4170894f8f.52.2026.10.13.02.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 02:51:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791885118; x=1792489918; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VW1GUPHtYzSt2OTa4PxklzBki78wWxXw5o8OcRcerk8=;
        b=M6Ls1BCuQsW7CzUNm1I/0G3RrXj9BKiXW++u2j2mJlEZqGAQ3gCSIJ49uJtnz29+ug
         x8lXDmuKan9r8ww5Ra04bgNcpBB4HTYfh+tT9FxmzY46nfzklMk23lLZxo2heZ1fFgmp
         y6/HVo2IzjanMqCxhkHTH5HJxhDktaintOTAAtss97FDkdXDJail6E2izsFv+pcqdBEy
         E03CEosqCizH00s5ZBKiRoaREc1SpQAAdsK0wnLnxlLGbuoWirAh3Dsa6pdhLXaQyn66
         JTJAtMhAM4upRHG+SIICL5bmNJA3PTlWLY+Kvf/QIiUcS22cc1WWLGclFiuQjzspDlOl
         /E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885118; x=1792489918;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VW1GUPHtYzSt2OTa4PxklzBki78wWxXw5o8OcRcerk8=;
        b=u7Zv46LaRbQHep7IknX3SRbctKwfkRLIFPVNcDcphF0HozOuMqHNOP5A1Zk0Age8GL
         2TIr5tZZHKjot7t63XnqCOQOWfOpOlDJe2P9KpJ0rFNuhds6Cyb2+45Sqv3VFNNimF3N
         F93d85KQmKFTBen3yWuWY4dYP5pNt5I7rPNSYuR5HVHKRVMFNZ4eX+ewwOmbH+J1Nakp
         MFy6on7CEEp/NXRAkp6NzqXY2UbI3XPxsQzayWdtLauI7CBHDHOCL5pMmHq15ujHmDFY
         3F9PQbJqKY/woCH+mL0gkf0mwGKApC5gS+Z5Axdp59je+9i0g3tsvSIGpUJD2RBJSfkM
         U4Rw==
X-Forwarded-Encrypted: i=1; AKwUvBw+kpMNvg8f0bjHJ310nFnoDZPiDmMXHdutr88MpjdC0exLiqym5VRLPSjCM3uKj3iZdu2LcfhOkpM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJCHmP0FElP61UMQjUC7xXTHEBAhsLJY1eHW4BbEro00oAPf03y
	thbdvDmeRq47YReqURnYl/6sxumBf4jC7+7FB0DYklzSNZWnn0DpaVhHxHnDRHz3LA==
X-Gm-Gg: AYBFou21An0TD24vKH05yaYN0jRB7oJjo/IU7cHe0d+wuUuzKJp9rlg6gwVANQIC8jn
	7GROuwsZDio2TTJSugnsps8PYh8pCkmhqVT/L2eGydcuUy3PEQmyldt+rMgDNj4vg90gnYgE50J
	boLL8BpMlulzKvwv3JHzTZYtfZ4BKXeyGo4H++NcsVgw/3FX00kb+JGEBY8ITh4p6igIQ0VRAo5
	GjeFKlZKsBnzHhOty4U4AA38ul5aYsYW4C7Ky/+bOHDWzOaetjtvmEQPI7KHqBlQGSD7FwmZvfc
	PX1ommSMZEzooioQHlzcpn4jWiCRJp+ERy+HqH5u2uuLLEtOgEuSoohV9D6+mLJ1Sf26/q4ezZC
	faXsbnFAvC2rl62TK/vcZrfnz7gqUCUfbtNVngS3MyANrjJiwvo+g5vjXUiuvFtJeDZN4GlaOod
	DxKZ5exBEGys8Aztr4V/syIoKNN9GXCijbgAzFIMXeFAb9QipZQOesWlwKa70Vh0gM9VjkZCgn0
	JwG3by4RRROlRtnxI3AuxUGndn5LCo6mjI49NGYxQKmruP9r59YxMNfohIPHw==
X-Received: by 2002:a5d:62d1:0:b0:488:898b:5c78 with SMTP id ffacd0b85a97d-48dbacdaa8cmr16518382f8f.29.1791885118500;
        Tue, 13 Oct 2026 02:51:58 -0700 (PDT)
Message-ID: <c78b8116-1138-4dc2-85af-71a4279963c1@suse.com>
Date: Tue, 13 Oct 2026 11:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] x86/hvm: Clamp Viridian features to known set
To: chunjie.zhu@citrix.com
Cc: ross.lagerwall@citrix.com, andrew.cooper3@citrix.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech,
 stephen.cheng@citrix.com, lin.liu01@citrix.com,
 xen-devel@lists.xenproject.org
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
 <cover.1791625578.git.chunjie.zhu@citrix.com>
 <16057af6a0433e8cec576825b784e3316fc2c06a.1791625578.git.chunjie.zhu@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <16057af6a0433e8cec576825b784e3316fc2c06a.1791625578.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791885119-BD67C757-24947A85/10/78276251493
X-purgate-type: spam
X-purgate-size: 688

On 10.10.2026 12:13, chunjie.zhu@citrix.com wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Instead of returning EINVAL on an unknown feature bit, clamp to the
> known feature set. This simplifies upgrades since when the hypervisor
> and toolstack are updated without an immediate reboot, the toolstack may
> set unknown feature bits and the existing behaviour leaves the VM
> without any Virdian features enabled.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Before submitting this v2, did you check prior communication? As per [1]
this patch was withdrawn.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-09/msg01511.html

