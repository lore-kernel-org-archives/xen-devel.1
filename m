From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: Credit2: enable fully custom runqueue
	arrangement
Date: Wed, 24 Jan 2018 19:33:47 +0100
Message-ID: <1516818827.15341.4.camel@suse.com>
References: <150531969753.22283.6861569329752511399.stgit@Solace.fritz.box>
 <849659c2-ef26-2df2-5eaf-f848cae2bf4c@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3257086745114426657=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=++wb=et=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eePsS-0001Xw-9v
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 18:34:28 +0000
In-Reply-To: <849659c2-ef26-2df2-5eaf-f848cae2bf4c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Praveen Kumar <kpraveen.lkml@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============3257086745114426657==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-jG0OrvzE27lkUiqsj8hW"


--=-jG0OrvzE27lkUiqsj8hW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-01-24 at 11:44 +0000, George Dunlap wrote:
> On 09/13/2017 05:21 PM, Dario Faggioli wrote:
> > diff --git a/docs/misc/xen-command-line.markdown b/docs/misc/xen-
> > command-line.markdown
> > index 9797c8d..dbf5d4c 100644
> > --- a/docs/misc/xen-command-line.markdown
> > +++ b/docs/misc/xen-command-line.markdown
> > @@ -585,6 +585,16 @@ Available alternatives, with their meaning,
> > are:
> >  * `node`: one runqueue per each NUMA node of the host;
> >  * `all`: just one runqueue shared by all the logical pCPUs of
> >           the host
> > +* `<custom>`: one runqueue per each specified subset of logical
> > +              pCPUs of the host. Subsets are defined either as:
> > +              `[[0,1,][2,6][3,5][4,7]]`, or as:
>=20
> Is the comma after the 1 there a typo, or do are you explicitly
> trying
> to communicate that you tolerate terminal commas?
>=20
The former. A typo. :-)

> > +
> > +        /* Is the cpu ID we found valid? */
> > +        if ( cpu >=3D nr_cpu_ids )
> > +            return false;
> > +
> > +        /*
> > +         * CPU IDs are considered only the first time they're
> > found in the
> > +         * string considere. Multiple subsequent occurrences are
> > ignored.
> > +         */
> > +        if ( cpumask_test_cpu(cpu, &cpus) )
> > +            continue;
> > +
> > +        cpumask_set_cpu(cpu, &cpus);
> > +        custom_cpu_runqueue[cpu] =3D rqi;
> > +    }
> > +
> > +    /*
> > +     * If in_subset is true, it means we are in format 1, and we
> > +     * found a subset that was not closed with its ']', which
> > +     * means the string is malformed.
> > +     */
> > +    if ( in_subset )
> > +        return false;
> > +
> > +    return ret;
> > +}
>=20
> Rather than nitpick the state machine here, I wonder if we could add
> some unit tests to make sure that the parser continues to be have as
> expected.  We could either do some trickery to allow it to run in
> user
> mode (as the x86_emulate() harness); or we could run some tests
> during
> boot-up when running in DEBUG mode.
>=20
I like the idea. Not sure which one of the two options I'd prefer...
Probably the "run in usermode" one, if it's not too complicated (I'll
have a look).

> If you can't pick this up, I can probably make time to do it.
>=20
I think I can take care of this.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-jG0OrvzE27lkUiqsj8hW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpo0Y0ACgkQFkJ4iaW4
c+5GTBAAzlNNjZ3ghGI8aFuKDySNIUlqq0LYc9+IeJlU7Bn6zKLUBD+P4r10QlQv
zwDq1pw65W8BUsiEkI7sMP8GsZBonJhPzZwpTjpdZj+p/OuicQSpFkOQ2PRa/Rbl
DgzzZce7Kc2R49IT6cBxapWZiw4HjzbOBV57XwXeerXD7cv96LX5woQH8f1YhMa3
sv3SQfHgUmBNtX1iG778nmXVwPdEXQofPFEz8M5VGLymzvTePHAHC9BF4ttAAxaT
IZfWHRwf8avUPVml7u22YWD5mGj4cGbKoCHnAmNlVsboC04EBU5z6R2uT5AbBPez
ZEn6eLjb3U03D0jF7Thbh5mogUA1QrY15I5dcOAg8pDKR2XfsBPjBJ7ebRJG1YAg
26f4renQrHsCmat4aLMtk8Jucjxk3IlZy5+WqCybDxdV/W+EajyvLhI1r0QTB85b
jiyuBRURqb+y0mWsCmMNu8V9mz13MGnQp/U6SrXGGtCCOf+FTr6GBDJL6wF4lhp+
Yb6iGhBzOJ2WvBkhL9S4W/mWHDwojlkM8pKGKGkjG7vdmQMUq8TYieusxLZuHxGM
ivGkh3o3XcfYQN/AxvK6zSLy35w93uapFJQ5jQCgTUd3L8yt+T4Xqca8TWKoNsRV
ki63Fyl3gJFW/dsG7yq3iLB1sf3zrNm7wuIa2E3Nh5YqijvO3Qk=
=eoPD
-----END PGP SIGNATURE-----

--=-jG0OrvzE27lkUiqsj8hW--



--===============3257086745114426657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3257086745114426657==--
