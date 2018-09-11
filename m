From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: Re-position the
 domain_update_node_affinity() call during vcpu construction
Date: Tue, 11 Sep 2018 18:14:23 +0200
Message-ID: <3684cff3526fc2adb160f6b072fac5eebb366944.camel@suse.com>
References: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5991885973262699752=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5991885973262699752==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-R7kFp/zx7nnNcBku3d+7"


--=-R7kFp/zx7nnNcBku3d+7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-06 at 15:01 +0100, Andrew Cooper wrote:
> alloc_vcpu()'s call to domain_update_node_affinity() has existed for
> a decade,
> but its effort is mostly wasted.
>=20
> alloc_vcpu() is called in a loop for each vcpu, bringing them into
> existence.
> The values of the affinity masks are still default, which is allcpus
> in
> general, or a processor singleton for pinned domains.
>=20
> Furthermore, domain_update_node_affinity() itself loops over all
> vcpus
> accumulating the masks, making it a scalability concern with large
> numbers of
> vcpus.
>=20
> Move it to be called once after all vcpus are constructed, which has
> the same
> net effect, but with fewer intermediate memory allocations and less
> cpumask
> arithmetic.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-R7kFp/zx7nnNcBku3d+7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluX6d8ACgkQFkJ4iaW4
c+7FfQ//YEzgW3kt4PCPKdsjl9D9HkIJ6B13ZMg89xBx5P3+l85xG1DDqmPkOMuu
llK2dDjDpm5LJXYae43IbHkTWUC2eZwAddsgUv1pmIIyu/0KXYvchktqVwjQZW5w
83SwXckOQDYNdjhLeWKrQ+RKdAzA260byLrAtONkoLCztFsECCz4/PlHu2VrKq0W
3uNQGf7bh2Y6thty5Yes2u4rID14F9L7xaSK1tL94Mywf2ysD8B6UUNArSh7f39N
kTLV37+UwM5XCUEtpK/xT5njC4ZNjnrwwzpnTqpjiL+rfYjDZTGyclqeevw0h18y
hKNSF2VthDm5a930tZKHUBljUi+MhMzMS8WtfrikNIn8maaemuTzPWBQ2irw8Ec/
4vEneTZdqbE3cJX3RGjoGLgx/DUqRL54qM3ciPTJ0Fm8HtBI6KJPnTJUu7EQOxN5
5cLP8wwzpgEnp+Bnqo8pB4W+sXGBekfCQfdwSr7Knw6+poKZwWqYIATTy7AOYaUg
CctuCVcJqKMsVUmDQ3bqNYiWOO44L5wDoxSW5thXm8t3Rgwde2iCis/4hy29DbwI
NbHj974UgA5Az6uSrhRp1dwxlColyUQe7wKzp5RvQYpl/j0gdlmVjg6xN3mtZBY9
qdt5uayMfReJPPRDLIR8MZEcmI7QtQM2o5SdFww36Jks60fjGdM=
=/Wnd
-----END PGP SIGNATURE-----

--=-R7kFp/zx7nnNcBku3d+7--



--===============5991885973262699752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5991885973262699752==--
