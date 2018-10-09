From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen optimization
Date: Tue, 09 Oct 2018 18:46:17 +0200
Message-ID: <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2332972835945156758=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fq0i=mv=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g9v9L-0001Ik-Qn
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 16:46:23 +0000
In-Reply-To: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>, xen-devel@lists.xenproject.org
Cc: Meng Xu <xumengpanda@gmail.com>, Julien Grall <julien.grall@arm.com>, sstabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org


--===============2332972835945156758==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Zo5eIRlni5GkYvZuqOcX"


--=-Zo5eIRlni5GkYvZuqOcX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-10-09 at 12:59 +0200, Milan Boberic wrote:
> Hi,
>
Hi Milan,

> I'm testing Xen Hypervisor 4.10 performance on UltraZed-EG board with
> carrier card.
> I created bare-metal application in Xilinx SDK.
> In bm application I:
>            - start triple timer counter (ttc) which generates
> interrupt every 1us
>            - turn on PS LED
>            - call function 100 times in for loop (function that sets
> some values)
>            - turn off LED
>            - stop triple timer counter
>            - reset counter value
>=20
Ok, I'm adding Stefano, Julien, and a couple of other people interested
in RT/lowlat on Xen.

> I ran this bare-metal application under Xen Hypervisor with following
> settings:
>     - used null scheduler (sched=3Dnull) and vwfi=3Dnative
>     - bare-metal application have one vCPU and it is pinned for pCPU1
>     - domain which is PetaLinux also have one vCPU pinned for pCPU0,
> other pCPUs are unused.
> Under Xen Hypervisor I can see 3us jitter on oscilloscope.
>=20
So, this is probably me not being familiar with Xen on Xilinx (and with
Xen on ARM as a whole), but there's a few things I'm not sure I
understand:
- you say you use sched=3Dnull _and_ pinning? That should not be=20
  necessary (although, it shouldn't hurt either)
- "domain which is PetaLinux", is that dom0?

IAC, if it's not terrible hard to run this kind of test, I'd say, try
without 'vwfi=3Dnative', and also with another scheduler, like Credit,
(but then do make sure you use pinning).

> When I ran same bm application with JTAG from Xilinx SDK (without Xen
> Hypervisor, directly on the board) there is no jitter.
>=20
Here, when you say "without Xen", do you also mean without any
baremetal OS at all?

> I'm curios what causes this 3us jitter in Xen (which isn't small
> jitter at all) and is there any way of decreasing it?
>=20
Right. So, I'm not sure I've understood the test scenario either. But
yeah, 3us jitter seems significant. Still, if we're comparing with
bare-hw, without even an OS at all, I think it could have been expected
for latency and jitter to be higher in the Xen case.

Anyway, I am not sure anyone has done a kind of analysis that could
help us identify accurately from where things like that come, and in
what proportions.

It would be really awesome to have something like that, so do go ahead
if you feel like it. :-)

I think tracing could help a little (although we don't have a super-
sophisticated tracing infrastructure like Linux's perf and such), but
sadly enough, that's still not available on ARM, I think. :-/

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-Zo5eIRlni5GkYvZuqOcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlu821kACgkQFkJ4iaW4
c+7fuQ//f5F5BlGuctLG1YXb9U24iODoY1yqgm2Rt4P+KkTmOzwwsj3TMFmo8JhR
1LDf4ZHZOODrFNNkLalHvOKv5DKC5tEpplYT88QMzicyi/AI+VM8zE1kBJsFXgbC
vkSIbojJ2MXPsfyZAwSmEGI8cU+Y+DlTbRPwsmAAX9nQXcWrbanbsGhU9xTE8e+h
/AZ0ebQ7Ozs8rBkktqYQubqyNfYSYasBEyI6la45BT84gwaznBBhkwsgvVagcN6C
fR2Aqz96M+vfwn0rFoXOCF4sB3EZxIx6M3MzrBiWasVgKai0omsz9oppe8QgLZhO
DqHl5R8jgkWxLprpEh853rYL8xW5noR2sp4MB1tbswHbf5iZghzxeUkFnVh3v46M
6Sh573aknGjUs3iDLVGZF8Tu0JWhDIiveIpFe9hi8mbLch+dYrGatEdS1oqcgx/f
zaHzDJzLxGUADmMFXl4KTPVkxzQh8hfdv0nCD1K0VlewhSolIFEp4BNUvzD6vrE5
Y1Y7ut2iQZZZt1OiaZFREkiwZtezIrxWN12MicbgZq/MhCSf2mmpz5XKQmlwbDBN
MFUBNiG+YpoL5BK4upEdRVrwJKLFqssBdk88lMJQNpPtAzcWasxpRG4PSpHxcxp0
lN8T/N2MxI3cSf5xBRl2Z/Uhpj/iancJtdzKmiTjB1lsxUH5aFU=
=ggTq
-----END PGP SIGNATURE-----

--=-Zo5eIRlni5GkYvZuqOcX--



--===============2332972835945156758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2332972835945156758==--
