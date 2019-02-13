From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Wed, 13 Feb 2019 05:31:25 -0500
Message-ID: <57352BCA-A6DC-4536-B839-C2176731DC9C@gmail.com>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <20190122141702.h3oxvr25xjxbhjcl@mac>
 <CACMJ4Gbr4dR2B7o=+i_0aCEPiXTA9nF-w477Btvv8vd_B2+mOw@mail.gmail.com>
 <20190131133931.vincqqgf4acywekz@mac>
 <CACMJ4GZ+85Hr4x8Ydt9u8zJWQLnGcDCxnWoHw3WQdqOZaZJ0gQ@mail.gmail.com>
 <20190204100712.idxj4xpvifv7yy6f@mac>
 <alpine.DEB.2.10.1902041020360.22962@sstabellini-ThinkPad-X260>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============6007982604012552437=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1qi=QU=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1gtrpA-0007CH-FA
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 10:31:28 +0000
Received: by mail-it1-x143.google.com with SMTP id y184so4696877itc.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Feb 2019 02:31:27 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1902041020360.22962@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6007982604012552437==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-E88BAF3E-8CCA-459E-962F-6390A89D4D77
Content-Transfer-Encoding: 7bit


--Apple-Mail-E88BAF3E-8CCA-459E-962F-6390A89D4D77
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Feb 4, 2019, at 13:22, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Mon, 4 Feb 2019, Roger Pau Monn=C3=A9 wrote:
>>> Yes, v7 was sent to address Jan and Julien's review comments in parallel=

>>> with our ongoing discussion on v5 macros. v7 also provided a checkpoint
>>> for Argo testers to maximize test coverage as the series converges into
>>> a Xen 4.12 merge candidate for Juergen. It addressed:
>>>=20
>>> - Jan's v6 review comments
>>> - Julien's v1 review comment
>>> - most of your xen-devel and offline review comments
>>=20
>> I think it will benefit the community to give this review in public,
>> so other reviewers know whats going on. IMO getting this private
>> review makes it harder for me (as a reviewer) to know the motivation
>> of some of the changes between versions, and likely also makes it
>> harder for you since you have to keep track of comments from multiple
>> sources on different channels.
>=20
> There is one more reason to require public comments which I have only
> learned recently: for safety certifications we need to keep a record of
> all review comments and patches that address them for traceability.

Do you mean:

(A) all _merged_ patches and their review comments

 or

(B) all comments and patches (merged or not) that address them

i.e. would the certification process be seeking traceability of safety-impac=
ting patches (code, scenario A) or decisions (including decisions to leave c=
ode unchanged, scenario B)?

If you mean (B), would we need an update to the Xen Security Problem Respons=
e Process [1]?  e.g. public archive of all comments from pre-disclosure disc=
ussion, along with content hashes stored immutably? =20

Rich

[1] https://www.xenproject.org/security-policy.html



--Apple-Mail-E88BAF3E-8CCA-459E-962F-6390A89D4D77
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-eq=
uiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"=
><span></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" conte=
nt=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"></div><div dir=3D"ltr">On=
 Feb 4, 2019, at 13:22, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini=
@kernel.org">sstabellini@kernel.org</a>&gt; wrote:</div><div dir=3D"ltr"><br=
></div><blockquote type=3D"cite"><div dir=3D"ltr"><span>On Mon, 4 Feb 2019, R=
oger Pau Monn=C3=A9 wrote:</span><br><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>Yes, v7 was sent to address Jan and Julien's review comme=
nts in parallel</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>with our ongoing discussion on v5 macros. v=
7 also provided a checkpoint</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>for Argo testers to maximize t=
est coverage as the series converges into</span><br></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span>a Xen 4.12 merge=
 candidate for Juergen. It addressed:</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> -=
 Jan's v6 review comments</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span> - Julien's v1 review comment</s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span> - most of your xen-devel and offline review comments</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>I think it will benefit the commun=
ity to give this review in public,</span><br></blockquote><blockquote type=3D=
"cite"><span>so other reviewers know whats going on. IMO getting this privat=
e</span><br></blockquote><blockquote type=3D"cite"><span>review makes it har=
der for me (as a reviewer) to know the motivation</span><br></blockquote><bl=
ockquote type=3D"cite"><span>of some of the changes between versions, and li=
kely also makes it</span><br></blockquote><blockquote type=3D"cite"><span>ha=
rder for you since you have to keep track of comments from multiple</span><b=
r></blockquote><blockquote type=3D"cite"><span>sources on different channels=
.</span><br></blockquote><span></span><br><span>There is one more reason to r=
equire public comments which I have only</span><br><span>learned recently: f=
or safety certifications we need to keep a record of</span><br><span>all rev=
iew comments and patches that address them for traceability.</span></div></b=
lockquote><div><br></div><div>Do you mean:</div><div><br></div><div>(A) all _=
merged_ patches and their review comments</div><div><br></div><div>&nbsp;or<=
/div><div><br></div><div>(B) all comments and patches (merged or not) that a=
ddress them</div><div><br></div><div>i.e. would the certification process be=
 seeking traceability of safety-impacting patches (code, scenario A) or deci=
sions (including decisions to leave code unchanged, scenario B)?</div><div><=
br></div>If you mean (B), would we need an update to the <span style=3D"back=
ground-color: rgba(255, 255, 255, 0);">Xen Security Problem Response Process=
 [1]? &nbsp;e</span><span style=3D"background-color: rgba(255, 255, 255, 0);=
">.g. public archive of all comments from pre-disclosure discussion, along w=
ith content hashes stored immutably? &nbsp;</span><div><div><br></div><div>R=
ich</div></div><div><br></div><div>[1]&nbsp;<a href=3D"https://www.xenprojec=
t.org/security-policy.html" style=3D"caret-color: rgb(0, 0, 0); background-c=
olor: rgba(255, 255, 255, 0);"><font color=3D"#000000">https://www.xenprojec=
t.org/security-policy.html</font></a></div><div><br></div><div><br></div></d=
iv></div></div></body></html>=

--Apple-Mail-E88BAF3E-8CCA-459E-962F-6390A89D4D77--


--===============6007982604012552437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6007982604012552437==--
