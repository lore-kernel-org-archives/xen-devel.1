From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
	memcpy
Date: Mon, 5 Feb 2018 10:51:10 -0500 (EST)
Message-ID: <nycvar.YSQ.7.76.1802051047031.1842__35463.5873031386$1517847904$gmane$org@knanqh.ubzr>
References: <20180205150340.328921-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mb+f=e7=fluxnic.net=nico@srs-us1.protection.inumbo.net>)
 id 1eij34-00050i-RJ
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 15:51:15 +0000
In-Reply-To: <20180205150340.328921-1-arnd@arndb.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCA1IEZlYiAyMDE4LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgoKPiArCWlmIChjbWQgPiBB
UlJBWV9TSVpFKGV2dGNobm9wX2xlbikpCj4gKwkJcmV0dXJuIC1FTk9TWVM7Cj4gKwlsZW4gPSBl
dnRjaG5vcF9sZW5bY21kXTsKCldoYXQgaWYgY21kID09IEFSUkFZX1NJWkUoZXZ0Y2hub3BfbGVu
KSA/CgoKTmljb2xhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
