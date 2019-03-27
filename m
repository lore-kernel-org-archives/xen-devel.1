From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 6/6] xen/sched: don't disable scheduler on
 cpus during suspend
Date: Thu, 28 Mar 2019 00:10:07 +0100
Message-ID: <cd406cd362b1af495d8f84585b8cff1b706203fe.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-7-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3352274924928127449=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9Hge-0000aM-OE
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 23:10:24 +0000
In-Reply-To: <20190318131155.29450-7-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3352274924928127449==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OqqkOF8HG7mRTinrINAF"


--=-OqqkOF8HG7mRTinrINAF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> Today there is special handling in cpu_disable_scheduler() for
> suspend
> by forcing all vcpus to the boot cpu. In fact there is no need for
> that
> as during resume the vcpus are put on the correct cpus again.
>=20
> So we can just omit the call of cpu_disable_scheduler() when
> offlining
> a cpu due to suspend and on resuming we can omit taking the schedule
> lock for selecting the new processor.
>=20
> In restore_vcpu_affinity() we should be careful when applying
> affinity
> as the cpu might not have come back to life. This in turn enables us
> to even support affinity_broken across suspend/resume.
>=20
> Avoid all other scheduler dealloc - alloc dance when doing suspend
> and
> resume, too. It is enough to react on cpus failing to come up on
> resume
> again.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Ok, I think this patch is fine.

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I guess you have tested both cpu off/on-lining and suspend/resume, or
do you need help with that? (One of my testboxes that I have here,
should be able to do suspend)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-OqqkOF8HG7mRTinrINAF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlycAs8ACgkQFkJ4iaW4
c+6SsRAAmt6/WP2ST362ZS89H1j3+eanLMnA4pA79CIXOWtZNrQLtBdZ7WA4cLml
1b3xTX9/ZIox4dnnKFW/2UrNOxn6n3FlQvmxW9Cva9q/qNHK8UcUUUgJKwPlTKEA
U0iGhmxHFjngLmt4yePzPMJdGl9sksOBLvq+R65X0N0jQ3Nd1BfHPT6mxrSfDjBP
yQlEI8MwjDhN2Tvf+XGRH6N20KIqfBJDq9yaruKJrkR1uJo7QsZNuPZk5SYIrU9N
ldptGnqy+g9GP6BTQwvkS3uo5demMqgghVMBB49O3ayp13SnCuxXItnYgeOTEnZp
5hSzE97WMWkDVvo3mNZdtGeFdvvAZvKvCNpYzZI5R23ydntFCNZTJv+hrfOo6+TJ
eDnaubtjP6uPXjZyIodhXjj5h2J7MEEM7nytAJhkLe5/bicK61vP9Mfuylm7/A8o
WSKXwGmbJYstv17ZoI8HyS2N3K9lqxsAMbt6noKRoCHbQT1h9aJ6wFCF/AMHa+0g
1uwQdGH0237ndYP7tkNGOGYodpcRyxyGsCwQL8bFRKk3ErVqMziWdT6yh0FIHk/g
dDqXL5nQqrNydDhz++6U8pJHTeyiiaqnwwZlE+xRtcb9MA+/GMcHhtfArO3t/muj
q+zCF27D3snT6ivTmE4597HEmyp40/XC/I8DYKbdqTAar362wwg=
=nFNz
-----END PGP SIGNATURE-----

--=-OqqkOF8HG7mRTinrINAF--



--===============3352274924928127449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3352274924928127449==--
