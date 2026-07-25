Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46983C531C9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 03:03:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370398.1618558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnSfc-0006eY-7P; Sat, 25 Jul 2026 03:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370398.1618558; Sat, 25 Jul 2026 03:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnSfc-0006eQ-2d; Sat, 25 Jul 2026 03:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1370398;
 Sat, 25 Jul 2026 03:03:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@netscape.net>) id 1wnSfa-0006eK-QS
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 03:03:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnSfZ-006G09-NS
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 05:03:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@netscape.net>)
 id 6a64273f-e002-0a2a0a5209dd-0a2a450c928e-28
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 05:03:20 +0200
Received: from [66.163.187.33] (helo=sonic308-10.consmr.mail.ne1.yahoo.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@netscape.net>)
 id 6a642777-f479-0a2a450c0019-42a3bb21a7a4-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 05:03:20 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sat, 25 Jul 2026 03:03:18 +0000
Received: by hermes--production-bf1-5f4bf6454b-wcw6j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 4e5e4e0dcc38a11ff96bce412d6dab85; 
 Sat, 25 Jul 2026 03:03:16 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=netscape.net header.i="@netscape.net" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1784948598; bh=Ouw76QmjyPBJFd+iVa9RbaQYPERVtquxiR67WHZRkeo=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=VLcq/PMWOq4ELyN6imjvEyPZmsAfEFgWkbbOcdlgiNJMNggdJKE5GHCpfwny5Uvx6ElmPSWNHP03a+IpjOnJ1XvdMqQ5uEJkcDT334Osbv2b6Ya33ECvJo5JgvtRJuYjlcxUqePTHBMsgBKz+oOdMLlvIAOTeDTI+7byfH30sT+k07dZr85B10K9QG0Z1GuVpqY0IEhONhOZ/wjkC8haoILZA4P9ZBapl+WLSmmJKopnbb/oQiHW/1LaK7pRkdWaVFA1KRYFY7108Tu5OScWOJNNdRr79153qfvmFYu9BzqHOlnq4VfmKPz0K+rnRRxSXvIsxWE4yXKs9YubsL/P4A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1784948598; bh=RgsBK90pn3tW4sL82HOA4Vj+mfxl/RvdPOxp+dA6I5e=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=t3MVInOyFrnD72k5ymFX6Tc1Yz9oI2YiCpO8AJaMnF3FtQpSxLyYA29qNVMO8PnRuKbQKp0owGFWwrgr8o50b9VdCdzYxaaYrlMVOGd7GHaPmSY6C/HghcX7YBNLoW2lAu/a39Y4Y9/b8MDwPaXIz9YgtENCn61nzDclE06GLV4pRGDKHElVyxT1+wHRUd6qgQl0XBNcuC3wGgWTlFgyQiFjsnZnw1xsDb/fMxCbb+2iEhfHdXc82ROpkK3nv1nASiF+zo9xBmsr4nRIf2mBRCoFXEs2l9yCCoEu34+xLSmv1a4GvFq0vPMvMxYmH8HjPciiMiq56fH6qSXE2PBavA==
