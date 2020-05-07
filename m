Return-Path: <SRS0=QEX0=6V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E1EC38A2A
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 18:12:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF7420870
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 18:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="EdevowK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF7420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWkzu-0003Iv-Ey; Thu, 07 May 2020 18:11:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWkzt-0003Iq-3k
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 18:11:49 +0000
X-Inumbo-ID: 366c445f-908e-11ea-9f57-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 366c445f-908e-11ea-9f57-12813bfff9fa;
 Thu, 07 May 2020 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588875107;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HCX/I0dHjDqSDMQrZwaa838VtWpjdp6sj0lX5rmhDDM=;
 b=EdevowK+AiE13Dk3uQ/K4psz8n6qWLOEOjWJLhiIsogJn9oBOeR+G85F
 Zvgz2XMgiQ5Sch65qyix3+DwTmjpaJZmn6z4LiZ38dDfwWl3eSqM6ezz0
 URPuZ+BVMxfYRIeuCgqQmVcR/CLB99wYG8VTi8YInQOyef4mSLlVk4WUE 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BLPE3jx3rl/A5v3ti9yAe8vxgtwxlpGgNGU+uMjjzSPKD8EnLpw74AiJJhAxSnjdt1utZesCJ3
 OvbYuGnFjNnWs1nsfsiuGYlMgWOtZkotnokZv3Wr5DnYAajbJbh04Zf1h4bOdAZod130o6oG8t
 Gh2jkVqhUvcqGC2dUkoFNmOXteTQT4k79R2uHUsz0Xd1IJcnGF9IIRwedMV3vknbtTp4Pq9Jqj
 +GAi8s+r0re8KiEsK8946gvcE8WvctKmg45UiHDhJQW3eUYzYCAS6trodvErydi20z1YgdGN3p
 Trk=
X-SBRS: 2.7
X-MesageID: 17288560
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="17288560"
Subject: Re: [PATCH v8 01/12] x86emul: disable FPU/MMX/SIMD insn emulation
 when !HVM
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <6110ec4d-36a7-efa7-fb86-069ec5b83ac2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a9badaa5-cae0-f2b0-7801-5355f342ad4b@citrix.com>
Date: Thu, 7 May 2020 19:11:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6110ec4d-36a7-efa7-fb86-069ec5b83ac2@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05/05/2020 09:12, Jan Beulich wrote:
> In a pure PV environment (the PV shim in particular) we don't really
> need emulation of all these. To limit #ifdef-ary utilize some of the
> CASE_*() macros we have, by providing variants expanding to
> (effectively) nothing (really a label, which in turn requires passing
> -Wno-unused-label to the compiler when build such configurations).
>
> Due to the mixture of macro and #ifdef use, the placement of some of
> the #ifdef-s is a little arbitrary.
>
> The resulting object file's .text is less than half the size of the
> original, and looks to also be compiling a little more quickly.
>
> This is meant as a first step; more parts can likely be disabled down
> the road.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v7: Integrate into this series. Re-base.
> ---
> I'll be happy to take suggestions allowing to avoid -Wno-unused-label.

I already gave you one, along with a far less invasive change.

It is not interesting to be able to conditionally compile these things
separately.  A build of Xen will either need everything, or just the
integer group.

~Andrew

