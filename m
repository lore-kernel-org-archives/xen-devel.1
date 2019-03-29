From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 07/49] xen/sched: fix credit2 smt idle
 handling
Date: Fri, 29 Mar 2019 19:22:35 +0100
Message-ID: <6635efeb4e40b6cd5f4f110d37efd619add16bfe.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-8-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6499078500295081185=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9w9U-0006VV-TJ
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 18:22:52 +0000
In-Reply-To: <20190329150934.17694-8-jgross@suse.com>
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


--===============6499078500295081185==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-JF+dhejIrpPNPURFSWbo"


--=-JF+dhejIrpPNPURFSWbo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-29 at 16:08 +0100, Juergen Gross wrote:
> Credit2's smt_idle_mask_set() and smt_idle_mask_clear() are used to
> identify idle cores where vcpus can be moved to. A core is thought to
> be idle when all siblings are known to have the idle vcpu running on
> them.
>=20
> Unfortunately the information of a vcpu running on a cpu is per
> runqueue. So in case not all siblings are in the same runqueue a core
> will never be regarded to be idle, as the sibling not in the runqueue
> is never known to run the idle vcpu.
>=20
> Use a credit2 specific cpumask of siblings with only those cpus
> being marked which are in the same runqueue as the cpu in question.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - use credit2 per-cpu specific sibling mask
> ---
>
FYI, I've sent my RoB to (I think) patches 1 to 7 in the other threads
where they've been posted.

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-JF+dhejIrpPNPURFSWbo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeYmsACgkQFkJ4iaW4
c+5QMRAAh8AU7HeyRAhB4R9YKd5veuw1AYls7YLRjsPPU+Wmaet+Bc/BPN/wZiHk
8m968VE7nr1FOgyqB8BunDu5So0QJyE/R44hH16pxPOkNSi8e58x5YM7cPX7xcUY
EFveUD/aRrd47xiWnJJ3LxpdqZ6YZBvw2xuM/wW8zhiOxESBPZPb/adwBQcNmEjm
9N7AdaVTRGlCiXLUCw9ktY0o4BF4GsN8SYOHbEE1IJUf+2yHqcWcYep0Mtu/qn0H
ba/Zj1i6eDU5hcxSzyTdfmEZ2SaiWaTyJyMp+YRt6SC5hiGne8x49tKwlfmDF1gR
eL1LAAY9uNMSfiC+pqbQ4doi/Zj75NJrB0ezxXzgJzCgf0+JsrILhBKp0vaoFlBC
YFSa9Xh1dKKYWPysiaACVHHK43zIaGzeR+FR3PHy4xXSNL0vHCw24kLiDeTSVseY
xwufCHNxqfIpZGu1sr3e5Lj/KC9qXvVEPUPoJGs4V1iqGa8uVOK939/MjqusAKVM
0vIhEYTDMl+Xhsp27LqevnxRBM6OkLAI7dbkOwlnXsmhUpYkkA7FZyP0nUDA698K
Mr9IhLow5BNV7xyyDMt/4yiRnxV6zEduIM5Sqk0SruQR8TY8D+R8Hn1ssLLsVYmJ
vFHSZK2sHSAtfVU8/IMBXPJV75oFpdk7zy0XJs8O+EpEO0D/zfo=
=yzpm
-----END PGP SIGNATURE-----

--=-JF+dhejIrpPNPURFSWbo--



--===============6499078500295081185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6499078500295081185==--
