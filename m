Return-Path: <SRS0=APZ7=A3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8812CC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 14:42:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA6C206F4
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 14:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="f50lpYkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA6C206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw55i-0005Pz-47; Thu, 16 Jul 2020 14:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw55g-0005Pu-0F
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 14:42:28 +0000
X-Inumbo-ID: 915f599e-c772-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 915f599e-c772-11ea-bb8b-bc764e2007e4;
 Thu, 16 Jul 2020 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594910547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6FUZUHpNfVY8WNpRF1zA5bVD5ePWW6OJT4WzlFNGH/k=;
 b=f50lpYkLpZzEB3ou1U3wHu9CfBMX+9ud2cQ+dGxah4PbHshGMh+JfAqm
 9K3bdkxmXAXIxF/yH73RmD7mdmzb5oERAjhMQx1XQPjpDAeOw/K+b/0es
 c2xIyUHgStx4z7N4Fb5Fri3sNMYciE7alRzNTpzoN6K7eTKQGry8wJRNP I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UKu99vf4dhACvHwiK1lYsBPqdkxTEnyBz22rwdQydEKJS/kCbSRuP+uUNlWXKvqV27rn07lVbU
 xZuEqqtlRwq0a1xrhXnR/HNaPOmydcOrR12Mwi8ySjjB8Fcz6D9k0CLSfZGTW0Xrz9CcR0hhm5
 Cg1GDpWXORxH88PDxUUo9A5XVDzXoC92FzptmCuNhjwmi88uuDWAyUZtSjwADL+M33s5naPz86
 cyfOGf0qCHLHDOPGHoBROry1h4NuHpwsPzE/42tOgGKKGWik03xbJb17bznfyb0sBFxTKer6Vm
 Qkc=
X-SBRS: 2.7
X-MesageID: 22731684
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22731684"
Date: Thu, 16 Jul 2020 16:42:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
Message-ID: <20200716144219.GQ7191@Air-de-Roger>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
 <20200716114128.GO7191@Air-de-Roger>
 <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 16, 2020 at 01:48:51PM +0200, Jan Beulich wrote:
> On 16.07.2020 13:41, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
> >> Use ENXIO instead of EINVAL to cover the two cases of the address not
> >> satisfying the requirements. This will make an issue here better stand
> >> out at the call site.
> > 
> > Not sure whether I would use EFAULT instead of ENXIO, as the
> > description of it is 'bad address' which seems more inline with the
> > error that we are trying to report.
> 
> The address isn't bad in the sense of causing a fault, it's just
> that we elect to not allow it. Hence I don't think EFAULT is
> suitable. I'm open to replacement suggestions for ENXIO, though.

Well, using an address that's not properly aligned to the requirements
of an interface would cause a fault? (in this case it's a software
interface, but the concept applies equally).

Anyway, not something worth arguing about I think, so unless someone
else disagrees I'm fine with using ENXIO.

Thanks.

