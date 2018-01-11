From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched_rt: Move repl_timer into struct
	rt_private
Date: Thu, 11 Jan 2018 19:19:20 +0100
Message-ID: <1515694760.30117.73.camel@suse.com>
References: <1515690052-4221-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8341877391293427230=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515690052-4221-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Meng Xu <mengxu@cis.upenn.edu>
List-Id: xen-devel@lists.xenproject.org


--===============8341877391293427230==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-G0OWC6IKZOH2sJmFRVRu"


--=-G0OWC6IKZOH2sJmFRVRu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-11 at 17:00 +0000, Andrew Cooper wrote:
> struct timer is only 48 bytes and repl_timer has a 1-to-1
> correspondance with
> struct rt_private, so having it referenced by pointer is wasteful.
>=20
> This avoids one memory allocation in rt_init(), and the resulting
> diffstat is:
>=20
>   add/remove: 0/0 grow/shrink: 0/7 up/down: 0/-156 (-156)
>   function                                     old     new   delta
>   rt_switch_sched                              134     133      -1
>   rt_context_saved                             278     271      -7
>   rt_vcpu_remove                               253     245      -8
>   rt_vcpu_sleep                                234     218     -16
>   repl_timer_handler                           761     744     -17
>   rt_deinit                                     44      20     -24
>   rt_init                                      219     136     -83
>=20
> As an extra bit of cleanup noticed while making this change, there is
> no need
> to call cpumask_clear() on an zeroed memory allocation.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-G0OWC6IKZOH2sJmFRVRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpXqqgACgkQFkJ4iaW4
c+4+gg/8D/JotQeLXBCDClr0YmyiQf46475tBlACx3s3yKL4cN0DcLFxe1zZBGeC
s+Kw6Hs9/65OH9ajfuMbd2hu1fQfL3z/gelD148mwTbUoWC86inRdY+LuuLIFLgp
CYKf/6lP2YDyiArYOKZyO79x6NLipbeHmv415HpvCESlAX0mfWOrePl81qYCMOwO
Ei7jbb4KPaefa6OcjxcPrCpnuDPdDpLR8quCW8FKLTexiSmw2avMchfMvwcpeO77
WEVOQ6890HjIy84CKnH43LCe7R0HY9LNJ9NGo//pQ/qtRSXdohU8I/+d26Mi+QAk
z73IpyBEJ98LJFKTdW6FEGb/ThaiV4tbhva1Mo04rvPQivGZq1NPLU0lkHr1f1qE
kpTgYz2cYsYGuVWfzy7NRgRwN7K+pGtPylREQ3yzhQmrrKkEtuFjnECuqWauwLCA
ltetV9sFsP/hTALsorhXVMyjDz4iVuHK4Dpdp/m3WkldbY1FZCjQoonhYki0hNbH
qRP7x8DH3uOFaBWDFMEYTQVoj4R5i0ODcLjf9fkB7xmjtRY5FOeQ4geCwCEe/wY2
7Egc5ihzIdhHMIaDw24RFKMEryP6GnL0xvvUX1qBAEtCbbSnPDGiZRAkhQk8aLvh
UUgIdiptutGMlHdim9CyXEXsc1FSj8mcmPHGLM5wb5sbvuUNOJE=
=wRsa
-----END PGP SIGNATURE-----

--=-G0OWC6IKZOH2sJmFRVRu--



--===============8341877391293427230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8341877391293427230==--
