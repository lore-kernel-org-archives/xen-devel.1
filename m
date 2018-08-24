From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: L1TF, and future work
Date: Fri, 24 Aug 2018 11:15:32 +0200
Message-ID: <4a76f789c59f2b580d868e101d9d6cf0a538c660.camel@suse.com>
References: <4dad178a-91c7-c328-9bc5-4362945d4725@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6803183971872044990=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4dad178a-91c7-c328-9bc5-4362945d4725@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>
Cc: Juergen Gross <JGross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Dario Faggioli <dario.faggioli@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Xen Security <security@xen.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6803183971872044990==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Wi5RBNZuxcEYz7cBKdFw"


--=-Wi5RBNZuxcEYz7cBKdFw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-08-15 at 14:17 +0100, Andrew Cooper wrote:
> Hello,
>=20
> Now that the embargo on XSA-273 is up, we can start publicly
> discussing
> the remaining work do, because there is plenty to do.  In no
> particular
> order...
>=20
>=20
> [...]
>
> 5) Core-aware scheduling.  At the moment, Xen will schedule arbitrary
> guest vcpus on arbitrary hyperthreads.  This is bad and wants
> fixing.=20
> I'll defer to Dario for further details.
>=20
Yes. So, basically, making sure that, if we have hyperthreading, only
vCPUs from one domain are, at any given time, concurrently running on
the threads of a core, acts as a form of mitigation.

As a reference, check how this is mentioned in L1TF writeups coming
from other hypervisor's that have (or are introducing) support for this
already:

Hyper-V:
https://support.microsoft.com/en-us/help/4457951/windows-server-guidance-to=
-protect-against-l1-terminal-fault

VMWare:
https://kb.vmware.com/s/article/55806

(MS' Hyper-V's core-scheduler is also mentioned in one of the Intel's
documents=20
https://www.intel.com/content/www/us/en/architecture-and-technology/l1tf.ht=
ml
 )

It's not a *complete* mitigation, and, e.g., the other measures (like
the L1D flushing on VMEnter) are still required, but it helps
preventing the issue of a VM being able to read/steal data from another
VM.

As an example, if we have VM 1 and VM 2, with four vCPUs each, and a
two core system with hyperthreading, i.e., cpu 0 and cpu 1 are threads
of core 0, while cpu 2 and cpu 3 are threads of core 2, we want to
schedule the vCPUs, for instance, like this:

cpu0 <-- d2v3
cpu1 <-- d2v1
cpu2 <-- d1v2
cpu3 <-- d1v0

and not like this:

cpu0 <-- d1v2
cpu1 <-- d2v3
...

Of course, this means that, if only d1v2, from VM 1, is active and
wants to run, while alle the four vCPUs of VM 2 are active and want to
run too, we can end up in this situation:

cpu0 <-- d1v2
cpu1 <-- _idle_
cpu2 <-- d2v1
cpu3 <-- d2v3

wanting_to_run: d2v0, d2v2

I.e., there are ready to run vCPUs, there is an idle pCPU, but we can't
run them there. This is not ideal, but is, at least in theory, better
than disabling hyperthreading entirely. (Again, these are all just
examples!)

Of course, this makes the scheduling much more complicated, especially
when it comes to fairness considerations and to avoiding starvation.

I do have an RFC level patch series, for starting implementing this
"core-scheduling", which I have shared with someone, during the
embargo, and that I will post here on xen-devel later.

Note that I'll be off for ~2 weeks, effective next Monday, so feel free
to comment, reply, etc, but expect me to reply back only in September.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-Wi5RBNZuxcEYz7cBKdFw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlt/zLYACgkQFkJ4iaW4
c+59UA/+NG3Aym+HH4F/XBVyc/arUaDyi4KYZU9r5wXB2OAbRrtQqJs8EKtzW9js
2NktWO5PqZosAtlV0KFOlAPaWEfV/IOO+2GPCklTNp3uNYWZIdVhtdG7Hdncf8ax
9vaiu0rLfhzpwTWA3L6RORJ0fwYU/Ksq9YsnSK6s1KPgVltPz6nfrZVlYQm3iGJa
9p4CNdt2CDsmk48tTYHrVsTMimvvkIgm056aeDJ73tYAufmcEhkHD3IsJHgNmsFF
PfREPs8apbj97HvYEPw1weeXke5yAosT8y8DwNQN+70Y55XPF2Y566py673bU5kL
Xr6keMkNMJsgUUutmMjTw/94Lu/mpNCD+r/y9HrQm3d+My+TJ5F35zrFMAAs6zIO
tVi27cYLaQvaRyNyAewLWETOSMquf4mG/+AxI35j1kFLWzjpAT2LOg5Idy0EWs8u
vdLojlO2R6aYSt8vIbxx4wDjqPFkWf4fCvugGshXOEkdpncoDgcCC512+fuO8VLi
WawnMMLVOULX9f6EontO7Y+62ouZF1jcpd5iNi0thfnt+dlo+sp4WmgqktwUW9Cy
+MoinZx8pdm0ZJOZjlGWncfmPNtlsAySGYeSZD/zYhZwmUU201ve5IKCdBAiMYQy
kkcO4F2XXYev8Dk0TcvGF8+g5jPcug2NMLZrpjiAj1vYlAgV1pI=
=vFZI
-----END PGP SIGNATURE-----

--=-Wi5RBNZuxcEYz7cBKdFw--



--===============6803183971872044990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6803183971872044990==--
