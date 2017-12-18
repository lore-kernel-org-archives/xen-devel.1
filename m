From: Govinda Tatti <Govinda.Tatti@Oracle.COM>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Mon, 18 Dec 2017 11:22:06 -0600
Message-ID: <7ded77fb-8c94-2ca6-33b7-90e35f5293d4__43607.0360396572$1513618049$gmane$org@Oracle.COM>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
 <20171218122629.GA18423@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vyyb=do=oracle.com=govinda.tatti@srs-us1.protection.inumbo.net>)
 id 1eQzD9-0004IG-VQ
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 17:28:20 +0000
In-Reply-To: <20171218122629.GA18423@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: jgross@suse.com, Satanand Burla <satananda.burla@caviumnetworks.com>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-pci@vger.kernel.org, Felix Manlunas <felix.manlunas@caviumnetworks.com>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Sinan Kaya <okaya@codeaurora.org>, Bjorn Helgaas <helgaas@kernel.org>, JBeulich@suse.com, Russell Currey <ruscur@russell.cc>, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xOC8yMDE3IDY6MjYgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIEZy
aSwgRGVjIDE1LCAyMDE3IGF0IDEyOjE4OjAyUE0gLTA2MDAsIEJqb3JuIEhlbGdhYXMgd3JvdGU6
Cj4+IEkgdGhpbmsgQ2hyaXN0b3BoIHZvbHVudGVlcmVkIHRvIGRvIHNvbWUgcmVzdHJ1Y3R1cmlu
ZywgYnV0IEkgZG9uJ3QKPj4ga25vdyBoaXMgdGltZWZyYW1lLiAgSWYgeW91IGNhbiwgSSB3b3Vs
ZCBwcm9iYWJseSB3YWl0IGZvciB0aGF0Cj4+IGJlY2F1c2UgdGhlcmUncyBzbyBtdWNoIG92ZXJs
YXAgaGVyZS4KPiBJJ2xsIGhhdmUgc29tZSB0aW1lIG92ZXIgdGhlIGhvbGlkYXlzLiAgSWYgeW91
IG5lZWQgaXQgbW9yZSB1cmdlbnQKPiB0aGFuIHRoYXQgZmVlbCBmcmVlIHRvIHRha2Ugb3Zlci4K
V2Ugd2lsbCB3YWl0IGZvciB5b3VyIGNoYW5nZXMuIFRoYW5rcyBDaHJpc3RvcGguCgpDaGVlcnMK
R09WSU5EQQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
