From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v7] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Sun, 1 Apr 2018 20:25:24 +0200
Message-ID: <20180401182524.GA1826@aepfle.de>
References: <20180401170318.8335-1-olaf@aepfle.de>
 <ce101031-2b1f-35ad-1b31-e0869e0370f0@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5522162096688336939=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ce101031-2b1f-35ad-1b31-e0869e0370f0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============5522162096688336939==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 01, Andrew Cooper wrote:

> On 01/04/18 18:03, Olaf Hering wrote:
> > diff --git a/tools/libxc/xc_sr_stream_format.h b/tools/libxc/xc_sr_stre=
am_format.h
> > index 15ff1c7efb..9b52f6ace6 100644
> > --- a/tools/libxc/xc_sr_stream_format.h
> > +++ b/tools/libxc/xc_sr_stream_format.h
> > @@ -121,7 +121,8 @@ struct xc_sr_rec_tsc_info
> > -    uint32_t _res1;
> > +    uint16_t vtsc_tolerance;
> > +    uint16_t _res1;
> You need to similarly tweak verify_record_tsc_info() in
> tools/python/xen/migration/libxc.py

Thanks. I think this simple change is enough?

--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -114,7 +114,7 @@ X86_PV_P2M_FRAMES_FORMAT  =3D "II"
 X86_PV_VCPU_HDR_FORMAT    =3D "II"
=20
 # tsc_info
-TSC_INFO_FORMAT           =3D "IIQII"
+TSC_INFO_FORMAT           =3D "IIQIHH"
=20
 # hvm_params
 HVM_PARAMS_ENTRY_FORMAT   =3D "QQ"
@@ -363,14 +363,14 @@ class VerifyLibxc(VerifyBase):
         if len(content) !=3D sz:
             raise RecordError("Length should be %u bytes" % (sz, ))
=20
-        mode, khz, nsec, incarn, res1 =3D unpack(TSC_INFO_FORMAT, content)
+        mode, khz, nsec, incarn, tolerance, res1 =3D unpack(TSC_INFO_FORMA=
T, content)
=20
         if res1 !=3D 0:
             raise StreamError("Reserved bits set in TSC_INFO: 0x%08x"
                               % (res1, ))
=20
-        self.info("  Mode %u, %u kHz, %u ns, incarnation %d"
-                  % (mode, khz, nsec, incarn))
+        self.info("  Mode %u, %u kHz, %u ns, incarnation %d tolerance %u"
+                  % (mode, khz, nsec, incarn, tolerance))
=20
=20
     def verify_record_hvm_context(self, content):

Olaf

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWsEkFAAKCRBdQqD6ppg2
fkBkAJ0ae/YnVuoX1tY6E0ADuTAnz4G3ggCgscaLoT71eTLcuEW6c+4btApG0cg=
=pwHH
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--


--===============5522162096688336939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5522162096688336939==--
