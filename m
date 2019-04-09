From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/IOMMU: abstract Intel-specific
 adjust_vtd_irq_affinities()
Date: Tue, 9 Apr 2019 10:11:40 +0100
Message-ID: <286a0d17-4faf-d6cf-b98e-9accb3615ea0@citrix.com>
References: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rl/Z=SL=citrix.com=prvs=995435944=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hDmnC-0003l8-5a
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:11:46 +0000
In-Reply-To: <5CAB2DAA02000078002254F3@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMjAxOSAxMjoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBjYW4ndCBiZSBm
b2xkZWQgaW50byB0aGUgcmVzdW1lIGhvb2ssIGFzIHRoYXQgcnVucyBiZWZvcmUgYnJpbmdpbgoK
YnJpbmdpbmcKCj4gYmFjayB1cCBBUHMsIGJ1dCB0aGUgYWZmaW5pdHkgYWRqdXN0bWVudCB3YW50
cyB0byBoYXBwZW4gd2l0aCBhbGwgQ1BVcwo+IGJhY2sgb25saW5lLiBIZW5jZSBhIHNlcGFyYXRl
IGhvb2sgaXMgbmVlZGVkIHN1Y2ggdGhhdCBBTUQgY2FuIHRoZW4KPiBsZXZlcmFnZSBpdCBhcyB3
ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
