From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 5/9] x86/genapic: remove indirection from
 genapic hook accesses
Date: Fri, 21 Sep 2018 11:53:09 +0100
Message-ID: <20180921105309.gbiaaivopqd75voh@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C48802000078001E7488@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3J3h-0005d0-UE
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:53:13 +0000
Content-Disposition: inline
In-Reply-To: <5B97C48802000078001E7488@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MzU6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW5zdGVhZCBvZiBsb2FkaW5nIGEgcG9pbnRlciBhdCBlYWNoIHVzZSBzaXRlLCBoYXZl
IGEgc2luZ2xlIHJ1bnRpbWUKPiBpbnN0YW5jZSBvZiBzdHJ1Y3QgZ2VuYXBpYywgY29weWluZyBp
bnRvIGl0IGZyb20gdGhlIGluZGl2aWR1YWwKPiBpbnN0YW5jZXMuIFRoZSBpbmRpdmlkdWFsIGlu
c3RhbmNlcyBjYW4gdGhpcyB3YXkgYWxzbyBiZSBtb3ZlZCB0byAuaW5pdAo+IChhbHNvIGFkanVz
dCBhcGljX3Byb2JlW10gYXQgdGhpcyBvY2Nhc2lvbikuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
