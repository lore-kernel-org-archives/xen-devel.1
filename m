From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 00/22] Vixen: A PV-in-HVM shim
Date: Mon, 8 Jan 2018 08:41:29 -0800
Message-ID: <CA+aC4kuyep1aMRqYbjk4croXkO5NY++7+kt0ZYP0ubWS3BThMQ@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <20180108115457.u4rspcpesep4we46@citrix.com>
 <20180108121155.vswrajzxi6wri3gd@MacBook-Pro-de-Roger.local>
 <CA+aC4kv-w9h4HHX-Y9_fTJFMDuF+VZuEG0b5d_hX8a8KrJG9FQ@mail.gmail.com>
 <CAFLBxZZrDTcE20U1Ug6jqsKcbJ-L59158X1o+VzS6Mnmndz96g@mail.gmail.com>
 <CA+aC4kt5zbymFbHqCMV-oB80cw2dXWTcTztpa4EnqOKELKs7qg@mail.gmail.com>
 <CA+aC4ku_0MB34=Y=yF3XwADyXttYd8t3Dw7XcOhOr+8aS9nONA@mail.gmail.com>
 <CA+aC4kvsVXDFTHrcRK76868zmqCVuKtrjpSLJk=dYNdxL0PSCw@mail.gmail.com>
 <CA+aC4kujGxWQzSfWP=8qP2SWd0G+qBod8HCLuosPg9SzS-22Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811226340777955320=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYaUQ-0003sU-DA
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 16:41:34 +0000
Received: by mail-lf0-x22d.google.com with SMTP id u84so12773476lff.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 08:41:31 -0800 (PST)
In-Reply-To: <CA+aC4kujGxWQzSfWP=8qP2SWd0G+qBod8HCLuosPg9SzS-22Vw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0811226340777955320==
Content-Type: multipart/alternative; boundary="f4f5e807c08c5dec470562467816"

--f4f5e807c08c5dec470562467816
Content-Type: text/plain; charset="UTF-8"

On Jan 8, 2018 8:28 AM, "George Dunlap" <dunlapg@umich.edu> wrote:

