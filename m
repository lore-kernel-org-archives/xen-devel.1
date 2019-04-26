Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF314C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 12:59:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1472067D
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 12:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1472067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK0RS-00057B-5J; Fri, 26 Apr 2019 12:59:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9dDU=S4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hK0RQ-000576-Rs
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 12:59:00 +0000
X-Inumbo-ID: 0d047576-6823-11e9-afb4-73b008dc0dfc
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d047576-6823-11e9-afb4-73b008dc0dfc;
 Fri, 26 Apr 2019 12:58:57 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 26 Apr 2019 14:58:55 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 26 Apr 2019 13:58:37 +0100
Message-ID: <7ef54ef1a0d86efd4499e53789434641955c03db.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, George Dunlap <George.Dunlap@citrix.com>
Date: Fri, 26 Apr 2019 14:58:36 +0200
In-Reply-To: <14e58f7e-305b-9ed9-9217-2b0b489521c7@suse.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <38C4FE16-299B-4726-9BC2-9AC99D6D1F59@citrix.com>
 <14e58f7e-305b-9ed9-9217-2b0b489521c7@suse.com>
Organization: SUSE
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0324411827998080256=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426125836.BtVBjbFTQyT66z5MFgngZu0v-PZGW_ry4UHiDJey9Wg@z>


--===============0324411827998080256==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-reUegZh3VLsJ3TZLAdMC"


--=-reUegZh3VLsJ3TZLAdMC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-23 at 11:56 +0200, Juergen Gross wrote:
> On 23/04/2019 11:50, George Dunlap wrote:
> >=20
> > > On Apr 20, 2019, at 4:24 PM, Dario Faggioli <dfaggioli@suse.com>
> > > wrote:
> > >=20
> > > We can, therefore, get rid of all the `if`-s testing prev and
> > > next being
> > > different, trading them with an ASSERT() (on ARM, the ASSERT()
> > > was even
> > > already there!)
> >=20
> > Keeping in mind that ASSERT() is merely a debugging aid: suppose
> > that testing didn=E2=80=99t discover this, and a bug that violated this
> > assumption slipped into production.  Would the patched code DTRT?
>=20
> The unpatched code would already do something wrong: it would clear
> v->is_running (through context_saved()) for the running vcpu,
> potentially leading to all sorts of wrong decisions in the scheduling
> code later.
>=20
Exactly! Which basically means it's quite likely that, if we ever get
past the call to:

  return continue_running(prev)  (in schedule.c:schedule())

with next=3D=3Dprev, things will go very wrong, without the `if`-s that
this patch is killing being of much help.

And, yes, this is (micro) optimizing, but it's also an attempt to
improve the code, making it clear, for people paying with
context_switch(), that they don't have to deal with the special case of
prev and next being equal, while right now they may think they do.

Even if we decide to keep the `if`-s, I'd still like to have the ASSERT
() (and a comment explaining why we have both the assertion and the
checks).

I haven't done archaeology to find out when it was (if ever) that it
was ok to call context_switch() with next=3D=3Dprev. I can, and see about
adding what I find in the changelog, if you (George) think it could be
interesting.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-reUegZh3VLsJ3TZLAdMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzDAHwACgkQFkJ4iaW4
c+5o7A//cijtCiBFMAePUPjcnE45UPVFpnXnisSo6m7Oq3TrMHiKmg9BbI+9VrqO
JFWcsfzewiOke/P7axGB5uCYfIOyEYbGoiWlfkD1l2xr7tbz008htrazh4uhuZQS
tpfknVa+Wd4m268ub7KnVi4hi+t1YffEooOWiHt6X3WUsmMNH9dEf7ReFpKjc9dk
tfOmi3B012EhxFS/rJeVo8poZG85X1Osg5a3pPY0Pqzz5m+CUaVU2mi5kqMola7/
nTtW9Gn5SGOXMGanesraIsr4VYxIn7vpHCdGErx7FswvM7vLrzMS8g5GVZSTXfD5
N0u+Ib9qF5RjrsKgZl2ziskNfX7UWxb/jdhXeH50DouapAej0zhb7BJzRQLP1ZRM
ve3GbbIjiq9yZhKFuHixQSPAb57CaIClPtWBHdez8ASUdgrOtv8Rix/r3f+Bipfe
t0ESny9azfiPPQZyTF+VFoLX0XfFKD/4k1di9mTLvkP7/EfOSSdXn7EkUv5HcfjF
IV55Rcgf8UOIM4CW51HRAhNa/zy7yqJ3Ngy2+s9LMevqaAZF/7hVlOX3bntb6/3+
M4KIB4rOnjq2IsXxg1QGaSKkMZbTg4uwISBAxDTxO3fLhXv18+Rn8Lv/bwYMhLvV
1oyw2+Eau1MF6GhLnbgIzlmB+/C7dMaVU9P7tJdX4k7V4FiVXFE=
=evnE
-----END PGP SIGNATURE-----

--=-reUegZh3VLsJ3TZLAdMC--



--===============0324411827998080256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0324411827998080256==--