X-YMail-OSG: ecir42gVM1khb9Ixoi3FCk8gKDu1Lc2WeiaF9Pso6oovrCfJZdYd5fTC9CI_Ky4
 Avt43_ZMlzhASHtbtkrViyW1_a7Shf1G_yisBClRxH08RjsKJIjk5i3bKBpeX2laaUCVDZtm.sGl
 r2dxbQ2Y05WgexCe6o6sD_ZlFte7d5Uip8V3djNSUJL5BbChppbBQjaFY4UKYj_jmENg.3Yt05Jo
 7UOrm.bbk.maF0B.cDJLSnN1pK3jH4b2k5jMQgGU8TEXvMbrHNf6qJJSWeJwAZ9S0emXGWxnrFWJ
 Wlp8wypVlgYToqZr4bKZd4jgvvUpbM83ga9BmhyduKouziwgih8458Efn.4nZBMI2mtxnt9dIQuY
 NyjCsu8UuVx9I5_a_x1dOGHbMQFTqJjqUyiyeu0wAa2fKBVGIHiOUKsYB00uxyx1nzTjG0MWS0zJ
 omIKJAgMDpss8UNR9eOuzcIm.3jmJ6Mmq7RxkHtMjrgIrFiiJVsqEDqhuPF.iz.PGPsEXSj1WWpX
 iSCyDBdZi_aURrI8OCQJmU7iK6AIKk305EjiLnIuJ2HNu3F.dfT3BK4ArKKmvZa.t3afZYI2FHHr
 Zu5yyoyhBJ8utknhIMwcocLlW7Wp2mJTYXeG.CNSNYBtojez_SAuVSEs0NE8OCNCVo64.G8zFDf6
 WWbY53xcdWpo.XAxcCRXNDRZ5xPmtDosfwsUkhOPYZ3fWLfll9PQVCX_Cigpcz.kMhwKuoF2jLts
 reJN07O2zOu7Pbv0VmdYVJMVwJkkoJgdWzC_l_D29Nz7_uaSZX3ETMo0vhNhkFAbPYOHVaHCmTn8
 4OI_LdMIjHR_fvLy0FQFeU0DGPZF_TqfP1fu_zvCzEetibuO5YzxLqHhojt3oPfg12wGhojIkiUN
 5N9xgA9NB_WwEYrwIj5phbLsbA_0vJyXH_UjKO7JbIJGVApjTe.X1PqMwQpYRSovI5zR8LLAhd.V
 ciFPGG2YopStcJxxVRfKXCjt_SOWrk7Us80FnYANziMBzxqBwLKFjQXYjQFqYTsAx8p1HkewrQdh
 fcXiSGNN_wxwQQOBv2Pw7p4qZ1Xhnr0FuWyLVEnZoT5OkF31ug463hxhOlJVI4rA4gmM_IAKn6IQ
 QnVIn.93pg5db8geaJa.UZXOQMSV15MOGXndCMPAPA51cNG7huFUEZN6TdEY3q4NXwviCrqMdFAs
 3fcsEEK6nKR19MM2E6cMGgR9QZQqCorBCCc72mz7rLitKGPLOPnyXWR1P36nlt7BG6TawlTAcn0m
 dY8HLaX5IHBDXgZwk9yDdUogvSkJUxEaTX8JPn.sXUAONwacaK0rxbCe6JOlGc6NR0jbLPeh8eZl
 01NYdUWkxNBzX7CaUIwFmD7Hee9m99aDhmqlobQSzxThkR2aSpfRunEdRqQ_J1O8_GlhzyBsPS6H
 87sWkjvN_TZP7nqFan_fxv_ahaKem.EqRBxiQUJS2.RvIPu8bOVkntA02jtbHjsbLmkI7xxfFntJ
 n39SHqOAFVcbG97JhMQ19syrvrLqDHZAQr46AtIr1MfQCaE1VKcXjN4WerWxQsjGCTEIt2tqm7Sb
 nhda7wXW6naZjqyJ81l_Vz6FhfNokGZsFvw5x.9zs0JTrjSsRwMYrGSjRY40vEWVky7sw6RkU.Qy
 J4I3dnNWMYABO47bBSvIsibPRWukc82gAdE.T.Y0YcNEjgMXSc7giDBvy7dZNjUBVSclNnAYwSpV
 4E9XlhTQopCdEtgbdFw0PnT8dNJR5xs3Ht1MCMTXMp3AHNID4dUsjE3Yy.mebG5d.XhcsbpXpojc
 Efl6cPZDbJf_rIY5YxNYdowLvglXBOrYbl27byQwd52KeA_OI036aAEB7_F6_ucBgGEJAB.cMwxE
 7rrQgQQzNzQQ6HUZfXmVPu.Z5EKovzI2jaWKIw5NkrskQ3p2SyANjYrBo9X7EraCbqf4oVklLdQ9
 vGH2mhdLTTjAy.dJALGqYtNpmnpjk_k0S51FHf5tBrjH5yekWaMyICwDvOTOjOf85kwM3xCLo4r8
 jlhVNtVUn9bBwGD5FiAu2pYWp30PCoMRE_6dIDHOssmf2HU2FylwkoFBxjzAuGwl0CTsVgsd1IJJ
 NRIEoHowQl4w3Rr3bUkgbSqE84qybw47OkcOGQb6jwzoyS897U7MWnl5m.M_LGJtNa1h8M_DE5g_
 2r7oU5U9k0rvuwFV37jf.a.s9p4EOtLnEhLGE6HIZUx4ZTVJkY4coYgUpuck0NM8cMwLRr3p0Oh9
 0YJi5UueCcqlAfufbN6PK2aWMx1P0ScTYdgvCJb4QbLt77RqEgbQ-
