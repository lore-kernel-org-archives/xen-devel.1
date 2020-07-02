Return-Path: <SRS0=nVJm=AN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF1BC433DF
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2020 20:30:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38DE2088E
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2020 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38DE2088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cert.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr5qp-0000As-Hh; Thu, 02 Jul 2020 20:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c/Sk=AN=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jr5qo-0000An-29
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 20:30:30 +0000
X-Inumbo-ID: dd5b3a46-bca2-11ea-88b5-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd5b3a46-bca2-11ea-88b5-12813bfff9fa;
 Thu, 02 Jul 2020 20:30:27 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DE845A38B9;
 Thu,  2 Jul 2020 22:30:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C9683A384F;
 Thu,  2 Jul 2020 22:30:25 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yyo64ZndYqLo; Thu,  2 Jul 2020 22:30:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 4D65CA38B9;
 Thu,  2 Jul 2020 22:30:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r8MvnRebaXFk; Thu,  2 Jul 2020 22:30:25 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2299BA384F;
 Thu,  2 Jul 2020 22:30:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0F13B22E49;
 Thu,  2 Jul 2020 22:29:55 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id eSO8T3zbrb_o; Thu,  2 Jul 2020 22:29:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 89DCC22E4A;
 Thu,  2 Jul 2020 22:29:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PdsDc5d_FJp8; Thu,  2 Jul 2020 22:29:49 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6865F22E49;
 Thu,  2 Jul 2020 22:29:49 +0200 (CEST)
Date: Thu, 2 Jul 2020 22:29:49 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1378030024.18497933.1593721789389.JavaMail.zimbra@cert.pl>
In-Reply-To: <5bb2fb6a-c4f4-7d88-9e07-7922d4235338@suse.com>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <f935f7f0-30e4-4ba2-588f-a8368a7b93b1@citrix.com>
 <20200702081020.GW735@Air-de-Roger>
 <5bb2fb6a-c4f4-7d88-9e07-7922d4235338@suse.com>
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add IPT cpu feature
Thread-Index: WUyFXnCTdsSnNUgEtk6y69dO/UcNzQ==
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 luwei kang <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 2 lip 2020 o 10:34, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 02.07.2020 10:10, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Jul 01, 2020 at 10:42:55PM +0100, Andrew Cooper wrote:
>>> On 30/06/2020 13:33, Micha=C5=82 Leszczy=C5=84ski wrote:
>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> index ca94c2bedc..b73d824357 100644
>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> @@ -291,6 +291,12 @@ static int vmx_init_vmcs_config(void)
>>>>          _vmx_cpu_based_exec_control &=3D
>>>>              ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITIN=
G);
>>>> =20
>>>> +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>> +
>>>> +    /* Check whether IPT is supported in VMX operation. */
>>>> +    vmtrace_supported =3D cpu_has_ipt &&
>>>> +                        (_vmx_misc_cap & VMX_MISC_PT_SUPPORTED);
>>>
>>> There is a subtle corner case here.=C2=A0 vmx_init_vmcs_config() is cal=
led on
>>> all CPUs, and is supposed to level things down safely if we find any
>>> asymmetry.
>>>
>>> If instead you go with something like this:
>>>
>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>> index b73d824357..6960109183 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -294,8 +294,8 @@ static int vmx_init_vmcs_config(void)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>> =C2=A0
>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* Check whether IPT is supported in VMX opera=
tion. */
>>> -=C2=A0=C2=A0=C2=A0 vmtrace_supported =3D cpu_has_ipt &&
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_vmx=
_misc_cap & VMX_MISC_PT_SUPPORTED);
>>> +=C2=A0=C2=A0=C2=A0 if ( !(_vmx_misc_cap & VMX_MISC_PT_SUPPORTED) )
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmtrace_supported =3D false=
;
>>=20
>> This is also used during hotplug, so I'm not sure it's safe to turn
>> vmtrace_supported off during runtime, where VMs might be already using
>> it. IMO it would be easier to just set it on the BSP, and then refuse
>> to bring up any AP that doesn't have the feature.
>=20
> +1
>=20
> IOW I also don't think that "vmx_init_vmcs_config() ... is supposed to
> level things down safely". Instead I think the expectation is for
> CPU onlining to fail if a CPU lacks features compared to the BSP. As
> can be implied from what Roger says, doing like what you suggest may
> be fine during boot, but past that only at times where we know there's
> no user of a certain feature, and where discarding the feature flag
> won't lead to other inconsistencies (which may very well mean "never").
>=20
> Jan


Ok, I will modify it in a way Roger suggested for the previous patch
version. CPU onlining will fail if there is an inconsistency.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

