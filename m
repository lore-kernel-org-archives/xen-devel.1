From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Tue, 25 Sep 2018 11:02:01 +0200
Message-ID: <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6206507257679972200=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n84c=mh=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g4jEj-0006PE-74
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 09:02:29 +0000
In-Reply-To: <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Milan Boberic <milanboberic94@gmail.com>
Cc: xen-devel@lists.xenproject.org, stefano@stabellini.net
List-Id: xen-devel@lists.xenproject.org


--===============6206507257679972200==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0eRYbdGcDym64aMfIxLp"


--=-0eRYbdGcDym64aMfIxLp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-09-24 at 22:46 +0100, Julien Grall wrote:
> On 09/21/2018 05:20 PM, Dario Faggioli wrote:
> >=20
> > What I'm after, is how log, after domain_destroy(),
> > complete_domain_destroy() is called, and whether/how it relates the
> > the
> > grace period idle timer we've added in the RCU code.
>=20
> NULL scheduler and vwfi=3Dnative will inevitably introduce a latency
> when=20
> destroying a domain. vwfi=3Dnative means the guest will not trap when
> it=20
> has nothing to do and switch to the idle vCPU. So, in such=20
> configuration, it is extremely unlikely the execute the idle_loop or=20
> even enter in the hypervisor unless there are an interrupt on that
> pCPU.
>=20
Ah! I'm not familiar with wfi=3Dnative --and in fact I was completely
ignoring it-- but this analysis makes sense to me.

> Per my understanding of call_rcu, the calls will be queued until the
> RCU=20
> reached a threshold. We don't have many place where call_rcu is
> called,=20
> so reaching the threeshold may just never happen. But nothing will
> tell=20
> that vCPU to go in Xen and say "I am done with RCU". Did I miss
> anything?
>=20
Yeah, and in fact we added the timer _but_, in this case, it does not
look that the timer is firing. It looks much more like "some random
interrupt happens", as you're suggesting. OTOH, in the case where there
are no printk()s, it might be that the timer does fire, but the vcpu
has not gone through Xen, so the grace period is, as far as we know,
not expired yet (which is also in accordance with Julien's analysis, as
far as I understood it).

> I have the feeling the problem might just be exacerbated the problem=20
> (simlar to the idle bug with credit2) by vwfi=3Dative. Milan, would it
> be=20
> possible to run the test without that option?
>=20
Indeed. And thanks, Julien, for having a look! :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-0eRYbdGcDym64aMfIxLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlup+YsACgkQFkJ4iaW4
c+7xZhAA1tOS4PzjMLRxVFMQIwjHrTSqhK9kXdSzHvY+pKMSuN+EB4yOBpbjDGsb
IJNrZdhX6fln3XogXNICtTe/jE/jEGEW9ibXIMU8bCrLzESyCMN5YWtJ4uu2jIbl
7lCYjSlsGKcr6n9nkVNnpzPPnpmhyowtVmM8gRmYIREAtFwY1DYcS07GFriVFvxe
ytgabIBDGZU+XYN78EPHEtUxiDdA/wj/plZ4VRki5IR1AN5iQJDiNLpEDddzBB0W
RD1xAdaO1js5c+ZUYd3Ol5A6zRV89skx9T+GYUDnlStZudexlqfvZpExr1L9rOh4
SFAvRVYCuG2p/rOxcP5Njfmgl35YYL3NhcfxjUal5O/yRrGN1UCUNmZyRTDxsQOv
XrO3l1eTIB62uitnRqxW7nT7YJgLFfMYccbTMqDvZlfbVLJrQFGWLvzfwAEMPX0T
kNI9wDaGDUe0FztLQT21oJKH8Zqgaw9FdEUJgxExqLLK4WL84VwsMxjfJyH8rejv
RdqgGSjng3DCRZZQWMeaUeU6VTB7rhlgWfUJ1j5LaqyVyblRJlddTW1+DTY3l7zR
qNzyD9mp+ls50UmIVnYPP7eMqq+HI39HSRYOGRko8Lq2DfQu1EV5p/yB5EA8qRoc
X2mZgA1Le5f6kSnXw5c2MNBvKCxJHO42b4nfaN0vwNdp1d2V8NM=
=TG6T
-----END PGP SIGNATURE-----

--=-0eRYbdGcDym64aMfIxLp--



--===============6206507257679972200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6206507257679972200==--
