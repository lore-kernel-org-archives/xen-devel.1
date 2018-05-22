From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen Project Security Whitepaper v1 is ready for
 community review
Date: Tue, 22 May 2018 20:52:00 +1000
Message-ID: <13396780.xA7tpI257g@wopr.lan.crc.id.au>
References: <6011F946-60DB-4EF0-B335-5333D3F56F74@citrix.com>
 <20180518175334.GB2731@mail-itl>
 <5B03ECDA02000078001C48FA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8238734700742380092=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mtwp=ij=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fL4tx-0005ra-Ly
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 10:52:22 +0000
In-Reply-To: <5B03ECDA02000078001C48FA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============8238734700742380092==
Content-Type: multipart/signed; boundary="nextPart2950014.C1JDTk1Opr"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2950014.C1JDTk1Opr
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 22 May 2018 8:11:38 PM AEST Jan Beulich wrote:
> >>> On 18.05.18 at 19:53, <marmarek@invisiblethingslab.com> wrote:
> > Alternative workaround for this would be more frequent point releases by
> > default (maybe with ability to delay it very few commits are queued).
> > For example every 3 months. It wouldn't solve all the cases, but I think
> > will make it easier most of the time.
>=20
> Is every 3 months so much better than every 4 months? Granted we
> basically never manage to make it exactly 4 months, but on the average
> I think we're not too far off.

I think the big thing is reducing the delta between the staging branch and =
the=20
release. I can only assume that would reduce the number of issues that occu=
r=20
with patching vs release tarballs - hopefully making the security teams job=
 a=20
little easier.

That being said, if an approach of releasing a new build when we come acros=
s=20
broken patch sets for XSAs (like the current 4.9.1 vs XSAs, and prior 4.10.=
0=20
vs XSAs), then I think this part becomes irrelevant.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart2950014.C1JDTk1Opr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlsD9lAACgkQQa811Xp9
MdyvzxAAql7DkT/kLucRgb6z11jxICD/cVQ8ojyF1gHTrsJTkP963C0dVOD+vaNc
vdjAChsPwm5JArAiI+PG25OXXt3lWxEf0x60gRAfd/XXfdP2nuVX0oESkB7OVY3U
WRD5OQ1qsOFIfc/u/WeGK2P70FL05s0OcDi+89VKNz+u2MQT54mDMvdVKLEE3T2M
i9m+1GvQj0+A7UD6gu7/RNV46T3aB+6+q86uEtTeI7xAiFIPuPrfUgX2FdtNvMd1
JYkxErhg8NwvIyOS/YCsmatMXb3prNOjhxEx/xokeXKmtQTeq89Eb8VlH7jpYedA
MylRFVzFeVwAVhnhQ1TS2dVfgxOdoz5a4hvKcUMGkxd4bMSXeGz8iSyB3rSgkk7v
hayVcOdbfROsMQqJdKYdWfuGtpi4mLtwzBUfxVbQ4MADi9xoDQ8m+72/yq7lX6U8
Q0jRcafqk8oPPW1ZO+XECvvclw8z90zEhV4H4ajcsYP2z46m9NXYEhnxatBCMysj
jNRByKsQ0C4EVqEtgR65LTQgcFDaDI1TvQCgOOpv0Z1iXjfLJnFTtDQBYqg25u+B
WDI1uOM8Pap7jyyCt5F9o4whb3WOQsHiGCzRTjCjc9iQKoUY/MZcGGzvlBz9j7w5
BmoxRzW5nI5E40dAZqYmRKJYMAdsYX2j5Ui4oCwKB2eyVGvfPYg=
=I9Ov
-----END PGP SIGNATURE-----

--nextPart2950014.C1JDTk1Opr--





--===============8238734700742380092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8238734700742380092==--
