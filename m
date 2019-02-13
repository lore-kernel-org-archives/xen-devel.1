From: Julien Grall <julien.grall@gmail.com>
Subject: Re: arm64,
 laxton[01] (was Re: [xen-unstable-smoke test] 133030: trouble:
 blocked/broken/pass)
Date: Wed, 13 Feb 2019 07:40:35 +0100
Message-ID: <CAF3u54CWwGLq_wq0dYJQuvrapjNcAvJaQiQ0Jw5DhZ8gvpP8vg@mail.gmail.com>
References: <osstest-133030-mainreport@xen.org>
 <20190208131416.espkw4gi3pn6fzb5@zion.uk.xensource.com>
 <20190208181219.mhfzzr3oexmqmfpr@zion.uk.xensource.com>
 <23649.23960.966699.466828@mariner.uk.xensource.com>
 <23650.44219.254756.700521@mariner.uk.xensource.com>
 <CAF3u54AJ9pecYZeak4dhHPLjVS++a=ZxiPmhPsfXfm_1OM8=Eg@mail.gmail.com>
 <23651.6588.41281.256610@mariner.uk.xensource.com>
 <23651.7650.360467.743599@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8063863473698088462=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rdbe=QU=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gtoDz-00045P-72
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 06:40:51 +0000
Received: by mail-vs1-xe42.google.com with SMTP id t7so760078vsq.5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 22:40:49 -0800 (PST)
In-Reply-To: <23651.7650.360467.743599@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, osstest service owner <osstest-admin@xenproject.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============8063863473698088462==
Content-Type: multipart/alternative; boundary="0000000000007787db0581c0d237"

--0000000000007787db0581c0d237
Content-Type: text/plain; charset="UTF-8"

Sorry the formatting.

On Tue, 12 Feb 2019, 20:26 Ian Jackson, <ian.jackson@citrix.com> wrote:

> Ian Jackson writes ("Re: [Xen-devel] arm64, laxton[01] (was Re:
> [xen-unstable-smoke test] 133030: trouble: blocked/broken/pass)"):
> > And that part works.  It runs through d-i and thinks it has succeeded.
> > But then when the host reboots it reboots into 3.16, not the backports
> > kernel.
> >
> > Looking at the installer log:
> >
> >   2019-02-07 15:18:34 Z 172.16.144.52:39843 <13>Feb  7 15:18:34
> >   base-installer: info: kernel linux-image-arm64 usable on arm64
> >
> > which is kind of weird.
> >
> > > So I think we can rule out a firmware bug.  Now, I am struggling to
> > > understand why osstest is suddenly using 3.16.
> > > Was there any change in osstest or the configuration?
> >
> > No.  I think something may be wrong with the way Debian is publishing
> > the backports kernels.  I will ask...
>
> Thanks, Julien, you have found enough for me to identify the problem.
>
> According to snapshot.debian.org, at 2019-02-06T21:13:14, the file
>
> http://ftp.debian.org/debian/dists/jessie-backports/main/binary-arm64/Packages.xz
> mentioned linux-base version 4.3~bpo8+1.  Now, it doesn't mention
> it at all.
>
> This is presumably part of cruft removal, since jessie-security does
> contain an even newer version, 4.5~deb8u1.
>
> linux-image-4.9.* require newer linux-support than is available in
> plain jessie.  As a result of all this, the installer removes the
> 4.9.x kernel because its dependencies can't be satisfied.  The machine
> then tries to reboot into some much older kernel.
>
> The osstest installer system does not use jessie-security and I think
> there was some reason for this which I have forgotten right now.
> Maybe the security repositories were awkward to cache - but nowadays
> we have a different approach to this caching.
>

This may be related to [1]. I don't know whether the support status changed
since then.


> I will investigate putting <suite>-security back.


[1]
https://xenbits.xen.org/gitweb/?p=osstest.git;a=commit;h=c14980b543ba057dcdd7a6c65d74a12cb4192034



> Ian.
>

--0000000000007787db0581c0d237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry the formatting.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Tue, 12 Feb 2019, 20:26 Ian Jackson, &lt;<a href=3D"mailto:ian.jackson@cit=
rix.com">ian.jackson@citrix.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Ian Jackson writes (&quot;Re: [Xen-devel] arm64, laxton[01] (=
was Re: [xen-unstable-smoke test] 133030: trouble: blocked/broken/pass)&quo=
t;):<br>
&gt; And that part works.=C2=A0 It runs through d-i and thinks it has succe=
eded.<br>
&gt; But then when the host reboots it reboots into 3.16, not the backports=
<br>
&gt; kernel.<br>
&gt; <br>
&gt; Looking at the installer log:<br>
&gt; <br>
&gt;=C2=A0 =C2=A02019-02-07 15:18:34 Z <a href=3D"http://172.16.144.52:3984=
3" rel=3D"noreferrer" target=3D"_blank">172.16.144.52:39843</a> &lt;13&gt;F=
eb=C2=A0 7 15:18:34<br>
&gt;=C2=A0 =C2=A0base-installer: info: kernel linux-image-arm64 usable on a=
rm64 <br>
&gt; <br>
&gt; which is kind of weird.<br>
&gt; <br>
&gt; &gt; So I think we can rule out a firmware bug.=C2=A0 Now, I am strugg=
ling to<br>
&gt; &gt; understand why osstest is suddenly using 3.16.<br>
&gt; &gt; Was there any change in osstest or the configuration?<br>
&gt; <br>
&gt; No.=C2=A0 I think something may be wrong with the way Debian is publis=
hing<br>
&gt; the backports kernels.=C2=A0 I will ask...<br>
<br>
Thanks, Julien, you have found enough for me to identify the problem.<br>
<br>
According to <a href=3D"http://snapshot.debian.org" rel=3D"noreferrer" targ=
et=3D"_blank">snapshot.debian.org</a>, at 2019-02-06T21:13:14, the file<br>
=C2=A0 <a href=3D"http://ftp.debian.org/debian/dists/jessie-backports/main/=
binary-arm64/Packages.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.d=
ebian.org/debian/dists/jessie-backports/main/binary-arm64/Packages.xz</a><b=
r>
mentioned linux-base version 4.3~bpo8+1.=C2=A0 Now, it doesn&#39;t mention<=
br>
it at all.<br>
<br>
This is presumably part of cruft removal, since jessie-security does<br>
contain an even newer version, 4.5~deb8u1.<br>
<br>
linux-image-4.9.* require newer linux-support than is available in<br>
plain jessie.=C2=A0 As a result of all this, the installer removes the<br>
4.9.x kernel because its dependencies can&#39;t be satisfied.=C2=A0 The mac=
hine<br>
then tries to reboot into some much older kernel.<br>
<br>
The osstest installer system does not use jessie-security and I think<br>
there was some reason for this which I have forgotten right now.<br>
Maybe the security repositories were awkward to cache - but nowadays<br>
we have a different approach to this caching.<br></blockquote></div><div><b=
r></div><div>This may be related to [1]. I don&#39;t know whether the suppo=
rt status changed since then.</div><div><br></div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
I will investigate putting &lt;suite&gt;-security back.</blockquote></div><=
div class=3D"gmail_quote"></div><div><br></div><div>[1] <a href=3D"https://=
xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dcommit;h=3Dc14980b543ba057dcdd7=
a6c65d74a12cb4192034">https://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dc=
ommit;h=3Dc14980b543ba057dcdd7a6c65d74a12cb4192034</a></div><div><br></div>=
<div><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Ian.<br>
</blockquote></div>

--0000000000007787db0581c0d237--


--===============8063863473698088462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8063863473698088462==--
