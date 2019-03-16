From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2] xen: introduce a cpumask with all bits
 set
Date: Sat, 16 Mar 2019 01:52:30 +0100
Message-ID: <da587c8356dfcd7a9739b5985767a781d485a57d.camel@suse.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-2-jgross@suse.com>
 <3644ab6d-4247-0651-eaf3-7d88263838a7@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8036628910972981700=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KzQf=RT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h4xZP-0007TT-18
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2019 00:53:03 +0000
In-Reply-To: <3644ab6d-4247-0651-eaf3-7d88263838a7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8036628910972981700==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OnKJis3IBfuJlD4qHM8L"


--=-OnKJis3IBfuJlD4qHM8L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-14 at 10:30 +0000, George Dunlap wrote:
> On 3/14/19 9:59 AM, Juergen Gross wrote:
> > There are several places in Xen allocating a cpumask on the stack
> > and
> > setting all bits in it just to use it as an initial mask for
> > allowing
> > all cpus.
> >=20
> > Save the stack space and omit the need for runtime initialization
> > by
> > defining a globally accessible cpumask_all variable.
> >=20
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Acked-by: George Dunlap <george.dunlap@citrix.com>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-OnKJis3IBfuJlD4qHM8L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyMSM4ACgkQFkJ4iaW4
c+6NbQ//QjceXctVRQ2Mx8sopa5SRo/DOn1M6nwA6VUxH7pcX4z8CdKgZTscA99f
fqBjj53ob71Y77HOFrJgCp4LZqYlQu9MAV4svY1uqRPq98BZNbRovpzkXFaasQDx
Wjt45ryA15YsAQqz8pkGZzEfBQMLwm2mLSQ7lrcMFiagB3prGfr8lexVaOJAfzlh
IVZXE0iItR4gALyhLNc5HYTqpzji910Pv+EdGBCGYaRNzuFMnjEH0gi57anLaYB5
PupUiWgN3R1/UitWCi1zlN5V8NqV0+LQAhrEh9z/Glq5HNyDvcNoErP4pl7j59vy
nkfCkTrjCD4MQ3OsDpU6JN+LM5PeGBFRFKn9CIOsOJTXTE6lzatgiPDjww3NbbLu
FipOWL3SiwD/JIgfnfg9bektsbCvvlmuqmYvnAOlFRigKuuWdBlkJK7TeXELN5rz
7d9e2Ux8MHiSUZwO1sf+wG7U3vklqJc3UzPelBXTxI4uFqYKUVjHfwxjHxAZvBOe
+U8prvPbN2mlmsKY9TiVW/1l6j8CBmqyrP9LDJQqqkMl408sYvkOMI5vzs+PYL4f
a/YG7gtfcdAsk9z8VhSQaEEIG+OKVsClVZlSIUEhCodcstv7e8vDkxzrRmicButX
bCFRyfDMkxKXTXat7qcTZgfeskBAj5h7Fb/bNpLyN0fm37uaQFo=
=+WzZ
-----END PGP SIGNATURE-----

--=-OnKJis3IBfuJlD4qHM8L--



--===============8036628910972981700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8036628910972981700==--
