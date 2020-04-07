Return-Path: <SRS0=FJpJ=5X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFA0C2D0EC
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 22:25:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F1020719
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 22:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="QiUk16lZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F1020719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLwed-0008EA-NR; Tue, 07 Apr 2020 22:25:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Iuu=5X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jLwec-0008E4-P7
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 22:25:10 +0000
X-Inumbo-ID: a36c727c-791e-11ea-8176-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a36c727c-791e-11ea-8176-12813bfff9fa;
 Tue, 07 Apr 2020 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586298309;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MnvuEYljmUlFky9bY4yxK7vaoBPZmfAm1/NLaWhCGh8=;
 b=QiUk16lZbip9/LnCrkAmrdfZuDIckGWCStPzheUDc1Ir8cNdUnCqaoky
 A0ShtDclNoOrWFeFDZUU1cIU1RIuYcIzQ1zjlSZPuGaBxvovdPhyG/VXe
 VPzcAR+I9C2MpMXl7ocAugguzvA89xjVFsWCyDQXPYRgX1tZplK7vNMP2 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VpzEnEWIvdt5N2mSJbBl/phfDdz2QszAmsfopVtK8/lP8A8/Yysu33YhwERgxXW0npxRRjQsQ5
 2bRUk7Prw0n/7s/F5GS2pobjd2qKkH/mj4ITBpdOz7xXloGgWLkKzDn6DQ/hfJyNY43rq66yZI
 mJgtqxQ5n1Fqee3/5TIGAk5bSh6xoM6Wgzp9TA3cy/HPwrb+nvMkuxzCjr+dognnrmx+1L1KJu
 HTxjotI5dmsmeOvacDWRJ4nuYvz+pNWv06icPqrI31XNrLUlIowjezKzQ4jepQlruOpMyriA+3
 etU=
X-SBRS: 2.7
X-MesageID: 15345650
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,356,1580792400"; d="scan'208";a="15345650"
Subject: Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy
 request
To: "Panyakin, Andrew" <apanyaki@amazon.com>, Wei Liu <wl@xen.org>
References: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
 <20200407202244.a6isag63njejbshe@debian>
 <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <17a92041-8639-2e4a-3d68-f77bd040b080@citrix.com>
Date: Tue, 7 Apr 2020 23:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/04/2020 23:06, Panyakin, Andrew wrote:
> On 4/7/20 10:22 PM, Wei Liu wrote:
>>> +        PERROR("Abort precopy loop");
>>> +        rc = -1;
>>> +        goto out;
>> There is no need to have "goto out" here.
> I was considering two more examples of "goto out" in a branch right before the label:
> - send_domain_memory_nonlive,
> - send_domain_memory_live.
>
> Isn't it done this way to simplify the function extension: you won't need to add "goto out" to previous branch when adding new code?

I'd recommend leaving the goto out like this.  Less effort for the next
person editing this code to think about.

>> These can be fixed easily while committing, so no need to resend yet. I
>> will give other people a chance to comment.

None of the copy policy was done well.  If Amazon have a usecase then
lets put it in.  (Talking of - I wonder why XenServer's usecase hasn't
tripped over this...  This was put into to help negotiate two live
streams at once, but this is an error case which surely ought to trigger.)

~Andrew

