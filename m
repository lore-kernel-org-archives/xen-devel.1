From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 14:50:03 +0100
Message-ID: <20190314145003.36695ef4.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4435298458646806054=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6KDy=RR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h4QkQ-0007X0-8f
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:50:14 +0000
In-Reply-To: <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4435298458646806054==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/rLi/uW=00/4f6cxh2NjjuBS"; protocol="application/pgp-signature"

--Sig_/rLi/uW=00/4f6cxh2NjjuBS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 13 Mar 2019 03:18:39 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> I'm sorry, but I continue to object to this adjustment getting done
> both by default _and_ not in a per-guest manner. As said before,
> you can't demand guests to run NTP, and hence you can't expect
> them to get along with a few hundred kHz jump in observed TSC
> frequency. Whether the performance drop due to vTSC use is
> better or worse is a policy decision, which we should leave to the
> admin. Hence the feature needs to be off by default, and there
> needs to be at least a host-wide control to enable it; a per-guest
> control would be better. IOW I explicitly do not agree with the
> last sentence of the commit message.

So this seems the be the essential part that prevents moving forward.

Your claim is basically that "we do not know how the workload reacts
to frequency change".
My claim is basically "there is enough evidence that syncing with
external clock is required if the frequency remotely matters".

I think that conflict can not be easily solved.

One way to solve it would be a knob that injects a value into the
proposed "vtsc_tolerance_khz" variable, leave the calculation to
the host admin, and leave code in tsc_set_info basically as is.

Maybe "xl set-params" can be the way to change the value, that way
it can be changed globally at runtime if needed.

In staging the change would affect HVM and PVH. I never ran PVH,
I have to assume it behaves like HVM in this regard.


Olaf

--Sig_/rLi/uW=00/4f6cxh2NjjuBS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIpcCwAKCRBdQqD6ppg2
fimdAJ42OPeusFZi2kKW3KrsygQS0gqTvQCdH0bd3NzJjHYtB7BYn1kV88iJ9b8=
=mqBW
-----END PGP SIGNATURE-----

--Sig_/rLi/uW=00/4f6cxh2NjjuBS--


--===============4435298458646806054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4435298458646806054==--
