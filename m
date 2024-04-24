Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9FC4345F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2024 13:31:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.711464.1111449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzci2-0003kB-75; Wed, 24 Apr 2024 13:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711464.1111449; Wed, 24 Apr 2024 13:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzci2-0003k4-4G; Wed, 24 Apr 2024 13:30:50 +0000
Received: by outflank-mailman (input) for mailman id 711464;
 Wed, 24 Apr 2024 13:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcL4=L5=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1rzci1-0003jy-Jz
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 13:30:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc4b2f66-023e-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 15:30:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0C2DF4EE0739;
 Wed, 24 Apr 2024 15:30:48 +0200 (CEST)
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
X-Inumbo-ID: dc4b2f66-023e-11ef-909a-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 24 Apr 2024 15:30:48 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/2] pci: add suffix 'U' to PCI_CONF_ADDRESS macro.
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <86c746d0-b369-4bbb-9510-c18023ff61ab@suse.com>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
 <10dc3a59085c801c91551625c036fcc9e5eb4729.1713956723.git.alessandro.zucchelli@bugseng.com>
 <86c746d0-b369-4bbb-9510-c18023ff61ab@suse.com>
Message-ID: <56c785a1e44ba3bba0112624c5b043fd@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-04-24 14:47, Jan Beulich wrote:
> On 24.04.2024 14:11, Alessandro Zucchelli wrote:
>> This addresses violations of MISRA C:2012 Rule 7.2 which states as
>> following: A “u” or “U” suffix shall be applied to all integer 
>> constants
>> that are represented in an unsigned type.
>> 
>> No functional change.
>> 
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
>> --- a/xen/arch/x86/x86_64/pci.c
>> +++ b/xen/arch/x86/x86_64/pci.c
>> @@ -9,7 +9,7 @@
>>  #include <asm/io.h>
>> 
>>  #define PCI_CONF_ADDRESS(sbdf, reg) \
>> -    (0x80000000 | ((sbdf).bdf << 8) | ((reg) & ~3))
>> +    (0x80000000U | ((sbdf).bdf << 8) | ((reg) & ~3))
>> 
>>  uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
>>  {
> 
> This is x86'es PCI, so the subject prefix may ant to be "x86/pci:".

Noted, thanks.

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

