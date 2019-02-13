From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Wed, 13 Feb 2019 05:43:01 -0500
Message-ID: <815EAD80-F4B6-4B1E-8FD0-6E2B7FDD9070@gmail.com>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <20190122141702.h3oxvr25xjxbhjcl@mac>
 <CACMJ4Gbr4dR2B7o=+i_0aCEPiXTA9nF-w477Btvv8vd_B2+mOw@mail.gmail.com>
 <20190131133931.vincqqgf4acywekz@mac>
 <CACMJ4GZ+85Hr4x8Ydt9u8zJWQLnGcDCxnWoHw3WQdqOZaZJ0gQ@mail.gmail.com>
 <20190204100712.idxj4xpvifv7yy6f@mac>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============2860149441662219904=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1qi=QU=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1gts0Q-0008Ep-Ev
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 10:43:06 +0000
Received: by mail-it1-x12a.google.com with SMTP id x131so3515564itc.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Feb 2019 02:43:03 -0800 (PST)
In-Reply-To: <20190204100712.idxj4xpvifv7yy6f@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============2860149441662219904==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-0A5FDA37-156B-4965-BD7D-C2CB7B1E7C45
Content-Transfer-Encoding: 7bit


--Apple-Mail-0A5FDA37-156B-4965-BD7D-C2CB7B1E7C45
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


>>>>> On Feb 4, 2019, at 05:07, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>>>>>=20
>>>>>> On Sun, Feb 03, 2019 at 10:04:29AM -0800, Christopher Clark wrote:
>>>>>> On Thu, Jan 31, 2019 at 5:39 AM Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com> wrote:
>>>>>>=20
>>>>>> On Wed, Jan 30, 2019 at 08:05:30PM -0800, Christopher Clark wrote:
>>>>>> On Tue, Jan 22, 2019 at 6:19 AM Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com> wrote:
>>>>>>=20
>>>>>> On Mon, Jan 21, 2019 at 01:59:40AM -0800, Christopher Clark wrote:
>>>>>> Version five of this patch series:
>>>>>>=20
>>>>>> * Changes are primarily addressing feedback from the v4 series review=
s.
>>>>>> Many points noted on the invididual commit posts.
>>>>>>=20
>>>>>> * Critical sections have been shrunk, with allocations and frees
>>>>>> pulled outside where possible, reordering logic within hypercall ops.=

>>>>>>=20
>>>>>> * A new ring hash function implemented, derived from the djb2 string
>>>>>> hash function.
>>>>>>=20
>>>>>> * Flags returned by the notify op have been simplified.
>>>>>>=20
>>>>>> * Now uses a single argo boot parameter, taking a list:
>>>>>> - top level boolean to enable/disable Argo
>>>>>> - mac-permissive option to enable/disable wildcard rings
>>>>>> - command line doc edit: no "CONFIG_ARGO" but refers to build config
>>>>>>=20
>>>>>> * Switched to use the standard list data structures used by Xen's
>>>>>> common code.
>>>>>=20
>>>>> AFAIK this was not requested by any reviewer, so I wonder why you made=

>>>>> such change. The more that you open coded some of the list_ macros
>>>>> instead of just doing a s/hlist_/list_/ replacement.
>>>>> I'm fine with using list instead of hlist,
>>>>=20
>>>> At your request, v7 replaces open coding with Xen's list macros. The
>>>> hlist macros were not used by any of the common code in Xen.
>>>>=20
>>>>> but I don't understand why
>>>>> you decided to open code list_for_each and list_for_each_safe instead
>>>>> of using the macros provided by Xen. Is there an issue with such
>>>>> macros?
>>>>=20
>>>> As discussed offline:
>>>>=20
>>>> - Using Xen's list macros will expedite Argo's merge for Xen 4.12
>>>> - List macros in Xen list.h originated in Linux list.h and have diverge=
d
>>>> - OpenXT has use cases for measured launch and nested virtualization,
>>>> which influence downstream performance and security requirements for
>>>> Argo and Xen
>>>> - OpenXT can temporarily patch Xen 4.12 for downstream use
>>>>=20
>>>>> I've made a couple of minor comments, but I think the current status
>>>>> is good, and fixing those minor comments is going to be trivial.
>>>>=20
>>>> Ack, thanks. Hopefully v7 looks good.
>>>=20
>>> As a note, the common flow of interactions usually involves the
>>> contributor replying to the comments made by the reviewer in order to
>>> try to reach an agreement before sending a new version.
>>=20
>> Yes, v7 was sent to address Jan and Julien's review comments in parallel
>> with our ongoing discussion on v5 macros. v7 also provided a checkpoint
>> for Argo testers to maximize test coverage as the series converges into
>> a Xen 4.12 merge candidate for Juergen. It addressed:
>>=20
>> - Jan's v6 review comments
>> - Julien's v1 review comment
>> - most of your xen-devel and offline review comments
>=20
> I think it will benefit the community to give this review in public,
> so other reviewers know whats going on. IMO getting this private
> review makes it harder for me (as a reviewer) to know the motivation
> of some of the changes between versions, and likely also makes it
> harder for you since you have to keep track of comments from multiple
> sources on different channels.
>=20
> Is there anything that prevents those people from making the review
> comments publicly on xen-devel?
>=20
> We should very much try to fix that so everyone can make review
> comments on the public mailing list.

