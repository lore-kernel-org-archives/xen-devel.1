From: sepanta s <sapanta992@gmail.com>
Subject: Re: An issue in sharing the pages again in xen-memshare
Date: Fri, 24 Aug 2018 09:37:19 +0430
Message-ID: <CABaiLQ-gQBDurcA+Bt+B0pNnziiq-pJMWqpE9Tvh5bYeCQjUjA@mail.gmail.com>
References: <CABaiLQ959qf8fDZSV5-G1utG3mZUB2WMmw+HaMjfXC0PXtkzhw@mail.gmail.com>
 <b1a73c07-3e50-38ad-7ef5-851df86bac7b@bitdefender.com>
 <CABaiLQ-EH0Z7UgFP4MF0oHWP5WSYR=4_FdU+r2+1BkECLdWScw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9206639824095403289=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABaiLQ-EH0Z7UgFP4MF0oHWP5WSYR=4_FdU+r2+1BkECLdWScw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas Lengyel <tamas.lengyel@zentific.com>, "xen-devel@lists.xen.org" <Xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============9206639824095403289==
Content-Type: multipart/alternative; boundary="000000000000e9e26105742b1f4a"

--000000000000e9e26105742b1f4a
Content-Type: text/plain; charset="UTF-8"

Hi again,

I debugged the kernel codes and found out the root cause.
The sharing is not done for some pages causing error -E2BIG which is due to
reference count being more than one. This prevents hypervor to nominate the
page. As much as I know about this issue, the page that I want to nominate
and I receive this error from make_page_sharable function in mem_sharing.c
is pointed by more than one pages. So, is there any idea to resolve this
issue? I though that I can put the page number in a buffer and share it
again after t milliseconds but still the nomination return -E2BIG error.
Am I missing something?

I would be grateful if you could help.


On Sat, Jul 28, 2018 at 11:13 AM sepanta s <sapanta992@gmail.com> wrote:

> Thanks.
> I would be thankful if he can help me ...
>
> On Mon, Jul 23, 2018 at 11:52 AM Razvan Cojocaru <
> rcojocaru@bitdefender.com> wrote:
>
>> On 07/23/2018 05:37 AM, sepanta s wrote:
>> > I have written a program that can share memory pages of two VMs every x
>> > milliseconds. To do so, I modified xen and added an unshare event to be
>> > able to capture it. However,  for some pages, when I receive the unshare
>> > event that contains the information about the pages which was about to
>> > be written on and put it on a buffer for sharing them again after x
>> > milliseconds, I cannot nominate them again and an error occurs. So, the
>> > sharing mechanism I have built can partially share pages. I guess the
>> > problem might be because of internal structure of sharing mechanism in
>> > the Xen but can't figure out the problem.
>> > Do you  have any idea what can cause this problem? Or what should I
>> > check to get closer to any solution?
>>
>> I've never used this feature, but Tamas might have some insight into
>> this (added to Cc).
>>
>

--000000000000e9e26105742b1f4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi again, <br></div><div><br></div><div>I debugged th=
e kernel codes and found out the root cause. <br></div><div>The sharing is =
not done for some pages causing error -E2BIG which is due to reference coun=
t being more than one. This prevents hypervor to nominate the page. As much=
 as I know about this issue, the page that I want to nominate and I receive=
 this error from make_page_sharable function in mem_sharing.c is pointed by=
 more than one pages. So, is there any idea to resolve this issue? I though=
 that I can put the page number in a buffer and share it again after t mill=
iseconds but still the nomination return -E2BIG error.=C2=A0 Am I missing s=
omething? <br></div><div><br></div><div>I would be grateful if you could he=
lp. <br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Sat, Jul 28, 2018 at 11:13 AM sepanta s &lt;<a href=3D"mailto:s=
apanta992@gmail.com">sapanta992@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><div>Thanks. <br></div><div>I would =
be thankful if he can help me ...<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Mon, Jul 23, 2018 at 11:52 AM Razvan Cojocaru &lt;=
<a href=3D"mailto:rcojocaru@bitdefender.com" target=3D"_blank">rcojocaru@bi=
tdefender.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 07/=
23/2018 05:37 AM, sepanta s wrote:<br>
&gt; I have written a program that can share memory pages of two VMs every =
x<br>
&gt; milliseconds. To do so, I modified xen and added an unshare event to b=
e<br>
&gt; able to capture it. However,=C2=A0 for some pages, when I receive the =
unshare<br>
&gt; event that contains the information about the pages which was about to=
<br>
&gt; be written on and put it on a buffer for sharing them again after x<br=
>
&gt; milliseconds, I cannot nominate them again and an error occurs. So, th=
e<br>
&gt; sharing mechanism I have built can partially share pages. I guess the<=
br>
&gt; problem might be because of internal structure of sharing mechanism in=
<br>
&gt; the Xen but can&#39;t figure out the problem.<br>
&gt; Do you=C2=A0 have any idea what can cause this problem? Or what should=
 I<br>
&gt; check to get closer to any solution?<br>
<br>
I&#39;ve never used this feature, but Tamas might have some insight into<br=
>
this (added to Cc).<br>
</blockquote></div>
</blockquote></div>

--000000000000e9e26105742b1f4a--


--===============9206639824095403289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9206639824095403289==--
