Return-Path: <SRS0=MTdN=BF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBE8C433E0
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 07:01:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 720ED205CB
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 07:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 720ED205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzaeq-0000nK-Ln; Sun, 26 Jul 2020 07:01:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jzaeq-0000nF-Al
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 07:01:16 +0000
X-Inumbo-ID: cbcdf304-cf0d-11ea-89fc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbcdf304-cf0d-11ea-89fc-bc764e2007e4;
 Sun, 26 Jul 2020 07:01:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1BDAAAC5;
 Sun, 26 Jul 2020 07:01:23 +0000 (UTC)
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
 <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
 <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3dXSnEBvhkHkZzV9URAGqSfdtJ1Lc838h_ViAWG3ZO4g@mail.gmail.com>
 <alpine.DEB.2.21.2007241353450.17562@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68a6a292-d299-aafa-3b38-4f63b1107c6b@suse.com>
Date: Sun, 26 Jul 2020 09:01:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007241353450.17562@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.07.2020 01:46, Stefano Stabellini wrote:
> On Fri, 24 Jul 2020, Julien Grall wrote:
>> On Fri, 24 Jul 2020 at 19:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> If they are not equal, then I fail to see why it would be useful to have this
>>>> value in Xen.
>>>
>>> I think that's because the domain is actually more convenient to use
>>> because a segment can span multiple PCI host bridges. So my
>>> understanding is that a segment alone is not sufficient to identify a
>>> host bridge. From a software implementation point of view it would be
>>> better to use domains.
>>
>> AFAICT, this would be a matter of one check vs two checks in Xen :).
>> But... looking at Linux, they will also use domain == segment for ACPI
>> (see [1]). So, I think, they still have to use (domain, bus) to do the lookup.
>>
>>>> In which case, we need to use PHYSDEVOP_pci_mmcfg_reserved so
>>>> Dom0 and Xen can synchronize on the segment number.
>>>
>>> I was hoping we could write down the assumption somewhere that for the
>>> cases we care about domain == segment, and error out if it is not the
>>> case.
>>
>> Given that we have only the domain in hand, how would you enforce that?
>>
>> >From this discussion, it also looks like there is a mismatch between the
>> implementation and the understanding on QEMU devel. So I am a bit
>> concerned that this is not stable and may change in future Linux version.
>>
>> IOW, we are know tying Xen to Linux. So could we implement
>> PHYSDEVOP_pci_mmcfg_reserved *or* introduce a new property that
>> really represent the segment?
> 
> I don't think we are tying Xen to Linux. Rob has already said that
> linux,pci-domain is basically a generic device tree property. And if we
> look at https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> "PCI domain" is described and seems to match the Linux definition.
> 
> I do think we need to understand the definitions and the differences.
> Reading online [1][2] it looks like a Linux PCI domain matches a "PCI
> Segment Group Number" in PCI Express which is probably why Linux is
> making the assumption that it is making.

If I may, I'd like to put the question a little differently, in the hope
for me to understand the actual issue here: On the x86 side, by way of
using ACPI, Linux and Xen "naturally" agree on segment numbering (as far
as normal devices go; Intel's Volume Management Device concept still
needs accommodating so that it would work with Xen). This includes the
multiple host bridges case then naturally. How is the Device Tree model
different from ACPI?

Jan

