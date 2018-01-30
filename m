From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] x86: re-organize toggle_guest_*()
Date: Tue, 30 Jan 2018 13:45:30 +0000
Message-ID: <b1db3393-51c9-e0ca-0909-5328b3b61765@citrix.com>
References: <5A671D6D02000078001A17B7@prv-mh.provo.novell.com>
 <5A671EB002000078001A17C7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=chuq=ez=citrix.com=prvs=5612829e9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1egWEX-0003yx-Vs
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 13:45:58 +0000
In-Reply-To: <5A671EB002000078001A17C7@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMTggMTA6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IHRvZ2dsZV9ndWVzdF9tb2Rl
KCkgaXMgb25seSBldmVyIGJlaW5nIGNhbGxlZCBmb3IgNjQtYml0IFBWIHZDUFUtcyAtCj4gcmVw
bGFjZSB0aGUgMzItYml0IFBWIGNvbmRpdGlvbmFsIGJ5IGFuIEFTU0VSVCgpLgo+Cj4gSW50cm9k
dWNlIGEgbG9jYWwgaGVscGVyIHdpdGhvdXQgMzItYml0IFBWIGNvbmRpdGlvbmFsLCB0byBiZSB1
c2VkIGJ5Cj4gYm90aCBwcmUtZXhpc3RpbmcgZnVuY3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
