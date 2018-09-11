From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: Improvements to domain_crash()
Date: Tue, 11 Sep 2018 18:28:45 +0200
Message-ID: <a998859f912b174c7dc81175fe794af16039f4b3.camel@suse.com>
References: <1535643097-12059-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0782940547139331311=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535643097-12059-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0782940547139331311==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oRYXmhYq3UuTtG+6Bkt3"


--=-oRYXmhYq3UuTtG+6Bkt3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-08-30 at 16:31 +0100, Andrew Cooper wrote:
> There original reason for this patch was to fix a livepatching
> problem;
> unnecesserily large livepatchs due to the use of __LINE__.
>=20
> A second problem is one of debugability.  A number of domain_crash()
> invocations have no logging at all, and number of others only have
> logging
> when compiled with a debug hypervisor.
>=20
> Change the interface to require the caller to pass a printk()
> message, which
> is emitted at guest error level.  This should ensure that every time
> a domain
> is crashed, an informative log message is also present.
>=20
> Update all callers to either merge with a previous printk(), or
> invent an
> informative log message.  A few select callers are switched to the
> non-printing version, when they've already emitted a relevent state
> dump.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
I like the idea, and the patch looks fine to me.

I don't think my Ack is really necessary. I see it's changing
xen/include/xen/sched.h but, AFAICT, that does not fall under the
schedulers' maintainers umbrella.

Anyway:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-oRYXmhYq3UuTtG+6Bkt3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluX7T4ACgkQFkJ4iaW4
c+5gbhAA6ZfckpXOP1iRBTFMwkFIlbGitIojte8LRJCKk49zXw1reLilCV+3SqC/
0tkR3rB4Yw5T92YreI+453N6GJG278mDrUQMvnX+ZGtbclNSLTcft614pCvLgCLi
Vj6Tm/oc/Nj/60mXfXAjroO55fkgyrYX3hfgJIhbjQULC3CJO4DY0L4z7d61wspn
zndlrmuKYjADHMRE/9gZ8lgLtJBufko8IARbJlxl4b5OrC0+vo/4GfT4Hc5WcOpS
8fSPdXWarYa8XAfUGgEjVBwuvy8ZrfIh0omhi3gCQJ14NyJ+2HCjnASIgQtVZDyb
5Ahf/4l+OFjbeGvfH5eQ5e5f0PfQ9IebfPQ8jHBG4kbdb+YdMhDU7PHqatzDJG8M
c2dkPoT0dQbSO49Il2akafGx/QXlmjpg6cSkHYyJKWaRby9tM+5HPPnvBVO00QUC
UK7k0ByUoqPgh85hY71ptLEuA5n6qattriiJfiCAa8YkivqUl9HeISn+/3BW7+vt
iwQrT2Q8cgwv3kpJLYuK/Q5vad1Ky8q5NtaklkClil2+giW7TyCu3Bju5Pf9VesO
kCcS9WU0Pek6YGjUHMjEXmQL0Dw7Drp7OGrYawH5NsmDwJ20HQtOrB9zM3uCERBW
gV1QuoLmJgZzxv/4v4PMqYWNQrjJXTswjkOxFGr9YBmoUPbDuhU=
=qJpN
-----END PGP SIGNATURE-----

--=-oRYXmhYq3UuTtG+6Bkt3--



--===============0782940547139331311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0782940547139331311==--
