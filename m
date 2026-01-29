Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403FCD6B084
	for <xen-devel@archiver.kernel.org>; Thu, 29 Jan 2026 16:04:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1216799.1526727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUV6-0000OU-Uh; Thu, 29 Jan 2026 16:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216799.1526727; Thu, 29 Jan 2026 16:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUV6-0000ON-Rl; Thu, 29 Jan 2026 16:04:08 +0000
Received: by outflank-mailman (input) for mailman id 1216799;
 Thu, 29 Jan 2026 16:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ySsi=AC=bounce.vates.tech=bounce-md_30504962.697b84f3.v1-73d8d46b397548ecad44944e93a33563@srs-se1.protection.inumbo.net>)
 id 1vlUV5-0000OH-DL
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:04:07 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2233c147-fd2c-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 17:04:05 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4f23q737bnzB5vfgS
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 16:04:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 73d8d46b397548ecad44944e93a33563; Thu, 29 Jan 2026 16:04:03 +0000
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
X-Inumbo-ID: 2233c147-fd2c-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769702643; x=1769972643;
	bh=QHKAeUR7kH8mvgAor9G1mV+cUywA6KCBVPBkM7zRzXc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DT4UQEJoczy6lsxjau88DYXWnvsudZf8MxdKGwui+/CtLec3yTdiMhRzfv7wIjMZq
	 4o37kLRBZMiSFOxcXaTLyZ0/ca/ZBraoLuuLLlaMO9X7oiPEGDjCKmrICUOS8sjlzl
	 6Ya40lp84HkvoUI4jug67pbK4tApfufmnk0n6HlJ5OAC3ohhKjfZA5KeHRJzSJa3fJ
	 n21yxzNjRC0hUfXwFImeHqG29M23O41UgbKfTOyrTy6iSvvZUW+aecc5KOYqz7ZHYH
	 eoxaQUAxYQ8lBUBfmYwDweZK0Xpo1DRkOvj74joMfDjwO0lu3Rndbf/gstIVr6tb+H
	 XJ/Zcz4TPcWzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769702643; x=1769963143; i=teddy.astie@vates.tech;
	bh=QHKAeUR7kH8mvgAor9G1mV+cUywA6KCBVPBkM7zRzXc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HeEvlY9ptYUG4J4tqvzd4qvG7i3Hbjkz2Aa9qTj3NmLIBXz8BsZLVOH58LKkUN/0n
	 9lgXiZM8S1qZZ3Tx0Y+AH9A27r6oDKVqLQ9uIngCQGU5U2roFTaX9us8hTgvzgnb4I
	 TjNZ3dZl+BCvadv+jzK+I+c2b39aQaFYtRMLKG+UXcmyqsQMIMq33/MyiGmmWQgsKN
	 oiq9YkEyS9Qk+xwxYj49ksqSIuONWCB9beI5PkpZ8biDBIacsPJciRm4PQuJnfbxI9
	 kQZDmDI5qRmhEzroy5ZZq1IJbzPZLGiE/93mmCpA27Mmjh++9PXBOVmgrxDH4FZ4FU
	 K5ibJT1q64xkg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86:=20Always=20display=20CPU=20vendor=20string?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769702640904
Message-Id: <90b5ac3f-9238-4344-8dbe-f7d5873a45c8@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <8b50a689e549fd174d6c34dadc5df5c65711c615.1769694285.git.teddy.astie@vates.tech> <87181edd-fc9d-4221-827c-97abc7aaca65@suse.com>
In-Reply-To: <87181edd-fc9d-4221-827c-97abc7aaca65@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.73d8d46b397548ecad44944e93a33563?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260129:md
Date: Thu, 29 Jan 2026 16:04:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29/01/2026 =C3=A0 15:06, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.01.2026 14:58, Teddy Astie wrote:
>> While we may not want all the other CPU informations. We likely
>> want to keep the CPU string as it's more practical than trying to
>> decode it from the family/model/stepping combination.
> 
> Yet why would we want it logged several hundred times by default, on a
> big enough system? IOW ...
> 

Ah I see; one idea I had was to move this to early_cpu_init() or 
somewhere similar, and only displaying it once (only for BSP ?) ?

>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -819,9 +819,6 @@ void print_cpu_info(unsigned int cpu)
>>   =09const struct cpuinfo_x86 *c =3D cpu_data + cpu;
>>   =09const char *vendor =3D NULL;
>>   
>> -=09if (!opt_cpu_info)
>> -=09=09return;
> 
> ... this conditional doesn't want removing, but amending. E.g.
> 
> =09if (!opt_cpu_info && system_state >=3D SYS_STATE_smp_boot)
> =09=09return;
> 
> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



