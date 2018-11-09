From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] pass-through: adjust pIRQ migration
Date: Fri, 9 Nov 2018 11:44:21 +0000
Message-ID: <c7ae8821-8563-d97a-7546-edb99c6a7976@citrix.com>
References: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wzzi=nu=citrix.com=prvs=84405b137=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gL5D7-0005Kj-Fz
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 11:44:25 +0000
In-Reply-To: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDkvMTggMTQ6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvciBvbmUgaXQgaXMgcXVp
dGUgcG9pbnRsZXNzIHRvIGl0ZXJhdGUgb3ZlciBhbGwgcElSUS1zIHRoZSBkb21haW4gaGFzCj4g
d2hlbiBqdXN0IG9uZSBpcyBiZWluZyBhZGp1c3RlZC4gSW50cm9kdWNlIGh2bV9taWdyYXRlX3Bp
cnEoKS4KPgo+IEFkZGl0aW9uYWxseSBpdCBpcyBib2d1cyB0byBtaWdyYXRlIHRoZSBwSVJRIHRv
IGEgdkNQVSBkaWZmZXJlbnQgZnJvbQo+IHRoZSBvbmUgdGhlIGV2ZW50IGlzIHN1cHBvc2VkIHRv
IGJlIHBvc3RlZCB0byAtIGlmIGFueXRoaW5nLCBpdCBtaWdodCBiZQo+IHdvcnRoIGNvbnNpZGVy
aW5nIG5vdCB0byBtaWdyYXRlIHRoZSBwSVJRIGF0IGFsbCBpbiB0aGUgcG9zdGluZyBjYXNlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
