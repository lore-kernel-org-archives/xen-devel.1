From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: Re: Intel Z270 support
Date: Fri, 19 Oct 2018 19:58:03 +0100
Message-ID: <CANkmNDcAL6kf86FhUz3o-ahwp8As4NtQpcG0mFbbW_ycA6Mx7g@mail.gmail.com>
References: <CANkmNDfWfZt_17ewcHX0=EkvpymqVGLSDyd6uyObr7rOHc9tig@mail.gmail.com>
 <375d8065-e141-4cd7-e051-e0f698d76e96@citrix.com>
 <CANkmNDfjr+2xJ9XOv=ktVnSYiquHeT6PSmBDLW1agOTyp-17KQ@mail.gmail.com>
 <f5a989eb-2f4b-cb04-9126-0ad2fbf49e21@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2689770945732285458=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e53t=m7=gmail.com=aaronngray.lists@srs-us1.protection.inumbo.net>)
 id 1gDZyb-0004Ai-FQ
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 18:58:25 +0000
Received: by mail-ed1-x52e.google.com with SMTP id z21-v6so32333261edb.11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Oct 2018 11:58:23 -0700 (PDT)
In-Reply-To: <f5a989eb-2f4b-cb04-9126-0ad2fbf49e21@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2689770945732285458==
Content-Type: multipart/alternative; boundary="000000000000ccdb590578997c78"

--000000000000ccdb590578997c78
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Oct 2018 at 23:42, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 18/10/2018 19:45, Aaron Gray wrote:
>
> On Thu, 18 Oct 2018 at 19:11, Andrew Cooper <andrew.cooper3@citrix.com>
> wrote:
>
>> On 18/10/2018 18:57, Aaron Gray wrote:
>> > I have two ASUS PRIME Z270-A machines based on Intel Z270 chipset and
>> > am wondering about when support will be available for them and what I
>> > can do to speed this up.
>> >
>> > But I have not done anything to do with kernel work since years ago
>> > when I read a lot of the main parts of the Linux 2.4 Kernel. Also I
>> > did code to get into and out of protected mode before this.
>> >
>> > Heres the datasheets that cover the chipset :-
>> >
>> >
>> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html
>> >
>> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html
>> >
>>
>> Xen doesn't have a list of individual support chips/systems, because
>> kernels don't really work like that.  We work feature by feature, or
>> device by device.
>>
>> You appear to have a Broadwell-era system.  Any recent Linux distro
>> should work for you, including the provided Xen package.
>
>
> I tried installing Xen 4.9 provided with Fedora 28 but it did not work.
> Can I get support with this please ?
>
>
> What didn't work.  What went wrong?
>
> What logs do you have from the attempt?
>
> We're not mind readers.  Noone here can divine the cause of your failure
> from nothing.
>

Sorry I will post a proper report over the weekend.

Aaron

--000000000000ccdb590578997c78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 18 Oct=
 2018 at 23:42, Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.c=
om">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"m_-2346656981181437284moz-cite-prefix">On 18/10/2018 19:4=
5, Aaron Gray wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div dir=3D"ltr">On Thu, 18 Oct 2018 at 19:11, Andrew Cooper
            &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_bla=
nk">andrew.cooper3@citrix.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On
            18/10/2018 18:57, Aaron Gray wrote:<br>
            &gt; I have two ASUS PRIME Z270-A machines based on Intel
            Z270 chipset and<br>
            &gt; am wondering about when support will be available for
            them and what I<br>
            &gt; can do to speed this up.<br>
            &gt;<br>
            &gt; But I have not done anything to do with kernel work
            since years ago<br>
            &gt; when I read a lot of the main parts of the Linux 2.4
            Kernel. Also I<br>
            &gt; did code to get into and out of protected mode before
            this.<br>
            &gt;<br>
            &gt; Heres the datasheets that cover the chipset :-<br>
            &gt;<br>
            &gt; <a href=3D"https://www.intel.com/content/www/us/en/chipset=
s/200-series-chipset-pch-datasheet-vol-1.html" target=3D"_blank" rel=3D"nor=
eferrer">https://www.intel.com/content/www/us/en/chipsets/200-series-chipse=
t-pch-datasheet-vol-1.html</a><br>
            &gt; <a href=3D"https://www.intel.com/content/www/us/en/chipset=
s/200-series-chipset-pch-datasheet-vol-2.html" target=3D"_blank" rel=3D"nor=
eferrer">https://www.intel.com/content/www/us/en/chipsets/200-series-chipse=
t-pch-datasheet-vol-2.html</a><br>
            &gt;<br>
            <br>
            Xen doesn&#39;t have a list of individual support chips/systems=
,
            because<br>
            kernels don&#39;t really work like that.=C2=A0 We work feature =
by
            feature, or<br>
            device by device.<br>
            <br>
            You appear to have a Broadwell-era system.=C2=A0 Any recent Lin=
ux
            distro<br>
            should work for you, including the provided Xen package.</block=
quote>
          <div><br>
          </div>
          <div>I tried installing Xen 4.9 provided with Fedora 28 but it
            did not work. Can I get support with this please ?</div>
        </div>
      </div>
    </blockquote>
    <br>
    What didn&#39;t work.=C2=A0 What went wrong?<br>
    <br>
    What logs do you have from the attempt?<br>
    <br>
    We&#39;re not mind readers.=C2=A0 Noone here can divine the cause of yo=
ur
    failure from nothing.<br></div></blockquote><div><br></div><div>Sorry I=
 will post a proper report over the weekend.</div><div><br></div><div>Aaron=
</div><div>=C2=A0</div></div></div>

--000000000000ccdb590578997c78--


--===============2689770945732285458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2689770945732285458==--