X-Sonic-MF: <brchuckz@netscape.net>
X-Sonic-ID: 1d99e148-c8c1-474b-84cc-b33a437e77f3
Message-ID: <a1608e19-6392-44d0-904d-88acd11eeb09@netscape.net>
Date: Fri, 24 Jul 2026 23:03:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/igd: get PCH info from host sysfs
To: Tomita Moeko <tomitamoeko@gmail.com>, Chuck Zmudzinski
 <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20260709183517.25866-1-brchuckz@aol.com>
 <20260709183517.25866-2-brchuckz@aol.com>
 <5cb8d286-f013-4400-aef4-baddaa775995@gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <5cb8d286-f013-4400-aef4-baddaa775995@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26215 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-purgate-ID: tlsNG-d25034/1784948600-77ED2A5B-7DFCAFAB/0/0
X-purgate-type: clean
X-purgate-size: 7243

On 7/23/2026 9:09 AM, Tomita Moeko wrote:
> Sorry I am not the maintainer/reviewer of Xen IGD passthrough, just out
> of my personal interest

I appreciate your review. Thanks!

> 
> On 2026-07-10 02:35, Chuck Zmudzinski wrote:
>> The igd_combo_id_infos[] data is more than 10 years
>> out of date with many Intel IGD devices missing from
>> igd_combo_id_infos[]. This means that many devices
>> that could be supported will not work with the
>> current implementation.
>> 
>> For newer devices not listed in igd_combo_id_infos[],
>> get infos from the host sysfs to enable support for the
>> newer devices not listed in igd_combo_id_infos[].
>> 
>> Introduce the helper function xen_pt_get_host_pch_info
>> to facilitate getting the necessary information from
>> sysfs.
>> 
>> Also, use errp in xen_igd_passthrough_isa_bridge_create
>> to set errors from xen_pt_get_host_pch_info.
>> 
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> ---
>> Changes in v2:
>>   - call error_setg* after closing files instead of before closing
>>     files
>>   - in last line of commit message change "to propagate errors" to
>>     "to set errors"
>>   - add stable to Cc list
>> 
>> Changes in v3:
>>   - whitespace fix at line 380 of xen_pt_graphics.c
>>   - fix Cc address for qemu-stable
>> 
>>  hw/xen/xen_pt.c          |  2 +-
>>  hw/xen/xen_pt_graphics.c | 82 ++++++++++++++++++++++++++++++++++++++--
>>  include/hw/xen/xen_igd.h |  3 +-
>>  3 files changed, 82 insertions(+), 5 deletions(-)
>> 
>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>> index 0fe9c0a..474606e 100644
>> --- a/hw/xen/xen_pt.c
>> +++ b/hw/xen/xen_pt.c
>> @@ -867,7 +867,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>>          }
>>  
>>          /* Register ISA bridge for passthrough GFX. */
>> -        xen_igd_passthrough_isa_bridge_create(s, &s->real_device);
>> +        xen_igd_passthrough_isa_bridge_create(s, &s->real_device, errp);
> 
> The `errp` need to be handled here if any error occurs.
> 
>>      }
>>  
>>      /* Handle real device's MMIO/PIO BARs */
>> diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
>> index 7df9344..2ef941e 100644
>> --- a/hw/xen/xen_pt_graphics.c
>> +++ b/hw/xen/xen_pt_graphics.c
>> @@ -376,8 +376,75 @@ static void pt_graphics_register_types(void)
>>  }
>>  type_init(pt_graphics_register_types)
>>  
>> +static void xen_pt_get_host_pch_info(PCIDevice *dev, uint16_t *pch_dev_id,
>> +                                     uint8_t *pch_rev_id, Error **errp)
>> +{
>> +    FILE *fp1, *fp2;
>> +    char *endptr;
>> +    char device_id[7], rev[5];
>> +    size_t len;
>> +    const char *device = "/sys/bus/pci/devices/0000:00:1f.0/device";
>> +    const char *revision = "/sys/bus/pci/devices/0000:00:1f.0/revision";
>> +    unsigned long val;
>> +
>> +    fp1 = fopen(device, "r");
>> +    if (fp1 == NULL) {
>> +        error_setg_errno(errp, errno, "Cannot open %s", device);
>> +        return;
>> +    }
>> +    fp2 = fopen(revision, "r");
>> +    if (fp2 == NULL) {
>> +        fclose(fp1);
>> +        error_setg_errno(errp, errno, "Cannot open %s", revision);
>> +        return;
>> +    }
>> +
>> +    len = fread(device_id, 1, 7, fp1);
>> +    if (!len) {
>> +        fclose(fp1);
>> +        fclose(fp2);
>> +        error_setg(errp, "Cannot read %s", device);
>> +        return;
>> +    }
>> +    len = fread(rev, 1, 5, fp2);
>> +    if (!len) {
>> +        fclose(fp1);
>> +        fclose(fp2);
>> +        error_setg(errp, "Cannot read %s", revision);
>> +        return;
>> +    }
>> +    fclose(fp1);
>> +    fclose(fp2);
>> +
>> +    val = strtoul(device_id, &endptr, 16);
>> +    if (val > 0xffff) {
>> +        error_setg(errp, "PCH device id is out of range: 0x%lx", val);
>> +        return;
>> +    }
>> +    if ((endptr > device_id) && (errno != ERANGE) &&
>> +        (errno != EINVAL)) {
>> +        *pch_dev_id = (uint16_t)val;
>> +    } else {
>> +        error_setg_errno(errp, errno, "device id strtoul "
>> +                                      "conversion failed");
>> +        return;
>> +    }
>> +    val = strtoul(rev, &endptr, 16);
>> +    if (val > 0xff) {
>> +        error_setg(errp, "PCH revision is out of range: 0x%lx", val);
>> +        return;
>> +    }
>> +    if ((endptr > rev) && (errno != ERANGE) && (errno != EINVAL)) {
>> +        *pch_rev_id = (uint8_t)val;
>> +    } else {
>> +        error_setg_errno(errp, errno, "revision strtoul "
>> +                                      "conversion failed");
>> +    }
>> +}
>> +
> 
> It would be better to reuse existing xen_host_pci_device_get() to read host
> LPC bridge ids instead of parsing it on our own here.

