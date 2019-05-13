From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/IO-APIC: dump full destination ID in
 x2APIC mode
Date: Mon, 13 May 2019 14:55:27 +0100
Message-ID: <20190513135527.GI2798@zion.uk.xensource.com>
References: <5CA35DE90200007800223E5A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBQV-0005eM-Az
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:55:35 +0000
Content-Disposition: inline
In-Reply-To: <5CA35DE90200007800223E5A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDIsIDIwMTkgYXQgMDc6MDQ6NDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4geDJBUElDIG1vZGUgaXQgaXMgMzIgYml0cyB3aWRlLgo+IAo+IEluIF9fcHJpbnRf
SU9fQVBJQygpIGRyb3AgbG9nZ2luZyBvZiBib3RoIHBoeXNpY2FsIGFuZCBsb2dpY2FsIElEczoK
PiBUaGUgbGF0dGVyIGNvdmVycyBhIHN1cGVyc2V0IG9mIHRoZSBiaXRzIG9mIHRoZSBmb3JtZXIg
aW4gdGhlIFJURSwgYW5kCj4gd2Ugd3JpdGUgZnVsbCA4LWJpdCB2YWx1ZXMgYW55d2F5IGV2ZW4g
aW4gcGh5c2ljYWwgbW9kZSBmb3IgYWxsIG9yZGluYXJ5Cj4gaW50ZXJydXB0cywgcmVnYXJkbGVz
cyBvZiBJTlRfREVTVF9NT0RFIChzZWUgdGhlIHVzZXJzIG9mIFNFVF9ERVNUKCkpLgo+IAo+IEFk
anVzdCBvdGhlciBjb2x1bW4gYXJyYW5nZW1lbnQgKGFuZCBoZWFkaW5nKSBhIGxpdHRsZSBhcyB3
ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
