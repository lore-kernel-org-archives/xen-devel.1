From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Mon, 18 Dec 2017 04:26:30 -0800
Message-ID: <20171218122629.GA18423__28489.7993704819$1513599946$gmane$org@infradead.org>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=a6li=do=bombadil.srs.infradead.org=batv+fb56882d68e01a86ab56+5230+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1eQuVJ-0006TP-Fw
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 12:26:45 +0000
Content-Disposition: inline
In-Reply-To: <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: jgross@suse.com, Sinan Kaya <okaya@codeaurora.org>, Govinda Tatti <Govinda.Tatti@Oracle.COM>, Herbert Xu <herbert@gondor.apana.org.au>, Satanand Burla <satananda.burla@caviumnetworks.com>, linux-pci@vger.kernel.org, Felix Manlunas <felix.manlunas@caviumnetworks.com>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Christoph Hellwig <hch@infradead.org>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, JBeulich@suse.com, Russell Currey <ruscur@russell.cc>, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMTUsIDIwMTcgYXQgMTI6MTg6MDJQTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBJIHRoaW5rIENocmlzdG9waCB2b2x1bnRlZXJlZCB0byBkbyBzb21lIHJlc3RydWN0
dXJpbmcsIGJ1dCBJIGRvbid0Cj4ga25vdyBoaXMgdGltZWZyYW1lLiAgSWYgeW91IGNhbiwgSSB3
b3VsZCBwcm9iYWJseSB3YWl0IGZvciB0aGF0Cj4gYmVjYXVzZSB0aGVyZSdzIHNvIG11Y2ggb3Zl
cmxhcCBoZXJlLgoKSSdsbCBoYXZlIHNvbWUgdGltZSBvdmVyIHRoZSBob2xpZGF5cy4gIElmIHlv
dSBuZWVkIGl0IG1vcmUgdXJnZW50CnRoYW4gdGhhdCBmZWVsIGZyZWUgdG8gdGFrZSBvdmVyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
