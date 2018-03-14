From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH 0/6] Using GitLab CI for build testing
Date: Wed, 14 Mar 2018 08:28:45 -0500
Message-ID: <2070f883-d4ae-8063-b7e5-61c8538af8d8@cardoe.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <CAFLBxZYWgajgoma0e_R_u2KzXwb6C4j-BqkTUTZ-hxkiaPjJsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8735711373520118624=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZYWgajgoma0e_R_u2KzXwb6C4j-BqkTUTZ-hxkiaPjJsQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8735711373520118624==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FO6NqX1qOUfiqzCHbPuChkJlhpC2Ertlg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FO6NqX1qOUfiqzCHbPuChkJlhpC2Ertlg
Content-Type: multipart/mixed; boundary="ILLAV46NtFITLtTHTGyc7Sf7aqHjN3fez";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <2070f883-d4ae-8063-b7e5-61c8538af8d8@cardoe.com>
Subject: Re: [Xen-devel] [RFC PATCH 0/6] Using GitLab CI for build testing
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <CAFLBxZYWgajgoma0e_R_u2KzXwb6C4j-BqkTUTZ-hxkiaPjJsQ@mail.gmail.com>
In-Reply-To: <CAFLBxZYWgajgoma0e_R_u2KzXwb6C4j-BqkTUTZ-hxkiaPjJsQ@mail.gmail.com>

--ILLAV46NtFITLtTHTGyc7Sf7aqHjN3fez
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/14/18 4:45 AM, George Dunlap wrote:
> On Tue, Mar 13, 2018 at 3:31 AM, Doug Goldstein <cardoe@cardoe.com> wro=
te:
>> Really early work on switching over to using GitLab CI over
>> Travis CI. GitLab is a competitor to GitHub with some advantages
>> such as an integrated CI system with a lot more flexibility
>> and control. It additionally is fully open sourced unlike GitHub
>> and Travis CI. We can even run an instance if that is preferred
>> over using the hosted instance.
>>
>> This change uses GitLab CI's ability to use Docker based runners
>> for running tests. With GitHub we also use a Docker based runner
>> but we are limited to one Docker container that is then morphed
>> a number of different ways. With this approach we can specify
>> different Docker containers for every run (or use the same). By
>> using different Docker containers we can build environments that
>> match systems where Xen can and should build. Using this
>> approach we should be able to cutdown on the number of surpise
>> build failures encountered by users.
>>
>> An example run can be seen here:
>> https://gitlab.com/cardoe/xen/pipelines/18789907
>>
>> If there is interest in this I will move it over to the "xen-project"
>> name space in the next version.
>>
>> Doug Goldstein (6):
>>   ci: add Dockerfile for CentOS 7.2
>>   ci: add Dockerfile for Ubuntu 14.04
>>   ci: add Dockerfile for Ubuntu 16.04
>>   ci: add Dockerfile for Debian jessie
>>   ci: add cfg to use GitLab CI to build
>>   ci: add a README about the containers
>>
>>  .gitlab-ci.yml                          | 34 ++++++++++++++++++++++-
>>  extras/testing/README.md                | 29 ++++++++++++++++++-
>>  extras/testing/centos/CentOS-7.2.repo   | 35 ++++++++++++++++++++++-
>>  extras/testing/centos/Dockerfile.7.2    | 41 ++++++++++++++++++++++++=
++-
>>  extras/testing/debian/Dockerfile.jessie | 21 +++++++++++++-
>>  extras/testing/ubuntu/Dockerfile.trusty | 21 +++++++++++++-
>>  extras/testing/ubuntu/Dockerfile.xenial | 21 +++++++++++++-
>=20
> "extras" is a bit generic.  What about something like "automation/build=
"?
>=20
> (You knew this bike shed wasn't going to get in without *some*
> discussion of the color!)
>=20
>  -George
>=20

Ha. Thank you. So in the same thread I'll move the helper script that
the CI will use into "automation/scripts"? Currently we have
"scripts/travis-build" but there are going to be some more (specifically
for ARM)

--=20
Doug Goldstein


--ILLAV46NtFITLtTHTGyc7Sf7aqHjN3fez--

--FO6NqX1qOUfiqzCHbPuChkJlhpC2Ertlg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqpI41fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1igg/+LzHvgBgU0eZXJGgVnhEPUspQPBGyApJ8813GB7dm62VRYx5ESX34Qj32
CnB0VH6ukzlqtwRvzISeQPTL6xduvvMa1+ECQ+Fr7Vi9pmrBHdHbiVHjFGQ/Un6X
kMHhPKPpyZhDXlQfJ+4P7hdYVzBLa0Mh2I9qBmpfb5KUaMre/uSYmfW53pLpLsL4
ukIo41Tz9I6NcNwcbL25EpbmhGbyg1QDMxfom1pw+ZEqR8dj3c24f4u17LvM1aot
VJJemx6SULK47tkADr5TxUfVkn6ezrciRGiCS66+sknvdAUsv0JatgzE7ohP7PuD
u2bRQR4P2pbfD9yNmWkrnDFiWWTr97LAzdfNcY2hXsqsNG43Qusr5crjTqWFB/3K
gge5jgb8E/0CC2G6UgoGMt+K4f59asVIbOwTRcYOdCChLjovFmoY8GrfYU//4bc0
MYgPGBUNgT6e4Jly07hObWUNdxLaJHAZoc3jhVDZdaIqycu7ryoUS46sxqopLTns
lUL2y4oLUrq/1yEpGv5lLFXBl+PxIampoNouL6zpNh1lqZMOFT6izC8TTGUHJwbZ
wisRLqCCrzR6gzl4H9cz5amWZ/f0/yyuWnHKfrwwJ3xt2Snoqn9a17FZbxWnKvhI
atCPGh913RXQKornahnC6ipn4+8wO6QvOZ7bx2p8a3XQnP7jGz0=
=Ccfh
-----END PGP SIGNATURE-----

--FO6NqX1qOUfiqzCHbPuChkJlhpC2Ertlg--


--===============8735711373520118624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8735711373520118624==--
