Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45C606D80D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 13:23:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1469783.1678539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEU2-0006IK-27; Tue, 03 Nov 2026 13:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469783.1678539; Tue, 03 Nov 2026 13:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOEU1-0006ID-Vr; Tue, 03 Nov 2026 13:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1469783;
 Tue, 03 Nov 2026 13:23:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaton@eik.bme.hu>) id 1xOEU0-0006I7-MP
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:23:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOEU0-00BCVj-2p
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:23:24 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae9e049-e002-0a2a0a5209dd-0a2a4506cd18-8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:23:24 +0100
Received: from [152.66.115.2] (helo=zero.eik.bme.hu)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae9e04b-195a-0a2a45060019-984273026978-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 14:23:23 +0100
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4DAAE60C2B6;
 Tue, 03 Nov 2026 14:23:23 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by localhost (zero.eik.bme.hu [127.0.0.1]) (amavis, port 10028) with ESMTP
 id XGS0VU7w7tal; Tue,  3 Nov 2026 14:23:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2D9F760C0F3; Tue, 03 Nov 2026 14:23:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2A1BF139920;
 Tue, 03 Nov 2026 14:23:21 +0100 (CET)
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
Date: Tue, 3 Nov 2026 14:23:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Yonggang Luo <luoyonggang@gmail.com>
cc: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
    qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
    Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
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
In-Reply-To: <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
Message-ID: <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu> <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-50472206-1793712201=:91419"
X-purgate-ID: tlsNG-16d1c6/1793712204-FD60A77B-176C6D1F/0/0
X-purgate-type: clean
X-purgate-size: 4229
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-50472206-1793712201=:91419
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 3 Nov 2026, Yonggang Luo wrote:
> On Tue, Nov 3, 2026 at 4:16 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>>>>> type_init
>>>>> function that calls type_register_static(). A later change needs to
>>>>> pass a
>>>>
>>>> That's the point of the macro to hide the boiler plate code.
>>>>
>>>>> target mask into that registration, and the macros have no parameter
>>>>> for it.
>>>>
>>>> Couldn't you just change the macros to take that parameter instead of
>>>> expanding it everywhere?
>>>>
>>>
>>> Problem of macros is that they don't have default parameters, so you
>>> need variants for everything:
>>>
>>> DEFINE_MACHINE
>>> DEFINE_MACHINE_EXTENDED
>>> DEFINE_MACHINE_WITH_INTERFACES
>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
>>> and now would need a new variant, with variant for other existing ones.
>>>
>>> In the end, it's just simpler to remove this and add the boilerplate.
>>> It's written once and never modified, so using a macro just save typing
>>> those lines once.
>>
>> For each machine, it is only written once, but we add machines
>> over time, and every time a new machine is added the code style
>> is slightly different. We introduced all the variuos DEFINE_*
>> macros for QOM to better ensure consistent style and usage as
>> new code is added over time.
>
> I understand that the DEFINE_* macros are bloating because of this.
> Indeed currently the only two macros used are "DEFINE_MACHINE" and
> "DEFINE_MACHINE_EXTENDED"

There are a few machines using some others but these are the most used. 
That suggests maybe we should change the convenience wrappers to match 
what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one that 
allows all parameters which should be rarely needed.

> ; each time people want to add a new attribute, the macros is twiced.

Not necessarily. The SECURE parameter did that to preserve previous 
behaviour but if you add new parameter changing all callers (which is the 
same as expanding the macro that would also change all callers) then it's 
just a new parameter added not changing the number of DEFINE_MACHINE* 
wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED used 
less is an independent change.

> And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
> with DEFINE_TYPES or TypeInfo
> and be more explicit. When we used as macro parameter, we need think

But that defies the purpose of hiding the QOM boiler plate as much as 
possible. New people are confused by QOM and it's easier for them to look 
up documentation on the DEFINE_MACHINE* macros to see what parameter is 
what and not care about how it's stored in QOM TypeInfo or what is that 
at all.

> what's that parameter means, and for
> TypeInfo, we can directly know what that member is about(because we
> are assigned with the member name).

The parameter also has a name and documentation so it's not simpler to 
look up TypeInfo than look at the macro definition or docs. In fact it's 
harder to guess from TypeInfo as then you also need to get into QOM.

> That's why I suggest keeping a single DEFINE_MACHINE, just like
> DEFINE_TYPES; as they are the most
> used macros(and simple enough), and won't suffer from changes much.

That means exposing all the boiler plate for all machines other than the 
simplest case. I think it would be better to keep DEFINE_MACHINE_EXTENDED 
but maybe rethink the existing wrappers and drop unused ones and maybe add 
new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still keep 
the boiler plate hidden.

Regards,
BALATON Zoltan
--3866299591-50472206-1793712201=:91419--

