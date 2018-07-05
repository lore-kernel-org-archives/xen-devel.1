From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] console: avoid printing no or null time
 stamps
Date: Thu, 5 Jul 2018 16:29:17 +0100
Message-ID: <20180705152916.oefm4dhxtt4ijath@citrix.com>
References: <5B3E224D02000078001D18B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzas=jv=citrix.com=prvs=717a9f9c1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fb6C8-0007Tq-Ri
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:29:20 +0000
Content-Disposition: inline
In-Reply-To: <5B3E224D02000078001D18B7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMDc6NTE6MDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRHVyaW5nIGVhcmx5IGJvb3QgdGltZXN0YW1wcyBhcmVuJ3QgdmVyeSB1c2VmdWwsIGFz
IHRoZXkncmUgYWxsIHplcm8KPiAoaW4gImJvb3QiIG1vZGUpIG9yIGFic2VudCBhbHRvZ2V0aGVy
IChpbiAiZGF0ZSIgYW5kICJkYXRlbXMiIG1vZGVzKS4KPiBMb2cgImJvb3QiIGZvcm1hdCB0aW1l
c3RhbXBzIHdoZW4gdGhlIGRhdGUgZm9ybWF0cyBhcmVuJ3QgYXZhaWxhYmxlIHlldCwKPiBhbmQg
bG9nIHJhdyB0aW1lc3RhbXBzIHdoZW4gYm9vdCBvbmVzIGFyZSBzdGlsbCBhbGwgemVyby4gQWxz
byBhZGQgYQo+ICJyYXciIG1vZGUuCj4gCj4gRm9yIHRoZSBBUk0gc2lkZSBnZXRfY3ljbGVzKCkg
dG8gcHJvZHVjZSBhIG1lYW5pbmdmdWwgdmFsdWUsIEFSTSdzCj4gY3ljbGVfdCBnZXRzIGNoYW5n
ZWQgdG8gdWludDY0X3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
