Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6130F606A31D
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 23:30:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1467027.1676556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNIWH-0006V7-LL; Sat, 31 Oct 2026 23:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467027.1676556; Sat, 31 Oct 2026 23:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNIWH-0006V0-Ik; Sat, 31 Oct 2026 23:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1467027;
 Sat, 31 Oct 2026 23:29:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaton@eik.bme.hu>) id 1xNIWG-0006Uu-EM
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 23:29:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNIWF-003QMg-HD
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 00:29:51 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae67963-8faa-0a2a0a5109dd-0a2a4504a03e-42
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 00:29:50 +0100
Received: from [152.66.115.2] (helo=zero.eik.bme.hu)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae679ee-b57f-0a2a45040019-984273024f18-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 00:29:50 +0100
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1E8CA60C0F3;
 Sun, 01 Nov 2026 00:29:50 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by localhost (zero.eik.bme.hu [127.0.0.1]) (amavis, port 10028) with ESMTP
 id 4q6hlnrGPhnV; Sun,  1 Nov 2026 00:29:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 007E860C0DB; Sun, 01 Nov 2026 00:29:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F0CD413996F;
 Sun, 01 Nov 2026 00:29:47 +0100 (CET)
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
Date: Sun, 1 Nov 2026 00:29:47 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Yonggang Luo <luoyonggang@gmail.com>
cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
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
In-Reply-To: <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
Message-ID: <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu> <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu> <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1983517024-1793489387=:97222"
X-purgate-ID: tlsNG-ebf023/1793489390-518D1B50-9F782118/0/0
X-purgate-type: clean
X-purgate-size: 4453
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1983517024-1793489387=:97222
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 1 Nov 2026, Yonggang Luo wrote:
> On Sun, Nov 1, 2026 at 1:06 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Sat, 31 Oct 2026, Yonggang Luo wrote:
>>> On Sat, Oct 31, 2026 at 8:42 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>
>>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
>>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
>>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>>>>>>> type_init
>>>>>>> function that calls type_register_static(). A later change needs to
>>>>>>> pass a
>>>>>>
>>>>>> That's the point of the macro to hide the boiler plate code.
>>>>>>
>>>>>>> target mask into that registration, and the macros have no parameter
>>>>>>> for it.
>>>>>>
>>>>>> Couldn't you just change the macros to take that parameter instead of
>>>>>> expanding it everywhere?
>>>>>>
>>>>>
>>>>> Problem of macros is that they don't have default parameters, so you
>>>>> need variants for everything:
>>>>>
>>>>> DEFINE_MACHINE
>>>>> DEFINE_MACHINE_EXTENDED
>>>>> DEFINE_MACHINE_WITH_INTERFACES
>>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
>>>>> and now would need a new variant, with variant for other existing ones.
>>>>>
>>>>> In the end, it's just simpler to remove this and add the boilerplate.
>>>>> It's written once and never modified, so using a macro just save typing
>>>>> those lines once.
>>>>>
>>>>>> Regards,
>>>>>> BALATON Zoltan
>>>>>>
>>>>>>> This series expands every caller first, with no behavior change, so the
>>>>>>> follow-up only replaces the type_register_static() call.
>>>>>>>
>>>>>>> Each machine file gains a class_init function, a TypeInfo, and a
>>>>>>> type_init
>>>>>>> function that calls type_register_static(). The last patch removes
>>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.
>>>>
>>>> Macros help reading the code not saving typing. If the actual
>>>> functionality is buried in a lot of boiler plate it's harder to understand
>>>> and spot bugs so putting the unintresting boiler plate behind a macro is
>>>> better even if you need a separate version for different cases. Then the
>>>> code that uses the macro will be much more obvious and not just a lot of
>>>
>>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
>>> not defined properly
>>> that causes them to not be extended easily.
>>>
>>> DEFINE_TYPES is another example, use them can extend easily, how about
>>> always use DEFINE_TYPES?
>>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MACHINE*?
>>
>> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
>> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't you add
>> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for machines
>> that need it, or if it's needed by all machines then make the new
>> parameter required and add it to all convenience wrappers too so you can
>> keep using DEFINE_MACHINE* and just need to add one parameter to it in
>> machines?
>
> That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means all
> calls to it also need
> to be changed, that means touch many $target_arch files. currently
> it's 13. But after these

That's not different from expanding the macro which would touch the same 
files.

> changes, there will be much more usage on it, and if we want to add
> more parameters or attributes
> to it, it will be a new tree-wide change.

Do you expect to need more parameters? Can't you add them at once then?

> And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] is
> explicit defined for
> DEFINE_TYPES

My point is that keeping the boiler plate as little as possible makes the 
code more readable. DEFINE_TYPES hides some of the boiler plate, 
DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would expose 
some even if it's better than no macro at all.

What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED that 
need to be added?

Regards,
BALATON Zoltan
--3866299591-1983517024-1793489387=:97222--

