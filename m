From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v2 4/4] pvh: Boot uncompressed kernel using
 direct boot ABI
Date: Wed, 2 Jan 2019 13:18:41 +0000
Message-ID: <20190102131841.GO24009@stefanha-x1.localdomain>
References: <1545422632-24444-1-git-send-email-liam.merwick@oracle.com>
 <1545422632-24444-5-git-send-email-liam.merwick@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6224804003214884961=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/c71=PK=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1gegQ3-000474-Qx
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 13:18:47 +0000
In-Reply-To: <1545422632-24444-5-git-send-email-liam.merwick@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: ehabkost@redhat.com, mst@redhat.com, maran.wilson@oracle.com, qemu-devel@nongnu.org, george.kennedy@oracle.com, xen-devel@lists.xenproject.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net, sgarzare@redhat.com
List-Id: xen-devel@lists.xenproject.org


--===============6224804003214884961==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jozmn01XJZjDjM3N"
Content-Disposition: inline


--jozmn01XJZjDjM3N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 21, 2018 at 08:03:52PM +0000, Liam Merwick wrote:
> @@ -1336,7 +1470,7 @@ void pc_memory_init(PCMachineState *pcms,
>      int linux_boot, i;
>      MemoryRegion *ram, *option_rom_mr;
>      MemoryRegion *ram_below_4g, *ram_above_4g;
> -    FWCfgState *fw_cfg;
> +    FWCfgState *fw_cfg = NULL;

What is the purpose of this change?

--jozmn01XJZjDjM3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcLLoxAAoJEJykq7OBq3PI7ZcH/2EvpccwgtnKmMLzxe6vNcJz
Hxc6hpJuTHeya07m711EZ80pJNcbCWPp3SwVDgH2eYI+ZkiqP9Ld80C7824jAn9h
UgTrsaf+8k7rHBHSv59PgbUMlRALORpUKDQaQZceg/6jmu3YONpjNTyAyxALV+OT
E9rVse1kbVBSIFB+Y/jq5kYZapadlpIOgpYa978ZNZFbuVFjNm6lNWmz4EAqyFot
fwwln5fdHNzB7U5RNOebGfidNYHuAr07/D2hG/8R6v4/3z3PL/0EXLkh6LpHBlCy
AjDkuEo9fZi7OELW+ypYEteZiUImvIaen8OOT4uqpT3F+BJ6WV+QPXo5QESvjdU=
=JSAl
-----END PGP SIGNATURE-----

--jozmn01XJZjDjM3N--


--===============6224804003214884961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6224804003214884961==--
