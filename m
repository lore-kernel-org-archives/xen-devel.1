From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] ns16550/PCI: fix skipping of devices
Date: Thu, 29 Nov 2018 16:56:43 +0000
Message-ID: <20181129165643.epldkdcqmujiybyy@zion.uk.xensource.com>
References: <5BB2440402000078001ED654@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WpH9=OI=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSPdN-00054K-BX
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:57:49 +0000
Content-Disposition: inline
In-Reply-To: <5BB2440402000078001ED654@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMDEsIDIwMTggYXQgMDk6NTc6NTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2VsZWN0aW5nIGJldHdlZW4gc2luZ2xlL211bHRpcGxlIEJBUiBtb2RlIHNob3VsZCBo
YXBwZW4gYWZ0ZXIgY2hlY2tpbmcKPiB3aGV0aGVyIHRvIHNraXAgdGhlIHByZXNlbnQgZGV2aWNl
LCBvciBlbHNlIG11bHRpLUJBUiBkZXZpY2VzIHdvbid0IGJlCj4gc2tpcHBlZCBjb3JyZWN0bHks
IGR1ZSB0byBwb3J0X2lkeCBnZXR0aW5nIHNldCB0byB6ZXJvIGluIHRoYXQgY2FzZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpTZWVpbmcgdGhh
dCB0aGlzIGhhcyBiZWVuIHBlbmRpbmcgZm9yIHNvIGxvbmcsIG9idmlvdXNseSBuby1vbmUgZWxz
ZSBoYXMKdGhlIHRpbWUgb3IgaW50ZXJlc3Qgb2YgZXhwZXJ0aXNlIHRvIHJldmlldyBpdCwgSSB3
aWxsIGhhdmUgdG8gZGVmZXIgdG8KeW91IGFzIHRoZSBleHBlcnQgaW4gdGhpcyBhcmVhLgoKQWNr
ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgp0byB0aGlzIHBhdGNoIGFuZCB0
aGUgb3RoZXIgc2VyaWVzIHlvdSBwb3N0ZWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