I've advocated for open-source principles in several large organizations.  A=
t XenSource and Citrix, we created organizational separation between the OSS=
 Xen dev team and product teams.  I don't know if that structure remains tod=
ay, but it was once helpful in reducing conflict between public OSS and priv=
ate product roadmaps.

The separation between server and client Xen product teams was less ideal, w=
hich eventually lead to OpenXT.  Six years after v4v was posted to xen-devel=
, Xen Argo is the first step to possible reunification, a small chance at re=
versal, via public open-source, of architectural and resource fragmentation t=
hat took place privately.

Like QubesOS, OpenXT (and predecessor Citrix XenClient) development is sprea=
d across many open-source projects, including Xen, enabling user workflows t=
hat balance hardware-assisted security with usability.  Spanning ecosystems,=
 OpenXT is:

- unbundling OSS capabilities, e.g. TrenchBoot and coreboot for launch integ=
rity
- moving code upstream (Argo, stubdom, blktap, Qemu, OpenEmbedded meta-virt)=

- refactoring for peer & downstream derivatives, on client devices and beyon=
d

To achieve this cross-community integration, we work with many stakeholders a=
mid competing priorities for limited dev resources.  It has taken six years t=
o turn the ship from a Xen separation which began within one organization. T=
his progress was accrued across multiple organizations and policies.

Argo was improved by the Xen upstreaming effort.  Future Xen code contributi=
ons will benefit from the lessons learned.


>>> There are comments from v5 that haven't been fixed in v7
>>> (the mask usage and list_first_entry_or_null for example)
>>> and the reply to the reviewer's comment was sent at the same time as
>>> v7, leaving no time for further discussion (and for reaching an
>>> agreement suitable to both parties) before sending v7.
>>=20
>> Code changes from our ongoing discussion will be addressed in v8. A
>> proposal to address mask usage has been put forward in the parallel
>> thread. Your proposed usage of list_first_entry_or_null will be made in
>> v8, subject to the previous offline discussion about list macros
>> (duplicated here for convenience):
>>=20
>>>> As discussed offline:
>>>>=20
>>>> - Using Xen's list macros will expedite Argo's merge for Xen 4.12
>>>> - List macros in Xen list.h originated in Linux list.h and have diverge=
d
>>>> - OpenXT has use cases for measured launch and nested virtualization,
>>>> which influence downstream performance and security requirements for
>>>> Argo and Xen
>=20
> FWIW, I don't see the connection between nested virtualization or
> measured launch and the list macros.

The issue most relevant to xen-devel is the divergence of list macros in Xen=
 list.h from their origin in Linux list.h.  Since this issue is independent o=
f Argo, I've started a separate thread on "macro supply chains" [1].


> I think a little bit more context
> would be helpful here in order to understand the issue.

For more context on nested virtualization, see Ian Pratt's talk [2] on AX, u=
Xen and nested Hyper-V.  If a production system is designed to meet performa=
nce and security requirements that are delivered by multiple hypervisors, wh=
ich could be open-source (e.g. Xen or uXen), proprietary (e.g. Hyper-V) or i=
n firmware (e.g. AX on HP laptops), then a measured launch increases the lev=
el of assurance that the system is booted with validated hypervisors that ca=
n cooperate to meet those requirements. =20

For more context on measured launch, see the boot integrity talks from PSEC 2=
018 [3].


