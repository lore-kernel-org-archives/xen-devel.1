Return-Path: <SRS0=XA5Y=BR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359B5C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 17:55:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F311E206B5
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2020 17:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XywZMHhG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F311E206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k46am-00011n-2t; Fri, 07 Aug 2020 17:55:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k46ak-00011f-S6
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 17:55:42 +0000
X-Inumbo-ID: 1b06ae9d-bddd-429e-85f7-b0430542ab50
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b06ae9d-bddd-429e-85f7-b0430542ab50;
 Fri, 07 Aug 2020 17:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596822941;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=maXFjAVsA9odGgKp4lfxSgc/MADSKx+Y4l1fhazwDV8=;
 b=XywZMHhGZzOvBNOV+ozvnycgkflUzEFpvYZPA8QmZ71fpOV/bCJddqNx
 D8vgc31K/AKp/krr365cVGwXj9XkX1Zqp3fxkVrfjNe8EmT26um0GODZ6
 Lp1Q+nWbj+l5o3p7mLBFtgjTbVVF9aLDAMV8yTderdplCa35w2iPtoAL9 I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qoO1xcrbRBTvjYT3SumY5p2CmGelmu4Uew+Xo+6rU3700qYQv2TMNsFlEh8EHzG71kdlQPdOBi
 yL2cZGkJ8zEJXR4CmdBVUEZ6IJ8E+aFqFdSQcGeTaT3ceg0UYYHyb0VaDmewPIgHWciAnY8d0b
 5C9gNxjs3w97LTpfn/MRr+teuhNEavBopPhugouF88esLudOfVJhrL3m/3J+ut6A2AlaCCX1ms
 rtWuAkvYH0AFIphA1T+ulijg4UH+3GGuidpZw/QVJGqsGlr7SgTz/JSidenNPZCuKSyQ/CPsdx
 tlQ=
X-SBRS: 2.7
X-MesageID: 24257257
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24257257"
Subject: Re: [PATCH v2 6/7] x86: move cpu_{up,down}_helper()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <d9f8c767-f6a1-d0d3-01db-5e5f850997d0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e96f9131-de3b-4f06-50ae-d18af9d895b1@citrix.com>
Date: Fri, 7 Aug 2020 18:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d9f8c767-f6a1-d0d3-01db-5e5f850997d0@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 12:34, Jan Beulich wrote:
> This is in preparation of making the building of sysctl.c conditional.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

