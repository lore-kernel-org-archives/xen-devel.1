From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] qemu-trad: stop using the default IOREQ
 server
Date: Wed, 15 Aug 2018 16:55:00 +0100
Message-ID: <23412.19668.773857.698715@mariner.uk.xensource.com>
References: <20180803132029.33536-1-paul.durrant@citrix.com>
 <23412.2012.28701.881984@mariner.uk.xensource.com>
 <31eb5d35-486d-59ff-c339-dfccab5f5b5d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifg0=k6=citrix.com=prvs=7582f73c5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fpy8W-0002zy-Vr
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 15:55:05 +0000
In-Reply-To: <31eb5d35-486d-59ff-c339-dfccab5f5b5d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIHFlbXUtdHJhZDogc3RvcCB1c2luZyB0aGUg
ZGVmYXVsdCBJT1JFUSBzZXJ2ZXIiKToKPiBQYXVsIGlzIE9vTyBmb3IgYSB3aGlsZSwgc28gcmVw
bHlpbmcgb24gaGlzIGJlaGFsZi4KClRoYW5rIHlvdS4KCj4gUWVtdS10cmFkIGhhcyBubyBzdXBw
b3J0IGZvciBNTUNGRywgd2hpY2ggaXMgdGhlIG1lbW9yeSBtYXBwZWQgaW50ZXJmYWNlCj4gd2hp
Y2ggc3VwZXJzZWRlcyB0aGUgbW9yZSBsZWdhY3kgY2ZjL2NmOCBoYW5kbGluZyBmb3IgUENJIGNv
bmZpZyBzcGFjZQo+IGFjY2Vzc2VzLgo+IAo+IFhlbidzIGludGVyZmFjZSBwYXNzZXMgdGhlIHJl
cXVpc2l0ZSBpbmZvcm1hdGlvbiBpbiBNTUNGRyBmb3JtYXQsIHdoaWNoCj4gaXMgdGhlIG1vc3Qg
ZWZmaWNpZW50IHdheSB0byBkbyBpdC7CoCBUaGlzIHBpZWNlIG9mIChhZG1pdHRlZGx5IG1lc3N5
KQo+IGNvZGUgY29udmVydHMgdGhlIGluZm9ybWF0aW9uIHRvIHRoZSBsZWdhY3kgaW50ZXJmYWNl
IHdoaWNoIGlzIHRoZSBvbmUKPiB3aGljaCBRZW11IHVuZGVyc3RhbmRzLgo+IAo+IHRsO2RyLCBJ
dCdzIG1lc3N5LCBidXQgaXQgaXMgY29ycmVjdCwgYW5kIGlzIHRoZSBiZXN0ICgvb25seSwgc2hv
cnQgb2YKPiBpbXBsZW1lbnRpbmcgTU1DRkcgc3VwcG9ydCBpbiBxZW11LXRyYWQpIHdheSBvZiBk
b2luZyBpdC4KClRoYW5rcyBmb3IgdGhpcyBleGNlbGVudCBleHBsYW5hdGlvbi4gIENhbiB5b3Ug
cGxlYXNlIGFkZCBpdCB0byB0aGUKY29tbWl0IG1lc3NhZ2UgYW5kL29yIHRvIGEgY29tbWVudCBp
biB0aGUgY29kZSA/ICBZb3UgbWF5IHRoZW4gYWRkIG15CmFjay4gIEkgd2lsbCB0aGVuIGNvbW1p
dCB0aGUgcGF0Y2ggOi0pLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