>>>> - OpenXT can temporarily patch Xen 4.12 for downstream use
>=20
> Patching the macros for OpenXT is perfectly fine, but it would be
> better to understand and fix the problem upstream if possible.
>=20
> How are you patching the macros?
>=20
> What are you trying to achieve by patching them?

This will be determined during an upcoming OpenXT development, testing and c=
ertification cycle, when upstream Xen Argo is evaluated in the context of Op=
enXT and derivative use cases.

Rich

[1] Macro supply chains
https://lists.xen.org/archives/html/xen-devel/2019-02/msg00832.html

[2] "Hypervisor Security =E2=80=94 Lessons Learned", Ian Pratt, 2018
https://www.platformsecuritysummit.com/2018/speaker/pratt/

[3] Boot Integrity presentations, 2018
https://www.platformsecuritysummit.com/2018/topic/boot/


--Apple-Mail-0A5FDA37-156B-4965-BD7D-C2CB7B1E7C45
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><s=
pan></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D=
"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D=
"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-=
8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><div dir=3D"ltr"><sp=
an></span></div><div dir=3D"ltr"><span></span><br><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>On Feb 4, 2019, at 05:07, Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto=
:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote:</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an></span><br></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>On Sun, Feb 03, 2019 at 10=
:04:29AM -0800, Christopher Clark wrote:</span><br></blockquote></blockquote=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>On Thu, Jan 31, 2019 at 5:=
39 AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger=
.pau@citrix.com</a>&gt; wrote:</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
On Wed, Jan 30, 2019 at 08:05:30PM -0800, Christopher Clark wrote:</span><br=
></blockquote></blockquote></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>On Tue, Jan 22, 2019 at 6:19 AM Roger Pau Monn=C3=A9 &lt;<a hre=
f=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote:</span>=
<br></blockquote></blockquote></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>On Mon, Jan 21, 2019 at 01:59:40AM -0800=
, Christopher Clark wrote:</span><br></blockquote></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>Version five of this patch s=
eries:</span><br></blockquote></blockquote></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span></span><br></blockquote></blockquote></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>* Changes are primarily a=
ddressing feedback from the v4 series reviews.</span><br></blockquote></bloc=
kquote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Many points=
 noted on the invididual commit posts.</span><br></blockquote></blockquote><=
/blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bl=
ockquote></blockquote></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>* Critical sections have been shrunk, with allocations and frees</sp=
an><br></blockquote></blockquote></blockquote></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>pulled outside where possible, reordering logic within hy=
percall ops.</span><br></blockquote></blockquote></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>* A new ring hash f=
unction implemented, derived from the djb2 string</span><br></blockquote></b=
lockquote></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>hash f=
unction.</span><br></blockquote></blockquote></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span></span><br></blockquote></blockquote></blockq=
uote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>* Flags returned by th=
e notify op have been simplified.</span><br></blockquote></blockquote></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockqu=
ote></blockquote></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>* Now uses a single argo boot parameter, taking a list:</span><br></block=
quote></blockquote></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>- top level boolean to enable/disable Argo</span><br></blockquote></blo=
ckquote></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- mac-=
permissive option to enable/disable wildcard rings</span><br></blockquote></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- c=
ommand line doc edit: no "CONFIG_ARGO" but refers to build config</span><br>=
</blockquote></blockquote></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span></span><br></blockquote></blockquote></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>* Switched to use the standard list data s=
tructures used by Xen's</span><br></blockquote></blockquote></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>common code.</span><br></blockq=
uote></blockquote></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquot=
e></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>AFAIK this was not requested by any re=
viewer, so I wonder why you made</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>such change. The more that you open coded some of the list_ mac=
ros</span><br></blockquote></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>instead of ju=
st doing a s/hlist_/list_/ replacement.</span><br></blockquote></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>I'm fine with using list instead of hlist,</span><br>=
</blockquote></blockquote></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>At your request, v7 replaces ope=
n coding with Xen's list macros. The</span><br></blockquote></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>hlist macros were n=
ot used by any of the common code in Xen.</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>but I don't understand why</span><br></bloc=
kquote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>you decided to open code list_for_eac=
h and list_for_each_safe instead</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>of using the macros provided by Xen. Is there an issue with suc=
h</span><br></blockquote></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>macros?</span><=
br></blockquote></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span></span><br></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>As discussed offline:</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>- Using Xen's list macros will expedite Ar=
go's merge for Xen 4.12</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>- List macros in Xen list.h orig=
inated in Linux list.h and have diverged</span><br></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- OpenXT has us=
e cases for measured launch and nested virtualization,</span><br></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>w=
hich influence downstream performance and security requirements for</span><b=
r></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>Argo and Xen</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>- OpenXT can temporarily patch X=
en 4.12 for downstream use</span><br></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>I've made a couple of minor comments, but I think the curr=
ent status</span><br></blockquote></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>is goo=
d, and fixing those minor comments is going to be trivial.</span><br></block=
quote></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>Ack, thanks. Hopefully v7 looks good.</spa=
n><br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>As a note, the common flow of=
 interactions usually involves the</span><br></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>contributor replying to the comments made by the reviewer in=
 order to</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>try to reac=
