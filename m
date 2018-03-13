From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH 6/6] ci: add a README about the
	containers
Date: Tue, 13 Mar 2018 11:12:41 -0500
Message-ID: <045292bb-bd15-dbac-aa23-1b97af602028@cardoe.com>
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <38ba2257035d0ca0eb1dbc488f9ca8ec3f03ed88.1520911150.git-series.cardoe@cardoe.com>
 <674191fe-511c-fd04-a75e-3420e04a0e95@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8966644207815845089=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <674191fe-511c-fd04-a75e-3420e04a0e95@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8966644207815845089==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="PaJ2EQAPXRkwFgaZq2uHuHAu5M4eML32y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PaJ2EQAPXRkwFgaZq2uHuHAu5M4eML32y
Content-Type: multipart/mixed; boundary="SbBSebRssKx6v5FlYlFawih4seXBnhL2E";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>
Message-ID: <045292bb-bd15-dbac-aa23-1b97af602028@cardoe.com>
Subject: Re: [RFC PATCH 6/6] ci: add a README about the containers
References: <cover.fc61971d5999dddd95c2bee5d18d572bfcc28399.1520911150.git-series.cardoe@cardoe.com>
 <38ba2257035d0ca0eb1dbc488f9ca8ec3f03ed88.1520911150.git-series.cardoe@cardoe.com>
 <674191fe-511c-fd04-a75e-3420e04a0e95@citrix.com>
In-Reply-To: <674191fe-511c-fd04-a75e-3420e04a0e95@citrix.com>

--SbBSebRssKx6v5FlYlFawih4seXBnhL2E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/13/18 10:38 AM, George Dunlap wrote:
> On 03/13/2018 03:31 AM, Doug Goldstein wrote:
>> Add a basic README explaining the containers and how people can use th=
em
>> to locally test with if they see an error in CI and want to reproduce =
it
>> locally.
>>
>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>> ---
>>  extras/testing/README.md | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 extras/testing/README.md
>>
>> diff --git a/extras/testing/README.md b/extras/testing/README.md
>> new file mode 100644
>> index 0000000..0908a66
>> --- /dev/null
>> +++ b/extras/testing/README.md
>> @@ -0,0 +1,29 @@
>> +Docker Containers
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +These Docker containers should make it possible to build Xen in
>> +any of the available environments on any system that supports
>> +running Docker. They are organized by distro and tagged with
>> +the version of that distro. They are available from the GitLab
>> +Container Registry under the Xen project at:
>> +
>> +registry.gitlab.com/cardoe/xen/DISTRO:VERSION
>=20
> If we were to check something like this into the upstream tree, it woul=
d
> be better if this were some sort of official Xen account (of which I'd
> be happy for you to be the maintainer).  Is that possible?

Yep. I mentioned in the cover letter that if people gave me a +1 I'd
move it over to the "xen-project" tenant. I've already registered it to
reserve it for us to move forward with this if we so decide.

>=20
> Other than that, this looks really good.  As you say, having FreeBSD
> would be a good thing to add, and with my CentOS hat on, I'd like to ad=
d
> a hook to build the CentOS Virt SIG packages against master as well (so=

> that I could get early notification of issues).

Totally agree. I ultimately want to have every environment that's
supported / used run through this loop. I'm just going to need some help
enumerating them all out.


--=20
Doug Goldstein


--SbBSebRssKx6v5FlYlFawih4seXBnhL2E--

--PaJ2EQAPXRkwFgaZq2uHuHAu5M4eML32y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqn+HlfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3fQhAAwDUkFzerfmubl7ueqg2aZbixZ5j3TOdJWepk9oqUIDOdecNmVLao8gYu
owIlbU7L4mJhnoAkXL5TiOHLa09X2w5qEzENht9xhRbNbFglCB5gCPv5PzKzsWDY
Pe+yB2N9kHy6hvoaBX+iUVjQCG5fueNEyvGFTVkornrZgPQAyjNVvKGbtQ7hqbmv
/jrgUXXQI6qYppBLXC/uy2MMKwfyN/nYtJPmQQUQrJaV3CgZOv7k/KXHPJpaImET
2CKhx2D9E9zTg7WxhSdrXPPlJfuX7lM+Pn80dZ+YeNlQa5/dMa0j3kxA6F9KXEnh
ni5PkmWCEQlTH4uABqVblyyRam+yjuu7REjrXoEnW8kxCXq3amE3sTyben2Hu7eu
/PJLC6zEGi6HyiMLKatuQP62UynUQXxftxEaVlTiUt3XmSMePiTWs/rMr63gNvCw
a+sWte5mk2EHQHlX8qPpPZUIpCmeFo/Q4AW/5xvDEbSSMygZUUtZhe+CKqhhFf+n
ow7FkgNNFoXauMcbyWCk0mK1WTdNgClpSn8aPwZZPOYml69wQ1yfQQ0fKA/ipdGS
TFLoGo5esYhInBC8BNStqoiFc1EVYT5QFY3D9Cq0iqX5Fa0iTs+weXEM5F9dhkgF
Q5zjcg+FpDhlmccitWk6uII2L2Bhyvn3yPWDcAOoXjuI5DU6y1k=
=2Mpl
-----END PGP SIGNATURE-----

--PaJ2EQAPXRkwFgaZq2uHuHAu5M4eML32y--


--===============8966644207815845089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8966644207815845089==--
