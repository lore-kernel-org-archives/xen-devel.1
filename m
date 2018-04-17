From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 3/3] sched/credit: Avoid doing cpu_pick
 calculation twice when deciding to move
Date: Tue, 17 Apr 2018 09:35:13 +0200
Message-ID: <525efc1b6b32480b814a8a41bec9240f6ab43079.camel@suse.com>
References: <20180411122518.26270-1-george.dunlap@citrix.com>
 <20180411122518.26270-4-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8585413890865948128=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yslv=hg=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1f8L9A-0002cg-Ia
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 07:35:24 +0000
In-Reply-To: <20180411122518.26270-4-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============8585413890865948128==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4LI8VfflMjF71m0W7Nr/"


--=-4LI8VfflMjF71m0W7Nr/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 13:25 +0100, George Dunlap wrote:
> In vcpu_acct(), we call _csched_cpu_pick() in order to decide whether
> to consider migrating; but then we throw that result away and do it
> again in context_saved() if we decide we do need to move.
>=20
> Instead, just initiate the migration and let the
> vcpu_migrate_finish()
> in context_saved() determine if it should make any changes.
>=20
I am ambivalent about this. In fact, I never liked the duplicated
pick_cpu effort myself.

Still, what happens right now is:
- vcpu_acct() calls _csched_cpu_pick();
- if the returned cpu is equal to where the vcpu is currently running,
  nothing happens;
- if it is different, we initiate a migration, and go through pick=20
  again.

So, we have the duplicated call to pick.

Initiating a migration means making the running vcpu not runnable and
hence de-scheduling it (in favour of either idle or some other runnable
vcpu). Then, in vcpu_migrate_finish(), we make it runnable again, put
it back in a runqueue, and raise the SCHEDULE_SOFTIRQ on the pCPU, if
appropriate. It's likely that the pCPU in question is different from
the one where the vcpu was running when vccpu_acct() was invoked.

After this patch, vcpu_acct() initiate a migration unconditionally.
This means we avoid the overhead of the double call to pick, but we
always go through de-scheduling current. This potentially means letting
a runnable vcpu preempt current just for figuring out immediately after
that current should not really migrate, and have it preempting the
other vcpu again.

So, AFAICT, we're saving some overhead, but introducing some other...

Anyway, this patch is not really necessary for fixing the race, so I'd
leave it aside for now.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-4LI8VfflMjF71m0W7Nr/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrVo7EACgkQFkJ4iaW4
c+6lgxAAxOMdV4oWi7DoR6R+TvShnrqypAgYQkkGNoT0D17mlgLZ7ZB9LQcbali/
p/GrEO50tMSuAB3UczSv9DBftJrBdCGZiu2w5OetGSSPTzv7+QxAquAfnP/uvskN
21RdgcWhfBx1HBdaIJqAylnRgWvUBewFXsc+uez0QKEknK+Al7STcw8H3Yeomk34
kPM/3XKDIsEKWD29llXFmWcCYKzmUbKGwzxifHZ5v5As/O8y2RJzQ84gMUpUvGwy
wisD0t7LMoJ72A0wkcvu/VmP4Cu4K8VGY2SShvPT/2cJSjnFdB2qhRYcR4vYiaZp
gj3YqR0EViQ4Dc4mqdIBV41DolisVLSbas70XkKpbU1z5+T63sCdKo6XoRzIl9TV
sm4kjTHPguolDihdNJ6sFA5d2Bs576LD5GsFiwr9hJlM1JXN7s5f0xcHwhoxyQOC
PHAB4GSb6xlvpx7qVkoMnGTo17RIhmf0VAE531mdOfaSSJaY/8QJxTocZd90EqRi
OClcetSE3RmyeUSlThNBAUazsZXFXPT6LpDqFmX0cwQeehWTnim1v/uKyktjWSVA
1JubCrGu8Tk03Ap/0ifoRfMJuTPijXO/mlojRUNulvWt6lptWkW0WXgBPQcDsLMF
Z+PYCYFRURZ0GcDJCzLebwBDruYGu4jne9rsQwacWlNzgcrdOAE=
=COaL
-----END PGP SIGNATURE-----

--=-4LI8VfflMjF71m0W7Nr/--



--===============8585413890865948128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8585413890865948128==--
