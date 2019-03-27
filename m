From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Thu, 28 Mar 2019 00:05:44 +0100
Message-ID: <67435427aae22aa3bed62b1874ceb6c9b75c669b.camel@suse.com>
References: =?UTF-8?B?PDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Mu+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5C9BA336020000780022235B=40suse=2ecom=3e_=3c0b849a5c-9af8?=
 =?UTF-8?Q?-2b47-ced3-376af22c6141=40suse=2ecom=3e_=3c5C9BABAF02000078002223?=
 =?UTF-8?B?RTNAc3VzZS5jb20+?= <6c3dfb46-f6e6-4ab2-549b-58e6ca883108@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4932067154793791882=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9HcH-0008J5-RZ
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 23:05:53 +0000
In-Reply-To: <6c3dfb46-f6e6-4ab2-549b-58e6ca883108@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============4932067154793791882==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-d4ueJrSgN9LU33eeSS1O"


--=-d4ueJrSgN9LU33eeSS1O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-03-27 at 18:06 +0100, Juergen Gross wrote:
> On 27/03/2019 17:58, Jan Beulich wrote:
> > > > >=20
> > Well, of course nothing's going to run on that CPU anymore.
> > But vCPU-s may still have associations with it, so what I'm
> > worried about is e.g. something finding v->processor pointing
> > at an offline CPU and getting confused. Another, more exotic
>=20
> v->processor is allowed to have a stale value as long as the vcpu
> isn't running.
>=20
I was also concerned about things being done no longer in stop-machine,=20
like Jan, and in fact, I asked for similar reassurances.

Thinking more about this, I agree with Juergen that it should work. In
fact, it's important for v->processor to point to a CPU that has its
scheduling data structure allocated and valid.

In current approach, right before suspend, that is only true for the
BSP, and that's why we move every vcpu there. But after this series,
since we don't deallocate such structs any longer, it should be ok that
v->processor retains its value.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-d4ueJrSgN9LU33eeSS1O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlycAcgACgkQFkJ4iaW4
c+6LThAAshBka2nQN7+ux0qDAVMmfj+gakSdVxvsHy+TphvezzN+RHSK5kGn7yJh
j94HEMrDkocnVQ6jxOV7pL6m7Xpx8r6LU8vB6W5JOqDYEz+XF7BUDq0chn+MQSRW
VSyY3xbobQKr9cNYE5soOje16T2qWz6x8SJP5cSUXCyq4rJnpCZKxb6AJ0JREN2v
7M0sf0qNhn+DoJmyHp9BixrsLc8aywukvOyV4Wfkl5iosVeG7Ic66ZqoKBUIFkZD
Z0bX0CE4VJq+hHHq1O8FWIY5okY+Uk5FoMICT2MegAUXubhTKY3nJWKUpQo3cvSD
QxnpNg/5nktbS2bdZYgyG/7ku2mRL7J+IILSKYTj4SkAMe3Ay6mtfZTcRmMyHWjn
v3U9fEMzqUkx74To4MNEY+JNelByxK/KnMfHTshFwUAGW7KjoTM6zFkqEAaTFM8s
dXwwa/3FOtr1K1MXHDKf5bvIhRryzn7Q8kFzj3pBgxK9QpjpGzGQF3Z7isIoBxkB
fi60J3lxOCCW2VtGR/CBBHfe7Ex1HeLE4AL341sL5EB264B1e9l3xUSjiXIpAjRo
8jHYtFPXqvbHdgzx7LpYFgsKiwaW5nNo4rVS+4BmSWwjgX5Ji6iUpXzeh1fs9Pp5
SwAXdk5mqpgKSBoWrs9sq75xvAfVL4/gjr9BYzCo9wY8bbCNctM=
=0PzU
-----END PGP SIGNATURE-----

--=-d4ueJrSgN9LU33eeSS1O--



--===============4932067154793791882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4932067154793791882==--
