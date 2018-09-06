From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen: avoid crash in disable_hotplug_cpu
Date: Thu, 6 Sep 2018 18:53:40 -0400
Message-ID: <904b8bf8-ce80-2751-04bf-de1e450ef58c__37120.6756135964$1536274275$gmane$org@oracle.com>
References: <20180906063712.28639-1-olaf@aepfle.de>
 <b7306d7f-e827-6556-e1bb-4b934a162e46@oracle.com>
 <20180906223145.37f7009b.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5005386762755522551=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n/pg=lu=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fy38W-00019f-29
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 22:52:28 +0000
In-Reply-To: <20180906223145.37f7009b.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5005386762755522551==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="auAW3TJhCbkwOPZEQCY9BtNozEvZC8EIu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--auAW3TJhCbkwOPZEQCY9BtNozEvZC8EIu
Content-Type: multipart/mixed; boundary="Qsz2hA954rg39Vg9lPeOJz7WCrKPmXf3t";
 protected-headers="v1"
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <904b8bf8-ce80-2751-04bf-de1e450ef58c@oracle.com>
Subject: Re: [PATCH v2] xen: avoid crash in disable_hotplug_cpu
References: <20180906063712.28639-1-olaf@aepfle.de>
 <b7306d7f-e827-6556-e1bb-4b934a162e46@oracle.com>
 <20180906223145.37f7009b.olaf@aepfle.de>
In-Reply-To: <20180906223145.37f7009b.olaf@aepfle.de>

--Qsz2hA954rg39Vg9lPeOJz7WCrKPmXf3t
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 09/06/2018 04:31 PM, Olaf Hering wrote:
> Am Thu, 6 Sep 2018 14:45:57 -0400
> schrieb Boris Ostrovsky <boris.ostrovsky@oracle.com>:
>
>> On 09/06/2018 02:37 AM, Olaf Hering wrote:
>>> The command 'xl vcpu-set 0 0', issued in dom0, will crash dom0:
>>> This happens because handle_vcpu_hotplug_event is called twice. In th=
e
>>> first iteration cpu_present is still true, in the second iteration
>>> cpu_present is false which causes get_cpu_device to return NULL.
>>> In case of cpu#0, cpu_online is apparently always true.
>> I think we should check both this and num_online_cpus() !=3D 0.
> This can not possibly help. cpu#0 is the first one that goes offline.
> IF cpu0_hotpluggable is broken, then only "if (!cpu) return;" can help.=



And maybe that needs to be part of the check, in addition to
cpu_is_hotpluggable() test.

Offlining CPU0 is problematic. For example, look at xen_pv_cpu_disable().=




-boris


--Qsz2hA954rg39Vg9lPeOJz7WCrKPmXf3t--

--auAW3TJhCbkwOPZEQCY9BtNozEvZC8EIu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAluRr/UACgkQit52kIbK
wbLYeRAAhsnCpb/DSHlF5gDBmxU3YHyAY7yCGZJYAtqNoQFytITDv2MupWiiVHqW
+RuAIlLD85ytK62bp/2+Fh30NnM9o6ePBTWUthotP+PS2QQ8yHiv5k0gEMzvlm7/
TMOposgvv91EKXLFHJd0xQVjHlNETN2gkajUdIfw5jx5AbKXOC46xxNcw8hlWSqP
CuZBzvC+FRCOAC4JEdOu5t9vunMbvGoj5WQuSXFgh50a7Y+ujXrRKtUvEHG2tkOw
JWJq7M+Dy/yj12/9JZdVVaNGviqGyedIUCUmYYSp/Nq7ciO+ji0kAw6ZFh12xr1T
6R6YADjWNw8LmaCn8TaI0a5gGsWx5d/Sq9oi+TM3NNgj2F1WIP+bNnTNjnOkepfr
HbLRgJgtDPor3bewPhTV30Oj5nE1YMEfphRwCIXiUTp6f8dRTUlGVAWo+f36OiN6
XWwY79v0iK2JZewp7ljlpRoTO6tZs6d5YKq7dBanoomyC/DhHNrAirrGdXmrQAaW
IDSyJayhcdHdKbr/eBlozTJfHswAkA//fTxUmMVReUOr1E+Zz5+xcRYeQ3G1EUKv
xQK5+GVnXCls885J6vlwaiFVRjc8B5SfftW7pm9IdXX8AUiVjkBFVht/oyCbjm19
ucXgbiueGZTV+hsh8UcZsLPphbYnYDD4H0s/hF6ZHLgyLf1/vNc=
=obmP
-----END PGP SIGNATURE-----

--auAW3TJhCbkwOPZEQCY9BtNozEvZC8EIu--


--===============5005386762755522551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5005386762755522551==--
