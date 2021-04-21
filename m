Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFF3C433ED
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 12:04:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA5161417
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 12:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA5161417
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114453.218111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZBaD-0002Yf-2Q; Wed, 21 Apr 2021 12:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114453.218111; Wed, 21 Apr 2021 12:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZBaC-0002YY-Vh; Wed, 21 Apr 2021 12:03:52 +0000
Received: by outflank-mailman (input) for mailman id 114453;
 Wed, 21 Apr 2021 12:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZBaC-0002YT-5B
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 12:03:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74c0e3c3-468a-43b5-a6eb-6160847ebb9b;
 Wed, 21 Apr 2021 12:03:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA633AF0F;
 Wed, 21 Apr 2021 12:03:49 +0000 (UTC)
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
X-Inumbo-ID: 74c0e3c3-468a-43b5-a6eb-6160847ebb9b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619006629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7VPaZAkX0xbKJguofbrybdI328o6L1UwnpsCxw1JWs=;
	b=NTYq+BjO6j+m8JoHzMlJ8LQb9VG5BBFFHydcnwKNyJsICHRuNzMJRQsGS9WAloyaktEzkq
	z1t3paxcajFTBPT3eR18+JwXTPBeuDqHEHnsLPyFhkawyWqhBHzGWfpoTOf6nxnLuuxXKN
	hutgK3P0iiOau8+6rIRMrIWUsFfKfmQ=
Subject: Re: [PATCH 6/8] x86/EFI: avoid use of GNU ld's
 --disable-reloc-section when possible
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
 <YH/8rb0aENMqOLAn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dada98e8-3e4a-94df-0678-bdd2a0e8de04@suse.com>
Date: Wed, 21 Apr 2021 14:03:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH/8rb0aENMqOLAn@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 12:21, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:46:44AM +0200, Jan Beulich wrote:
>> @@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
>>  endif
>>  
>>  $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
>> +ifeq ($(MKRELOC),:)
>> +$(TARGET).efi: ALT_BASE :=
>> +else
>>  $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
> 
> Could you maybe check whether $(relocs-dummy) is set as the condition
> here and use it here instead of efi/relocs-dummy.o?

I can use it in the ifeq() if you think that's neater (the current way
is minimally shorter), but using it in the ALT_BASE assignment would
make this differ more from the VIRT_BASE one, which I'd like to avoid.

>> @@ -210,16 +233,16 @@ note_file_option ?= $(note_file)
>>  ifeq ($(XEN_BUILD_PE),y)
>>  $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
> 
> Do you need to also replace the target prerequisite to use $(relocs-dummy)?

No - without the dependency the file might not be generated (if this ends
up being the only real dependency on $(BASEDIR)/arch/x86/efi/built_in.o).
We can't rely on $(note_file) resolving to efi/buildid.o, and hence
recursing into $(BASEDIR)/arch/x86/efi/ may not otherwise get triggered.
Yet to calculate VIRT_BASE we need efi/relocs-dummy.o.

>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -86,10 +86,12 @@ static void __init efi_arch_relocate_ima
>>                  }
>>                  break;
>>              case PE_BASE_RELOC_DIR64:
>> -                if ( in_page_tables(addr) )
>> -                    blexit(L"Unexpected relocation type");
>>                  if ( delta )
>> +                {
>>                      *(u64 *)addr += delta;
>> +                    if ( in_page_tables(addr) )
>> +                        *(u64 *)addr += xen_phys_start;
> 
> Doesn't the in_page_tables check and modification also apply when
> delta == 0?

No, it would be wrong to do so: efi_arch_load_addr_check() sets
xen_phys_start, and subsequently (to still be able to produce human
visible output) we invoke efi_arch_relocate_image() with an argument
of 0. Later we'll invoke efi_arch_relocate_image() a 2nd time (when
having exited boot services already, and hence when we can't produce
output via EFI anymore, and we can't produce output yet via Xen's
normal mechanisms), with a non-zero argument. Thus we'd add in
xen_phys_start twice.

> Maybe you could just break on !delta to reduce indentation if none of
> this applies then?

Could be done, sure, and if you think this makes sufficiently much
of a difference I can add a patch. The purpose here though it to
have this and the preceding case block look as similar as possible,
yet also not re-format that earlier one (which would be an unrelated
change).

Jan

