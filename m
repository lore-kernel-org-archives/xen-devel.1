From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] libxl: extract and save affinity maps from
 hypervisor
Date: Tue, 16 Oct 2018 20:45:08 +0200
Message-ID: <043cfed917c22e0799daa0763b431df8edbf667c.camel@suse.com>
References: <409d6789ab39c20d3c90483426e6d146ad131de1.1537546261.git-series.wei.liu2@citrix.com>
 <23494.4470.855127.777529@mariner.uk.xensource.com>
 <6eee6a89df54025bb4316a917a67b60840026725.camel@suse.com>
 <23494.9058.115538.263269@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4589138841850241248=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q9ou=m4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gCULE-0007S3-8q
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 18:45:16 +0000
In-Reply-To: <23494.9058.115538.263269@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4589138841850241248==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-msreLJW81tIBH/wWgBp7"


--=-msreLJW81tIBH/wWgBp7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-10-16 at 18:44 +0100, Ian Jackson wrote:
> Dario Faggioli writes ("Re: [PATCH] libxl: extract and save affinity
> maps from hypervisor"):
> > If on the other hand, a domain was actually explicitly specified,
> > then
> > I guess it makes sense to at least try to set it when resuming.
> >=20
> > So the point is, are we, at that time (i.e., during resume), able
> > to
> > tell whether the reason why the domain has an affinity, is because
> > the
> > user explicitly specified it? Out of the top of my head, I don't
> > think
> > we can, but I probably better have another look at the code
> > tomorrow...
> > :-/
>=20
> So I think what is needed is to save the original config-specified
> affinity (plus any updates), not fish the (probably libxl-generated)
> one out of the hypervisor.
>=20
I think that too.

Well, we probably can even fish it from Xen, but we need to save it in
a place/field which is not the one that is looked at in libxl to decide
whether or not to run placement (or, in general, decide whether or not
to use whatever libxl own default).

And then make the resume code look at that new field, rather than at
vcpu_[hard,soft]_affinity.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-msreLJW81tIBH/wWgBp7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvGMbQACgkQFkJ4iaW4
c+6Mrg//aVs+x9XMp3ZlstMzvnfR4i4SI5sqfNihR6TNb7os5hSXYdJ3B8dyC2Ea
+/cG5G8N8wONMkmkgSO+7m7LrTDC0iVVaeGh8Ymw/2ctqPRXbwX6N1sxl1JH+oPI
iwaBGIBgd2mteg3TXAJw+Ap6jGSkn/0Zmrl2DVn7iahrZnlqNq0TLTaJAVmsjP8t
85ASFJxS2YnR84TeLHwOzttMA2spDW5nTLsB5g8gpHSdGuLZQN1oJcokPpKYsUqw
0Pgkmu6w7j41cNsE2nDEGRJHEgFHAE8peobNPv5+QpJ4TcAgKSyb245HYmxq3Qmk
R/2R8CdIXCb9nbBMDQFV3dGin4vhi+LhCCTtVbNim49RB61XnD78VfKEwy5vckba
LEv5LIs5QDlHYa2jXEDNClCrpU94wmhp3/mKmGrc4h5nq7mo3At5BUFeL4XZsW7y
m5FTSHyw30FDaQ8Ynz8R9O0E/oGaxjY90jbISCAZP1ddINquU6SxRQU8sJ8KogCv
md+aLEUPeitasJ68fKYuTswqJB7iQJjJfz6H8YHsxCaN/wtBCC8JEnVO8fc31AYx
AiEXs5PQZ3YyJvPLjg7J37XNFgiHbGSfmnL+0mvFqqxZnwEUFKBoCvGz0aIoIrj2
Un3nul59i8x6xlaOPp49+kKRmP2t8Lpp5RBl2zCglCLFPHVMvuA=
=0cz3
-----END PGP SIGNATURE-----

--=-msreLJW81tIBH/wWgBp7--



--===============4589138841850241248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4589138841850241248==--
