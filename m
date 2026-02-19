Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC20FE9A048
	for <xen-devel@archiver.kernel.org>; Thu, 19 Feb 2026 12:45:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1236231.1538971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3On-0007sb-05; Thu, 19 Feb 2026 12:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236231.1538971; Thu, 19 Feb 2026 12:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt3Om-0007sU-TZ; Thu, 19 Feb 2026 12:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1236231;
 Thu, 19 Feb 2026 12:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5se=AX=bounce.vates.tech=bounce-md_30504962.699705bf.v1-a51c4b1ad364496ab8140e652e13eaad@srs-se1.protection.inumbo.net>)
 id 1vt3Ol-0007sM-L7
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 12:44:51 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c66ac20f-0d90-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 13:44:49 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fGtPW2c27zPm0j4M
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 12:44:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a51c4b1ad364496ab8140e652e13eaad; Thu, 19 Feb 2026 12:44:47 +0000
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
X-Inumbo-ID: c66ac20f-0d90-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771505087; x=1771775087;
	bh=ekWC7xbCItHTVzn4dwCJQg3s6mD0YG5ENhFdY0aWNz4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e0T40mm+9tjpxFrxDRrbShiZc7ptlQtvldKDeh7c/bJHmxyI37g+pQn+uuAg+h2Y7
	 bS3ECWlk1a23/UgtFFLvLRKmE6ByNlH2NS3MVJhOwTQta/eOKvqLh3rqtTQcybhqxY
	 GvQWPgSiCplAWqvLhc8kuZvcR/Wj/TPg8y7sxJ4l20N8MVJpGKFXbLqfbY4pTR/nL8
	 qyxF6l6Zrf86z9JSB9X2aINUIoB0O9retu5Iq4IdoXENPm3XFGMrzUg1czfEeeMi+H
	 d3aH7ZIWCImsm2Q8xTsa/AMCsj+FNbHhyX5sAkBFC96LmpZlj6lPMLmGTkU8iPFMRf
	 6rdgCnYi8yJrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771505087; x=1771765587; i=julian.vetter@vates.tech;
	bh=ekWC7xbCItHTVzn4dwCJQg3s6mD0YG5ENhFdY0aWNz4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wbTIi4ceiE5yhOIngd9xgYNx9XGvCUo/2nUSf/wZ7HBUa+78OThcGhm55Eo0hIN2E
	 LjUQWK/Xt2BqokGNksPn0h9z2Z7YtWoNtNrdyTFcJkPGr+nsDsFK3krESadOjhrS5O
	 XVQx6c3E+eIaFhjwgXZlrFSVmD2vfi+PcQyjkdCchrQxFXjf3RXX6LOWYPu1yZtr3Q
	 8M3cZezYOB/7rfYG1MGTiraDoDTdNFEkScnFRz71bzuvMruka4+X8v/jLEDA7Rtshv
	 js9VV4y1CDYhJsOb6X3WmDllzn8MXnswupJ1MONHRyOTP/EQOdxK7O1cSPNMn6qBJq
	 x2/QjV9Z+t/JA==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hvm:=20Advertise=20and=20support=20extended=20destination=20IDs=20for=20MSI/IO-APIC?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771505086332
Message-Id: <993fafc6-330b-4680-8284-983efb7694f8@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20260209113412.2603088-1-julian.vetter@vates.tech> <aYneEnAa-LqQt8Gm@Mac.lan>
In-Reply-To: <aYneEnAa-LqQt8Gm@Mac.lan>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a51c4b1ad364496ab8140e652e13eaad?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260219:md
Date: Thu, 19 Feb 2026 12:44:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 2/9/26 14:16, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 09, 2026 at 11:34:18AM +0000, Julian Vetter wrote:
>> x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
>> addresses and IO-APIC RTEs only provide an 8-bit destination field.
>> Without extended destination ID support, Linux limits the maximum usable
>> APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
>> advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
>> signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
>> bits 55:49 as additional high destination ID bits. This expands the
>> destination ID from 8 to 15 bits.
>>
>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
>> ---
>>   xen/arch/x86/cpuid.c                   |  9 +++++++++
>>   xen/arch/x86/hvm/irq.c                 | 11 ++++++++++-
>>   xen/arch/x86/hvm/vioapic.c             |  2 +-
>>   xen/arch/x86/hvm/vmsi.c                |  4 ++--
>>   xen/arch/x86/include/asm/hvm/hvm.h     |  4 ++--
>>   xen/arch/x86/include/asm/hvm/vioapic.h | 13 +++++++++++++
>>   xen/arch/x86/include/asm/msi.h         |  3 +++
>>   7 files changed, 40 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>> index d85be20d86..fb17c71d74 100644
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -148,6 +148,15 @@ static void cpuid_hypervisor_leaves(const struct vc=
pu *v, uint32_t leaf,
>>           res->a |=3D XEN_HVM_CPUID_DOMID_PRESENT;
>>           res->c =3D d->domain_id;
>>   
>> +        /*
>> +         * Advertise extended destination ID support. This allows guest=
s to use
>> +         * bits 11:5 of the MSI address and bits 55:49 of the IO-APIC R=
TE for
>> +         * additional destination ID bits, expanding the addressable AP=
IC ID
>> +         * range from 8 to 15 bits. This is required for x2APIC guests =
with
>> +         * APIC IDs > 255.
>> +         */
>> +        res->a |=3D XEN_HVM_CPUID_EXT_DEST_ID;
> 
> This cannot be unilaterally advertised: you need a QEMU (or in general
> any device model that manages PCI passthrough) to understand the
> extended destination mode.  This requires the introduction of
> a new XEN_DOMCTL_bind_pt_irq equivalent hypercall, that can take an
> extended destination ID not limited to 256 values:
> 
> struct xen_domctl_bind_pt_irq {
> [...]
>               uint32_t gflags;
> #define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff
> 
> When doing PCI passthrough it's QEMU the entity that decodes the MSI
> address and data fields, and hence would need expanding (and
> negotiation with Xen) about whether the Extended ID feature can be
> advertised.
> 
> It would be good to introduce a new XEN_DMOP_* set of hypercalls that
> support Extended ID to do the PCI passthrough interrupt binding.

Thank you for your feedback. But wouldn't it be enough if QEMU extracts 
the additional bits from the gflags and pass it on to XEN? In 
pt_irq_create_bind I already extract the additional bits. In QEMU the 
function msi_dest_id would just need to extract the additional bits 
before calling xc_domain_update_msi_irq. The gflags argument in 
xc_domain_update_msi_irq is 32Bits, so there is enough room to pass the 
additional bits. What do you think?

Thank you
Julian

> 
> Thanks, Roger.



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



