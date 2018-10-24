From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: Re: [Xen-users] Intel Z270 support
Date: Wed, 24 Oct 2018 22:20:30 +0100
Message-ID: <CANkmNDf3iisowAgXXUt4U10w6Jd+XP5HW8JvFr++X=8+iWVNOw@mail.gmail.com>
References: <CANkmNDfWfZt_17ewcHX0=EkvpymqVGLSDyd6uyObr7rOHc9tig@mail.gmail.com>
 <CACaqnaSSq8=j1wF_+_O1Zc2vW_ebN6ACRdbB5KLdcOcPAZnO1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6154287337953322365=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bkdn=ne=gmail.com=aaronngray.lists@srs-us1.protection.inumbo.net>)
 id 1gFQaA-00026m-1o
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 21:20:50 +0000
In-Reply-To: <CACaqnaSSq8=j1wF_+_O1Zc2vW_ebN6ACRdbB5KLdcOcPAZnO1Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: eduncan911@gmail.com
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6154287337953322365==
Content-Type: multipart/alternative; boundary="00000000000048ba640579000f7b"

--00000000000048ba640579000f7b
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Oct 2018 at 14:25, Eric Duncan <eduncan911@gmail.com> wrote:

>
> On Thu, Oct 18, 2018 at 2:03 PM Aaron Gray wrote:
>
>> I have two ASUS PRIME Z270-A machines based on Intel Z270 chipset and am
>> wondering about when support will be available for them and what I can do
>> to speed this up.
>>
>> But I have not done anything to do with kernel work since years ago when
>> I read a lot of the main parts of the Linux 2.4 Kernel. Also I did code to
>> get into and out of protected mode before this.
>>
>> Heres the datasheets that cover the chipset :-
>>
>>
>> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html
>>
>> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html
>>
>> Regards,
>>
>> Aaron
>>
>
> It's your Linux kernel that needs to support your hardware, not Xen itself.
>
> I personally run Xen with an Arch Linux dom0 specifically for this purpose
> of getting the latest hardware support across my devices.  For example, I
> am on kernel 4.18.10 at this moment.  The AUR also keeps a fairly recent
> version of Xen, currently 4.11.
>

That sounds an interesting direction I would try Arch if I was not trying
to get Xen Fedora rawhide sussed as I need this step to get my machine
architecture working with Qubes.

F29 Beta has 4.11.0

At present I have one instillation on F29 that worked straight away with :-

    sudo yum groupinstall 'Virtualization'
    sudo yum install xen

And another were I did a yum update first and Xen it does not function with
the missing module.mod and multiboot.mod issue that was found in F27 and
F28.

    https://bugzilla.redhat.com/show_bug.cgi?id=1486002#c36

I just need to do the diff's on /boot and the rpm's tomorrow to see what if
I can find the issue.

Regards,

Aaron






-- 
Aaron Gray

Independent Open Source Software Engineer, Computer Language Researcher,
Information Theorist, and amateur computer scientist.

--00000000000048ba640579000f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Wed, 24 Oct 2018 at 14:25, Eric Duncan &lt;<a href=
=3D"mailto:eduncan911@gmail.com">eduncan911@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padd=
ing-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;borde=
r-left-style:solid"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Thu, Oct 18, 2018 at 2:03 PM Aaron Gray wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:=
1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-st=
yle:solid"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I have t=
wo ASUS PRIME Z270-A machines based on Intel Z270 chipset and am wondering =
about when support will be available for them and what I can do to speed th=
is up.</div><div><br></div><div>But I have not done anything to do with ker=
nel work since years ago when I read a lot of the main parts of the Linux 2=
.4 Kernel. Also I did code to get into and out of protected mode before thi=
s.</div><div><br></div><div>Heres the datasheets that cover the chipset :-<=
/div><div><br></div><div><a href=3D"https://www.intel.com/content/www/us/en=
/chipsets/200-series-chipset-pch-datasheet-vol-1.html" target=3D"_blank">ht=
tps://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datas=
heet-vol-1.html</a></div><div><a href=3D"https://www.intel.com/content/www/=
us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html" target=3D"_blan=
k">https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-=
datasheet-vol-2.html</a></div><div><br></div><div>Regards,</div><div><br></=
div><div>Aaron</div></div></div></div></blockquote><div><br></div><div>It&#=
39;s your Linux kernel that needs to support your hardware, not Xen itself.=
</div><div><br></div><div>I personally run Xen with an Arch Linux dom0 spec=
ifically for this purpose of getting the latest hardware support across my =
devices.=C2=A0 For example, I am on kernel 4.18.10 at this moment.=C2=A0 Th=
e AUR also keeps a fairly recent version of Xen, currently 4.11.<br></div><=
/div></div></blockquote><div><br></div><div>That sounds an interesting dire=
ction I would try Arch if I was not trying to get Xen Fedora rawhide sussed=
 as I need this step to get my machine architecture working with Qubes.</di=
