Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB77C432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 20:43:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2FF2146E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 20:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2FF2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCreR-0003gx-9u; Tue, 24 Sep 2019 20:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iCreQ-0003gs-8E
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 20:43:10 +0000
X-Inumbo-ID: ea6de604-df0b-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ea6de604-df0b-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 20:43:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C068FACC6;
 Tue, 24 Sep 2019 20:43:07 +0000 (UTC)
Message-ID: <5718957fba3d6384f89f26f290c24e6b8be20730.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 22:43:06 +0200
In-Reply-To: <20190914085251.18816-24-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-24-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 23/47] xen/sched: switch
 sched_move_irqs() to take sched_unit as parameter
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8867902616779445106=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8867902616779445106==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uNcuQRyerdSCM5qjvJzf"


--=-uNcuQRyerdSCM5qjvJzf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> sched_move_irqs() should work on a sched_unit as that is the unit
> moved between cpus.
>=20
> Rename the current function to vcpu_move_irqs() as it is still needed
> in schedule().
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

(Stands with parameter constified as suggested.)

Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-uNcuQRyerdSCM5qjvJzf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Kf9oACgkQFkJ4iaW4
c+5I6A//ae7wwVv6MCOWrKY6g96m6v+9v9/qu74GhI4uwGZo4Lhk/Lf/fUsWJFNw
Rc+ucc060Ef43UqhE02wjrggo/MZb7l447PdGSAitbA7OLPhyJNLtjhZ1PEZgnX/
CDjLGk6WP5DUM3zTVQPZGYU/lZ9vaFxlRyP9hL2JfCO6CKdEss7f8UXGaPQVaGfT
IuCBO1JPwTRoYeQEgftJX2/e27wm2FHQbHKJg1sCD/lZng3nGxG6aLQ0ytVklDCc
TmGgb5WuIABXbwWNacI5j/IBHH/kdi3RPT54Hf0KVlAnD60AALOj7humZFaFvDoL
/r++InTgX350BeURtShD7wVN2oIf+htYWlqMreZqsgvBUhn3yuFBTzsLjWjAw8Wi
t9tNShVSiN8g1D4fcs3A9TKgNbCSZNK/22QlWtdyZ3w/Slpcc5iold6FGuVi518m
TWenpl46IfWsUELT/RCPq+oYjreiPnNHl7TquUSBVukfw/RZX0C4ouGAydmArZzu
uquswSgX0kzdIa7Ia0/tM+Y96+GmAxoChoUnJD1M47CTwlhTSjISXBEoFFKMgRs3
NdRdJbQgdjfBVxGu3vHid7aIDEab5/LH8RcJp7j7+RrJrw6J9JyjHopTp3jyAE8O
joPVAE2t+n0sT3aidBDZtCrDztgs6owz6KYHgi/GkrDe8q4ia3A=
=K3C8
-----END PGP SIGNATURE-----

--=-uNcuQRyerdSCM5qjvJzf--



--===============8867902616779445106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8867902616779445106==--


