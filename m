From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 05/12] xen: add hypercall interfaces for
 domain and cpupool parameter setting
Date: Wed, 26 Sep 2018 19:06:57 +0200
Message-ID: <cbdeef2e94827f0ffd8a8bfb008cfbb05630f614.camel@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051744528515093746=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5DHq-0006wk-D2
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 17:07:42 +0000
In-Reply-To: <20180918060309.7186-6-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org


--===============1051744528515093746==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5nTz1xutm+1H/Rmt7D0L"


--=-5nTz1xutm+1H/Rmt7D0L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-18 at 08:03 +0200, Juergen Gross wrote:
> Add a new domctl for setting domain specific parameters similar to
> XEN_SYSCTL_set_parameter for global hypervisor parameters.
>=20
> Enhance XEN_SYSCTL_set_parameter to be usable for setting cpupool
> specific parameters, too. For now do only extended parameter
> checking.
> The cpupool parameter setting will be added later.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I mean...

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1055,12 +1055,18 @@ struct xen_sysctl_livepatch_op {
>   * Parameters are a single string terminated by a NUL byte of max.
> size
>   * characters. Multiple settings can be specified by separating them
>   * with blanks.
> + * Scope can be either global (like boot parameters) or cpupool.
>   */
> =20
>  struct xen_sysctl_set_parameter {
>      XEN_GUEST_HANDLE_64(char) params;       /* IN: pointer to
> parameters. */
>      uint16_t size;                          /* IN: size of
> parameters. */
> -    uint16_t pad[3];                        /* IN: MUST be zero. */
> +    uint8_t  scope;                         /* IN: scope of
> parameters. */
> +#define XEN_SYSCTL_SETPAR_SCOPE_GLOBAL   0
> +#define XEN_SYSCTL_SETPAR_SCOPE_CPUPOOL  1
> +    uint8_t  pad;                           /* IN: MUST be zero. */
> +    uint32_t instance;                      /* IN: scope global:
> must be zero */
> +                                            /*     scope cpupool:
> cpupool id */
>
... I don't particularly like the name 'instance', but I've not been
able to come up with anything else which sounds better... :-/

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-5nTz1xutm+1H/Rmt7D0L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlurvLEACgkQFkJ4iaW4
c+4FVQ//dhDKLCQSr2DFgDB//yO9TztfqgNCPeHBk6zwkdvMOBNLqG+og5m/Y78J
9jsbI60cut8sUB9oCU9bjITHzlGUAT1KoSQQWDtqo6mziFeoPXjt+0OMBGzXymTr
6VOTP41Sc8ombas+Fe3GlwGPWdGaBqqJaVne9G70cXESXwvXG+hE+3p88cQ03fcp
5Ju5GV+bYNRfCskVrlDPiUorXR61IOs1yVXIRDOmKmDD5Qr3s6j2aUiZrpkzQjy5
7qAM48IjvFWrnUwMETQV4bWBvs0vu0j+OdA3455AXV/4XFRBzstS1Fw1Xgemu1g1
NqrN5d+CGGeTF7pt+TXcPvdpwR3ph9/tySIGpEKBPlDwncMbi5zUj/0YpVyP4U8F
1WMrDAxiVP0a5txNnyUtt2ZStLzrUID9KcyKOnD7uB9QloS+07aOe+fG9D/yknK4
TzGJUN6gFazq2nUk0eSaAxCJOP2PPR3/NNDziif0S5tV+TP7jTuFgBAFuxJmO8Qp
DMifsVTmPuekGn5rPATgPeefEiZvkRDNONkBFN8yM764a/NHNgyUTx2tr5QY/57E
fMmA108T240dCtoPr4ihHfKaSvC41TfUnFh2M1giQKjPfRBJecUufs7NGQUC36Rq
R3UXZSItiaJbxCBzkwBlvB50yMzdPoiCQkjnvVvj3eXQyJpNr3I=
=gX1W
-----END PGP SIGNATURE-----

--=-5nTz1xutm+1H/Rmt7D0L--



--===============1051744528515093746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1051744528515093746==--