h an agreement before sending a new version.</span><br></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>Yes, v7 was sent to address Jan and Julien's review comme=
nts in parallel</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>with our ongoing discussion on v5 macros. v=
7 also provided a checkpoint</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>for Argo testers to maximize t=
est coverage as the series converges into</span><br></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span>a Xen 4.12 merge=
 candidate for Juergen. It addressed:</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>-=
 Jan's v6 review comments</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>- Julien's v1 review comment</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>- most of your xen-devel and offline review comments</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><span></span><br></block=
quote><blockquote type=3D"cite"><span>I think it will benefit the community t=
o give this review in public,</span><br></blockquote><blockquote type=3D"cit=
e"><span>so other reviewers know whats going on. IMO getting this private</s=
pan><br></blockquote><blockquote type=3D"cite"><span>review makes it harder f=
or me (as a reviewer) to know the motivation</span><br></blockquote><blockqu=
ote type=3D"cite"><span>of some of the changes between versions, and likely a=
lso makes it</span><br></blockquote><blockquote type=3D"cite"><span>harder f=
or you since you have to keep track of comments from multiple</span><br></bl=
ockquote><blockquote type=3D"cite"><span>sources on different channels.</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>Is there anything that prevents those people f=
rom making the review</span><br></blockquote><blockquote type=3D"cite"><span=
>comments publicly on xen-devel?</span><br></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>We shoul=
d very much try to fix that so everyone can make review</span><br></blockquo=
te><blockquote type=3D"cite"><span>comments on the public mailing list.</spa=
n><br></blockquote><span></span><br><span>I've advocated for open-source pri=
nciples in several large organizations. &nbsp;At XenSource and Citrix, we cr=
eated organizational separation between the OSS Xen dev team and product tea=
ms. &nbsp;I don't know if that structure remains today, but it was once help=
ful in reducing conflict between public OSS and private product roadmaps.</s=
pan><br><span></span><br><span>The separation between server and client Xen p=
roduct teams was less ideal, which eventually lead to OpenXT. &nbsp;Six year=
s after v4v was posted to xen-devel, Xen Argo is the first step to possible r=
eunification, a small chance at reversal, via public open-source, of archite=
ctural and resource fragmentation that took place privately.</span><br><span=
></span><br><span>Like QubesOS, OpenXT (and predecessor Citrix XenClient) de=
velopment is spread across many open-source projects, including Xen, enablin=
g user workflows that balance hardware-assisted security with usability. &nb=
sp;Spanning ecosystems, OpenXT is:</span><br><span></span><br><span>- unbund=
ling OSS capabilities, e.g. TrenchBoot and coreboot for launch integrity</sp=
an><br><span>- moving code upstream (Argo, stubdom, blktap, Qemu, OpenEmbedd=
ed meta-virt)</span><br><span>- refactoring for peer &amp; downstream deriva=
tives, on client devices and beyond</span><br><span></span><br><span>To achi=
eve this cross-community integration, we work with many stakeholders amid co=
mpeting priorities for limited dev resources. &nbsp;It has taken six years t=
o turn the ship from a Xen separation which began within one organization. T=
his progress was accrued across multiple organizations and policies.</span><=
br><span></span><br><span>Argo was improved by the Xen upstreaming effort. &=
nbsp;Future Xen code contributions will benefit from the lessons learned.</s=
pan><br><span></span><br><span></span><br><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>There are comments from v5=
 that haven't been fixed in v7</span><br></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>(the mask usage and list_first_entry_or_null for example)</span>=
