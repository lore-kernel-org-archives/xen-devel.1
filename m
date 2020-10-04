Return-Path: <SRS0=3MVR=DL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444B5C4363C
	for <xen-devel@archiver.kernel.org>; Sun,  4 Oct 2020 18:14:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C760020795
	for <xen-devel@archiver.kernel.org>; Sun,  4 Oct 2020 18:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="g46GQJ9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C760020795
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2756.7860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kP8WE-00076L-Gy; Sun, 04 Oct 2020 18:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2756.7860; Sun, 04 Oct 2020 18:13:58 +0000
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
	id 1kP8WE-00075o-DQ; Sun, 04 Oct 2020 18:13:58 +0000
Received: by outflank-mailman (input) for mailman id 2756;
 Sun, 04 Oct 2020 18:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GwjW=DL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kP8WC-00075g-Lh
 for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 18:13:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ac7e565-6998-497d-a3d0-92ee7b6f2610;
 Sun, 04 Oct 2020 18:13:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GwjW=DL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kP8WC-00075g-Lh
	for xen-devel@lists.xenproject.org; Sun, 04 Oct 2020 18:13:56 +0000
X-Inumbo-ID: 3ac7e565-6998-497d-a3d0-92ee7b6f2610
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3ac7e565-6998-497d-a3d0-92ee7b6f2610;
	Sun, 04 Oct 2020 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601835235;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=pMCF59CDIOu7GsydgexNuPw99R4/maZ6+vmTv+bIM0Y=;
  b=g46GQJ9OXXIk5jpBBpRecj/O4O+QhnH7oMwKVQTMzGv/f1nm9XJQ3Ol3
   X8EAnIBenX1Dg1mleaCCERAnFvlGWkwhYTqpkAOYv34YWsWQoSoJVwUJP
   TbqAggbIVAFyd7Qh1Bc4wdyQea2Czh/cdS/uZvqNk+Hcx437qdShta5ww
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VObHLUTJ/uVKs5WEuwwrHYowB9elvFPwJctnxCsAZuB9lOgxccicanLnxreseAMDHM0PCTfBhZ
 25JZySJgxeumN8YvhB85AHkdje4kFrlRmgNG1IydbdKnWOM7qe0dfv605Ib+IJlvXLwSjAs/Po
 mqiiiIAJsTjjmQ1ujSzscfwFoDIzEJizN0tRHckTJyVrMpqvP7N99Z4k+3CFsdqDgAcZ+oQvlp
 94x57kej2dhQfQ6IJqTzdrqiWP+DF98mYJMfHTT1R7h+WMkwbGogmaye0mhQJvmE4ZdUhin2Q8
 m5w=
X-SBRS: None
X-MesageID: 28248639
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,335,1596513600"; 
   d="scan'208";a="28248639"
Subject: Re: [PATCH] x86/S3: Restore CR4 earlier during resume
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
References: <20201002213650.2197-1-andrew.cooper3@citrix.com>
 <7d4e12ca-cb0d-3fbd-7d24-27bd46b8b95c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <90366a1e-3301-e614-b91e-f6f932b51c55@citrix.com>
Date: Sun, 4 Oct 2020 19:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d4e12ca-cb0d-3fbd-7d24-27bd46b8b95c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 04/10/2020 08:38, Jan Beulich wrote:
> On 02.10.2020 23:36, Andrew Cooper wrote:
>> c/s 4304ff420e5 "x86/S3: Drop {save,restore}_rest_processor_state()
>> completely" moved CR4 restoration up into C, to account for the fact that MCE
>> was explicitly handled later.
>>
>> However, time_resume() ends up making an EFI Runtime Service call, and EFI
>> explodes without OSFXSR, presumably when trying to spill %xmm registers onto
>> the stack.
>>
>> Given this codepath, and the potential for other issues of a similar kind (TLB
>> flushing vs INVPCID, HVM logic vs VMXE, etc), restore CR4 in asm before
>> entering C.
>>
>> Ignore the previous MCE special case, because its not actually necessary.  The
>> handler is already suitably configured from before suspend.
> Are you suggesting we could drop the call to mcheck_init() altogether?

Not completely.  It reconfigures some of the MCE bank controls, which
probably won't survive S3, but the #MC handler itself is fully intact
once the IDT is re-established.

It probably wants splitting in two, but I think some part of it needs to
remain.

>
>> Fixes: 4304ff420e5 ("x86/S3: Drop {save,restore}_rest_processor_state() completely")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

