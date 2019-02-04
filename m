From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Scheduling and the periodic timer
Date: Mon, 04 Feb 2019 10:13:10 +0100
Message-ID: <65e078ba7c511e84decb7ca727c13d28bf9d5d07.camel@suse.com>
References: <2c71ac06-9d04-475b-30bc-9f87c906391a@suse.com>
 <5C5416700200007800213132@suse.com>
 <5e3d5840-9b7f-973b-749b-999731a34f45@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6718500229091206321=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/ws0=QL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gqaIo-0008Aj-2M
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 09:12:30 +0000
In-Reply-To: <5e3d5840-9b7f-973b-749b-999731a34f45@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6718500229091206321==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-z2rW9UhQ9T7upWDS8MIc"


--=-z2rW9UhQ9T7upWDS8MIc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-02-01 at 10:59 +0100, Juergen Gross wrote:
> On 01/02/2019 10:50, Jan Beulich wrote:
> > > > > On 01.02.19 at 08:26, <jgross@suse.com> wrote:
> > >=20
> > > The periodic timer is used via VCPUOP_set_periodic_timer only,
> > > and
> > > today's Linux kernel isn't using it at all. So I guess this timer
> > > not
> > > really working as it should is no big issue.
> >=20
> > Interesting. Our kernels have been using it until SLE11 SP1, as
> > did the old 2.6.18 one that all of our old kernels were derived
> > from. Yet the same code is present already in 3.2.0's schedule().
> > Are you sure this timer is meant to wake the vCPU at the set
> > rate, rather than just surfacing events if the vCPU is running?
> > Looking at vcpu_periodic_timer_work()'s calculation of the
> > next event time also suggests to me that there's no guarantee
> > that the event will indeed surface at the set rate.
>=20
> That's correct. The set rate just is the minimum time between two
> interrupts.
>=20
> The usability of such a timer is questionable in the best case IMO.
>=20
Yes, I vaguely recall discussing about this with someone, and the
outcome being <<Well, everyone should be using the single-shot timer
anyway, these days>>, and then we probably dropped the ball (I can't
find the thread right now, maybe it was on IRC). :-(

IAC, I do agree that it does not make any sense to stop the timer for
the vcpu being descheduled. And we really should either fix this... or
we can get just get rid of the timer entirely, as it's basically
delivering events at pseudo-random rate! :-O

I can look into that.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-z2rW9UhQ9T7upWDS8MIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxYAiYACgkQFkJ4iaW4
c+77EQ/+PB6s3Ep6feVzW/aKBks//hZWN9DDk0mMXdj04wX3Mr9T8p4Du2Q20pzM
wFfnPavQmmdBQ38elyKbF68eE1ZtDyBJwQXAgnelpbJkW7Coxa4rlZ2x1nxtHOL5
wkJOxn0uRjocmldNRMECqWl7TMmvv5XLz4Vs8p7MRrUywuW2U/nVSHTWQgAqEo8A
dmNbXxWbVEwp8LjH5VmypqdjMX0WioDPmyfuH/TXMXrlV2ngVwMxuxHfYQrwA7KV
ZbNrjq39sVWNqF9HM5UrLL3fzhpglhyaM/UbsnKqq+jXlHp1fb6APfFZr/0NSc4z
6LTuU53hCEt3ktUjQ7lLaDypH0asKyPjPp/e5JI7qeeM5fTtjTpT4Vt63vo77+T8
sII+xt3lL3v44c6XIIZ3thD40ELK0EvZWopwWMEARoH4kFF2AnbGEgyn1mpGsP+I
ISW5Y6vV+PiYKvIJYweFGu075QwcH/kRpyXDcSECFj8jVmOaXD3W3lNoNsidP3ZV
mazDpFlRMOvvkBCeBpbBfa3QXmFlvRdNvi4uKp6uycmdX8RTGSXSUCB+luOVWVrM
0uTfQj9dXjDt1MXFhSD6w/7PF3CF9yznJz4hNOf8ZxCUkBD9mAf8xPgmUI5IjtpL
XvBGng14HuMlnHD8W57264FTlOvf4GY584CYE21oB+uVIkPGqyw=
=+MqU
-----END PGP SIGNATURE-----

--=-z2rW9UhQ9T7upWDS8MIc--



--===============6718500229091206321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6718500229091206321==--
