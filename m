Return-Path: <SRS0=1DY5=BW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3AEC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 23:35:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D4420771
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 23:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="AEMaOuF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D4420771
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k60HH-0003cz-Uq; Wed, 12 Aug 2020 23:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RYY=BW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k60HG-0003cu-Gg
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 23:35:26 +0000
X-Inumbo-ID: ddeab9c3-30e3-49d2-ad58-c631165138b4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddeab9c3-30e3-49d2-ad58-c631165138b4;
 Wed, 12 Aug 2020 23:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597275325;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=X6VKxyz+x39eLM+Ne5Pu7a5nKWeWclxeYcLkkuirA60=;
 b=AEMaOuF//MrzxLb9IlrOST/DthoYMhXTNZ8+Cg9IbXof8k+UwhLVCo6k
 Kosg1LRh9lz5W5Qd7MhXRXCP9jkv1FFdWhjHO7v7GhUNCAFw1yNmqRPc/
 YAOs3/4dUVFwT/RytLSDFfJzDLKvbI/DukBy/rPSt0F6cKF7IQgoK6q1z Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: q9w91wi3o6FUWbSFWL4aSbv3dvcAVX9re2hmxa0y7XDGRAgUS75Q94C5zjJhVfvCNujyn+res+
 u41IUREsETyVrHdlD0eB1BT77RnkuZGlWXC0tVIqGhQGp2qdYYLLJdjEnyJfgtZZ7bKt4jhlpw
 AgCbi9XysC5TAwoagRlnytIWj9u/1cXILx71t3IKMGklmh7Eym1yup7BNCQOSg/CxNKCclLD0J
 vIfwYKNbdF34JeRrTdD4csHApklmjw++slsceoIRZv1Ft4weoNnVMPQndXGh5doR7PucS3Tg41
 5Yw=
X-SBRS: 2.7
X-MesageID: 24427772
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,305,1592884800"; d="scan'208";a="24427772"
Subject: Re: [PATCH] arch/x86/setup.c: Ignore early boot parameters like
 no-real-mode
To: Trammell Hudson <hudson@trmm.net>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <On7D3GbE8WWWH3f-1bSvUFQDxFcHP3yg6NdfvffgKqPRjQmJKsPBKsPgCCEEHbt9r2A3yxvf3gARonkKF9M_n1f3UfLEFpnZ29J2-Jc35ls=@trmm.net>
 <c7afab8c-291c-df0d-7269-084093975ea0@citrix.com>
 <iEyldvHWFXZA_7Xpgqaa_FADQCBGEu--Ab6oj2vDM3rLGKbCYcCWFl5q_GfZBHRN3IP77IQLLPzEFqupHvVwurwLMVQeBScoabJtROhiMbw=@trmm.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c86b1b58-9e52-a466-84b0-8d6bc230f607@citrix.com>
Date: Thu, 13 Aug 2020 00:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <iEyldvHWFXZA_7Xpgqaa_FADQCBGEu--Ab6oj2vDM3rLGKbCYcCWFl5q_GfZBHRN3IP77IQLLPzEFqupHvVwurwLMVQeBScoabJtROhiMbw=@trmm.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/08/2020 20:06, Trammell Hudson wrote:
> On Wednesday, August 12, 2020 8:16 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
>> However, the use of LINE creates problems for livepatch builds, as
>> it causes the binary diffing tools to believe these changed, based on a
>> change earlier in the file.
> Ah, I hadn't considered that.  Makes sense that the
> deterministic __COUNTER__ would be better for many uses.
> However...
>
> One concern is that the __COUNTER__ is per compilation unit,
> which I think would mean that every file would conflict by
> creating __setup_str_ign_0 for the first one, __setup_str_ign_1
> for the next, etc.  Unless they are static scoped or have a
> variable-name-friendly unique prefix, they aren't
> suitable for globals that share a namespace.

That's fine.  Something else which exists in our tangle of a build
system is some symbol munging (behind CONFIG_ENFORCE_UNIQUE_SYMBOLS)
which takes any static variable and prepends the relative filename, so
the end result is something which is properly unique.

In some copious free, this wants refining to "every ambiguous static
variable", seeing as most static variables aren't ambiguous, but that is
an incremental improvement.

>
> Another is that each evaluation increments it, so the macro
> would need some tricks to avoid double-evaluation since it
> both defines __setup_str_ign_XYZ and references it in the
> __kparam structure.  This is in contrast to __LINE__,
> which is constant in the macro and based on the line where
> it was invoked so the double evaluation is not a problem.
>
>> Instead of opencoding TEMP_NAME(), can we borrow Linux's __UNIQUE_ID()
>> infrastructure?  COUNTER appears to have existed for ages, and
>> exists in all of our supported compilers.
> I'm definitely in favor of borrowing it from Linux, although
> subject to those two caveats.
>
>> If you want, I can sort that out as a prereq patch, and rebase this one
>> on top?
> That sounds fine to me. They really are two separate patches.

I think we're fine caveat wise.  I'll try and find some time tomorrow.

~Andrew

