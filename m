From: Lele Ma <lelema.zh@gmail.com>
Subject: [C stubdom] printf to console not complete
Date: Mon, 26 Mar 2018 06:44:20 -0400
Message-ID: <CA+-OKzWTfLLLdWTGxgybWd4k9OsYx7yjUWrnNSCvMe_4HkEA6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023251276130479312=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uzai=gq=gmail.com=lelema.zh@srs-us1.protection.inumbo.net>)
 id 1f0Pbz-0002m5-0i
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 10:44:23 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============2023251276130479312==
Content-Type: multipart/alternative; boundary="000000000000e4a25f05684e74ae"

--000000000000e4a25f05684e74ae
Content-Type: text/plain; charset="UTF-8"

Dear all,

This is Lele Ma, a graduate student from The College of William and Mary. I
am playing with c-stubdom on Xen-4.9.1 and encountered problems when do
printings using printf.

It seems that if I print many lines of strings consecutively, many lines
would got cut at the tail.
Here is an example code I tested in C stubdom:

// file /stubdom/c/main.c

int main(void) {
  int i = 0;
  for (i=0; i< 1000; i++){
    printf("print %d \n", i);
  }
  return 0;
}

After build and run, the output got cut in the middle and only the first
~400 lines got printed, as following:

------------- output begin ---------------------

root@xen-4.9.1: c # xl create -c ../../extras/mini-os/domain_config
Parsing config from ../../extras/mini-os/domain_config
...
print 427    *<---looks good*
print 428
print 429
print 430
print 431
print 432
print 433
print 434   *<--- prints got cut here (should print to 999), and different
executions got cut in different lines. *
root@xen-4.9.1: c #

------------ output end -----------------------

However, if I use sleep(1) after every printf, it could print all lines.

Could anyone give any hints about what is happening here? And where need to
be fixed to get all printings properly with printf?

Best,
Lele

--000000000000e4a25f05684e74ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear all, <br><br>This is Lele Ma, a graduate student from=
 The College of William and Mary. I am playing with c-stubdom on Xen-4.9.1 =
and encountered problems when do printings using printf.=C2=A0<div><br><div=
>It seems that if I print many lines of strings consecutively, many lines w=
ould got cut at the tail.=C2=A0</div><div><div>Here is an example code I te=
sted in C stubdom:<br><br>// file /stubdom/c/main.c</div><div><br><div><div=
>int main(void) { =C2=A0<br>=C2=A0 int i =3D 0;<br>=C2=A0 for (i=3D0; i&lt;=
 1000; i++){<br>=C2=A0 =C2=A0 printf(&quot;print %d \n&quot;, i);<br>=C2=A0=
 }<br>=C2=A0 return 0;<br>}<br><br>After build and run, the output got cut =
in the middle and only the first ~400 lines got printed, as following:<br><=
br>------------- output begin ---------------------=C2=A0</div><div><br>roo=
t@xen-4.9.1: c # xl create -c ../../extras/mini-os/domain_co<wbr>nfig<br>Pa=
rsing config from ../../extras/mini-os/domain_co<wbr>nfig<br>... =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>print 427 =C2=A0 =C2=A0<b>&lt;--=
-looks good</b><br>print 428 <br>print 429 <br>print 430 <br>print 431 <br>=
print 432 <br>print 433 <br>print 434 =C2=A0 <b>&lt;--- prints got cut here=
 (should print to 999), and different executions got cut in different lines=
. </b><br>root@xen-4.9.1: c #<br><br>------------ output end --------------=
---------<br><br>However,=C2=A0if I use sleep(1) after every printf, it cou=
ld print all lines.=C2=A0<br><br>Could anyone give any hints about what is =
happening here? And where need to be fixed to get all printings properly wi=
th printf?<br><br>Best,<br>Lele<br><br><br><br><br><br><br></div></div></di=
v></div></div></div>

--000000000000e4a25f05684e74ae--


--===============2023251276130479312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2023251276130479312==--
