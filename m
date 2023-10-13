Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5E9CDB483
	for <xen-devel@archiver.kernel.org>; Fri, 13 Oct 2023 15:28:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.616687.958931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK5S-0000qD-IF; Fri, 13 Oct 2023 15:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616687.958931; Fri, 13 Oct 2023 15:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrK5S-0000q6-Ex; Fri, 13 Oct 2023 15:28:26 +0000
Received: by outflank-mailman (input) for mailman id 616687;
 Fri, 13 Oct 2023 15:28:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrK5R-0000q0-0C
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrK5O-0004Ez-BW; Fri, 13 Oct 2023 15:28:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrK5O-0004O5-4A; Fri, 13 Oct 2023 15:28:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=KdoR4VgpIspwk1J70XxI7xPNsXvg1T7DV4p+aJWDUqA=; b=05t5HIWEJ5747uBeswTrEeFqE+
	9JVtcEEncl+TebHuBJKerUW+ZG1TL4Ch238GrD/pwI2l1yLXshIvElcpvel9Fq1nSnc9EkDPv1JBg
	ZEx30QIoqx/AgVKbrUoQ7feU7kxmxvd+bFdbrSTPYoSAGRfhcDFlKcvV0kwMA3BA7zHs=;
Message-ID: <c679186f-4c8b-4ade-8563-9b988296935d@xen.org>
Date: Fri, 13 Oct 2023 16:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
 <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
 <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org>
 <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/10/2023 16:04, Juergen Gross wrote:
> On 13.10.23 16:51, Julien Grall wrote:
> A dom0less domU doesn't have that negotiation with xenstored, as 
> xenstored just
> uses the pre-defined grant for looking at the ring page. For the domU 
> there is
> no way to tell that xenstored has initialized the ring page (it is not 
> the domU
> to do the initialization, as the XS_INTRODUCE might be sent before the domU
> even starts running), other than the "connected" indicator in the page 
> itself.

Thanks for the informaiton. So dom0 needs to send a command in order to 
know if Xenstored is up. This is the part I find odd and the event 
channel notification could have help to harmonize that part (not the 
ring page setup).

Anyway, I seem the only one to think that and I don't have a use-case so 
far. So I will not push for it.

Cheers,

-- 
Julien Grall

