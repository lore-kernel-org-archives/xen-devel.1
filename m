From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 6/8] x86: enable interrupts earlier with
 XPTI disabled
Date: Thu, 22 Mar 2018 12:23:17 +0000
Message-ID: <20180322122317.4cwqkpct6a5xaakt@citrix.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCBF202000078001B372F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f68c=gm=citrix.com=prvs=6120e2e14=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyzG4-0000xg-Fg
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 12:23:52 +0000
Content-Disposition: inline
In-Reply-To: <5AAFCBF202000078001B372F@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6NDA6NTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIFNUSSBpbnN0YW5jZXMgd2VyZSBtb3ZlZCAob3IgYWRkZWQgaW4gdGhlIElOVDgw
IGNhc2UpIHRvIG1lZXQgVExCCj4gZmx1c2ggcmVxdWlyZW1lbnRzLiBXaGVuIFhQVEkgaXMgZGlz
YWJsZWQsIHRoZXkgY2FuIGJlIHB1dCBiYWNrIHdoZXJlCj4gdGhleSB3ZXJlIChvciBvbWl0dGVk
IGluIHRoZSBJTlQ4MCBjYXNlKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
