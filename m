From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH v2 0/7] x86: Meltdown band-aid overhead
	reduction
Date: Tue, 13 Feb 2018 13:39:57 -0500
Message-ID: <3B6E9308-31CB-4A5E-8987-C686B67E5027@gmail.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0493940820998267228=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=chpt=fh=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1elfUm-0007hG-TK
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 18:40:00 +0000
Received: by mail-it0-x232.google.com with SMTP id d10so6059443itj.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2018 10:39:58 -0800 (PST)
In-Reply-To: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============0493940820998267228==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-FAE24D1C-F218-4BB5-8EC7-5D1FB7537E1D
Content-Transfer-Encoding: 7bit


--Apple-Mail-FAE24D1C-F218-4BB5-8EC7-5D1FB7537E1D
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Feb 7, 2018, at 11:05, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> 1: slightly reduce Meltdown band-aid overhead
> 2: remove CR reads from exit-to-guest path
> 3: introduce altinstruction_nop assembler macro
> 4: NOP out most XPTI entry/exit code when it's not in use
> 5: avoid double CR3 reload when switching to guest user mode
> 6: disable XPTI when RDCL_NO
> 7: x86: log XPTI enabled status

Since work on XPTI is ongoing, will these improvements to XPTI-stage-1 be pu=
blished via http://xenbits.xen.org/xsa/xsa254/README.pti?

Rich=

--Apple-Mail-FAE24D1C-F218-4BB5-8EC7-5D1FB7537E1D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div></div><div>On Feb 7, 2018, at 11:05, Jan Beulich &lt;<a href="mailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt; wrote:</div><div><br></div><blockquote type="cite"><div><span>1: slightly reduce Meltdown band-aid overhead</span><br><span>2: remove CR reads from exit-to-guest path</span><br><span>3: introduce altinstruction_nop assembler macro</span><br><span>4: NOP out most XPTI entry/exit code when it's not in use</span><br><span>5: avoid double CR3 reload when switching to guest user mode</span><br><span>6: disable XPTI when RDCL_NO</span><br><span>7: x86: log XPTI enabled status</span><br></div></blockquote><div><br></div><div>Since work on XPTI is ongoing, will these improvements
  to XPTI-stage-1 be published via&nbsp;<a href="http://xenbits.xen.org/xsa/xsa254/README.pti">http://xenbits.xen.org/xsa/xsa254/README.pti</a>?</div><div><br></div><div>Rich</div></body></html>
--Apple-Mail-FAE24D1C-F218-4BB5-8EC7-5D1FB7537E1D--


--===============0493940820998267228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0493940820998267228==--
