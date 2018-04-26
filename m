From: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 01/16] checkpatch: Add xendevicemodel_handle
 to the list of types
Date: Thu, 26 Apr 2018 09:21:40 -0500
Message-ID: <0b6d4152-f949-6c7a-6855-baa8e7124407@redhat.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-2-git-send-email-ian.jackson@eu.citrix.com>
 <23265.45771.760936.993507@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2905397196035071654=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=f6am=hp=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1fBhmM-0007aj-4v
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 14:21:46 +0000
In-Reply-To: <23265.45771.760936.993507@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Markus Armbruster <armbru@redhat.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2905397196035071654==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lmyUUm0ZaacsFGyYKsFAJfFuW70UXRhPY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lmyUUm0ZaacsFGyYKsFAJfFuW70UXRhPY
Content-Type: multipart/mixed; boundary="UFBl6c1T4Q5bco66lKJKQ4Uk5vI9S64Vy";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Ian Jackson <ian.jackson@citrix.com>, qemu-devel@nongnu.org,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0b6d4152-f949-6c7a-6855-baa8e7124407@redhat.com>
Subject: Re: [PATCH 01/16] checkpatch: Add xendevicemodel_handle to the list
 of types
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-2-git-send-email-ian.jackson@eu.citrix.com>
 <23265.45771.760936.993507@mariner.uk.xensource.com>
In-Reply-To: <23265.45771.760936.993507@mariner.uk.xensource.com>

--UFBl6c1T4Q5bco66lKJKQ4Uk5vI9S64Vy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/26/2018 06:06 AM, Ian Jackson wrote:
> (expanding the CC to include everyone that get_maintainer suggests)
>=20
> Ian Jackson writes ("[PATCH 01/16] checkpatch: Add xendevicemodel_handl=
e to the list of types"):
>> This avoids checkpatch misparsing (as statements) long function
>> definitions or declarations, which sometimes start with constructs
>> like this:
>>
>>   static inline int xendevicemodel_relocate_memory(
>>       xendevicemodel_handle *dmod, domid_t domid, ...
>>
>> The type xendevicemodel_handle does not conform to Qemu CODING_STYLE,
>> which would suggest CamelCase.  However, it is a type defined by the
>> Xen Project in xen.git.  It would be possible to introduce a typedef
>> to allow the qemu code to refer to it by a differently-spelled name,
>> but that would obfuscate more than it would clarify.
>=20
> This patch has been posted in substantially similar form quite a few
> times now.  Paolo Bonzini understandably suggested that renaming the
> variable would be better but that's not within qemu's bailiwick as I
> say above.
>=20
> I think everything else in this series has a review and/or an ack.
> So I would like to send a pull request.
>=20
> Does someone want to review this patch ?  Should I drop it and just
> let checkpatch complain ?  Shold I include it in my pull request
> anyway ?

If no one has commented on what seems pretty trivial (especially since
checkpatch.pl has no official maintainer, but is more of a
"whoever-touched-it-last" file at the moment), then including the patch
in your pull request is perfectly acceptable.  As a maintainer, it is
also perfectly acceptable for you to ignore false positives from
checkpatch (although documenting it in the commit message and/or cover
letter never hurts, when you are intentionally ignoring a false positive)=
=2E

But, as there has also been a recent patch to teach checkpatch about
glib types [1], your patch makes sense (any merge conflict between your
patch and that one will be obvious to resolve).  So on that grounds,

Reviewed-by: Eric Blake <eblake@redhat.com>

[1] https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg04179.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--UFBl6c1T4Q5bco66lKJKQ4Uk5vI9S64Vy--

--lmyUUm0ZaacsFGyYKsFAJfFuW70UXRhPY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrh4HQACgkQp6FrSiUn
Q2o9Pgf/QD1GCLDjXRIcYdVkE1tpfzvGQJcBYkBcSdxDXD0r3pJr8s0AsaiHiay+
mPCJiuLasUaIsvCdorbqcS3ycTxIOerDrRb5yy32UTKYk39GPUOnzi7V9OL5pYhx
oswr365Pdm+zBkaAvcbzqh8XLYk1sfVvI4SN+8EYqpPUKmTAWxG7aW2Hrub78aBZ
NRUN2QH5yureliDU63z6TVLYGGzE2dNtiEpTdMUWDcRtXO/EuQVh9kV+xgSMEA0f
PkKM+0GuPEPkHv9vElpZWO3Y08vm2BSnyssv6lY7K2Ig6FJ68FjHB1WJkmub7HUc
rno2pHqsQ0S0s1kzvAYRys7+wNNQOg==
=sg5w
-----END PGP SIGNATURE-----

--lmyUUm0ZaacsFGyYKsFAJfFuW70UXRhPY--


--===============2905397196035071654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2905397196035071654==--
