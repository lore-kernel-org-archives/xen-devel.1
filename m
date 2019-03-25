From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/6] xen: add helper for calling
 notifier_call_chain() to common/cpu.c
Date: Mon, 25 Mar 2019 12:56:29 +0100
Message-ID: <4d9ccca0f1769078d78eedae5cdc43d93b4fd8e9.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2521811184828178101=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8ODw-0002o7-4P
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 11:57:04 +0000
In-Reply-To: <20190318131155.29450-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============2521811184828178101==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lhPFS686xItr9vAI/wwV"


--=-lhPFS686xItr9vAI/wwV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> Add a helper cpu_notifier_call_chain() to call notifier_call_chain()
> for a cpu with a specified action, returning an errno value.
>=20
> This avoids coding the same pattern multiple times.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-lhPFS686xItr9vAI/wwV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyYwe0ACgkQFkJ4iaW4
c+5ikBAA33xsPP5Bt9vvRiQqwr6KD3A95tJNCN4wse+bIW4obSjEMJ+yvmwIkct6
HyOF1u0JoAlzHFaUGov4nlG4fEd14JhpH0kB8NDV2U9OX9uqMqF6oQJRyuAotMgb
X7Crifv+QZcyqrP67k1tb+RfZjPAcYb3+kNqeLiwmsOuPyyM8zxA9GuMHOq1+iyI
XHJsvV27ifrnyF1+JQ8eqNvvs4bPsptC0AwXfd2/lCBtIXzAyCc6Yhqo+G3SJnrW
G/Lx0aCviUS/+7hnd2Gt/SMARe1lvD2Qj9MoUFTR8CsYNLMj4Y5dg7u2HuWZfB+b
bnC4Gjxe4oYVXcjVaxirrBPV4yB7gV+fINT3Xy6AXxz5UJG/88fBlfX+sQigCf5O
u3dazVp5Pl3kd9m4URJrG+TD93GVgl3Y9Mk9RL9A9zGWFYxm07yPHi35NSbCKkss
Z5JUjaD7hiKbQTFMD52nIzXw8BGGr/CAaBLksxRO/babJXCsofsegDoAuamFOR1W
SPa87zz7JxdzSHMMOBYWr4CKXeKMJ1uwgQelx8jstNxd6lMsWtzQ+/YxPVWPBeAL
jWXirPixsFr5VX5im9FMHvDpnrx9Hw7E/w39BdK1DEuFwU5KNyn+h5Oq94Z/BiRv
u/VhlLcmMqKaJdIScLZuEVTW3tREolVq18fiWZD/F/haRYkZa2Y=
=Asxj
-----END PGP SIGNATURE-----

--=-lhPFS686xItr9vAI/wwV--



--===============2521811184828178101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2521811184828178101==--
