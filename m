From: Minjun Hong <nickeysgo@gmail.com>
Subject: Is there any way to read msr in hypervisor code?
Date: Tue, 27 Feb 2018 18:37:48 +0900
Message-ID: <CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2361391045707721827=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============2361391045707721827==
Content-Type: multipart/alternative; boundary="f403043ef80c30febe05662e6177"

--f403043ef80c30febe05662e6177
Content-Type: text/plain; charset="UTF-8"

Hello, I've tried to read msr in hypervisor code:

uint64_t reg;

rdmsr_safe(0x412e, ret);


But, I all failed to read it because the hypervisor is running in ring-1
CPL as I did googling.
When I accessed msr, the crash log is below:


(XEN) ----[ Xen-4.9.0  x86_64  debug=n   Not tainted ]----
>
> (XEN) CPU:    7
>
> (XEN) RIP:    e008:[<ffff82d08024139d>] mcsched.c#shscan_timer_fn+0xd/0x180
>
> (XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
>
> (XEN) rax: ffff83084abfe028   rbx: ffff83084abfe300   rcx: 000000000000412e
>
> (XEN) rdx: ffff83084abb7fff   rsi: ffff82d080632f00   rdi: 0000000000000000
>
> (XEN) rbp: ffff82d080241390   rsp: ffff83084abb7e30   r8:  ffff830868d4bdc0
>
> (XEN) r9:  0000000000000005   r10: 0000012da75b50a5   r11: ffff8300782f3060
>
> (XEN) r12: 0000000000000000   r13: 0000012d9f9d6e07   r14: ffff83084abb7fff
>
> (XEN) r15: ffff82d08062ad80   cr0: 000000008005003b   cr4: 00000000003526e0
>
> (XEN) cr3: 00000003426f3000   cr2: 00007fc3c21d4000
>
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>
> (XEN) Xen code around <ffff82d08024139d>
>> (mcsched.c#shscan_timer_fn+0xd/0x180):
>
> (XEN)  00 00 41 55 41 54 55 53 <0f> 32 4c 8d 05 0a 79 11 00 48 8d 0d 91 45
>> 14 00
>
> (XEN) Xen stack trace from rsp=ffff83084abb7e30:
>
> (XEN)    ffff83084abfe300 ffff82d080241390 0000000000000000
>> 0000012d9f9d6e07
>
> (XEN)    ffff83084abb7fff ffff82d08023841d ffff83084abfe300
>> ffff82d080632f00
>
> (XEN)    ffff830868d4bdb0 ffff82d0802385c6 ffff82d080641240
>> 00000000ffffffff
>
> (XEN)    0000000000000000 ffff82d08062aa00 ffffffffffffffff
>> ffff83084abb7fff
>
> (XEN)    ffff82d08062ad80 ffff82d080234e0a ffff83084abb7fff
>> 00000000ffffffff
>
> (XEN)    ffff83084abb7fff 00000000ffffffff ffff830868ce2000
>> ffff8306e5a36000
>
> (XEN)    ffff82d080641240 ffff82d08026b725 0000000000000000
>> ffff830077ff8000
>
> (XEN)    ffff8300782f3000 ffffffff81e00000 0000000000000000
>> 0000000000000000
>
> (XEN)    0000000000000000 ffffffff81e03e68 ffffffff81f3c9c0
>> 0000000000000246
>
> (XEN)    0000000000007ff0 0000000000000000 ffff88003f810580
>> 0000000000000000
>
> (XEN)    ffffffff810013aa ffffffff81e55450 0000000000000000
>> 0000000000000001
>
> (XEN)    0000010000000000 ffffffff810013aa 000000000000e033
>> 0000000000000246
>
> (XEN)    ffffffff81e03e38 000000000000e02b 0000000000000000
>> 0000000000000000
>
> (XEN)    0000000000000000 0000000000000000 0000000000000007
>> ffff830077ff8000
>
> (XEN)    00000037ca5a7300 00000000003526e0
>
> (XEN) Xen call trace:
>
> (XEN)    [<ffff82d08024139d>] mcsched.c#shscan_timer_fn+0xd/0x180
>
> (XEN)    [<ffff82d080241390>] mcsched.c#shscan_timer_fn+0/0x180
>
> (XEN)    [<ffff82d08023841d>] timer.c#execute_timer+0x3d/0x60
>
> (XEN)    [<ffff82d0802385c6>] timer.c#timer_softirq_action+0x66/0x250
>
> (XEN)    [<ffff82d080234e0a>] softirq.c#__do_softirq+0x7a/0xc0
>
> (XEN)    [<ffff82d08026b725>] domain.c#idle_loop+0x35/0x70
>
> (XEN)
>
> (XEN)
>
> (XEN) ****************************************
>
> (XEN) Panic on CPU 7:
>
> (XEN) GENERAL PROTECTION FAULT
>
> (XEN) [error_code=0000]
>
> (XEN) ****************************************
>
>
>
So... I need to find any way to access msr.
Please give me some clue to solve this problem.

Thanks!

Minjun Hong

--f403043ef80c30febe05662e6177
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, I&#39;ve tried to read msr in hypervisor code:<div>=
<br></div><div>

<blockquote class=3D"gmail_quote" style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;text-decoration-style:initial;text-decoration-color:initial;margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
uint64_t reg;=C2=A0=C2=A0</blockquote><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">rdmsr_safe(0x412e, ret);</blockquote></div><div><br><div>But, =
I all failed to read it because the hypervisor is running in ring-1 CPL as =
I did googling.</div><div>When I accessed msr, the crash log is below:</div=
><div><br></div><div><br></div><div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) ----[ Xe=
n-4.9.0=C2=A0 x86_64=C2=A0 debug=3Dn=C2=A0 =C2=A0Not tainted ]----</blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) CPU:=C2=A0 =C2=
=A0 7</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) R=
IP:=C2=A0 =C2=A0 e008:[&lt;ffff82d08024139d&gt;] mcsched.c#shscan_timer_fn+=
0xd/0x180</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XE=
N) RFLAGS: 0000000000010206=C2=A0 =C2=A0CONTEXT: hypervisor</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">(XEN) rax: ffff83084abfe028=
=C2=A0 =C2=A0rbx: ffff83084abfe300=C2=A0 =C2=A0rcx: 000000000000412e</block=
quote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) rdx: ffff8308=
4abb7fff=C2=A0 =C2=A0rsi: ffff82d080632f00=C2=A0 =C2=A0rdi: 000000000000000=
0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) rbp: =
ffff82d080241390=C2=A0 =C2=A0rsp: ffff83084abb7e30=C2=A0 =C2=A0r8:=C2=A0 ff=
ff830868d4bdc0</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">(XEN) r9:=C2=A0 0000000000000005=C2=A0 =C2=A0r10: 0000012da75b50a5=C2=A0 =
=C2=A0r11: ffff8300782f3060</blockquote><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">(XEN) r12: 0000000000000000=C2=A0 =C2=A0r13: 0000012d9f9d6e0=
7=C2=A0 =C2=A0r14: ffff83084abb7fff</blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">(XEN) r15: ffff82d08062ad80=C2=A0 =C2=A0cr0: 0000000=
08005003b=C2=A0 =C2=A0cr4: 00000000003526e0</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">(XEN) cr3: 00000003426f3000=C2=A0 =C2=A0cr=
2: 00007fc3c21d4000</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">(XEN) ds: 0000=C2=A0 =C2=A0es: 0000=C2=A0 =C2=A0fs: 0000=C2=A0 =C2=
=A0gs: 0000=C2=A0 =C2=A0ss: e010=C2=A0 =C2=A0cs: e008</blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">(XEN) Xen code around &lt;ffff82d0=
8024139d&gt; (mcsched.c#shscan_timer_fn+0xd/0x180):</blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">(XEN)=C2=A0 00 00 41 55 41 54 55 53 =
&lt;0f&gt; 32 4c 8d 05 0a 79 11 00 48 8d 0d 91 45 14 00</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">(XEN) Xen stack trace from rsp=
=3Dffff83084abb7e30:</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">(XEN)=C2=A0 =C2=A0 ffff83084abfe300 ffff82d080241390 00000000000000=
00 0000012d9f9d6e07</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">(XEN)=C2=A0 =C2=A0 ffff83084abb7fff ffff82d08023841d ffff83084abfe30=
0 ffff82d080632f00</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">(XEN)=C2=A0 =C2=A0 ffff830868d4bdb0 ffff82d0802385c6 ffff82d080641240=
 00000000ffffffff</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">(XEN)=C2=A0 =C2=A0 0000000000000000 ffff82d08062aa00 ffffffffffffffff =
ffff83084abb7fff</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">(XEN)=C2=A0 =C2=A0 ffff82d08062ad80 ffff82d080234e0a ffff83084abb7fff 0=
0000000ffffffff</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)=C2=A0 =C2=A0 ffff83084abb7fff 00000000ffffffff ffff830868ce2000 ff=
ff8306e5a36000</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">(XEN)=C2=A0 =C2=A0 ffff82d080641240 ffff82d08026b725 0000000000000000 fff=
f830077ff8000</blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>(XEN)=C2=A0 =C2=A0 ffff8300782f3000 ffffffff81e00000 0000000000000000 0000=
000000000000</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
(XEN)=C2=A0 =C2=A0 0000000000000000 ffffffff81e03e68 ffffffff81f3c9c0 00000=
00000000246</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(=
XEN)=C2=A0 =C2=A0 0000000000007ff0 0000000000000000 ffff88003f810580 000000=
0000000000</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(X=
EN)=C2=A0 =C2=A0 ffffffff810013aa ffffffff81e55450 0000000000000000 0000000=
000000001</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XE=
N)=C2=A0 =C2=A0 0000010000000000 ffffffff810013aa 000000000000e033 00000000=
00000246</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN=
)=C2=A0 =C2=A0 ffffffff81e03e38 000000000000e02b 0000000000000000 000000000=
0000000</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN)=
=C2=A0 =C2=A0 0000000000000000 0000000000000000 0000000000000007 ffff830077=
ff8000</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN)=
=C2=A0 =C2=A0 00000037ca5a7300 00000000003526e0</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">(XEN) Xen call trace:</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">(XEN)=C2=A0 =C2=A0 [&lt;ffff82d=
08024139d&gt;] mcsched.c#shscan_timer_fn+0xd/0x180</blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080241=
390&gt;] mcsched.c#shscan_timer_fn+0/0x180</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">(XEN)=C2=A0 =C2=A0 [&lt;ffff82d08023841d&gt;]=
 timer.c#execute_timer+0x3d/0x60</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">(XEN)=C2=A0 =C2=A0 [&lt;ffff82d0802385c6&gt;] timer.c#t=
imer_softirq_action+0x66/0x250</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">(XEN)=C2=A0 =C2=A0 [&lt;ffff82d080234e0a&gt;] softirq.c#_=
_do_softirq+0x7a/0xc0</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">(XEN)=C2=A0 =C2=A0 [&lt;ffff82d08026b725&gt;] domain.c#idle_loop=
+0x35/0x70</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(X=
EN)</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN)</bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) **********=
******************************</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">(XEN) Panic on CPU 7:</blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">(XEN) GENERAL PROTECTION FAULT</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">(XEN) [error_code=3D0000]</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) ***********=
*****************************</blockquote><div><br></div></blockquote><div>=
<br></div><div>So... I need to find any way to access msr.</div><div>Please=
 give me some clue to solve this problem.</div><div><br></div><div>Thanks!<=
/div><div><br></div><div>Minjun Hong=C2=A0</div></div></div></div>

--f403043ef80c30febe05662e6177--


--===============2361391045707721827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2361391045707721827==--
