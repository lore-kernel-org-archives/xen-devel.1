Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB1609621C
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:56:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1468425.1677529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNtS8-0007yH-O6; Mon, 02 Nov 2026 14:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468425.1677529; Mon, 02 Nov 2026 14:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNtS8-0007yA-Kj; Mon, 02 Nov 2026 14:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1468425;
 Mon, 02 Nov 2026 14:56:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaton@eik.bme.hu>) id 1xNtS7-0007y4-8u
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:56:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNtS6-0087Zy-Lt
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:56:02 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae8a480-2eae-0a2a0a5409dd-0a2a450a838e-12
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:56:02 +0100
Received: from [152.66.115.2] (helo=zero.eik.bme.hu)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaton@eik.bme.hu>)
 id 6ae8a481-f2d2-0a2a450a0019-98427302a64e-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:56:02 +0100
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3C50A60C532;
 Mon, 02 Nov 2026 15:56:01 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by localhost (zero.eik.bme.hu [127.0.0.1]) (amavis, port 10028) with ESMTP
 id VTz4k38AQKv2; Mon,  2 Nov 2026 15:55:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F184D60C4E7; Mon, 02 Nov 2026 15:55:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id ED86A13991F;
 Mon, 02 Nov 2026 15:55:58 +0100 (CET)
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
Date: Mon, 2 Nov 2026 15:55:58 +0100 (CET)
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
In-Reply-To: <CAE2XoE8pNaP3rAR5Y2BpUZ2vSu-UC-wG9V9U7gPXrEGY=kx0RA@mail.gmail.com>
Message-ID: <e5ce0ea8-7e97-aa76-6384-025fc43cb85a@eik.bme.hu>
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu> <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu> <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com> <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu> <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu> <CAE2XoE8pNaP3rAR5Y2BpUZ2vSu-UC-wG9V9U7gPXrEGY=kx0RA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-608982516-1793631358=:93499"
X-purgate-ID: tlsNG-4011c0/1793631362-520C1CFC-16F135F0/0/0
X-purgate-type: clean
X-purgate-size: 9576
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-608982516-1793631358=:93499
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 2 Nov 2026, Yonggang Luo wrote:
> On Mon, Nov 2, 2026 at 4:57 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Sun, 1 Nov 2026, Yonggang Luo wrote:
>>> On Sun, Nov 1, 2026 at 7:29 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>
>>>> On Sun, 1 Nov 2026, Yonggang Luo wrote:
>>>>> On Sun, Nov 1, 2026 at 1:06 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>>>
>>>>>> On Sat, 31 Oct 2026, Yonggang Luo wrote:
>>>>>>> On Sat, Oct 31, 2026 at 8:42 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>>>>>
>>>>>>>> On Fri, 30 Oct 2026, Pierrick Bouvier wrote:
>>>>>>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
>>>>>>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>>>>>>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>>>>>>>>>>> type_init
>>>>>>>>>>> function that calls type_register_static(). A later change needs to
>>>>>>>>>>> pass a
>>>>>>>>>>
>>>>>>>>>> That's the point of the macro to hide the boiler plate code.
>>>>>>>>>>
>>>>>>>>>>> target mask into that registration, and the macros have no parameter
>>>>>>>>>>> for it.
>>>>>>>>>>
>>>>>>>>>> Couldn't you just change the macros to take that parameter instead of
>>>>>>>>>> expanding it everywhere?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Problem of macros is that they don't have default parameters, so you
>>>>>>>>> need variants for everything:
>>>>>>>>>
>>>>>>>>> DEFINE_MACHINE
>>>>>>>>> DEFINE_MACHINE_EXTENDED
>>>>>>>>> DEFINE_MACHINE_WITH_INTERFACES
>>>>>>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
>>>>>>>>> and now would need a new variant, with variant for other existing ones.
>>>>>>>>>
>>>>>>>>> In the end, it's just simpler to remove this and add the boilerplate.
>>>>>>>>> It's written once and never modified, so using a macro just save typing
>>>>>>>>> those lines once.
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> BALATON Zoltan
>>>>>>>>>>
>>>>>>>>>>> This series expands every caller first, with no behavior change, so the
>>>>>>>>>>> follow-up only replaces the type_register_static() call.
>>>>>>>>>>>
>>>>>>>>>>> Each machine file gains a class_init function, a TypeInfo, and a
>>>>>>>>>>> type_init
>>>>>>>>>>> function that calls type_register_static(). The last patch removes
>>>>>>>>>>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.
>>>>>>>>
>>>>>>>> Macros help reading the code not saving typing. If the actual
>>>>>>>> functionality is buried in a lot of boiler plate it's harder to understand
>>>>>>>> and spot bugs so putting the unintresting boiler plate behind a macro is
>>>>>>>> better even if you need a separate version for different cases. Then the
>>>>>>>> code that uses the macro will be much more obvious and not just a lot of
>>>>>>>
>>>>>>> I think mainly because DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* are
>>>>>>> not defined properly
>>>>>>> that causes them to not be extended easily.
>>>>>>>
>>>>>>> DEFINE_TYPES is another example, use them can extend easily, how about
>>>>>>> always use DEFINE_TYPES?
>>>>>>> Or add a DEFINE_TYPE to replace DEFINE_MACHINE* and DEFINE_SECURE_MACHINE*?
>>>>>>
>>>>>> Maybe I'm missing the problem but DEFINE_MACHINE macros are just
>>>>>> convenience wrappers around DEFINE_MACHINE_EXTENDED. So why can't you add
>>>>>> the needed parameter to DEFINE_MACHINE_EXTENDED and use that for machines
>>>>>> that need it, or if it's needed by all machines then make the new
>>>>>> parameter required and add it to all convenience wrappers too so you can
>>>>>> keep using DEFINE_MACHINE* and just need to add one parameter to it in
>>>>>> machines?
>>>>>
>>>>> That's the issue, add parameter to DEFINE_MACHINE_EXTENDED means all
>>>>> calls to it also need
>>>>> to be changed, that means touch many $target_arch files. currently
>>>>> it's 13. But after these
>>>>
>>>> That's not different from expanding the macro which would touch the same
>>>> files.
>>>>
>>>>> changes, there will be much more usage on it, and if we want to add
>>>>> more parameters or attributes
>>>>> to it, it will be a new tree-wide change.
>>>>
>>>> Do you expect to need more parameters? Can't you add them at once then?
>>>>
>>>>> And DEFINE_TYPES do not suffer from such issues. As the TypeInfo[] is
>>>>> explicit defined for
>>>>> DEFINE_TYPES
>>>>
>>>> My point is that keeping the boiler plate as little as possible makes the
>>>> code more readable. DEFINE_TYPES hides some of the boiler plate,
>>>> DEFINE_MACHINE hides even more so converting to DEFINE_TYPES would expose
>>>> some even if it's better than no macro at all.
>>>>
>>>> What exactly are the parameters missing from DEFINE_MACHINE_EXTENDED that
>>>> need to be added?
>>>
>>> Hi BALATON
>>> the things we faced is we first is to add TypeInfo::is_available parameter to
>>> DEFINE_MACHINE_EXTENDED, and have more usage of it.
>>> Then we will add targets:uint64_t parameter to DEFINE_MACHINE_EXTENDED, this is
>>> a prepare to remove TypeInfo::is_available parameter from
>>> DEFINE_MACHINE_EXTENDED,
>>>
>>> And finally, once all usage of TypeInfo::is_available can be replaced with
>>> targets:uint64_t, then we finally need to remove
>>> TypeInfo::is_available parameter from DEFINE_MACHINE_EXTENDED,
>>
>> Is there a way to avoid the temporary is_available churn and introduce the
>> targets:uint64_t right away? (I'm not following this so I don't really
>> know what you're talking about just looks like there's some churn here
>> which might be good to awoid anyway independent of these macros.)
>>
>>> That's what I am facing now. And the explicit
>>> static const TypeInfo xxx_machine_typeinfo = {
>>>    .name       = MACHINE_TYPE_NAME("xxx"),
>>>    .parent     = TYPE_MACHINE,
>>>    .class_init = xxx_machine_class_init,
>>> };
>>>
>>> Will help me avoid the issue. And I think this is a little boilerplate
>>> and very explicit.
>>
>> That's not all DEFINE_MACHINE hides though. It's longer with .abstract,
>> .secure and .iterfaces plus the machine initfn that would also need to be
>> expanded if you used DEFINE_TYPES.
>>
>> Is this conversion needed for all machines using all DEFINE_MACHINE
>
> At the end, only "none" machine do not have targets parameter or
> (QEMU_ARCH_ALL), as that's the sole
> machine that supports all targets.
>
>> variants or only some of them? If the latter why not convert those to
>
>
>
>
>> DEFINE_MACHINE_EXTENDED and then only that macro needs to be changed with
>> other wrappers passing a default value without needing a new parameter.
>> That does not work if all machines need to do this but even then, keeping
>> the macro and adding a new required parameter is better in my opinion as
>> it keeps boiler plate hidden.
>
> Another option is keep DEFINE_MACHINE and introduce DEFINE_MACHINE_TARGETS
> and remove DEFINE_MACHINE_EXTENDED, and we only use DEFINE_MACHINE for
> simple case,
> that is parent is TYPE_MACHINE and have no custom type and no more
> attributes assigned.
> DEFINE_MACHINE_EXTENDED is too verbose, when calling it, it less clear
> than calling to DEFINE_MACHINE.
> And if we want to set more attributes to TypeInfo, just expand it to
> use type_init or DEFINE_TYPES, how about this way.
>
> This will be something like:
>
> #define DEFINE_MACHINE_TARGETS(namestr, machine_initfn, targets) \
>    static void machine_initfn##_class_init(ObjectClass *oc, const void *data) \
>    { \
>        MachineClass *mc = MACHINE_CLASS(oc); \
>        machine_initfn(mc); \
>    } \
>    static const TypeInfo machine_initfn##_typeinfo = { \
>        .name       = MACHINE_TYPE_NAME(namestr), \
>        .parent     = TYPE_MACHINE, \
>        .class_init = machine_initfn##_class_init, \
>    }; \
>    static void machine_initfn##_register_types(void) \
>    { \
>        type_register_targets(&machine_initfn##_typeinfo, targets); \
>    } \
>    type_init(machine_initfn##_register_types)
>
> /* Implicitly insecure */
> #define DEFINE_MACHINE(namestr, machine_initfn) \
>    DEFINE_MACHINE_TARGETS(namestr, machine_initfn, QEMU_ARCH_ALL) \
>
> As the many call is to DEFINE_MACHINE.
>
> And after all conversion, all existing usage of DEFINE_MACHINE will be
> converted to
> DEFINE_MACHINE_TARGETS.
> DEFINE_MACHINE will be called for ('none') machine or future heterogeneous
> machines
>
>
> Either way, these patches will be dropped. We will introduce
> DEFINE_MACHINE_TARGETS first.

I think I'm lost and cannot follow what you want. As far as I understood 
you want to add a new field "target" to machine TypeInfo but instead of 
adding that straight away you proposed to first add is_available then 
later replace that with target. I asked why do you need is_available and 
not add target right away?

Then if this target parameter will be needed for all machines why can't 
you add that to all DEFINE_MACHINE macros as a required parameter and set 
it for all machines passing it through to DEFINE_MACHINE_EXTENDED which 
sets in the TypeInfo. That way no machines need changing other than adding 
the target parameter to the existing DEFINE_MACHINE calls.

What am I missing?

Regards,
BALATON Zoltan
--3866299591-608982516-1793631358=:93499--

