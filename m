From: Minjun Hong <nickeysgo@gmail.com>
Subject: Re: where can I find the 'address translation' code in
 Xen?
Date: Tue, 1 May 2018 21:54:05 +0900
Message-ID: <CAFX_q-E7CE4=PO9c15NBwZ1QSv1FgoemKpnpqGY+ekDAi4qfLw@mail.gmail.com>
References: <CAFX_q-EPQuiEV4SBSFnCagEhx8pgTBWe6K-1FUP0sfMaLA5Kmw@mail.gmail.com>
 <54e4ae9f-d831-9721-abd7-62dfc54dd919@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0743864856038846969=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <54e4ae9f-d831-9721-abd7-62dfc54dd919@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0743864856038846969==
Content-Type: multipart/alternative; boundary="f4f5e80c2a28328bd2056b2477a1"

--f4f5e80c2a28328bd2056b2477a1
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 10:13 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 29/04/18 11:11, Minjun Hong wrote:
> > Hi.
> > I'm looking for a point where address translation (guest virtual
> > address to machine address) occurs in Xen.
> > Of course, I mean when TLB miss has occured.
>
> This question makes me wonder whether you are more familiar with PowerPC
> than x86.  In x86, the TLB is automatically maintained by hardware, and
> new entries will be populated as necessary.  All pagetable related
> errors result in a pagefault exception, which Xen handles.
>
> > I'm using a PV guest and I've found 'guest_walk_tables()' function in
> > "xen/arch/x86/mm/guest_walk.c".
> > However, in the comment of the function, it says "Walk the guest
> > pagetables, after the manner of a hardware walker".
> > I'm confused because I'm not sure if the function is called after the
> > 'hardware page table walker'.
>
> "after the manner" is an uncommon phrase in English, which AFAICT
> derives from Latin originally.  It means "in the style of", "in the same
> way as", etc.
>
> guest_walk_tables() is a function which tries to match the behaviour of
> the hardware pagewalker.  However, it is only used for cases where we
> can't use regular hardware support, such as emulation of instructions.
>
> ~Andrew
>

Thank you, Andrew.
Your answer is very helpful for me.

It appears that there is no code to be executed when address translations
of the guest occurs in Xen.
Frankly, I was expecting there may be an address translation when accessing
guest memory, and I wanted to find the code used in Xen at that time.
Is there any code I can use for this purpose in Xen? No matter how I look,
I could not find it in Xen with my background knowledge right now. So that
I need your help.

--f4f5e80c2a28328bd2056b2477a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Apr 30, 2018 at 10:13 PM, Andrew Cooper <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.cooper3@citr=
ix.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 29/04/18 11:11, Minjun Hong wrote:<br>
&gt; Hi.<br>
&gt; I&#39;m looking for a point where address translation (guest virtual<b=
r>
&gt; address to machine address) occurs in Xen.<br>
&gt; Of course, I mean when TLB miss has occured.<br>
<br>
</span>This question makes me wonder whether you are more familiar with Pow=
erPC<br>
than x86.=C2=A0 In x86, the TLB is automatically maintained by hardware, an=
d<br>
new entries will be populated as necessary.=C2=A0 All pagetable related<br>
errors result in a pagefault exception, which Xen handles.<br>
<span class=3D""><br>
&gt; I&#39;m using a PV guest and I&#39;ve found &#39;guest_walk_tables()&#=
39; function in<br>
&gt; &quot;xen/arch/x86/mm/guest_walk.c&quot;<wbr>.<br>
&gt; However, in the comment of the function, it says &quot;Walk the guest<=
br>
&gt; pagetables, after the manner of a hardware walker&quot;.<br>
&gt; I&#39;m confused because I&#39;m not sure if the function is called af=
ter the<br>
&gt; &#39;hardware page table walker&#39;.<br>
<br>
</span>&quot;after the manner&quot; is an uncommon phrase in English, which=
 AFAICT<br>
derives from Latin originally.=C2=A0 It means &quot;in the style of&quot;, =
&quot;in the same<br>
way as&quot;, etc.<br>
<br>
guest_walk_tables() is a function which tries to match the behaviour of<br>
the hardware pagewalker.=C2=A0 However, it is only used for cases where we<=
br>
can&#39;t use regular hardware support, such as emulation of instructions.<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
~Andrew<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">Thank you, Andrew.</span><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;text-decoration-style:initial;text-decoration=
-color:initial">Your answer is very helpful for me.<br></div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;text-decoration-style:initial;text-=
decoration-color:initial"><br></div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:small;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;text-decoration-style:initial;text-decoration-color:initial"=
><div>It appears that there is no code to be executed when address translat=
ions of the guest occurs in Xen.</div><div>Frankly, I was expecting there m=
ay be an address translation when accessing guest memory, and I wanted to f=
ind the code used in Xen at that time.</div><div>Is there any code I can us=
e for this purpose in Xen? No matter how I look, I could not find it in Xen=
 with my background knowledge right now. So that I need your help.</div></d=
iv></div></div>

--f4f5e80c2a28328bd2056b2477a1--


--===============0743864856038846969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0743864856038846969==--
