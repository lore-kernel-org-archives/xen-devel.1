Return-Path: <SRS0=trq0=HZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E04C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 08:45:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94DC260230
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 08:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94DC260230
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88620.166722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETJt-0000Z0-MO; Tue, 23 Feb 2021 08:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88620.166722; Tue, 23 Feb 2021 08:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETJt-0000Yt-Ib; Tue, 23 Feb 2021 08:45:25 +0000
Received: by outflank-mailman (input) for mailman id 88620;
 Tue, 23 Feb 2021 08:45:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqnB=HZ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lETJs-0000Yo-AC
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 08:45:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 225e3f63-6940-4283-b7fb-485a034bff6e;
 Tue, 23 Feb 2021 08:45:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82D49ACBF;
 Tue, 23 Feb 2021 08:45:22 +0000 (UTC)
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
X-Inumbo-ID: 225e3f63-6940-4283-b7fb-485a034bff6e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614069922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZkNXdyMDx8NTUOj1TzHP+7IReNsG+wxkpdKOKxULGc0=;
	b=Xn+E33kTlgqw5+xs5M7AyxSost7CV3qpLJF9XxDtdgsRtAfNnlintw0NWQ2ORrA0ALy4C0
	oziQv6IUmfpHpNK7gjl02HzU0kDqXNRKyeCzmgWvbHoRHJxct4yLimcOFLImkRfwL4wtOc
	twvArflXXUeMcP+cjeXO17SA3yBlGQs=
Message-ID: <ba0522858e4a16336ddfb3c5ecd1f791ad7634e7.camel@suse.com>
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, iwj@xenproject.org,
 ash.j.wilding@gmail.com,  Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Tue, 23 Feb 2021 09:45:20 +0100
In-Reply-To: <alpine.DEB.2.21.2102221208050.3234@sstabellini-ThinkPad-T480s>
References: <20210220194701.24202-1-julien@xen.org>
	 <744ca7e5-328d-0c5f-bc52-e4c0e78dad97@suse.com>
	 <alpine.DEB.2.21.2102221208050.3234@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-gpDumVTxRxxZLZxvWZVR"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-gpDumVTxRxxZLZxvWZVR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-02-22 at 12:09 -0800, Stefano Stabellini wrote:
> On Mon, 22 Feb 2021, Jan Beulich wrote:
> > On 20.02.2021 20:47, Julien Grall wrote:
> > >=20
> > > vcpu_block() is now gaining an smp_mb__after_atomic() to prevent
> > > the CPU
> > > to read any information about local events before the flag
> > > _VPF_blocked
> > > is set.
> > >=20
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> >=20
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-gpDumVTxRxxZLZxvWZVR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmA0wKEACgkQFkJ4iaW4
c+7dIw/9F6mygFJS5J8GnnflnJcMkS6PkxYdGPD5k6s732AwHnTCW/jZhciNqXIC
cSN0lC+9oNxnaLuR2ieQ7oguUhhbtcnu//QxrbYaO5qfYIbZV3xJ96F5vZBr8u7x
dGKVKxnmXJld5Jikk/dZ5m1kRSEQH1rUxl7JwsEF5y6MAzF+s5XvS2hPfBQlItM9
a5qOdf2RPXMd1P9vwSO18paaoiEfEH1G09JTVJnueBvcZmcQgcGPSt2pdYonxZxm
ZY6RszC+0Jk5PNdBIkj4INXuFMQB65w0tk88/iDsce8QD/qLHvnD72wDwbU43nGs
qEhLFQ8rD/WkT2ygLViniJM6LHylRaynNt4/qID5D8joZ9jf91eKvGJx5J7Mj/ar
2T/G46Ps8sYzjk4SYGo40GyZek7+ivAFXWAQZ6CL+wWofoKvMZj3x/o+Xi3H5ukX
KWcV663LXbeu23eTOEidMBoR/lsX7+78sAl6MJNcXiBAMDZMBRNv8/CsOV4O6e6J
L7IioP9fD8sI3qpzkjme+zBmFAXiluzyZs1AgsZZJoppGB5qEKEvwtbiuArLpjpb
NtbUw+rsJ5aLyvx+aJ6vkoh1EjltYkWSyQqsPEVPqmwjbvi6X0hvOZXsu+uY02NM
NqTc/9otskHZAlT3h8J53S4c2adRQGwu9JsgTqIFWogQs/4SGXg=
=a6nR
-----END PGP SIGNATURE-----

--=-gpDumVTxRxxZLZxvWZVR--


