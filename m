From: Olivier Lambert <lambert.olivier@gmail.com>
Subject: Re: [Xen-users] Data corruption with xl migrate
Date: Tue, 19 Dec 2017 12:01:34 +0100
Message-ID: <CACJ1ZNvamD4SvroBZ+j4NAyAW6=ubXJFAavNuEtzx-a5+WkyqQ__16009.7134569243$1513682459$gmane$org@mail.gmail.com>
References: <8dd20c44-d4ab-056c-9b9e-bc0f1b85367c@pse-consulting.de>
 <f3192d23-bf33-9377-ca3e-6562c426fa57@pse-consulting.de>
 <CAFLBxZYMWqf5rJQAOh_ZuR+i1q2ESraH08Vx5u=dJNmWJ9zqPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4561084563634927415=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=riaz=dp=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1eRFfR-0008Cj-GM
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 11:02:37 +0000
In-Reply-To: <CAFLBxZYMWqf5rJQAOh_ZuR+i1q2ESraH08Vx5u=dJNmWJ9zqPw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andreas Pflug <pgadmin@pse-consulting.de>, xen-users@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Joao Martins <joao.m.martins@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4561084563634927415==
Content-Type: multipart/alternative; boundary="001a11c15518e98d380560af633c"

--001a11c15518e98d380560af633c
Content-Type: text/plain; charset="UTF-8"

Hi!

Xen Orchestra team here. Our virtual appliance (XOA) is running on Jessie
and few customers experienced this problem on XenServer too. I'm trying to
investigate more to correlate if the affected customers did a migration
before this happened (XOA is running on prem, so we can't monitor it
directly).

Keep us posted for any bug report created on Debian side.

Thanks!

Olivier.

On Tue, Dec 19, 2017 at 11:33 AM, George Dunlap <dunlapg@umich.edu> wrote:

> On Sun, Dec 17, 2017 at 3:53 PM, Andreas Pflug
> <pgadmin@pse-consulting.de> wrote:
> > Still experiencing data corruption when migrating 3.16 VMs from one host
> > to another...
> > Seems independent of Xen version or storage backend.
> >
> > Regards
> > Andreas
> >
> > Am 13.12.17 um 09:12 schrieb Andreas Pflug:
> >> Recently, I encountered file system data corruption on several systems
> >> after a migration (ext4, xfs, zfs). So far, I haven't been able to nail
> >> down the cause for it.
> >>
> >> All VMs affected run Debian Jessie with 3.16 kernel. Possibly newer 3.16
> >> kernels are more likely to suffer corruption.
> >>
> >> This happened on a Xen 4.1 cluster (yes, really old) using a SAN storage
> >> system, but also on a Xen 4.8 cluster with DRBD mirroring. All systems
> >> are working for >>1 year now, only recently those filesystem corruption
> >> started to happen. Data blocks seem to get randomly garbled.
> >>
> >> Migration of Debian Stretch or Windows VMs didn't show any anomalies so
> far.
> >>
> >> Can anyone shed some light on this?
>
> Thanks for the report -- cc'ing a few random people who know more
> about the block layer / Debian kernels.
>
> It seems Debian Jessie 3.16 kernel was experiencing corruption on
> migration, but not the Debian Stretch kernel or Windows VMs.  That
> sounds like a bug in the Debian kernel; any ideas about what patch may
> be worth backporting / any steps to help further investigate the
> source of the problems?
>
> Thanks,
>  -George
>
> _______________________________________________
> Xen-users mailing list
> Xen-users@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-users
>

--001a11c15518e98d380560af633c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi!<br><br></div>Xen Orchestra team he=
re. Our virtual appliance (XOA) is running on Jessie and few customers expe=
rienced this problem on XenServer too. I&#39;m trying to investigate more t=
o correlate if the affected customers did a migration before this happened =
(XOA is running on prem, so we can&#39;t monitor it directly).<br><br></div=
>Keep us posted for any bug report created on Debian side.<br><br></div>Tha=
nks!<br><br></div>Olivier.<br></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, Dec 19, 2017 at 11:33 AM, George Dunlap <span di=
r=3D"ltr">&lt;<a href=3D"mailto:dunlapg@umich.edu" target=3D"_blank">dunlap=
g@umich.edu</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On Sun, Dec 17, 2017 at 3:53 PM, Andreas Pflug<br>
&lt;<a href=3D"mailto:pgadmin@pse-consulting.de">pgadmin@pse-consulting.de<=
/a>&gt; wrote:<br>
&gt; Still experiencing data corruption when migrating 3.16 VMs from one ho=
st<br>
&gt; to another...<br>
&gt; Seems independent of Xen version or storage backend.<br>
&gt;<br>
&gt; Regards<br>
&gt; Andreas<br>
&gt;<br>
&gt; Am 13.12.17 um 09:12 schrieb Andreas Pflug:<br>
&gt;&gt; Recently, I encountered file system data corruption on several sys=
tems<br>
&gt;&gt; after a migration (ext4, xfs, zfs). So far, I haven&#39;t been abl=
e to nail<br>
&gt;&gt; down the cause for it.<br>
&gt;&gt;<br>
&gt;&gt; All VMs affected run Debian Jessie with 3.16 kernel. Possibly newe=
r 3.16<br>
&gt;&gt; kernels are more likely to suffer corruption.<br>
&gt;&gt;<br>
&gt;&gt; This happened on a Xen 4.1 cluster (yes, really old) using a SAN s=
torage<br>
&gt;&gt; system, but also on a Xen 4.8 cluster with DRBD mirroring. All sys=
tems<br>
&gt;&gt; are working for &gt;&gt;1 year now, only recently those filesystem=
 corruption<br>
&gt;&gt; started to happen. Data blocks seem to get randomly garbled.<br>
&gt;&gt;<br>
&gt;&gt; Migration of Debian Stretch or Windows VMs didn&#39;t show any ano=
malies so far.<br>
&gt;&gt;<br>
&gt;&gt; Can anyone shed some light on this?<br>
<br>
</span>Thanks for the report -- cc&#39;ing a few random people who know mor=
e<br>
about the block layer / Debian kernels.<br>
<br>
It seems Debian Jessie 3.16 kernel was experiencing corruption on<br>
migration, but not the Debian Stretch kernel or Windows VMs.=C2=A0 That<br>
sounds like a bug in the Debian kernel; any ideas about what patch may<br>
be worth backporting / any steps to help further investigate the<br>
source of the problems?<br>
<br>
Thanks,<br>
=C2=A0-George<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
______________________________<wbr>_________________<br>
Xen-users mailing list<br>
<a href=3D"mailto:Xen-users@lists.xenproject.org">Xen-users@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-users" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-users</a></div></div></blockquote></div><br></div>

--001a11c15518e98d380560af633c--


--===============4561084563634927415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4561084563634927415==--
