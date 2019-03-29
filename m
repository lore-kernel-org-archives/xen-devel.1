From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 6/6] xen/sched: don't disable scheduler
 on cpus during suspend
Date: Fri, 29 Mar 2019 18:36:14 +0100
Message-ID: <f52c17447e12b939ebbb50d85ee631bc61565dbf.camel@suse.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <20190328120658.11083-7-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6261538477065733956=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9vQU-0001Qd-2o
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 17:36:22 +0000
In-Reply-To: <20190328120658.11083-7-jgross@suse.com>
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


--===============6261538477065733956==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HTpZ5WUlOSujg9f6KKGc"


--=-HTpZ5WUlOSujg9f6KKGc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-28 at 13:06 +0100, Juergen Gross wrote:
> [...]
>
> Avoid all other scheduler dealloc - alloc dance when doing suspend
> and
> resume, too. It is enough to react on cpus failing to come up on
> resume
> again.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-HTpZ5WUlOSujg9f6KKGc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeV44ACgkQFkJ4iaW4
c+5cxxAAyF4mhD28PhNaZTM+neJL5hGqsKM/ifHH8jRedNogMjJqNh3sGWqJbKfX
+uw3QNV8B6f57FxlKD2GQj8626UQeVUVLpyy8dbD1C/s7kQBMUYCQ28agNTFFcSL
37Tg3c6ajR2GwAyJVMEc5uD7N/P5iEuZzMGLWrNavvreV9e8HIUh8QXFvIrJ6Acp
CiET2vzAcDVDx/MYOE1MDk83aEMqy+gwdogM3ktc5WoAUPzIq8GekyQYueqc4Jef
h12KQalqJVZ9nYZ5xOxS8OsYOBqiLMLO91/MEmiurwn4369I/yTFSeWTpNnYZ6xY
kdkCMcXc6vom4K4t7ebOZwj02cERACI8U3+hE7gdZ+XNX32nXqOfh2o+9mkHWewO
5ZIRnVWXg233DDJXBY2GXL7VQuhmfRwMQ+0SkXASaSkN5Xge7rCyj0htZpEVvVlR
/F3S7IwgIY7LNPlRNMDXQjW6Sws1ig/gciR9HwJ8dB/6yrxNsbTRTmJ4nIqd8zBz
csva40sTDLs8OESaPpSdbOQAs+KPQlpof7jubnh5zfGs79puGJGO/5SMSoNQnQ/L
s056Mf1AL1FHivZRs7gjj5Yt9pz9/jQpS0vyW8dvuU7rwLLWu8LWx07caN6fCAf8
4oYp3s17ZOpZ+AgeAIiXdKFOoWi7R4sjKsKHA99nrrVDVvT9G8Y=
=mxUW
-----END PGP SIGNATURE-----

--=-HTpZ5WUlOSujg9f6KKGc--



--===============6261538477065733956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6261538477065733956==--
