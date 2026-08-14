Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506CFC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 17:08:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391359.1631224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvNo-0006rU-Dg; Fri, 14 Aug 2026 17:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391359.1631224; Fri, 14 Aug 2026 17:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvNo-0006rN-A4; Fri, 14 Aug 2026 17:07:52 +0000
Received: by outflank-mailman (input) for mailman id 1391359;
 Fri, 14 Aug 2026 17:07:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1wuvNm-0006rH-S8
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 17:07:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuvNm-00GhUV-8s
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 19:07:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a7f4b37-8faa-0a2a0a5109dd-0a2a4503aae4-36
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 19:07:49 +0200
Received: from [98.137.64.205] (helo=sonic303-24.consmr.mail.gq1.yahoo.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a7f4b63-fae8-0a2a45030019-628940cdad36-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 19:07:49 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Fri, 14 Aug 2026 17:07:47 +0000
Received: by hermes--production-ne1-6dbcb84f44-2jkrk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fcaea302a7739d9747edaf46b5414c24; 
 Fri, 14 Aug 2026 17:07:45 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="Date:Subject:From:To:Cc:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1786727267; bh=UY+I4UqGSnIpDiJN8AUplsskjws3Y+OSbvdRYW7JPno=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=BfbomtQlNSINKeR60rhpLziDP1DxAHD6ngEt/Gff5VH97iO3hTsCGgI2KJ+ym1uc/yWmbySncIwRADbSiZpqr9FfN7YW5fajUCuiD9vMtcLe8LxE4f9GGYwiZ+eoLjSXT5xu34ZItjgnaAEI8+5FDpBpJ85RBWy5bzB34UaDR0iyWCxMtS8RKgsifJmCp6e7OrPBwavlfUGJWUdpeXkFqbjCF5jEM1hr7Z5+JIq+bsSr28zVw3laKd+K5e41eSjvdOTzoCqItrGVcD8n62QgtVdRyrcIMJUWbWoR4cR3V2ZmEjg1vBP0cDTirTek5p7FA7lGajzZsgTuAooYfklh4Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786727267; bh=c39lbYaGJJoIE/qhea/ao2CxkL7OjjLdrbSLzWVUHJs=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=hNDy+a5sYYtLgboIHCp1Qcq0ohES12nsJh4n1yTM3tHBpXw5USle3m/qVodP0aXpDC5ZhPDQ9tqTHvkw0l0IX88pcx681PXPXsZuQ4Y9ZhnXxAClvbnx5NHmAN3QnwLv9tDBkEiyjuyjXAai9sG10OK9+jw+GWqmLQU/cISHzFB2JxFCKkyOaKBIfuAhq3oRt7k2OKDD7I/5G6zQTADCR8n25vztQgy2qDrSVXM9YisNXzNOCV+I+FH1tB6K9GbkPusFBb4Sf2vyR4SwXeykjxv/xruKhqKP3JTqyAW7s1RyOhXG+pgDvChG5Sqn1A+hoXIB1xZuayl4gQ9D8JqCBQ==
X-YMail-OSG: 8a2iFRQVM1lC0evxH.V2EkutHKBoXV3brFfmIDV7qQdtN5HbXc6Qi7Ov7kQiIiR
 UsbvpIRtPBz.uUgwf4Redp6xLr_DgmrIGmbMMVgQ13W2s96wLlNJJFjGQ.uSd9ZdPbN86l1CU7Db
 VdWLVICOwP5kb5ZYjG3O5MKeQIxRfQgkOpFIcSSunNieNGteF8V01DdHQDNougx7nIy8SqmcFwO5
 NlFRVaelWgP5f42Lgdmjl.VOgPzhgaPLp0R.9OnGD_c4P7ZBufVdk55JRJTkGWlGt_.t3KexRy1k
 z1IysH8oBWtI4m4asf7u914_PHoMbZyfdLbsQj9ET9uP605LdHxt5fEduNlDFUIPYQZfSkGuk6kk
 7lMjbJkaZ8qKflcdGE4aKmdEPOdoVDiIhoRKmy36BstJMS9M299Kw86glkEsbyQ7YjXRhRQRIxVR
 jPQ9oewICB5Kb07gNwtVweKv5_ahSw7DmwCEJaYgc2T94.awdXZTthhgWCqG4RwR0QQ.DsQp1mAZ
 Vlsf3DoEOEShsAyFkkhv3ifHNGaTsVSFHbH0Z19C4jri0DDBQO_EnJfhQFHxreLbXwm6Z7SoviI5
 q2mf0bmPDXi2cO3wjZOwd7rV2ZNr.Pzo4UuCox6VwpmrjYp34AKrPf2ExyBm7ZRm2on.LRZuPvLM
 VoY.KNZUjh5JpJyNXeQ1s85qAXY__TsGMidIvz8jYS9MsG.VuMga8NriuiklZxP9PB.VlXQ_MN_f
 Kvh2OPfH_qajbrzCNi2KBogpZFzrrm7re8QoULFNKD3E.Uu_noPWJX37h.GQUMLbgJXGhohucRqq
 nzNcX.4Z8EXgsUYuEqy8h1Isw3_8ribF6PSlWeLjyFr9GfjN7TKx0WxuU6P_PkJtq1_Fi2TcpEuo
 E7yvcHinxQBmLodID5mYvl39j8RgZtvgccIBSbxfXcbVZxuS_r6_s3dS_XtGWoEk7Hn040_CY3a4
 360F5JBdawUqL1UCSZ0aJA_TyRsgDFok89DcAoURetVx_5HJNIKkABN8.nRS7ZrpcwLSQPiAwIRn
 QNMzlBCCaOgW82MrbSdcHuBjD3.zHmieY6BaxugMIvT1eCsO74ysr6ed7FqAIhJ7pNDtxWItfcD5
 09w_tNV3jeWkAW5QxlMA7XG2BNnuDUR2kYQF6BUX0OMy8qRVZYvOb8vAQBaMCl_r4_OJwtFd9s7p
 wSQjAdzVC418z5.PzeP41UFtpmqsK6vRx7NFrzeZe2SrMVdgFp0IvgZh.fk5OeC7sfVomPJYnNVB
 XE4md11OY18SC2MhBieestlKn4rcAvPrFx9H7xPo_sDGFc5ksN.Nd.qRJ2cyWZeyrzsUuP.DJsRr
 dFpsTAZBUqgddIYi34rAgv__xpWN3mSnskebwdrETpwp9tD6SdyaCtrskRya.WrLxgpn4vgTCsPD
 IHAxbIXxzbhpApmKckdzgdLCNf3U6s2x55vd5_ddJyfoNegK4QhbeHiaLgjzhk18W03YtQDlnK0y
 cPBPMr3CEWGzLPppHvmVKWNAoGSWq4nNMSxPRJ.AY.WxpNW.RSZrwxAPrGtEzzqgN1RueR5Pg8Yd
 R8Ud0xWuwODjgZ9U6dMklXbH7hjUC_A..C0AkRMvNA8uhKsGJV55EyoNCLS5FjpC9GG19YqR2bWv
 M417BEaATPsT6XItbTpUVStn2o3.QPP3uMVLeQtAQTqZesWGQb5RxlRGITLtfHvJKe8Y1EgAAYpI
 qW9XrydEZH5U_YlNb6oLYFEDJrJgK8qvn8yXRIk40ipnFIH8mNGFL48keEnThRQarLaVRbZF9MkK
 QfYTckSiOWTsGWZH22reXk4xSHXDjaqqq4qs0_pcBhi2pVANhjNG3eGtIDo6FzKlX3203_YU3FeV
 jtb3RQhnBo9AKAAlp_kM23E.8oWCTg9wtRQaCBSN0HN6px0bCiuZo7dVcqKxYEQyNnPAg3fBCIKW
 ZJAiezeOYfKEnHTzJ0LZkKHW0AN37W58agpBFURz0LbXPpKkyXFLFeDeVfSdTDy.bKhBY_IogS6n
 ULp0UdbxYGlag.G8SoL2a4gPaINd9Sl3T3pDAltOIMTc3H8b7qVWSgiJ10LiXzY6ndtJIiMuy5DA
 PFKFLOYqZKmGRo3XNpKasHL8_OxvieKcmp0u3AvAf91oqY6jTRnLamgtIp3V8o9GSWxOy4ihsQaH
 75.JyPrD750BqFWotqESvwmz74Q329v0M6cjtGmgnfoDyC86zZNDi_IJTNUXTnmEsYiA0aoObW0e
 lrAGln2VeJhM8LWnsh4IJJoHaVcycgPJOSasV3fixQu7_ibQ-
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 18dd4469-32e4-4583-9cc9-9f8238f17af1
Message-ID: <416caa9d-b658-4ba8-a401-babf477c0afe@aol.com>
Date: Fri, 14 Aug 2026 13:07:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/hvmloader: implement Intel IGD extended VBT
 support
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: qemu-devel@nongnu.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tomita Moeko <tomitamoeko@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260802050824.10554-1-brchuckz.ref@aol.com>
 <20260802050824.10554-1-brchuckz@aol.com>
 <2110d4b7-ae37-47aa-99be-ab59e16f6167@suse.com>
 <67579eba-e222-41dd-84bf-8440d2eaf2a9@netscape.net>
 <da2200cd-def7-4cce-a6c2-9f9ac9e202ce@suse.com>
 <de56c8bd-f0e8-4fe9-8cf5-f6807698176c@aol.com>
 <02a7dc18-4184-4e86-84cb-121769187f71@suse.com>
 <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
Content-Language: en-US
In-Reply-To: <1858e8e6-73fa-4017-93e2-c733fbf0ec8d@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26254 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-purgate-ID: tlsNG-33051d/1786727269-778C54E9-EE706EEB/0/0
X-purgate-type: clean
X-purgate-size: 3395

On 8/14/2026 11:23 AM, Chuck Zmudzinski wrote:
> On 8/14/2026 9:46 AM, Jan Beulich wrote:
>> On 14.08.2026 15:18, Chuck Zmudzinski wrote:
>>> On 8/14/2026 3:35 AM, Jan Beulich wrote:
>>>> On 14.08.2026 02:45, Chuck Zmudzinski wrote:
>>>>> On 8/13/2026 6:35 AM, Jan Beulich wrote:
>>>>>> On 02.08.2026 07:08, Chuck Zmudzinski wrote:
>>>>>>> -- snip --
>> 
>>>>>>> +    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>>>>>>> +               (igd_opregion_pgbase << PAGE_SHIFT) |
>>>>>>> +                IGD_OPREGION2_SUPPORT_MASK);
>>>>>>
>>>>>> This looks to imply qemu is the only possible device model.
>>>>>
>>>>> Yeah, this is an issue. Other device models that intend to support
>>>>> the Intel IGD with hvmloader will also have to be compatible with this.
>>>>> It would be easier if we did not have to worry about backward
>>>>> compatibility and supporting what we had in the codebase for many years
>>>>> in both hvmloader and Qemu and we would not need IGD_OPREGION2_SUPPORT_MASK
>>>>> in that case. Instead, we would just completely deprecate all previous
>>>>> implementations of the Intel IGD passthrough feature in both hvmloader and
>>>>> the Qemu DM as unsupported. So my previous comments about backward
>>>>> compatibility apply here again.
>>>>
>>>> As said, I don't think backward compatibility can be dropped. My comment
>>>> also didn't really mean to hint in that direction. Instead I was wondering
>>>> in how far, even if perhaps by only a few #define-s, the necessary
>>>> interfacing couldn't be put down in a public header, for any DM to consume.
>>> 
>>> Ok. Perhaps the IGD_* defines could be moved to a public header to define the
>>> interface to be used to support the Intel IGD. Would it be OK to move those
>>> to a separate igd.h header
>> 
>> This may require input by others, as in the given situation I'm not quite
>> sure what is best. Anthony - do you possibly have any suggestion here?
>> 
>>> and include it in hvmloader/config.h?
>> 
>> I don't see why that would be needed. The few files which need the #define-s
>> can include that new public header, without impacting anything else.
> 
> So I would just include it in the new intel-opregion.c file. Also, maybe igd-related
> declarations should be moved there too, such as the currently existing extern variable
> igd_opregion_pgbase and my newly proposed extern variable igd_opregion_e820_pages,
> which would mean the new header would also need to be included in hvmloader/e820.c.

Actually, those igd-related declarations do not need to be in a public header. But I
think if we go to a public header for any DM to consume, we need to fixup oddities
like the current definition of IGD_OPREGION_PAGES of 3 when the actual number of pages
in the OpRegion is exactly 2. So I propose the next version of this patch should
add a preliminary patch to cleanup the oddities in the current implementation such as
having IGD_OPREGION_PAGES set to 3 without introducing any functional change by
redefining IGD_OPREGION_PAGES to the value it should be, which is 2. Then we can
include IGD_OPREGION2_SUPPORT_MASK, IGD_OPREGION_PAGES, etc. as defines in a public
header for any DM to consume. I can probably build such a public header directly from
IGD-related header files in use in the Linux kernel or in the Qemu/vfio IGD-related
headers files.

Chuck

