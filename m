From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Wed, 19 Sep 2018 15:48:18 +0100
Message-ID: <20180919144818.7ccf6unelnspdd74@zion.uk.xensource.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2dmA-0004a1-7N
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 14:48:22 +0000
Content-Disposition: inline
In-Reply-To: <20180903154836.25708-4-apop@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMDMsIDIwMTggYXQgMDY6NDg6MzZQTSArMDMwMCwgQWRyaWFuIFBvcCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4KCkFj
a2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKRkFPRCBJJ20gZXhwZWN0aW5n
IHlvdSB0byBhZGRyZXNzIFRhbWFzJyBjb21tZW50IGluIHBhdGNoIDEgYW5kIHJlc2VuZC4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