On Mon, Jan 8, 2018 at 4:02 PM, Anthony Liguori <anthony@codemonkey.ws>
wrote:
>>> I do want to make the shim be able to run in both pvh and hvm mode
>>> (which doesn't seem to be too hard in practice).
>>
>> AFAIK the pv-shim code will already work in HVM mode. It's just that
>> booting the pv-shim in HVM mode requires that you install the shim
>> inside of the guest and then boot it using grub or a similar loader
>> that can do multiboot.
>
> I'm happy to work on either approach.  I just want to get something
> merged to have
> an upstream solution to this issue.  I think this particular CVE for
> Xen PV is the worst
> of this batch of issues so I'm super eager on getting a solution
> straightened out.  I'd
> really like to hear from others on what the right approach should be
> and I'll work on
> whatever the consensus is.
>
> I think PVH is a good long term solution but I think it's a poor short
> term solution.
> PVH isn't widely deployed so it's asking people to upgrade their
> infrastructure to a
> very new version of Xen.  It also requires tools changes which means
> that even if
> you are on a newer version of Xen, you still have to upgrade.  The
> patch series is
> also pretty big which means I suspect people will need to wait to 4.11 at
best.
>
> OTOH, the HVM version of the series requires no tools changes and works
on Xen
> versions going back to 3.4 (at least).  What this means practically
> speaking is that
> if it were merged, we can tell people that they can solve this problem
> by building the
> HVM shim and modifying their launch config to boot from an ISO or
> something similar.
>
> This gives people an immediate solution that does not require major
> changes to their
> underlying infrastructure.

Solving the "how to we boot the shim" question is the main reason that
we decided to start with PVH-only back to 4.8.

We didn't consider working around it by having a special boot disk
(ISO or otherwise); it's hard to know how well that will work for most
people.  You don't think that "having to create and boot from a custom
ISO" would count as "major changes to underlying infrastructure"?


If you are a use of xl, then it's a one time config file conversion plus
iso generation.  If you use pvgrub, then the same iso can be reused widely.

You can imagine a script to automate the conversion too.

It may be harder if you are using management tools but it's still easier
than a major version upgrade.

> The series now is also reasonably contained and small enough that
> IMHO, it could go
> into the stable tree.  That means that once merged, we could cut a
> stable release giving
> people an official release that could be used for this purpose.
>
> If it was entirely my call, I would work on merging HVM shim first,
> get a 4.10 stable release
> cut with it, and then focus on getting PVH shim in place for the 4.11
> release.  I think
> this is the right balance of addressing the short term needs while
> also having the best long
> term solution.

If I understand correctly, this series is missing a number of features
from the other series -- migration being the key one, but perhaps
others (vcpu hot-plug? ballooning?).


I haven't tested vcpu hotplug.  The xenstore communication works but we
would have to also pass through the reservations calls.  Not hard at all to
do.

In terms of completeness, as I mentioned, all PV instances in EC2 are using
this today.  We don't make use of all Xen features so some others may be
missing.


In either case, it sounds like "additional boot disk" should work for
older versions, it sounds like.


Right.

Regards,

Anthony Liguori


 -George

--f4f5e807c08c5dec470562467816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote=
">On Jan 8, 2018 8:28 AM, &quot;George Dunlap&quot; &lt;<a href=3D"mailto:d=
unlapg@umich.edu">dunlapg@umich.edu</a>&gt; wrote:<br type=3D"attribution">=
<blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"elided-text">On Mon, Jan 8, 2018 at =
4:02 PM, Anthony Liguori &lt;<a href=3D"mailto:anthony@codemonkey.ws">antho=
ny@codemonkey.ws</a>&gt; wrote:<br>
&gt;&gt;&gt; I do want to make the shim be able to run in both pvh and hvm =
mode<br>
&gt;&gt;&gt; (which doesn&#39;t seem to be too hard in practice).<br>
&gt;&gt;<br>
&gt;&gt; AFAIK the pv-shim code will already work in HVM mode. It&#39;s jus=
t that<br>
&gt;&gt; booting the pv-shim in HVM mode requires that you install the shim=
<br>
&gt;&gt; inside of the guest and then boot it using grub or a similar loade=
r<br>
&gt;&gt; that can do multiboot.<br>
&gt;<br>
&gt; I&#39;m happy to work on either approach.=C2=A0 I just want to get som=
ething<br>
&gt; merged to have<br>
&gt; an upstream solution to this issue.=C2=A0 I think this particular CVE =
for<br>
&gt; Xen PV is the worst<br>
&gt; of this batch of issues so I&#39;m super eager on getting a solution<b=
r>
&gt; straightened out.=C2=A0 I&#39;d<br>
&gt; really like to hear from others on what the right approach should be<b=
r>
&gt; and I&#39;ll work on<br>
&gt; whatever the consensus is.<br>
&gt;<br>
&gt; I think PVH is a good long term solution but I think it&#39;s a poor s=
hort<br>
&gt; term solution.<br>
&gt; PVH isn&#39;t widely deployed so it&#39;s asking people to upgrade the=
ir<br>
&gt; infrastructure to a<br>
&gt; very new version of Xen.=C2=A0 It also requires tools changes which me=
ans<br>
&gt; that even if<br>
&gt; you are on a newer version of Xen, you still have to upgrade.=C2=A0 Th=
e<br>
&gt; patch series is<br>
&gt; also pretty big which means I suspect people will need to wait to 4.11=
 at best.<br>
&gt;<br>
&gt; OTOH, the HVM version of the series requires no tools changes and work=
s on Xen<br>
&gt; versions going back to 3.4 (at least).=C2=A0 What this means practical=
ly<br>
&gt; speaking is that<br>
&gt; if it were merged, we can tell people that they can solve this problem=
<br>
&gt; by building the<br>
&gt; HVM shim and modifying their launch config to boot from an ISO or<br>
&gt; something similar.<br>
&gt;<br>
&gt; This gives people an immediate solution that does not require major<br=
>
&gt; changes to their<br>
&gt; underlying infrastructure.<br>
<br>
</div>Solving the &quot;how to we boot the shim&quot; question is the main =
reason that<br>
we decided to start with PVH-only back to 4.8.<br>
<br>
We didn&#39;t consider working around it by having a special boot disk<br>
(ISO or otherwise); it&#39;s hard to know how well that will work for most<=
br>
people.=C2=A0 You don&#39;t think that &quot;having to create and boot from=
 a custom<br>
ISO&quot; would count as &quot;major changes to underlying infrastructure&q=
uot;?<br></blockquote></div></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">If you are a use of xl, then it&#39;s a one time config file con=
version plus iso generation.=C2=A0 If you use pvgrub, then the same iso can=
 be reused widely.</div><div dir=3D"auto"><br></div><div dir=3D"auto">You c=
an imagine a script to automate the conversion too.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">It may be harder if you are using management to=
ols but it&#39;s still easier than a major version upgrade.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text">
&gt; The series now is also reasonably contained and small enough that<br>
&gt; IMHO, it could go<br>
&gt; into the stable tree.=C2=A0 That means that once merged, we could cut =
a<br>
&gt; stable release giving<br>
&gt; people an official release that could be used for this purpose.<br>
&gt;<br>
&gt; If it was entirely my call, I would work on merging HVM shim first,<br=
>
&gt; get a 4.10 stable release<br>
&gt; cut with it, and then focus on getting PVH shim in place for the 4.11<=
br>
&gt; release.=C2=A0 I think<br>
&gt; this is the right balance of addressing the short term needs while<br>
&gt; also having the best long<br>
&gt; term solution.<br>
<br>
</div>If I understand correctly, this series is missing a number of feature=
s<br>
from the other series -- migration being the key one, but perhaps<br>
others (vcpu hot-plug? ballooning?).<br></blockquote></div></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I haven&#39;t tested vcpu hotplug=
.=C2=A0 The xenstore communication works but we would have to also pass thr=
ough the reservations calls.=C2=A0 Not hard at all to do.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">In terms of completeness, as I mentioned,=
 all PV instances in EC2 are using this today.=C2=A0 We don&#39;t make use =
of all Xen features so some others may be missing.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
In either case, it sounds like &quot;additional boot disk&quot; should work=
 for<br>
older versions, it sounds like.<br></blockquote></div></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Right.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Regards,</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Anthony Liguori</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<font color=3D"#888888"><br>
=C2=A0-George<br>
</font></blockquote></div><br></div></div></div>

--f4f5e807c08c5dec470562467816--


--===============0811226340777955320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0811226340777955320==--
