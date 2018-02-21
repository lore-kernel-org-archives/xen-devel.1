From: Stefan Bader <stefan.bader@canonical.com>
Subject: Ability to crash a HVM guest by accessing /dev/hpet
Date: Wed, 21 Feb 2018 15:12:15 +0100
Message-ID: <6d5172da-c4f5-a275-229d-068899b056f6@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5445845871187451309=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>
Cc: Ian Campbell <ian.campbell@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5445845871187451309==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="MylRbFvm7f3Nf4pFr7houRHpfTRFy8zMo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MylRbFvm7f3Nf4pFr7houRHpfTRFy8zMo
Content-Type: multipart/mixed; boundary="Cl5qDz1yvyAuqbQbvxBJImDy4F2cA6JX2";
 protected-headers="v1"
From: Stefan Bader <stefan.bader@canonical.com>
To: "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>
Cc: Ian Campbell <ian.campbell@citrix.com>
Message-ID: <6d5172da-c4f5-a275-229d-068899b056f6@canonical.com>
Subject: Ability to crash a HVM guest by accessing /dev/hpet

--Cl5qDz1yvyAuqbQbvxBJImDy4F2cA6JX2
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

This seems to have been found by us[1] and Citrix[2] recently. To trigger=
 this
one needs to be root in the guest, so it is not super critical but still =
it
seems to be a bit harsh that purely opening /dev/hpet read-only is leadin=
g to a
domain crash via xen/arch/x86/hvm/hpet.c@375(hpet_write):

    case HPET_Tn_CFG(0):
    case HPET_Tn_CFG(1):
    case HPET_Tn_CFG(2):
        tn =3D HPET_TN(CFG, addr);

        h->hpet.timers[tn].config =3D hpet_fixup_reg(new_val, old_val, 0x=
3f4e);

        if ( timer_level(h, tn) )
        {
            gdprintk(XENLOG_ERR,
                     "HPET: level triggered interrupt not supported now\n=
");
            domain_crash(current->domain);
            break;
        }

The default in Linux seems to be level triggered. I wonder whether there =
would
be any possible way to make this return as some error instead of blowing =
up?

-Stefan

[1] https://bugs.launchpad.net/bugs/1741409
[2]
https://bugs.xenserver.org/browse/XSO-809?focusedCommentId=3D16484&page=3D=
com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel


--Cl5qDz1yvyAuqbQbvxBJImDy4F2cA6JX2--

--MylRbFvm7f3Nf4pFr7houRHpfTRFy8zMo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJajX4/AAoJEOhnXe7L7s6jZ2UQAKhk0mo0eT5yjFyj1Dm0EgSf
6984qeH8Zx4MXNt+XBJYrIVm5kYmIeOCsEelvqI+Sf57oa68nl3KyDnfc6Mfn0ff
6Siz6B5DhTwGuEs1HCx4E/E4VTb+wbHFhCZg9jxuIjqDREtb1bmiyCNnJaZejYQ+
eQSSRCC/AqoroEJU0Z4h8qfbP1H4oFTYD2gI/S2hSeBPUNI0/vHg7OtvIICSGPTe
x0PcJOAmGkFFabPHp4B9h5sm7MeB4pCNvTJlTHD8TDpIlaAlPlF0ywbn+UX3jpzP
4UDSEVDFNMFJgKnj0F/l4xJ26PFZfPSQpMBAFC9Lqd2DtIMdZJ58K0zm4BIyiZpV
Hn2nokzlH6l1Qs8nqXS7VOM3puE6S4QUQrh90cczYfXoWOzocwdpkV77o9o/Sius
rSk56yhJWw2x+CBUmUb1FbRGT9CgFZXHvp9LtO3/bhvNdJR6W+PR3/CkV8gvViNM
6YFKQJKS82vB/96/Cs1in/PDD/Uu9UQPLO5HHTYzuZTs0t61H4x5S2iXEHFhrXCM
+bRFkHkEdqr+sGpIVJ1CYz6ZYPmhfaFngawXa40x+bdZ974W1YhENrpJvV0Bp2er
gU41bW9yiSinKPBLg5lUCL8ao0tzr3jDUaUpHvNPmxc9S6VWNrNlxc7hnodjPbU/
HVXSSu724JjtsLsCJZom
=CS/Q
-----END PGP SIGNATURE-----

--MylRbFvm7f3Nf4pFr7houRHpfTRFy8zMo--


--===============5445845871187451309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5445845871187451309==--
