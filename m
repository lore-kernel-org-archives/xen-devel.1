Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8352FC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 17:27:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 358612054F
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 17:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 358612054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72285.130040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2dk4-0003mD-MH; Thu, 21 Jan 2021 17:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72285.130040; Thu, 21 Jan 2021 17:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2dk4-0003m3-I2; Thu, 21 Jan 2021 17:27:32 +0000
Received: by outflank-mailman (input) for mailman id 72285;
 Thu, 21 Jan 2021 17:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfWZ=GY=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l2dk2-0003l3-Su
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 17:27:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 301b3291-547c-40da-ba5f-31c916fde5ee;
 Thu, 21 Jan 2021 17:27:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13712ABD6;
 Thu, 21 Jan 2021 17:27:29 +0000 (UTC)
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
X-Inumbo-ID: 301b3291-547c-40da-ba5f-31c916fde5ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611250049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S2WdeLtzYfouP+gclV7VhQ0bFtHdFj8AaoO+stsPU5U=;
	b=Fwielg+VZQo/wLZo+obzGIJ3LzrTeM/bLeOMqtmkhqJjDqRi+Bfh4YzxLBhIuUAdN/9TCE
	QhBjT2wqIe5zFdGch62erXXU/a4OnSSU6Ee2OF9IGAKT/XpYOxKeQwjSacdIgPU+kKR5WL
	8sZqoXPdZ5EdMIS2V5ekqpnpTcfppYQ=
Message-ID: <8eb3360a078152bf8b175217c764fda3acc0fe4f.camel@suse.com>
Subject: Re: [PATCH v4 4/5] xen/cpupool: add scheduling granularity entry to
 cpupool entries
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 21 Jan 2021 18:27:27 +0100
In-Reply-To: <20210118115516.11001-5-jgross@suse.com>
References: <20210118115516.11001-1-jgross@suse.com>
	 <20210118115516.11001-5-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-weKf3OIAOweFuDlLIHeE"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-weKf3OIAOweFuDlLIHeE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-01-18 at 12:55 +0100, Juergen Gross wrote:
> Add a "sched-gran" entry to the per-cpupool hypfs directories.
>=20
> For now make this entry read-only and let it contain one of the
> strings "cpu", "core" or "socket".
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-weKf3OIAOweFuDlLIHeE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAJuX8ACgkQFkJ4iaW4
c+4aExAAz6ih5a1yfIT7HuHXDch3OI1shgral8/rd9lO/8kQcDuGTALagzSBYHYn
b33d2V6nqbOAUvPMCJavITKSWDgSXh4Cm9igFZfSjRDZHaTi3kpRXhgGj1XiAPWn
3gAHo9xJCn5LpFQySZQXANGkmrNAh1hJVXMuPDzqns/9/NHqGiK+4ThDc5WvReff
QdQGhFNhMudynOgvwNR5/To2ZQW0TLpLAkeuoAR09T48ZSxYI5RuYgCsWKZu+iSk
4FtimlGA6ovnnMYodkkvt9ATX4T0unUlEC/50vQCdze08Hy/MLI84/3MffoVnfkz
ds9pWpLKrAvjgSlmECMKwdEO6uXzQH1C2WOhAEENx2yGtMRp89rGIEoARQSD31su
G8Mc2okWpo0PZubx1CkulScY80g2GYA5jG33TZ9HVcgME/yzfpPu2kSX61h4B85Z
2eF8gymUqGXml7a/T0vi8j4mj2jyDmZpZCMIaWW297TdvWRL4hJobR1IT6Gz6V3F
zIR3TIJkPNMzc1UB4Hl+CPhNLWUFEnMfIGCJqbTl3LPS8+aa2IoKGnQmnhb2rC7w
sSbXkw4PfPhqdDpY0+jVYc7CxyhXQU8MaWyhMDnkAkGX9ZiTdKrknh1Sa99dXDwD
Xxa2l7T4yghfGfbR99I7XlP7cKn1C55yjGla93FPIGO9onW87q8=
=e3r4
-----END PGP SIGNATURE-----

--=-weKf3OIAOweFuDlLIHeE--