Ah yes, I see how that can be done and I agree that would be better. I will
re-write xen_pt_get_host_pch_info() using the functions declared in
xen-host-pci-device.h for the next version of this patch.

> 
>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>> -                                           XenHostPCIDevice *dev)
>> +                                           XenHostPCIDevice *dev,
>> +                                           Error **errp)
>>  {
>>      PCIBus *bus = pci_get_bus(&s->dev);
>>      struct PCIDevice *bridge_dev;
>> @@ -394,7 +461,16 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>>          }
>>      }
>>  
>> -    if (pch_dev_id == 0xffff) {
>> +    /* Newer devices get PCH infos from host sysfs */
>> +    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
>> +        xen_pt_get_host_pch_info(&s->dev, &pch_dev_id, &pch_rev_id, errp);
>> +    }
>> +
>> +    XEN_PT_LOG(&s->dev, "PCH device id: 0x%x\n", pch_dev_id);
>> +    XEN_PT_LOG(&s->dev, "PCH revision: 0x%x\n", pch_rev_id);
>> +
>> +    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
>> +        error_setg(errp, "failed to get PCH device id or revision");
>>          return;
>>      }
>>  
>> @@ -406,7 +482,7 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>>       * Note that vendor id is always PCI_VENDOR_ID_INTEL.
>>       */
>>      if (!bridge_dev) {
>> -        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
>> +        error_setg(errp, "set igd-passthrough-isa-bridge failed!");
>>          return;
>>      }
>>      pci_config_set_device_id(bridge_dev->config, pch_dev_id);
>> diff --git a/include/hw/xen/xen_igd.h b/include/hw/xen/xen_igd.h
>> index 7ffca06..da51f09 100644
>> --- a/include/hw/xen/xen_igd.h
>> +++ b/include/hw/xen/xen_igd.h
>> @@ -22,7 +22,8 @@ uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>>  void xen_igd_reserve_slot(PCIBus *pci_bus);
>>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>> -                                           XenHostPCIDevice *dev);
>> +                                           XenHostPCIDevice *dev,
>> +                                           Error **errp);
>>  
>>  static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
>>  {
> 


