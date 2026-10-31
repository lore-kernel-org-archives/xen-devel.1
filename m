Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0441606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 12:42:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1466736.1676513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN8Pe-0004O4-RE; Sat, 31 Oct 2026 12:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466736.1676513; Sat, 31 Oct 2026 12:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN8Pe-0004Nw-Nq; Sat, 31 Oct 2026 12:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1466736;
 Sat, 31 Oct 2026 12:42:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaton@eik.bme.hu>) id 1xN8Pd-0004Nq-S2
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 12:42:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xN8Pd-00BTsr-1M
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 13:42:21 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae5e1de-e002-0a2a0a5209dd-0a2a4504db40-34
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 13:42:20 +0100
Received: from [152.66.115.2] (helo=zero.eik.bme.hu)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae5e22c-b57f-0a2a45040019-98427302f02f-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 13:42:20 +0100
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DF4ED60C532;
 Sat, 31 Oct 2026 13:42:19 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by localhost (zero.eik.bme.hu [127.0.0.1]) (amavis, port 10028) with ESMTP
 id 9dpfbu7glJHt; Sat, 31 Oct 2026 13:42:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D10E160C50E; Sat, 31 Oct 2026 13:42:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CDB1B13996F;
 Sat, 31 Oct 2026 13:42:17 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Virus-Scanned: amavis at eik.bme.hu
Date: Sat, 31 Oct 2026 13:42:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, 
    Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
    Aleksandar Rikalo <arikalo@gmail.com>, 
    Philippe Mathieu-Daude <philmd@mailo.com>, 
    Antony Pavlov <antonynpavlov@gmail.com>, 
    Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
    =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
    Max Filippov <jcmvbkbc@gmail.com>, 
    Niek Linnenbank <nieklinnenbank@gmail.com>, xen-devel@lists.xenproject.org, 
    qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>, 
    qemu-ppc@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, 
    Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>, 
    Thomas Huth <th.huth+qemu@posteo.eu>, 
    =?ISO-8859-15?Q?Cl=E9ment_Chigot?= <chigot@adacore.com>, 
    Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
    Yoshinori Sato <yoshinori.sato@nifty.com>, 
    Frederic Konrad <konrad.frederic@yahoo.fr>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Chao Liu <chao.liu@processmission.com>, 
    Sai Pavan Boddu <sai.pavan.boddu@amd.com>, 
    Alistair Francis <alistair@alistair23.me>, 
    Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
    Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
In-Reply-To: <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
Message-ID: <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu> <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-purgate-ID: tlsNG-ebf023/1793450540-583C0B50-96BF0A3D/0/0
X-purgate-type: clean
X-purgate-size: 1890
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>>> type_init
>>> function that calls type_register_static(). A later change needs to
>>> pass a
>>
>> That's the point of the macro to hide the boiler plate code.
>>
>>> target mask into that registration, and the macros have no parameter
>>> for it.
>>
>> Couldn't you just change the macros to take that parameter instead of
>> expanding it everywhere?
>>
>
> Problem of macros is that they don't have default parameters, so you
> need variants for everything:
>
> DEFINE_MACHINE
> DEFINE_MACHINE_EXTENDED
> DEFINE_MACHINE_WITH_INTERFACES
> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
> and now would need a new variant, with variant for other existing ones.
>
> In the end, it's just simpler to remove this and add the boilerplate.
> It's written once and never modified, so using a macro just save typing
> those lines once.
>
>> Regards,
>> BALATON Zoltan
>>
>>> This series expands every caller first, with no behavior change, so the
>>> follow-up only replaces the type_register_static() call.
>>>
>>> Each machine file gains a class_init function, a TypeInfo, and a
>>> type_init
>>> function that calls type_register_static(). The last patch removes
>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.

Macros help reading the code not saving typing. If the actual 
functionality is buried in a lot of boiler plate it's harder to understand 
and spot bugs so putting the unintresting boiler plate behind a macro is 
better even if you need a separate version for different cases. Then the 
code that uses the macro will be much more obvious and not just a lot of 
boiler plate.

Regards,
BALATON Zoltan

