From: Olaf Hering <olaf@aepfle.de>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 17:48:33 +0200
Message-ID: <20180411174833.5055c04b.olaf@aepfle.de>
References: <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <5ACE23DF0200002D03781F6A@prv1-mh.provo.novell.com>
 <5ACE483302000078001BA5FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6069077259884368772=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ACE483302000078001BA5FF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6069077259884368772==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/+A773BR.zEfbeQ5Y4pS9nlp"; protocol="application/pgp-signature"

--Sig_/+A773BR.zEfbeQ5Y4pS9nlp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 11 Apr 2018 09:38:59 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> And till now I had assumed we've taken care of them with earlier
> fixes (all 4.7 reports were with old packages, like 4.7.2 based
> ones). Can you repro this with a debug hypervisor (so we can
> both trust the stack trace and know whether any earlier
> assertion would trigger)?

I have seen it only once, with debug=3Dn.

Olaf

--Sig_/+A773BR.zEfbeQ5Y4pS9nlp
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWs4uUQAKCRBdQqD6ppg2
frjYAJ9KOxMUHVaV7JmLBOioElgz8J1FjACfZqU63+IOjhXWRgN7RuR1Rky6tPs=
=tCOL
-----END PGP SIGNATURE-----

--Sig_/+A773BR.zEfbeQ5Y4pS9nlp--


--===============6069077259884368772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6069077259884368772==--
