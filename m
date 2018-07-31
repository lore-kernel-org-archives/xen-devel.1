From: Lele Ma <lelema.zh@gmail.com>
Subject: Networking with MiniOS
Date: Tue, 31 Jul 2018 17:42:01 -0400
Message-ID: <CA+-OKzVn9-ijw+z8toXWy=6HcXsD=HeLKEA3-Y1C5LSsTro57A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0077088603988907623=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h+0c=kp=gmail.com=lelema.zh@srs-us1.protection.inumbo.net>)
 id 1fkcPG-0004PR-U0
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 21:42:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org
Cc: xen-devel <xen-devel@lists.xenproject.org>, tamas.lengyel@zentific.com
List-Id: xen-devel@lists.xenproject.org

--===============0077088603988907623==
Content-Type: multipart/alternative; boundary="00000000000068c3d505725273e8"

--00000000000068c3d505725273e8
Content-Type: text/plain; charset="UTF-8"

Dear All,

I am trying to enable networking with MiniOS.

I created a daytime server based on daytime.c
<https://github.com/xen-project/mini-os/blob/master/daytime.c> shipped with
MiniOS. The code in daytime.c is copied into stubdom/c/main.c and built
with c-stubdom.
Server thread is created successfully but client cannot establish tcp
connection with server thread, neither from MiniOS itself or from anther VM
(dom0).

The client code in MiniOS is:
-------------------------------
 while (1){
        targetconn = netconn_new(NETCONN_TCP);
            if ( targetconn == NULL ) {
            /* No memory for new connection? */
            continue;
        }
        rc = netconn_bind(targetconn, &localip, 0);
*        //... success binding*
        rc = netconn_connect ( targetconn, &remote_ip, LISTEN_PORT );

        if ( rc != ERR_OK )
        {
*            // always catched the error here*
            printf("----%s: Error connecting. Now reconnect...\n",
__FUNCTION__);
            netconn_delete ( targetconn );
            continue;
        }
    }
-------------------------------------------------
(Complete code: https://github.com/tinyvmi/tinynet/blob/master/daytime.c)

On dom0, I used telnet <minios-ip> <port> to connect, also with no luck.

Could anyone give some hints how should I build a tcp connection with
MiniOS?

Best,
Lele Ma

--00000000000068c3d505725273e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear All,<div><br></div><div>I am trying to enable network=
ing with MiniOS.</div><div><br></div><div>I created a daytime server based =
on <a href=3D"https://github.com/xen-project/mini-os/blob/master/daytime.c"=
>daytime.c</a> shipped with MiniOS. The code in daytime.c is copied into st=
ubdom/c/main.c and built with c-stubdom.=C2=A0</div><div>Server thread is c=
reated successfully but client cannot establish tcp connection with server =
thread, neither from MiniOS itself or from anther VM (dom0).</div><div><br>=
</div><div>The client code in MiniOS is:</div><div>------------------------=
-------</div><div><div>=C2=A0while (1){</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 targetconn =3D netconn_new(NETCONN_TCP);<br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( targetconn =3D=3D NULL ) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 No memory for new connection? */</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D netconn_bind(targetconn, &amp;localip, 0);<=
/div><div><b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 //... success binding</b></div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D netconn_connect ( targetconn, &amp;rem=
ote_ip, LISTEN_PORT );=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rc !=3D ERR_OK )</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 {</div><div><b>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // always catched the error here</b></div><div><b>=C2=A0</b> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;----%s: Error connecting. Now reconne=
ct...\n&quot;, __FUNCTION__);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 netconn_delete ( targetconn );</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 continue;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div>=
=C2=A0 =C2=A0 }<br></div></div><div>---------------------------------------=
----------</div><div>(Complete code:=C2=A0<a href=3D"https://github.com/tin=
yvmi/tinynet/blob/master/daytime.c">https://github.com/tinyvmi/tinynet/blob=
/master/daytime.c</a>)</div><div><br></div><div>On dom0, I used telnet &lt;=
minios-ip&gt; &lt;port&gt; to connect, also with no luck.</div><div><br></d=
iv><div>Could anyone give some hints how should I build a tcp connection wi=
th MiniOS?=C2=A0=C2=A0</div><div><br></div><div>Best,<br>Lele Ma</div><div>=
<br></div></div>

--00000000000068c3d505725273e8--


--===============0077088603988907623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0077088603988907623==--
