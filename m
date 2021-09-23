Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826A6C433F5
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 11:08:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EF860F6F
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 11:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3EF860F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=greensocs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.193704.345048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMas-0004AG-2Z; Thu, 23 Sep 2021 11:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193704.345048; Thu, 23 Sep 2021 11:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMar-0004A9-Tg; Thu, 23 Sep 2021 11:08:45 +0000
Received: by outflank-mailman (input) for mailman id 193704;
 Thu, 23 Sep 2021 11:08:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTMaq-0004A3-7I
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:08:44 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94471309-08c8-470a-b0f8-0990909f649c;
 Thu, 23 Sep 2021 11:08:42 +0000 (UTC)
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E523C20777;
 Thu, 23 Sep 2021 11:08:39 +0000 (UTC)
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
X-Inumbo-ID: 94471309-08c8-470a-b0f8-0990909f649c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632395320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pKGcNnmlj8pflXWMttiwz2KP8cVDOcviRK9BnXLJgmg=;
	b=Yzw8VOoeXtchb31M5o7ihWMzh115d5LEkUD/IjkknpVcRv+Wpiik2gMc7ix0A9ZGEFXtUd
	BNML4R9Kt/vkAR74LOFxs0dragUKbR0yYkvXfUnQ3YLvVm937WLOKlcaHHrQZDXvPolsfg
	qZfCuKoudgXjuISaTcUD5bKxvcPzjAk=
Message-ID: <d080506d-04a0-0af1-5426-6162091ef55f@greensocs.com>
Date: Thu, 23 Sep 2021 13:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <a4debda9-f00b-dc99-7e7c-37ea9b4d7b5c@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <a4debda9-f00b-dc99-7e7c-37ea9b4d7b5c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/22/21 19:50, Philippe Mathieu-Daudé wrote:
> Hi Damien,
> 
> On 9/22/21 18:13, Damien Hedde wrote:
>>
>> The goal of this work is to bring dynamic machine creation to QEMU:
>> we want to setup a machine without compiling a specific machine C
>> code. It would ease supporting highly configurable platforms (for
>> example resulting from an automated design flow). The requirements
>> for such configuration include begin able to specify the number of
>> cores, available peripherals, emmory mapping, IRQ mapping, etc.
>>
>> This series focuses on the first step: populating a machine with
>> devices during its creation. We propose patches to support this
>> using QMP commands. This is a working set of patches and improves
>> over the earlier rfc (posted in May):
>> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html
> 
> Do you have a roadmap for the following steps? Or are you done with
> this series?

Hi Philippe,

We would like to stick to this scope ("creating devices in a machine") 
for this particular series otherwise it will become very big and cover a 
huge scope.

We have some patches to "migrate" more devices to be early 
user-creatable (like the last 2 patches of this series) so that we can 
use more device when building a machine. But these are trivial and only 
depends on what is the condition to allow this. We plan to submit these 
when this series is done.

We plan to address other issues we have in others series of patches. We 
do not put a roadmap somewhere. But we can details this in a page in our 
github or in the qemu wiki if you think this is a good idea.
Here are the main remaining issues:
+ the base machine (we are using "none" here because it is "almost" 
empty and fit our needs but it has some limitations)
+ adding cpus
+ non-trivial memory mappings
+ solving backend (eg: net) connection issues

> 
> Yesterday I was thinking about this, and one thing I was wondering is
> if it would be possible to have DeviceClass and MachineClass implement
> a populate_fdt() handler, to automatically generate custom DTB for these
> custom machines.
> 
> Maybe in your case you don't need that, as your framework generating the
> QEMU machine also generates the DTB, or even parse a DTB to generate the
> machine... :)

You are right, we do not need this. We indeed use a device tree file to 
describe the platform but this is an "extended" device tree (it has more 
info than needed for linux). If it was not the case, I think it would 
still be easier to generate it from the source platform description than 
using qemu as an intermediate.

It is probably possible but it is tricky to generate the dtb: mapping in 
dtb are not standardized and really depends on the node types.

For example, to generate the interrupt-map property of a device node. 
You need to know the interrupt mapping (which interrupt line goes in 
which interrupt controller) and also have info about the interrupt 
controller's cells format (eg: how many bytes do we need to specify the 
interrupt). For example for some controller, you have specify the 
interrupt kind (rising or falling edge, high or low active level).

So you'll probably need some special "get_dtb_interrupt_cell" method in 
interrupt controllers to generate these entries for you so that a device 
can ask dtb data to its controller.

Bus mappings also depend on the bus type, but since qemu devices are 
already organized on a bus-type basis, this is probably easier to solve.

You'll have similar issues with every mapping. But bus and interrupt are 
the most important ones.

Thanks,
Damien

