From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: L1TF, and future work
Date: Tue, 11 Sep 2018 17:13:11 +0200
Message-ID: <337585af03f85f16e0637e1525dcdf273efd9e4b.camel@suse.com>
References: <4dad178a-91c7-c328-9bc5-4362945d4725@citrix.com>
 <4a76f789c59f2b580d868e101d9d6cf0a538c660.camel@suse.com>
 <CABfawh=irJJsc3cyW+CJX2=hd493+yMsudOGLF7koD+M-r+5Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7455986919291875006=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawh=irJJsc3cyW+CJX2=hd493+yMsudOGLF7koD+M-r+5Pg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dario.faggioli@citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, security@xen.org, dwmw@amazon.co.uk, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7455986919291875006==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xVHXD0zXK7yUFKVHLRRZ"


--=-xVHXD0zXK7yUFKVHLRRZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-09-10 at 15:45 -0600, Tamas K Lengyel wrote:
> On Fri, Aug 24, 2018 at 3:16 AM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > Note that I'll be off for ~2 weeks, effective next Monday, so feel
> > free
> > to comment, reply, etc, but expect me to reply back only in
> > September.
>=20
> Hi Dario,
>
Hi,

> once you are back from vacation, could you share the RFC patches you
> mentioned?
>=20
I did that before leaving actually. :-)

https://lists.xenproject.org/archives/html/xen-devel/2018-08/msg02164.html

I'm back now, and am working on the series again. In the meanwhile, do
feel free to share any kind of feedback or opinion.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-xVHXD0zXK7yUFKVHLRRZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluX24cACgkQFkJ4iaW4
c+5D5A/9HgxMYivbfo3xhoFGx3pvZZEDuXvHcgBPmybuqkKwfb+5TablXLuqRxBJ
768/QFkizppcQe5KcoYasip/uTLxsbDC6VUizrL24EbIIKb6fd3kZ7qm2owZS8Mo
SmT7GZ4h5iaIs5CfqIb5br5OCbIvqULjeMl63ApWm++D89Q2k3c+MB6YbpQHG+zi
pqrchGxXPD+YWj1QVOBEE6afR0eRl4WvaoypGaaDb7QTL0lOG3Ag+JXAeN/CKtmL
eoFCCH/oKxvh89dQKoRh3pJR/ITXshjluItAFocY+g3c312xyPZGHwJQxK18jwHp
kYLJo4N7SJu/wyw95SVhJY9OV/bvH57lMeM2TEOXm4+0YhYV07ea95bjDWg1zxFm
Bka1++KiucUsqIgbzPnRjs05+AVixRE29hDcXh2DfBfjgNAV8rgwTNPz2ENYQ3wn
EE87Gqe06gL9MGlvd8qjuSBDimYBLFs5DtgYbCS+5+ecyxAM00VVydMDWI5yk+5x
0Gq10ifgMReNmMJFM15GxZD2SmvohmzSWM/4DndIUT30vytRlZPRypqZbD5A1Qru
AdTzRn/lCKtXUmLWd2wwtvH1rrns0UACKUrAwrbQc7ftesUgBznaZpeSme0vr383
3odiAZ1eW3OPlcA7WqhDPIoxbh6vueFYlGhLAvQfLaxRsrfB0co=
=sbC3
-----END PGP SIGNATURE-----

--=-xVHXD0zXK7yUFKVHLRRZ--



--===============7455986919291875006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7455986919291875006==--
