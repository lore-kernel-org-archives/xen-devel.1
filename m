From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Thu, 30 Aug 2018 12:42:43 +0200
Message-ID: <20180830104243.GB20226@aepfle.de>
References: <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
 <20180830081034.GA20226@aepfle.de>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <5B86773A0200004903F324A0@prv1-mh.provo.novell.com>
 <5B87A68A0200001C04E5493A@prv1-mh.provo.novell.com>
 <5B87A97D02000078001E3674@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0156443399935675856=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ntoh=ln=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvKPb-0005Za-DQ
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 10:42:51 +0000
In-Reply-To: <5B87A97D02000078001E3674@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============0156443399935675856==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, Jan Beulich wrote:

> approach): One is Paul's idea of making null_handler actually retrieve
> RAM contents when (part of) the access touches RAM. Another might

This works for me:

static int null_read(const struct hvm_io_handler *io_handler,
                     uint64_t addr,
                     uint32_t size,
                     uint64_t *data)
{
    struct vcpu *curr =3D current;
    struct domain *currd =3D curr->domain;
    p2m_type_t p2mt =3D p2m_invalid;
    unsigned long gmfn =3D paddr_to_pfn(addr);
    struct page_info *page;
    char *p;

    get_gfn_query_unlocked(currd, gmfn, &p2mt);
    if ( p2mt !=3D p2m_ram_rw )
    {  =20
        *data =3D ~0ul;
    }
    else
    {  =20
        page =3D get_page_from_gfn(currd, gmfn, NULL, P2M_UNSHARE);
        if ( ! page )
        {
            memset(data, 0xee, size);
        }
        else
        {
            p =3D (char *)__map_domain_page(page) + (addr & ~PAGE_MASK);
            memcpy(data, p, size);
            unmap_domain_page(p);
            put_page(page);
        }
    }
    return X86EMUL_OKAY;
}

Olaf

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4fKHwAKCRBdQqD6ppg2
ftA1AJ4iHCOfKve6dVwea7Zuz8j4Tv5XTwCgjx9usDkvKfHgsipMDgEMu2SOi30=
=glX9
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--


--===============0156443399935675856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0156443399935675856==--
