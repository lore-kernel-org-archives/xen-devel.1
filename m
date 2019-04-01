From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Subject: Re: [PATCH 0/4] More python fixes
Date: Mon, 1 Apr 2019 20:36:44 +0000
Message-ID: <alpine.LFD.2.21.1904012117030.3030@austen3.home>
References: <20190401103238.15649-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="_002_alpineLFD22119040121170303030austen3home_"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zzay=SD=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hB3fl-00078u-C2
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 20:36:49 +0000
In-Reply-To: <20190401103238.15649-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--_002_alpineLFD22119040121170303030austen3home_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B57194797A020445A3C14A9E3557CCA6@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2019, Wei Liu wrote:

> Wei Liu (4):
>  pygrub: fix message in grub parser
>  pygrub/grub: always use integer for default entry
>  pygrub: decode string in Python 3
>  tools/ocaml: make python scripts 2 and 3 compatible
>
> tools/ocaml/libs/xentoollog/genlevels.py |  5 ++++-
> tools/ocaml/libs/xl/genwrap.py           | 17 ++++++++++-------
> tools/pygrub/src/GrubConf.py             |  8 ++++++--
> tools/pygrub/src/pygrub                  |  5 ++++-
> 4 files changed, 24 insertions(+), 11 deletions(-)

There is a bit missing compared to my original patch which is to convert=20
the string back to bytes for the final write out and avoid the error

Traceback (most recent call last):
   File "/tmp/xencode/usr/libexec/xen/bin/pygrub", line 967, in <module>
     os.write(fd, ostring)
TypeError: a bytes-like object is required, not 'str'

The attached patch works for me in a quick test on python3 though I=20
haven't tested it on python2 yet.

 	Michael Young=

--_002_alpineLFD22119040121170303030austen3home_
Content-Type: text/plain; name="python3.patch"
Content-Description: python3.patch
Content-Disposition: attachment; filename="python3.patch"; size=445;
	creation-date="Mon, 01 Apr 2019 20:36:43 GMT";
	modification-date="Mon, 01 Apr 2019 20:36:43 GMT"
Content-ID: <alpine.LFD.2.21.1904012136350.3030@austen3.home>
Content-Transfer-Encoding: base64

LS0tIHhlbi00LjEyLjAvdG9vbHMvcHlncnViL3NyYy9weWdydWIub3JpZwkyMDE5LTA0LTAxIDIx
OjI1OjMzLjIwNjQwNTk5NSArMDEwMA0KKysrIHhlbi00LjEyLjAvdG9vbHMvcHlncnViL3NyYy9w
eWdydWIJMjAxOS0wNC0wMSAyMToyNzozNi4xNzk5MjkxMDUgKzAxMDANCkBAIC05NjMsNSArOTYz
LDggQEANCiAgICAgICAgIG9zdHJpbmcgPSBmb3JtYXRfc2ltcGxlKGJvb3RjZmdbImtlcm5lbCJd
LCBib290Y2ZnWyJyYW1kaXNrIl0sIGFyZ3MsICJcMCIpDQogDQogICAgIHN5cy5zdGRvdXQuZmx1
c2goKQ0KLSAgICBvcy53cml0ZShmZCwgb3N0cmluZykNCisgICAgaWYgc3lzLnZlcnNpb25faW5m
b1swXSA8IDM6DQorICAgICAgICBvcy53cml0ZShmZCwgb3N0cmluZykNCisgICAgZWxzZToNCisg
ICAgICAgIG9zLndyaXRlKGZkLCBvc3RyaW5nLmVuY29kZSgpKQ0KICAgICANCg==

--_002_alpineLFD22119040121170303030austen3home_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_002_alpineLFD22119040121170303030austen3home_--
