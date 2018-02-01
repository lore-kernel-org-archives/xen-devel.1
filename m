From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shim: don't use 32-bit compare on
 boolean variable
Date: Thu, 1 Feb 2018 10:06:18 +0000
Message-ID: <20180201100618.aqaqq5mlfdrdk3pp@MacBook-Pro-de-Roger.local>
References: <5A71EFEA02000078001A40E6@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmgq=e3=citrix.com=prvs=563c9b0be=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ehBlH-0008Ih-UX
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 10:06:31 +0000
Content-Disposition: inline
In-Reply-To: <5A71EFEA02000078001A40E6@prv-mh.provo.novell.com>
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

T24gV2VkLCBKYW4gMzEsIDIwMTggYXQgMDg6MzM6NDZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ3VycmVudCB1cHN0cmVhbSBnYXMgc2lsZW50bHkgYXNzdW1lcyAzMi1iaXQgb3BlcmFu
ZCBzaXplIGZvciBtb3N0Cj4gb3BlcmF0aW9ucyB3aGVyZSB0aGUgc2l6ZSBjYW4ndCBiZSBpbmZl
cnJlZCBmcm9tIGFuIGludm9sdmVkIHJlZ2lzdGVyCj4gKG15IG93biBvbmUgZG9lc24ndCBhbnlt
b3JlLCB3aGljaCBpcyBob3cgSSd2ZSBub3RpY2VkIHRoaXMpLiBJdCBpcyBwdXJlCj4gbHVjayB0
aGF0IHRoZSAzIGJ5dGVzIGZvbGxvd2luZyBwdmhfYm9vdCBhcmUgY3VycmVudGx5IHBhZGRpbmcg
b25lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
