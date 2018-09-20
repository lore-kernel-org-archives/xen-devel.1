From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Thu, 20 Sep 2018 08:53:26 +0100
Message-ID: <20180920075326.5ojsdlnxqhtacnkt@zion.uk.xensource.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
 <20180919144818.7ccf6unelnspdd74@zion.uk.xensource.com>
 <eb0df7dc-ce09-7611-5b63-8b8583c39b4b@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1x7a=mc=citrix.com=prvs=794768bfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2tmX-00057j-Sv
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 07:53:49 +0000
Content-Disposition: inline
In-Reply-To: <eb0df7dc-ce09-7611-5b63-8b8583c39b4b@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjAsIDIwMTggYXQgMTA6NDY6MDFBTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDkvMTkvMTggNTo0OCBQTSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIE1vbiwg
U2VwIDAzLCAyMDE4IGF0IDA2OjQ4OjM2UE0gKzAzMDAsIEFkcmlhbiBQb3Agd3JvdGU6Cj4gPj4g
U2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4gPiAKPiA+
IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gCj4gPiBGQU9EIEkn
bSBleHBlY3RpbmcgeW91IHRvIGFkZHJlc3MgVGFtYXMnIGNvbW1lbnQgaW4gcGF0Y2ggMSBhbmQg
cmVzZW5kLgo+IAo+IEhlbGxvIFdlaSwKPiAKPiBUaGF0IGhhcyBhbHJlYWR5IGJlZW4gYWRkcmVz
c2VkIGluIFY2LCBhbmQgdGhlIHBhdGNoIGlzIGFscmVhZHkgaW46Cj4gCj4gaHR0cDovL3hlbmJp
dHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD1lZWE0ZWMyYjY2ZGFk
ODdlYzc0NTc3OGFiOWYwMGUxMmVmMGYyNzYwCgpZZXAuIFNhdyB0aGF0IHllc3RlcmRheSBhbmQg
SSBjb21taXR0ZWQgdGhlIGxhc3QgdHdvIHBhdGNoZXMgb2YgdjYuCgpXZWkuCgo+IAo+IAo+IFRo
YW5rcywKPiBSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
