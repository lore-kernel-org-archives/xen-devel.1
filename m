Return-Path: <SRS0=IY88=VU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E959AC7618B
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jul 2019 13:07:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C488C218BE
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jul 2019 13:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C488C218BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpuVs-0003Ip-1b; Tue, 23 Jul 2019 13:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+BnY=VU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hpuVr-0003Ik-5Q
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 13:07:27 +0000
X-Inumbo-ID: d0437aac-ad4a-11e9-a2f2-2bd803018c2f
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0437aac-ad4a-11e9-a2f2-2bd803018c2f;
 Tue, 23 Jul 2019 13:07:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0D88B039;
 Tue, 23 Jul 2019 13:07:23 +0000 (UTC)
Message-ID: <a2338765fbb092989ec600829417f066c4231f1d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
In-Reply-To: <20190723092056.15045-3-jgross@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
Organization: SUSE
MIME-Version: 1.0
Date: Tue, 23 Jul 2019 15:07:16 +0200
User-Agent: Evolution 3.32.3 
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0337298967477255830=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0337298967477255830==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ULDB989qtuox+os4e//W"


--=-ULDB989qtuox+os4e//W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-23 at 11:20 +0200, Juergen Gross wrote:
> Today there are three scenarios which are pinning vcpus temporarily
> to
> a single physical cpu:
>=20
> - NMI/MCE injection into PV domains
> - wait_event() handling
> - vcpu_pin_override() handling
>=20
> Each of those cases are handled independently today using their own
> temporary cpumask to save the old affinity settings.
>
> The three cases can be combined as the two latter cases will only pin
> a vcpu to the physical cpu it is already running on, while
> vcpu_pin_override() is allowed to fail.
>=20
> So merge the three temporary pinning scenarios by only using one
> cpumask and a per-vcpu bitmask for specifying which of the three
> scenarios is currently active (they are allowed to nest).
>
Right. And, after this patch, all the three cases above and
suspend/resume, all use cpu_hard_affinity_saved.

Can you add a paragraph, either here in the changelog, on in a comment
(e.g., at the top or inside of vcpu_set_tmp_affinity()), about why this
is all fine?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ULDB989qtuox+os4e//W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl03BoAACgkQFkJ4iaW4
c+432A//exY1uGsVelD62p3C9HbiRcCmHLo+57sfOueaR9GRDssyU6xaQaVAQ2g4
mfPYMSJZNtOcG4cjEegI2RKnh04chNseoQgKI4lDWss5cesAFeaTtXNHaXEr0p+n
awgPKtS8WTVF/w94L4XT/OW2TsQ60tUlL5CgIRSK6DOaqlQazsDKJo8fH8yJRa+v
GBcGefnk0RXx28aRfqaFYElc+7mueyYlRAuqHt90yMZhQPp3NqKGvLvWXo0zSUgX
jFLLy+DJauLJmLc+BFQKh7AXFMYaFqr8dLCdk+E8o6oNiGvdbqHzTya16nwMnXwa
wmDm8DYGwcMVGguUOjryZXfmqtG98BrCMH8KtrItu9LpNIgoSIcZgZOSyiXlndKx
zuTE5a8K7Px6F6hUBd1QlSRZ/yVWRsOgU2flS6VL0OmFn/SAQK/ahXHZVXcA/pJY
yNQohLEZKEDkmk0WJk2fDocK1pWmx98aDidYEaCX3OwDdZ4GdHptUXgagnmGBQ3E
oGszv1D3wqdAOsVzyIgehFnPD5eKVqkzTZm3SX1LCL3u9fgVh4IVD6DVKQ3HkXtZ
WL4A2+YfwwrZ1p3xPbVFLun/5VSNKcdmwZuSoLHRbOfr0tLVbSXTkTSqUoR+q2DC
DmztjtB521qR3k+qyvyXNqLEuNm8rlfNu/Y6T11+sSaMqb9Ngow=
=jO/V
-----END PGP SIGNATURE-----

--=-ULDB989qtuox+os4e//W--



--===============0337298967477255830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0337298967477255830==--


