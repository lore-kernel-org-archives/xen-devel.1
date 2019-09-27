Return-Path: <SRS0=1d2Y=XW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473B7C4360C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 16:18:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B915217D9
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 16:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B915217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDswU-0002Sy-NI; Fri, 27 Sep 2019 16:18:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDswT-0002St-D2
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 16:18:01 +0000
X-Inumbo-ID: 5f4a28e2-e142-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 5f4a28e2-e142-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 16:17:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11A91AECA;
 Fri, 27 Sep 2019 16:17:59 +0000 (UTC)
Message-ID: <7d2c7d8512261336ca1aa1a2fd05ec836836ade2.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 18:17:58 +0200
In-Reply-To: <20190927070050.12405-44-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-44-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 43/46] xen/sched: support differing
 granularity in schedule_cpu_[add/rm]()
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
Content-Type: multipart/mixed; boundary="===============7074811242879500933=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7074811242879500933==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xT6eqAHriq5k9jWwjyGK"


--=-xT6eqAHriq5k9jWwjyGK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> With core scheduling active schedule_cpu_[add/rm]() has to cope with
> different scheduling granularity: a cpu not in any cpupool is subject
> to granularity 1 (cpu scheduling), while a cpu in a cpupool might be
> in a scheduling resource with more than one cpu.
>=20
> Handle that by having arrays of old/new pdata and vdata and loop over
> those where appropriate.
>=20
> Additionally the scheduling resource(s) must either be merged or
> split.
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


--=-xT6eqAHriq5k9jWwjyGK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2ONjYACgkQFkJ4iaW4
c+40bw/+OFTck7IwBsclkNq++rRFUDC/dHA7ucVqxn9zErctf2xnS+yQ+rGGiWrk
SpDUde+z3JL8AB0oScTjpWl4p7ESOlDvCMHajwNngrIdCvwZjx/4vUVZdnTMuxmR
IcHowaL8SRFRlBrFYhf/QQ426CbnTD+xUFR/Fvs4ddfDy9+f3m9NvR+L9PjJc+gz
PiF/cFnWLAHc0KOOsXLpP96NgAqhnr64r9S/i72gwIRc9kysvqSZ4yGJhvffbACi
eiDqb1bdHNEJC/wS7ZynEzYCjKkoXjQroh+5K5UdjQfpA+GFJdbdO6PRtRENoDIk
/x9HdWCkI9Be3xFlZdYdtKjAn1WQ5vdTh9ZZisCq7euh9VgNHs/vg633fdTfXpT8
gpzns4X3VdD7NDMQCoxymqrlC7Me9nFIHrLKSy1uSzIPTOJtRmLHibIw+Ws6Ja7I
5X4eTArYNBZhcMqquaLBvqJPWcaHXwui+Gspn+1UMRzNYtyxg6A00gro9ittMbIv
NMgPM6Fh5Yq/6XL/MlpJ0T7eGIqPw99cLSk3rdxoSPkSUNqlLuTGwyGQJz5f89R6
F/tg//OMab3SZufbFASqptaiQUCL7H9o25qRcTumJezw96P6unOobaCgm93NkEUx
kuKz4lGeGiwFxt6xnTDzFyZ2oqGHWsewXbc+0ZJhXefmRLH3ovY=
=W3ak
-----END PGP SIGNATURE-----

--=-xT6eqAHriq5k9jWwjyGK--



--===============7074811242879500933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7074811242879500933==--


