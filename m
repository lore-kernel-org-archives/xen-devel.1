From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2] schedule: move last_run_time to the
 credit scheduler privates
Date: Wed, 12 Sep 2018 19:27:15 +0200
Message-ID: <290084ac9a2824db8daa7d6ea96d5508c08d1e54.camel@suse.com>
References: <1536763667-26510-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6849971218366678861=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g08vx-0004Go-5i
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 17:28:09 +0000
In-Reply-To: <1536763667-26510-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6849971218366678861==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WZ+OiqFW+afWzqVxgIbO"


--=-WZ+OiqFW+afWzqVxgIbO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-09-12 at 17:47 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> The structure member last_run_time is used by credit scheduler only.
> So move it from a generic vcpu sctructure to the credit scheduler
> private
> vcpu definition.
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
> Changes in v2:
>     - last_run_time type changed to s_time_t
>     - scurr changed to svc
>     - dropped stray blanks
>     - pointers to const are used appropriately
>
Well, the fact that the type is changing, and that you're also
fixing/improving const-ness, should IMO at least be quickly mentioned
in the changelog.

Something like:
"While there, also turn it into s_time_t, which is more appropriate.
Also, properly const-ify one of the argument of
__csched_vcpu_is_cache_hot()"

And I was right about to write that I would also like the changelog
itself to contain the usual sentence:
"No functional change intended"

but then I saw this (sorry for not noticing it in v1):

> @@ -1869,6 +1874,7 @@ csched_schedule(
>          /* Update credits of a non-idle VCPU. */
>          burn_credits(scurr, now);
>          scurr->start_time -=3D now;
> +        scurr->last_run_time =3D now;
>      }
>      else
>      {
> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index 05281d6..3c299ca 100644
> @@ -1556,7 +1556,6 @@ static void schedule(void)
>          ((prev->pause_flags & VPF_blocked) ? RUNSTATE_blocked :
>           (vcpu_runnable(prev) ? RUNSTATE_runnable :
> RUNSTATE_offline)),
>          now);
> -    prev->last_run_time =3D now;
> =20
>      ASSERT(next->runstate.state !=3D RUNSTATE_running);
>      vcpu_runstate_change(next, RUNSTATE_running, now);
>
Basically, right now last_run_time is updated only when, in
csched_schedule() we chose a different vcpu than the one which was
running, and it also was updated for the idle vcpu.

With the patch, it looks to me that it is updated even when we continue
to run the same vcpu, and is never updated for the idle vcpu.

Now, considering how the info it contains is used currently, I'd say
that not updating the field for the idle vcpu is not a problem.

The fact that we _always_ update it for non-idle vcpus means we're
changing what the field contains for running vcpus. Which again does
not look to matter much right now.

Do you agree with this analysis?

If yes, well, I think this is bearable. Or, at least, that the benefit
of having the logic self-contained in Credit code, overweight this
slight loss of coherency between the name of the field and its content
(things remains well within Credit's standards wrt to time accounting!
:-/).

But I'd add a few words about all this either in the changelog, and
probably also in a comment (even a very short one, like "last_run_time
is only meaningful for non running tasks" close to where you update it,
or something like that).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-WZ+OiqFW+afWzqVxgIbO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluZTHcACgkQFkJ4iaW4
c+6V/Q/+OnxQLuQtb3FRdYPBqzCcTBs2j1EdaIPRsosA+Aajp3rFseOxV71jRPSL
42l04tg7MKNhZFGzrm6K6uyQ2WjzgeS2CbwQXhwORCZH3k+9lY78LWlVs03ShO0S
PquCAewNSkQtvVABcMYRnmVSpDIQSNXOJSLPLAQxmnaUc1kAXlcxdxO2la+Ce+LP
4eJ+ZWYNeMIQcmYsu5Vj/O+qbd0xkblyD6+1RRyucfuJGgGCFOwwpZuDgOvmcWPF
nrjTbI9tu/bjhttysoQ0Tx/XWT82nG/8/EzuUKG1ni7e9zBz1svpeIF0wBsCTKzi
V4OQHV1jr6DPXzWfv3nTRehfOV8kV5nWmPAtt6ixcMrNZHfLpjkewqJV91BaiN8y
j5h+8/K0TABmOia0Ljln/GTS6PDGyQ2JzYbHd2aFHVVcg2cr8FbwgaUnsRHcrsR9
+9KK6gsAtwsEgwKDm9bBuhAvNtndyMVbgwAxpFpqLh75TDeFAKKcdf+V4OrF9Ped
2bFsl5qnEgL3sYeZo85UtNXG14b3wCNRGScsLrQsg1ysYoNrGkbsoXhzE4Cpbquk
6K0jsyNdnwVfSm2xyIUQbU+UbxJiTNFaWuU5cTArHWudEIUXwKgYvUXioDizeehN
BqYB5q870Cml8rA7uNpQKCdslvDFr+xNOtECxVCLMLEcMjUJS3A=
=7z3k
-----END PGP SIGNATURE-----

--=-WZ+OiqFW+afWzqVxgIbO--



--===============6849971218366678861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6849971218366678861==--
