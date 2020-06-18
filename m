Return-Path: <SRS0=CsTU=77=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E439DC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 22:17:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5E420786
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2020 22:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kN/UQt3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5E420786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm2qL-0001sC-Vn; Thu, 18 Jun 2020 22:17:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dWRf=77=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jm2qK-0001s7-SZ
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 22:17:08 +0000
X-Inumbo-ID: 72b4dbbc-b1b1-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72b4dbbc-b1b1-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 22:17:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E0D82083B;
 Thu, 18 Jun 2020 22:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592518627;
 bh=HsHRQUoX57oUkk6Dfirz9XaoQFQ6mQvR/LpqyiHjNVY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kN/UQt3aGceAVfoJydwUBZhEsKqKRjlrM/VGcflqFSjDr4icfhKJiZpxFBOAFLPop
 Ap0qjP4ePjw0+E2ekKjKOcpe+lg0yKP9yUbfnxzegfVqIUB2/I0vVR7TFWNsKyA79X
 m/eZU+dX1ittpGzmJhacKHKuQz5E84wQmAv6ev4o=
Date: Thu, 18 Jun 2020 15:17:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [Tee-dev] TEE with XEN
In-Reply-To: <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
Message-ID: <alpine.DEB.2.21.2006181507360.14005@sstabellini-ThinkPad-T480s>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 18 Jun 2020, Julien Grall wrote:
> +Bertrand and Stefano

Thanks for CC'ing me


> On 16/06/2020 02:24, Volodymyr Babchuk wrote:
> > Hi Peng,
> > 
> > On Mon, 15 Jun 2020 at 05:07, Peng Fan <peng.fan@nxp.com> wrote:
> > > 
> > > Hi All,
> > > 
> > > While enabling trusty os with xen, I took same approach as OP-TEE,
> > > with OP-TEE running in secure world. But I am also thinking this might
> > > introduce potential issue is that secure world OS communicate with DomU.
> > > If there are some misbehavior in secure world OS, it might let XEN
> > > hypervisor not work proper.
> > > 
> > > In my setup, trusty os sometimes panic in secure world, xen will not able
> > > to control the panic core anymore.
> 
> May I ask in which case Trusty is panicking?
> 
> > > 
> > > So I am thinking whether we need to emulating secure world in a XEN VM
> > > which is the VM running DomU. Just like what ACRN did to run trusty
> > > os.
> > 
> > Well, it depends on whom you are trusting more. Both XEN and TEE are minimal
> > OS implementations with aim at security. I'm speaking about generic TEE OS,
> > not
> > about particular OS like OP-TEE or Trusty. Problem is that, if TEE is
> > running inside
> > VM, it will be susceptible to a hypervisor misbehaviour. You need to
> > understand
> > that Xen and privileged domain (dom0, mostly) can access memory of any
> > guest.
> > At least, in default configuration. There are means to harden this
> > setup. But anyways,
> > Xen can't be stopped from reading TEE's secrets.
> 
> IIRC, we discussed this approach for OP-TEE in the past. There was other
> potential pitfalls with it. For instance, you wouldn't be able to directly
> access any secure device from that guest (it is running in non-secure world).

Given that Secure World has access to Normal World but not vice versa,
it is more natural to run Trusty in one of the Secure execution levels.
The expectation is that Trusty has higher privilege, thus it is more
"trusted" than anything running in Normal World, including Xen.

Of course no client should be able to crash Trusty, so the reality
sometimes can be very different from the theory :-)

If I were you, I would consider running the TEE "inside" the VM only if
the service that the TEE provides is strongly coupled with the VM and
doesn't actually need a high level of privilege to function (i.e.
doesn't access secure devices or at least not often.)


> Depending on whether you can modify Trusty OS, alternative would be to make
> itvirtualization aware as OP-TEE did. The core would need to be resilient and
> the panic only affect a given client.

This would most probably be the best compromise.

