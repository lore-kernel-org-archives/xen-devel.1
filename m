Return-Path: <SRS0=X+fC=A7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CE3C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 11:27:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A809F22B4D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 11:27:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm+/09mD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A809F22B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTwp-00077n-CZ; Mon, 20 Jul 2020 11:27:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPHy=A7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxTwn-00077Z-Qn
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:27:05 +0000
X-Inumbo-ID: eff20e78-ca7b-11ea-848b-bc764e2007e4
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff20e78-ca7b-11ea-848b-bc764e2007e4;
 Mon, 20 Jul 2020 11:27:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y18so9477366lfh.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Q33zzfdqXxr2MgVpFLd414bKy58NQoCmmszfR9Nkzlg=;
 b=cm+/09mD19sinas2m0E5kWIQmbgktijwG6O445gAOOZuiqZ7BIIocqnX1ym9/AGj/R
 iuqnt4bs2t2HvsPxv3jZ/r6b71pSnwoTr+lNVHcXvJTF+PH/G32dboT/hAbz1h+BqYJc
 UAAf/q/H/0f9aXfJYGj/d9VMCfw1v1x9gb1blVgpyFVJAGdPBJzDmwRl1aRfXxOwPHQf
 j0ZgRpLXaOhvk8y3NPv35YeLsl7chXVaTsCaJnnNWWRHGmYIgO+r7lN7dbth+BytIEuE
 vf+pPa8qRrn3NvC0MwdoesHL4thUa/ajteiF+0eLXjOqDj39F181jR4A0Hmqo6iEuNli
 ejHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Q33zzfdqXxr2MgVpFLd414bKy58NQoCmmszfR9Nkzlg=;
 b=FW7gqqHl0WpomgoL7+bMKJEcU9qDh9Pp2rqKhBmB6gf80foVfXwWvAc3Znn7bn2gRF
 WbYpbMgoizjr/sNyHPr7RTU/tsb/jJR1dKJkeAWvlbH/4Mh/a4ShIyF5R4ifiUMNAv7J
 JKgCWK9+deE8CFZSRNOXSHfC425niyeC7dmX/C68Tpn/Ygw3KaPqeTETN58Y6wlGfEey
 q2SMDAJen7Jc5kctTvlHtOktEOkSyEZXI+SqzZ7TgOcGnhvRxF7MIzZcxjU59uuOjhw+
 kcZWACi21CcQv13o3AA82rCfZpD4gFUAbAzWekqFU4jnonVXMhHItIuQKAiWNeJGJqIv
 X+rA==
X-Gm-Message-State: AOAM531tJZKpGKEFBe9dVmKLcC3p25PghPhvTWAOqOeVDtXNmReCbIS3
 jMSPDbJoEuFxHdSkBrMxlgA=
X-Google-Smtp-Source: ABdhPJwes+yMzBs3u5ZxjgSvho9kpfiQM3alPMDR05EtPhob0gU4tGvl1hWgU9gsr+Id7s6ibxsUxQ==
X-Received: by 2002:ac2:5691:: with SMTP id 17mr10870019lfr.209.1595244423749; 
 Mon, 20 Jul 2020 04:27:03 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s28sm3196852ljm.24.2020.07.20.04.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 04:27:03 -0700 (PDT)
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Julien Grall <julien@xen.org>
References: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
 <20200717160834.GA7191@Air-de-Roger>
 <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
 <1dea1217-f884-0fe1-d339-95c5b473ae23@gmail.com>
 <2fd6c418-db41-8070-5644-344fefd8128d@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a9951d1d-d858-de65-284f-3b604ec102e1@gmail.com>
Date: Mon, 20 Jul 2020 14:27:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2fd6c418-db41-8070-5644-344fefd8128d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 18.07.20 14:24, Julien Grall wrote:

Hello Julien

>
>
> On 17/07/2020 20:17, Oleksandr wrote:
>> I would like to clarify regarding an IOMMU driver changes which 
>> should be done to support PCI pass-through properly.
>>
>> Design document mentions about SMMU, but Xen also supports IPMMU-VMSA 
>> (under tech preview now). It would be really nice if the required 
>> support is extended to that kind of IOMMU as well.
>>
>> May I clarify what should be implemented in the Xen driver in order 
>> to support PCI pass-through feature on Arm? 
>
> I would expect callbacks to:
>     - add a PCI device
>     - remove a PCI device
>     - assign a PCI device
>     - deassign a PCI device
>
> AFAICT, they are already existing. So it is a matter of plumbing. This 
> would then be up to the driver to configure the IOMMU correctly.


Got it.

>
>> Should the IOMMU H/W be "PCI-aware" for that purpose?
>
> The only requirement is that your PCI devices are behind an IOMMU :). 
> Other than that the IOMMU can mostly be configured the same way as you 
> would do for the non-PCI devices. 

That's good.


> The main difference would be how you find the master ID.
>
> I am aware that on some platforms, the masterID may be shared between 
> multiple PCI devices. In that case, we would need to have a way to 
> assign all the devices to the same guest (maybe using group?).

Or just prevent these devices from being assigned to different guests? 
During assigning a device to newly created guest check whether masterID 
is already in use for any existing guests and deny operation in such a 
case.


-- 
Regards,

Oleksandr Tyshchenko


