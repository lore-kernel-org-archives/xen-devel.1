From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 04/12] pci: split code to size BARs from
 pci_add_device
Date: Thu, 22 Mar 2018 04:15:06 -0600
Message-ID: <5AB3903A02000078001B4EA0@prv-mh.provo.novell.com>
References: <20180320151543.84348-1-roger.pau@citrix.com>
 <20180320151543.84348-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyxFW-0004Yx-16
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 10:15:10 +0000
In-Reply-To: <20180320151543.84348-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDE2OjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC02NzIsMTEgKzcyMiwxNiBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVz
LCB1OCBkZXZmbiwKPiAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gIAo+ICAgICAgICAg
ICAgICBCVUlMRF9CVUdfT04oQVJSQVlfU0laRShwZGV2LT52Zl9ybGVuKSAhPSBQQ0lfU1JJT1Zf
TlVNX0JBUlMpOwo+IC0gICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IFBDSV9TUklPVl9OVU1f
QkFSUzsgKytpICkKPiArICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBQQ0lfU1JJT1ZfTlVN
X0JBUlM7ICkKPiAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGlkeCA9IHBvcyArIFBDSV9TUklPVl9CQVIgKyBpICogNDsKPiAgICAgICAgICAgICAgICAgIHUz
MiBiYXIgPSBwY2lfY29uZl9yZWFkMzIoc2VnLCBidXMsIHNsb3QsIGZ1bmMsIGlkeCk7Cj4gLSAg
ICAgICAgICAgICAgICB1MzIgaGkgPSAwOwo+ICsgICAgICAgICAgICAgICAgcGNpX3NiZGZfdCBz
YmRmID0gewo+ICsgICAgICAgICAgICAgICAgICAgIC5zZWcgPSBzZWcsCj4gKyAgICAgICAgICAg
ICAgICAgICAgLmJ1cyA9IGJ1cywKPiArICAgICAgICAgICAgICAgICAgICAuZGV2ID0gc2xvdCwK
PiArICAgICAgICAgICAgICAgICAgICAuZnVuYyA9IGZ1bmMsCj4gKyAgICAgICAgICAgICAgICB9
OwoKU28gSSd2ZSBoYWQgZXZlcnl0aGluZyB1cCB0byBwYXRjaCA5IGFwcGxpZWQgYW5kIHJlYWR5
IGZvciBwdXNoaW5nLAp3aGVuIEkgZGlkIG15IHVzdWFsIHNlY29uZGFyeSBjb21waWxlIHRlc3Qg
b24gYW4gb2xkIHN5c3RlbTogVGhpcwpmYWlscyB0byBjb21waWxlIHdpdGggZ2NjIDQuMyAoZHVl
IHRvIHRoZXJlIGJlaW5nIGEgdW5uYW1lZCBzdWItCnN0cnVjdHVyZSkuIEEgc2ltaWxhciBpc3N1
ZSBleGlzdHMgYXQgbGVhc3QgaW4gcGF0Y2ggNy4gU2luY2UgdGhlCnN0cnVjdHVyZSBnZXRzIGlu
dHJvZHVjZWQgaW4gcGF0Y2ggMSAoYW5kIGhlbmNlIG1heSBuZWVkIGNoYW5naW5nCnRoZXJlLCBk
ZXBlbmRpbmcgb24gaG93IHRoaXMgaXMgdG8gYmUgYWRkcmVzc2VkKSwgSSdtIG5vdCBnb2luZyB0
bwpwdXNoIGFueSBwYXJ0IG9mIHRoaXMgc2VyaWVzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
