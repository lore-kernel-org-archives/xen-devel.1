From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/PV: fix off-by-one in I/O bitmap limit
 check
Date: Mon, 26 Feb 2018 10:44:14 +0000
Message-ID: <20180226104414.qjcefuqhbsgcchef@MacBook-Pro-de-Roger.local>
References: <5A93C77302000078001AB8CB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4q6f=fu=citrix.com=prvs=588a07e6a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqGGg-0006Kr-FS
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:44:26 +0000
Content-Disposition: inline
In-Reply-To: <5A93C77302000078001AB8CB@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMTI6Mzg6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2
aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLmFwdUBjaXRyaXguY29tPgoKSSB3b3Vs
ZCBob3dldmVyIGludmVydCB0aGUgY2hlY2ssIG15IGJyYWluIGZpbmRzIGl0IGVhc2llciB0byBy
ZWFkCmFzOgoKKHBvcnQgKyBieXRlcykgPD0gdi0+YXJjaC5wdl92Y3B1LmlvYm1wX2xpbWl0CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
