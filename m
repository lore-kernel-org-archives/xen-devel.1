Return-Path: <SRS0=k60x=3L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1620AC2D0DB
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jan 2020 13:12:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C1420678
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jan 2020 13:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C1420678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFnQ-0000EG-Ha; Wed, 22 Jan 2020 13:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iuFnP-0000EB-Jb
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 13:11:47 +0000
X-Inumbo-ID: b9424974-3d18-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9424974-3d18-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 13:11:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC42BAD6F;
 Wed, 22 Jan 2020 13:11:37 +0000 (UTC)
Message-ID: <4f58c328cec2439313d53119d4db1ef7c666bc32.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 14:11:35 +0100
In-Reply-To: <20200108152328.27194-1-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 0/9] xen: scheduler cleanups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3755373457181641367=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3755373457181641367==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-JK4v3gwLjC8pku/DK8Pd"


--=-JK4v3gwLjC8pku/DK8Pd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-08 at 16:23 +0100, Juergen Gross wrote:
> Move all scheduler related hypervisor code to xen/common/sched/ and
> do a lot of cleanups.
>=20
> Juergen Gross (9):
>   xen/sched: move schedulers and cpupool coding to dedicated
> directory
>   xen/sched: make sched-if.h really scheduler private
>   xen/sched: cleanup sched.h
>   xen/sched: remove special cases for free cpus in schedulers
>   xen/sched: use scratch cpumask instead of allocating it on the
> stack
>   xen/sched: replace null scheduler percpu-variable with pdata hook
>   xen/sched: switch scheduling to bool where appropriate
>   xen/sched: eliminate sched_tick_suspend() and sched_tick_resume()
>   xen/sched: add const qualifier where appropriate
>
Ok, unless I'm missing something, I think that "scheduling-wise" this
series if fully Rev/Acked-by.

Thanks Juergen for the cleanups. The code looks a lot better with this
patches applied! :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-JK4v3gwLjC8pku/DK8Pd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4oSgcACgkQFkJ4iaW4
c+5XcxAAp7RWx6yQkQulVEpvzi019TUIq84sy77XuytcrJK5g5JMFjHkVAsIksSY
H2OzIkSfXwyizFKbIgirx/DBVc6GSmdeYCji+QOlE5fASCrLxcg1fFeuzppsJu9J
R2gQIkmKJfL5wm/scP9uaRALpWfDCMRFSq2R9xCmrFOylaS+MYyHBEoVDIRvnHQu
1hWpfGAiKRd9LCCwSjoth+2oTTT1sJZ4d8pYELmLBGs6gYC86Sf9cTRpD4OQabsR
k6FPRsoLBdCiVeczg1ZvNm7f20Xn6uXCZzrDJsQUJGKgU4o0uz6f3QSASMRX0iZS
o1w4gcAMnK3tDkfVrnzJKpYuZ0Yn3tryHdE3iOq8I7FcmpmXAjWMHIoc89jcTcu8
ESDqeN+/UZvfiYxemuQ9tU4mRfUQc3GyvIOcP28OFmOaHkxNLM8hAZjSxDinJkNO
sQJqwLPR/3WxF+y4KtUsqkx3MsrMDcmuDlYoGdJHK+nJ5K4jZFU8ZvshT+zPO048
HZqxuMByOvevAHeEFL2Yxn2qdW8aJNEGg6tHTR8CxAk0WUezHbZIolChEq1OxvG1
ENdouhpzyODJQdqTNHjeJuIcaHajH9IPDEHrmDKBs5+VIPzxfcGr3RuR8/thip1m
QwF8UDW+uogWbnV6VBbPlVnk9q9/5nyDA37FOsMJ0c5r/FPpQvk=
=PBUF
-----END PGP SIGNATURE-----

--=-JK4v3gwLjC8pku/DK8Pd--



--===============3755373457181641367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3755373457181641367==--


