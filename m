Return-Path: <SRS0=QJhb=DU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D3DC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 13:24:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAC6F22EBF
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 13:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UzpitQvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAC6F22EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6201.16441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKHU-000313-6V; Tue, 13 Oct 2020 13:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6201.16441; Tue, 13 Oct 2020 13:23:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKHU-00030w-3Y; Tue, 13 Oct 2020 13:23:56 +0000
Received: by outflank-mailman (input) for mailman id 6201;
 Tue, 13 Oct 2020 13:23:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSKHS-00030D-QX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:23:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47b15ca5-07f6-43fa-bfb0-56a31d25d1a3;
 Tue, 13 Oct 2020 13:23:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSKHS-00030D-QX
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:23:54 +0000
X-Inumbo-ID: 47b15ca5-07f6-43fa-bfb0-56a31d25d1a3
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 47b15ca5-07f6-43fa-bfb0-56a31d25d1a3;
	Tue, 13 Oct 2020 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602595433;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=s6/6G/AA6r3e0Zt1cJD/3dGEjMPEVC+PIlv5DgBo0+M=;
  b=UzpitQvfbPpvEit/theUJaCcd+LpqMlE+UNTqDawrRFiAOEWRQylw9fl
   6JTkIpL0RPCtxftSn0TQVYRrCLomik2bIZRTpIys9zbmQWkV/kMkDVi7N
   lLvTEUxxNW5LUScGPpBkG78bwjEMcHniHXezP0qzutvuRROtUskm33sNo
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jC/qmyHPone5mVmQQqJ+10YW1rwPkw1gEnihkO3poVVITmE6vBpAT43fcH/Ro7CwbCNNIV20jp
 i/LiBfoJP6uvNr2rVpRcjkoQoN84EJhl/Yf5m7NaTamHFC//2v0ZwCgn7Jy+6+gpQSJfEGA2sb
 nnkUi/Uw2OK5ehyiKaGqvrLM+CY9dY15o5Nu/XpY+VI6GDniq9wu62yNx4t89Pc/BlXPxCQVqI
 5aFctrHhv3R51S+cRSuNGf+mJuBNgsEacbzC27NWJwLSJ9HIRmMDcpE9xagXp73aUn+Jm8yJsT
 GZ8=
X-SBRS: 2.5
X-MesageID: 28888871
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="28888871"
Subject: Re: [PATCH] x86/smpboot: Unconditionally call
 memguard_unguard_stack() in cpu_smpboot_free()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201005122325.17395-1-andrew.cooper3@citrix.com>
 <36d3443d-50dd-5163-ddac-973421f390e0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d5c19b39-0413-d61d-3e1f-c35dd19b4287@citrix.com>
Date: Tue, 13 Oct 2020 14:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <36d3443d-50dd-5163-ddac-973421f390e0@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 13/10/2020 14:16, Jan Beulich wrote:
> On 05.10.2020 14:23, Andrew Cooper wrote:
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -971,16 +971,16 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>      if ( IS_ENABLED(CONFIG_PV32) )
>>          FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
>>  
>> +    if ( stack_base[cpu] )
>> +        memguard_unguard_stack(stack_base[cpu]);
>> +
>>      if ( remove )
>>      {
>>          FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>>          FREE_XENHEAP_PAGE(idt_tables[cpu]);
>>  
>>          if ( stack_base[cpu] )
>> -        {
>> -            memguard_unguard_stack(stack_base[cpu]);
>>              FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
>> -        }
>>      }
>>  }
> In my initial reply to Marek's report I did suggest putting the fix
> in the alloc path in order to keep the pages "guarded" while the CPU
> is parked

In which case you should have identified that bug explicitly.

Because I can't read your mind while fixing the other real bugs in your
suggestion.

~Andrew

