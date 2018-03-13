From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH 0/6] Using GitLab CI for build testing
Date: Mon, 12 Mar 2018 23:29:47 -0500
Message-ID: <f564c30d-add0-147d-4fd4-f7ca29225b61@cardoe.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0777036203857760612=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0777036203857760612==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="HLgBgcQeGtwfLhqAaX9LmOVr1Ru3RIpRs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HLgBgcQeGtwfLhqAaX9LmOVr1Ru3RIpRs
Content-Type: multipart/mixed; boundary="VS712tXtAHnnEzUYwRzcIsNzs7Tlakren";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Message-ID: <f564c30d-add0-147d-4fd4-f7ca29225b61@cardoe.com>
Subject: Re: [RFC PATCH 0/6] Using GitLab CI for build testing
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>

--VS712tXtAHnnEzUYwRzcIsNzs7Tlakren
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/12/18 10:31 PM, Doug Goldstein wrote:
> Really early work on switching over to using GitLab CI over
> Travis CI. GitLab is a competitor to GitHub with some advantages
> such as an integrated CI system with a lot more flexibility
> and control. It additionally is fully open sourced unlike GitHub
> and Travis CI. We can even run an instance if that is preferred
> over using the hosted instance.
>=20
> This change uses GitLab CI's ability to use Docker based runners
> for running tests. With GitHub we also use a Docker based runner
> but we are limited to one Docker container that is then morphed
> a number of different ways. With this approach we can specify
> different Docker containers for every run (or use the same). By
> using different Docker containers we can build environments that
> match systems where Xen can and should build. Using this
> approach we should be able to cutdown on the number of surpise
> build failures encountered by users.
>=20
> An example run can be seen here:
> https://gitlab.com/cardoe/xen/pipelines/18789907
>=20
> If there is interest in this I will move it over to the "xen-project"
> name space in the next version.

Worth noting another advantage is that builders can be VMs or even
physical hosts as well. So we can have a FreeBSD VM that can be a build
environment.

Further more the above link is to a GitLab pipeline, pipelines are made
of stages which are further composed of jobs. Currently the example uses
one stage called build and all the different distros are different jobs.
But there's a lot of flexibility as to what can be done here. There can
be stages that check code style or other pre-flight checks that people
may be interested. There can be stages that happen after the build stage
as well such as some simple tests (e.g. I use it to run the just built
xen.gz with an initramfs only dom0 that contains a small Alpine Linux VM
that spits out a string to an HTTP endpoint which decides that Xen build
is good enough to allow it to be merged into our testing branch).

Overall there are a lot more possibilities than what I've put together
so far.
--=20
Doug Goldstein


--VS712tXtAHnnEzUYwRzcIsNzs7Tlakren--

--HLgBgcQeGtwfLhqAaX9LmOVr1Ru3RIpRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqnU75fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1jiw/7BNHwHt1Jo+t7MvPBCJTa4i0a0u2Zs7lWkK7EMBivwiQIrLiZAld6tBzf
w1tfI4gPQvpMQIUZozF1ZIuNrYVf2hpDFL25vup0WsF6Pn6R/ADkuCZf3QmpM15h
k7Iqm3GZ0VhQ1NfV53yw9/BGh1Rhd8UCy7Pp6OV376LlZJkAIec1h8LCYczhbvPj
wxG4yZ+tvIQ+m9mNk+wCAyzKQ9v3TXEas3WxZNQ5x/OFQ9QmpagG2B3Ue6JzkeqW
6OK2+K4LSiCZxE3mLVv4WjiOAZVrgoFOqAvGzf4F7IM2WlwN8x2yDj/17U8C3da4
y98K5G4DiEUzc8f1Xm+5Q3z8eRKBJQhMktYWVD0b6DCYOsl0lGV/+24+mJdlgMv7
q9ftbiZtW/LR9wD1yzBiXv2ddGE8qOufULmv+g9eY0hqc+p8+PBOYMjxOztXcj38
OwXz37uS0Y8xru8pDOQmO4AKRujFC8Q0Pv97JiPKmIjnU9xko2+co1oyJqBMJnnl
NI0drXIZgnwPj+t4cv3iUZpqEcDV+D2YyXSJIscUHgauS7htI278Vp0Ff29F73zw
u+SrTs5lYiMI+qccP2hJZYYMg905/hQG9IW4Yo1HzFQZMI7Zv0C61BqxOfkxDvKJ
Nf7EU2xWLyS+ss/KbtLJzQFcbbmQVwFG1FU6w+AFNTe7fspEzhs=
=0Toh
-----END PGP SIGNATURE-----

--HLgBgcQeGtwfLhqAaX9LmOVr1Ru3RIpRs--


--===============0777036203857760612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0777036203857760612==--
