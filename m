From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Resume from suspend to RAM broken when using early
 microcode updates
Date: Wed, 11 Apr 2018 11:48:00 +0000
Message-ID: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5942728723879895275=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lz4q=ha=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f6EEP-00051M-RT
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 11:48:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5942728723879895275==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="HvsWX5uFCI1L7suDBz1pboGXuxizbsLeF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HvsWX5uFCI1L7suDBz1pboGXuxizbsLeF
Content-Type: multipart/mixed; boundary="6GBW8cWSzeSY4HDo7XlWQ17gSgPs1cSLQ";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c91218e2-d793-4e1d-343f-c4a566e66b47@invisiblethingslab.com>
Subject: Resume from suspend to RAM broken when using early microcode updates

--6GBW8cWSzeSY4HDo7XlWQ17gSgPs1cSLQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

when I use early microcode loading with the microcode update with the
BTI mitigations, resuming from suspend to RAM is broken.

Based on added logging to enter_state() (from power.c) it doesn't
survive the local_irq_restore(flags) call (at least a printk() after the
call doesn't output anything on the serial console).

I guess that some irq handler tries to use IBRS/IBPB. But the microcode
is only loaded later.

If I simply move the microcode_resume_cpu(0) directly before the
local_irq_restore(flags) everything seems to work fine. But I'm not sure
if this has unintended consequences.

I tested the above with Xen 4.8.3 from Qubes which includes the BTI and
microcode patches from staging-4.8. AFAICS there are no commits which
changes the affected code or other commits which sound relevant so this
probably affected also all the newer branches.

Simon


--6GBW8cWSzeSY4HDo7XlWQ17gSgPs1cSLQ--

--HvsWX5uFCI1L7suDBz1pboGXuxizbsLeF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrN9gcACgkQkO9xfO/x
ly+fNw/+IJHfW7yDf/GF3BOG1Q+rLkEMlvzTKnIYrdhjEXBW47RtCLY/aDG8SMJh
mT7l8YSaT60BsqzUBsbP/TYb2LTAhXdmKQlX4nm6uBKediABj88/75lHVZ2oNltk
7f8fqyy/CT6NgEDRgoC4JVCfHLQwfzrlPyGxdM6YL3K664EYaJ5xnl4ls1DKnSor
JKiMVLA6YDkSPCZH25BUj1YkZNbtaBmD7Uyfh2xV0yjrp+v8SRsv3VKTJ0cGvLZ0
GB3bWjCkuLu7rQGb5MHTxYkIQKd+fRLIx2TPIzi30bRlBBuKJTD+9E2D9irEzzQW
WhfGSVhLQvnyMvuiNCrkfOnpvYHu5oKiTKBxO0q2DOtHVp/Xv79tJLcA0a2JKLIe
1KQEvhNpY2Bkt/PFZJpX+ZnyocOHxpgYrXQK+jFywyp0tvgaIAvlIf95lTmbp2Dz
nDJMShXWMrDEsNqGJjMf3+I9HCKH6HBpnLdP5y7H7LoLZNKl2HYnia5lcX71zgTp
617AJY5X/XQv9ZDw7HeNtJINc20jJAgVIiIhGw5KjBHXz+0q1MhZsxsSJvlrnjVV
wyKI2ifc9UdfyI2NnCK9iq6k6iP4xWDeW7m8uudt4LMAaILrjqWkdrxz0bZyS5dy
6eceVnjARSEJPOBYGN1WpA9rDtn1IPN9+YjXj0ylWhihJ+6yaRA=
=LNhn
-----END PGP SIGNATURE-----

--HvsWX5uFCI1L7suDBz1pboGXuxizbsLeF--


--===============5942728723879895275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5942728723879895275==--
