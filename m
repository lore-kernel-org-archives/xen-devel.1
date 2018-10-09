From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Tue, 9 Oct 2018 18:42:14 +0200
Message-ID: <20181009184214.7754dc5f.olaf@aepfle.de>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <ba4e6e5f-b342-10e5-971e-1e71d50b3073@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0810996800730043376=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ba4e6e5f-b342-10e5-971e-1e71d50b3073@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFy?= =?UTF-8?B?Y3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============0810996800730043376==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/chKQlVa/oDX9gLmT4g6EGtT"; protocol="application/pgp-signature"

--Sig_/chKQlVa/oDX9gLmT4g6EGtT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for all the replies. I will work through them.
One remark now:

Am Mon, 1 Oct 2018 13:39:51 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> > With the new option the host admin can decide how a domU should behave
> > when it is migrated across systems of the same class. Since there is
> > always some jitter when Xen calibrates the cpu_khz value, all hosts of
> > the same class will most likely have slightly different values. As a
> > result vTSC emulation is unavoidable. Data collected during the incident
> > which triggered this change showed a jitter of up to 200 KHz across
> > systems of the same class. =20
> Do you have any further details of the systems involved?=C2=A0 If they are
> identical systems, they should all have the same real TSC frequency, and
> its a known issue that Xen isn't very good at working out the
> frequency.

If "identical" systems really have an identical frequency, but Xen is
unable to figure out the exact value of that frequency that it is going
to use for its calculations, why would it be a good idea in the first place
to rely on such an estimated value? If there is drift expected, shouldn't
that be handled by running ntpd inside dom0 and the domUs?

If I did that math correctly: a domU that is started with the estimated
cpu_khz value of 2666766, and is migrated to another host with the
estimated cpu_khz value of 2666755, would see 950400K fewer ticks during
a day. How many ticks actually happen, noone knows. But since that amount
of ticks represents a time span of ca. 0.3 seconds I would assume that
ntpd can handle such drift.

With larger differences, like the 200 KHz mentioned above, the drift will
be larger.


What I mean to say is: should the comparison of both hosts be based
on different metrics, instead of a plain estimated value in 'cpu_khz'?


Olaf

--Sig_/chKQlVa/oDX9gLmT4g6EGtT
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW7zaZgAKCRBdQqD6ppg2
fhmnAKDTV6XEC+WqjkiE4oYZwUyZu3T96QCdGH8J+5HSX6cl8yXG/Aoh7BBHncQ=
=Z2XP
-----END PGP SIGNATURE-----

--Sig_/chKQlVa/oDX9gLmT4g6EGtT--


--===============0810996800730043376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0810996800730043376==--