v><div><br></div><div>F29 Beta has 4.11.0</div><div><br></div><div><div sty=
le=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica,sans-serif;o=
utline:transparent 0px;border:0px rgb(34,34,34);width:568px;text-align:left=
;color:rgb(34,34,34);text-transform:none;text-indent:0px;letter-spacing:nor=
mal;overflow:visible;text-decoration:none;word-spacing:0px;white-space:norm=
al;font-size-adjust:none;font-stretch:100%"><font face=3D"arial,helvetica,s=
ans-serif" style=3D"background:none;font:400 13.33px/19.99px arial,helvetic=
a,sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:auto;le=
tter-spacing:normal;overflow:visible;font-size-adjust:none;font-stretch:100=
%">At present I have one instillation on F29 that worked straight away with=
 :-</font></div><div style=3D"background:none;font:400 13.33px/19.99px Aria=
l,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);wid=
th:568px;text-align:left;color:rgb(34,34,34);text-transform:none;text-inden=
t:0px;letter-spacing:normal;overflow:visible;text-decoration:none;word-spac=
ing:0px;white-space:normal;font-size-adjust:none;font-stretch:100%"><font f=
ace=3D"arial,helvetica,sans-serif" style=3D"background:none;font:400 13.33p=
x/19.99px arial,helvetica,sans-serif;outline:transparent 0px;border:0px rgb=
(34,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-adju=
st:none;font-stretch:100%"></font><br style=3D"background:none;font:400 13.=
33px/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px =
rgb(34,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-a=
djust:none;font-stretch:100%"></div><div style=3D"background:none;font:400 =
13.33px/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0=
px rgb(34,34,34);width:568px;text-align:left;color:rgb(34,34,34);text-trans=
form:none;text-indent:0px;letter-spacing:normal;overflow:visible;text-decor=
ation:none;word-spacing:0px;white-space:normal;font-size-adjust:none;font-s=
tretch:100%"><font face=3D"arial,helvetica,sans-serif" style=3D"background:=
none;font:400 13.33px/19.99px arial,helvetica,sans-serif;outline:transparen=
t 0px;border:0px rgb(34,34,34);width:auto;letter-spacing:normal;overflow:vi=
sible;font-size-adjust:none;font-stretch:100%">=C2=A0 =C2=A0 sudo <span sty=
le=3D"font:400 13.33px/20.45px arial,helvetica,sans-serif;text-align:left;c=
olor:rgb(0,0,0);text-transform:none;text-indent:0px;letter-spacing:normal;t=
ext-decoration:none;word-spacing:0px;display:inline;white-space:pre-wrap;fo=
nt-size-adjust:none;font-stretch:100%;float:none;background-color:rgb(249,2=
49,249)">yum groupinstall &#39;Virtualization&#39;<br>=C2=A0=C2=A0=C2=A0 su=
do yum install xen<b><br></b></span></font></div><div style=3D"background:n=
one;font:400 13.33px/19.99px Arial,Helvetica,sans-serif;outline:transparent=
 0px;border:0px rgb(34,34,34);width:568px;text-align:left;color:rgb(34,34,3=
4);text-transform:none;text-indent:0px;letter-spacing:normal;overflow:visib=
le;text-decoration:none;word-spacing:0px;white-space:normal;font-size-adjus=
t:none;font-stretch:100%"><b style=3D"background:none;font:700 13.33px/19.9=
9px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34,34=
,34);width:auto;letter-spacing:normal;overflow:visible;font-size-adjust:non=
e;font-stretch:100%"></b><i style=3D"background:none;font:italic 400 13.33p=
x/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb=
(34,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-adju=
st:none;font-stretch:100%"></i><u style=3D"background:none;font:400 13.33px=
/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(=
34,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-adjus=
t:none;font-stretch:100%"></u><sub style=3D"background:none;font:400 9.2px/=
13.8px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34=
,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-adjust:=
none;font-stretch:100%"></sub><sup style=3D"background:none;font:400 9.2px/=
13.8px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34=
,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-adjust:=
none;font-stretch:100%"></sup><strike style=3D"background:none;font:400 13.=
33px/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px =
rgb(34,34,34);width:auto;letter-spacing:normal;overflow:visible;font-size-a=
djust:none;font-stretch:100%"></strike><font face=3D"arial,helvetica,sans-s=
erif" style=3D"background:none;font:400 13.33px/19.99px arial,helvetica,san=
s-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:auto;letter-=
spacing:normal;overflow:visible;font-size-adjust:none;font-stretch:100%"></=
font><b style=3D"background:none;font:700 13.33px/19.99px Arial,Helvetica,s=
ans-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:auto;lette=
r-spacing:normal;overflow:visible;font-size-adjust:none;font-stretch:100%">=
</b><b style=3D"background:none;font:700 13.33px/19.99px Arial,Helvetica,sa=
ns-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:auto;letter=
-spacing:normal;overflow:visible;font-size-adjust:none;font-stretch:100%"><=
/b><br style=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica,sa=
ns-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:auto;letter=
-spacing:normal;overflow:visible;font-size-adjust:none;font-stretch:100%"><=
/div><div style=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica=
,sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:568px;te=
xt-align:left;color:rgb(34,34,34);text-transform:none;text-indent:0px;lette=
r-spacing:normal;overflow:visible;text-decoration:none;word-spacing:0px;whi=
te-space:normal;font-size-adjust:none;font-stretch:100%">And another were I=
 did a yum update first and Xen it does not function with the missing modul=
e.mod and multiboot.mod issue that was found in F27 and F28.</div><div styl=
e=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica,sans-serif;ou=
tline:transparent 0px;border:0px rgb(34,34,34);width:568px;text-align:left;=
color:rgb(34,34,34);text-transform:none;text-indent:0px;letter-spacing:norm=
al;overflow:visible;text-decoration:none;word-spacing:0px;white-space:norma=
l;font-size-adjust:none;font-stretch:100%"><br></div><div style=3D"backgrou=
nd:none;font:400 13.33px/19.99px Arial,Helvetica,sans-serif;outline:transpa=
rent 0px;border:0px rgb(34,34,34);width:568px;text-align:left;color:rgb(34,=
34,34);text-transform:none;text-indent:0px;letter-spacing:normal;overflow:v=
isible;text-decoration:none;word-spacing:0px;white-space:normal;font-size-a=
djust:none;font-stretch:100%">=C2=A0 =C2=A0 <a style=3D"margin:0px;padding:=
0px;border:0px rgb(17,85,204);color:rgb(17,85,204);text-decoration:none" hr=
ef=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1486002#c36" target=3D"=
_blank" rel=3D"nofollow">https://bugzilla.redhat.com/show_bug.cgi?id=3D1486=
002#c36</a></div><div style=3D"background:none;font:400 13.33px/19.99px Ari=
al,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);wi=
dth:568px;text-align:left;color:rgb(34,34,34);text-transform:none;text-inde=
nt:0px;letter-spacing:normal;overflow:visible;text-decoration:none;word-spa=
cing:0px;white-space:normal;font-size-adjust:none;font-stretch:100%"><br></=
div><div style=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica,=
sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:568px;tex=
t-align:left;color:rgb(34,34,34);text-transform:none;text-indent:0px;letter=
-spacing:normal;overflow:visible;text-decoration:none;word-spacing:0px;whit=
e-space:normal;font-size-adjust:none;font-stretch:100%">I just need to do t=
he diff&#39;s on /boot and the rpm&#39;s tomorrow to see what if I can find=
 the issue.</div><div style=3D"background:none;font:400 13.33px/19.99px Ari=
al,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);wi=
dth:568px;text-align:left;color:rgb(34,34,34);text-transform:none;text-inde=
nt:0px;letter-spacing:normal;overflow:visible;text-decoration:none;word-spa=
cing:0px;white-space:normal;font-size-adjust:none;font-stretch:100%"><br></=
div><div style=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica,=
sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);width:568px;tex=
t-align:left;color:rgb(34,34,34);text-transform:none;text-indent:0px;letter=
-spacing:normal;overflow:visible;text-decoration:none;word-spacing:0px;whit=
e-space:normal;font-size-adjust:none;font-stretch:100%">Regards,</div><div =
style=3D"background:none;font:400 13.33px/19.99px Arial,Helvetica,sans-seri=
f;outline:transparent 0px;border:0px rgb(34,34,34);width:568px;text-align:l=
eft;color:rgb(34,34,34);text-transform:none;text-indent:0px;letter-spacing:=
normal;overflow:visible;text-decoration:none;word-spacing:0px;white-space:n=
ormal;font-size-adjust:none;font-stretch:100%"><br></div><div style=3D"back=
ground:none;font:400 13.33px/19.99px Arial,Helvetica,sans-serif;outline:tra=
nsparent 0px;border:0px rgb(34,34,34);width:568px;text-align:left;color:rgb=
(34,34,34);text-transform:none;text-indent:0px;letter-spacing:normal;overfl=
ow:visible;text-decoration:none;word-spacing:0px;white-space:normal;font-si=
ze-adjust:none;font-stretch:100%">Aaron</div><div style=3D"background:none;=
font:400 13.33px/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px=
;border:0px rgb(34,34,34);width:568px;text-align:left;color:rgb(34,34,34);t=
ext-transform:none;text-indent:0px;letter-spacing:normal;overflow:visible;t=
ext-decoration:none;word-spacing:0px;white-space:normal;font-size-adjust:no=
ne;font-stretch:100%"><br></div><div style=3D"background:none;font:400 13.3=
3px/19.99px Arial,Helvetica,sans-serif;outline:transparent 0px;border:0px r=
gb(34,34,34);width:568px;text-align:left;color:rgb(34,34,34);text-transform=
:none;text-indent:0px;letter-spacing:normal;overflow:visible;text-decoratio=
n:none;word-spacing:0px;white-space:normal;font-size-adjust:none;font-stret=
ch:100%"><br></div><div style=3D"background:none;font:400 13.33px/19.99px A=
rial,Helvetica,sans-serif;outline:transparent 0px;border:0px rgb(34,34,34);=
width:568px;text-align:left;color:rgb(34,34,34);text-transform:none;text-in=
dent:0px;letter-spacing:normal;overflow:visible;text-decoration:none;word-s=
pacing:0px;white-space:normal;font-size-adjust:none;font-stretch:100%"><br>=
</div><div style=3D"background:none;outline:transparent 0px;border:0px rgb(=
34,34,34);width:568px;text-align:left;color:rgb(34,34,34);text-transform:no=
ne;line-height:19.99px;text-indent:0px;letter-spacing:normal;overflow:visib=
le;font-family:Arial,Helvetica,sans-serif;font-size:13.33px;font-variant:no=
rmal;word-spacing:0px;white-space:normal;font-size-adjust:none;font-stretch=
:100%"><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></di=
v><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><b></b><i></i=
><u></u><sub></sub><sup></sup><strike></strike><br></div></div><b></b><i></=
i><u></u><sub></sub><sup></sup><strike></strike><br>-- <br><div class=3D"gm=
ail_signature" dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Aaro=
n Gray</div><div><br></div><div>Independent Open Source Software Engineer, =
Computer Language Researcher, Information Theorist, and amateur computer sc=
ientist.<br></div></div></div></div></div></div></div></div>

--00000000000048ba640579000f7b--


--===============6154287337953322365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6154287337953322365==--