<br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>and the reply to the revi=
ewer's comment was sent at the same time as</span><br></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>v7, leaving no time for further discussion (and for=
 reaching an</span><br></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>agreem=
ent suitable to both parties) before sending v7.</span><br></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>Code changes from our ongoing discussion will be addr=
essed in v8. A</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>proposal to address mask usage has been put=
 forward in the parallel</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>thread. Your proposed usage of li=
st_first_entry_or_null will be made in</span><br></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>v8, subject to the p=
revious offline discussion about list macros</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>(duplicated h=
ere for convenience):</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>As discussed offline:</span><br></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>- Using Xen's list macros will expedite Argo's merge fo=
r Xen 4.12</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>- List macros in Xen list.h originated in Lin=
ux list.h and have diverged</span><br></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>- OpenXT has use cases for m=
easured launch and nested virtualization,</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>which influenc=
e downstream performance and security requirements for</span><br></blockquot=
e></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>A=
rgo and Xen</span><br></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><span>FWIW, I don't see the connection between nested virtualization or<=
/span><br></blockquote><blockquote type=3D"cite"><span>measured launch and t=
he list macros.</span><br></blockquote><span></span><br><span>The issue most=
 relevant to xen-devel is the divergence of list macros in Xen list.h from t=
heir origin in Linux list.h. &nbsp;Since this issue is independent of Argo, I=
've started a separate thread on "macro supply chains" [1].</span><br><span>=
</span><br><span></span><br><blockquote type=3D"cite"><span>I think a little=
 bit more context</span><br></blockquote><blockquote type=3D"cite"><span>wou=
ld be helpful here in order to understand the issue.</span><br></blockquote>=
<span></span><br><span>For more context on nested virtualization, see Ian Pr=
att's talk [2] on AX, uXen and nested Hyper-V. &nbsp;If a production system i=
s designed to meet performance and security requirements that are delivered b=
y multiple hypervisors, which could be open-source (e.g. Xen or uXen), propr=
ietary (e.g. Hyper-V) or in firmware (e.g. AX on HP laptops), then a measure=
d launch increases the level of assurance that the system is booted with val=
idated hypervisors that can cooperate to meet those requirements. &nbsp;</sp=
an><br><span></span><br><span>For more context on measured launch, see the b=
oot integrity talks from PSEC 2018 [3].</span><br><span></span><br><span></s=
pan><br><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>- OpenXT can temporarily patch Xen=
 4.12 for downstream use</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquo=
te type=3D"cite"><span>Patching the macros for OpenXT is perfectly fine, but=
 it would be</span><br></blockquote><blockquote type=3D"cite"><span>better t=
o understand and fix the problem upstream if possible.</span><br></blockquot=
e><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span>How are you patching the macros?</span><br></blockquote><blockq=
uote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><=
span>What are you trying to achieve by patching them?</span><br></blockquote=
><span></span><br><span>This will be determined during an upcoming OpenXT de=
velopment, testing and certification cycle, when upstream Xen Argo is evalua=
ted in the context of OpenXT and derivative use cases.</span><br><span></spa=
n><br><span>Rich</span><br><span></span><br>[1] Macro supply chains</div><di=
v dir=3D"ltr"><a href=3D"https://lists.xen.org/archives/html/xen-devel/2019-=
02/msg00832.html">https://lists.xen.org/archives/html/xen-devel/2019-02/msg0=
0832.html</a></div><div dir=3D"ltr"><br><span>[2] "Hypervisor Security =E2=80=
=94 Lessons Learned", Ian Pratt, 2018</span><br><span><a href=3D"https://www=
.platformsecuritysummit.com/2018/speaker/pratt/">https://www.platformsecurit=
ysummit.com/2018/speaker/pratt/</a></span><br><span></span><br><span>[3] Boo=
t Integrity presentations, 2018</span><br><span><a href=3D"https://www.platf=
ormsecuritysummit.com/2018/topic/boot/">https://www.platformsecuritysummit.c=
om/2018/topic/boot/</a></span><br><span></span><br></div></div></div></div><=
/div></div></body></html>=

--Apple-Mail-0A5FDA37-156B-4965-BD7D-C2CB7B1E7C45--


--===============2860149441662219904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2860149441662219904==--
