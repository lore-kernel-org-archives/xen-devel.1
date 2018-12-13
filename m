From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] xen_disk: fix memory leak
Date: Thu, 13 Dec 2018 11:33:33 +0000
Message-ID: <20181213113333.GZ18875@perard.uk.xensource.com>
References: <20181211160224.22181-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YZL0=OW=citrix.com=prvs=8789a7fed=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gXPFP-0000GY-60
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 11:33:43 +0000
Content-Disposition: inline
In-Reply-To: <20181211160224.22181-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDU6MDI6MjRQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gVGhlcmUgYXJlIHNvbWUgY29kZSBwYXRocyB0aGF0IGNsb2JiZXIgaW9yZXEtPmJ1Ziwg
d2hpY2ggbGVhZHMgdG8gYSBodWdlCj4gbWVtb3J5IGxlYWsgYWZ0ZXIgYSBmZXcgaG91cnMgb2Yg
cnVudGltZS4gT25lIGNvZGUgcGF0aCBpcwo+IHFlbXVfYWlvX2NvbXBsZXRlLCB3aGljaCBtaWdo
dCBiZSBjYWxsZWQgcmVjdXJzaXZlLiBBbm90aGVyIG9uZSBpcwoKSSB0aGluayBpdCdzIHMvcmVj
dXJzaXZlL3JlY3Vyc2l2ZWx5Ly4KCj4gaW9yZXFfcmVzZXQsIHdoaWNoIG1pZ2h0IGNsb2JiZXIg
aW9yZXEtPmJ1ZiBhcyB3ZWxsLgo+IAo+IEFkZCB3cmFwcGVycyB0byBmcmVlIGlvcmVxLT5idWYg
YmVmb3JlIHJlYXNzaWdubWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xh
ZkBhZXBmbGUuZGU+CgpUaGF0IHBhdGNoIHNlZW1zIGZpbmUsIHdpdGggYSBmZXcgY29kaW5nIHN0
eWxlIGlzc3VlcywgYW5kIGlzIGdvaW5nIHRvCmJlIG5lZWRlZCB0byBiZSBmb3J3YXJkIHBvcnRl
ZCB0byBQYXVsJ3MgcmVpbXBsZW1lbnRhdGlvbiAobm90IHlldAptZXJnZWQpLgoKPiAtLS0KPiAg
aHcvYmxvY2sveGVuX2Rpc2suYyB8IDIyICsrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2h3L2Jsb2NrL3hlbl9kaXNrLmMgYi9ody9ibG9jay94ZW5fZGlzay5jCj4gaW5kZXggMzZl
ZmY5NGY4NC4uZTE1ZWVmZTYyNSAxMDA2NDQKPiAtLS0gYS9ody9ibG9jay94ZW5fZGlzay5jCj4g
KysrIGIvaHcvYmxvY2sveGVuX2Rpc2suYwo+IEBAIC0xMDMsMTIgKzEwMywyNCBAQCBzdHJ1Y3Qg
WGVuQmxrRGV2IHsKPiAgCj4gIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KPiAgCj4gK3N0YXRpYyB2b2lkIGlvcmVxX2J1
Zl9hbGxvYyhzdHJ1Y3QgaW9yZXEgKmlvcmVxLCBzaXplX3QgYWxpZ25tZW50KQoKWW91IGhhdmUg
dGhlIHBhcmFtZXRlciBgYWxpZ25tZW50YCBidXQgZG9uJ3QgYWN0dWFsbHkgdXNlIGl0LCBJIGRv
bid0CnRoaW5rIGl0J3MgbmVlZGVkLgoKPiArewo+ICsgICAgaWYgKGlvcmVxLT5idWYpCj4gKyAg
ICAgICAgcWVtdV92ZnJlZShpb3JlcS0+YnVmKTsKCllvdSBjb3VsZCBjYWxsIGlvcmVxX2J1Zl9m
cmVlIGhlcmUgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgY29kZS4KCj4gKyAgICBpb3JlcS0+
YnVmID0gcWVtdV9tZW1hbGlnbihYQ19QQUdFX1NJWkUsIGlvcmVxLT5zaXplKTsKPiArfQo+ICtz
dGF0aWMgdm9pZCBpb3JlcV9idWZfZnJlZShzdHJ1Y3QgaW9yZXEgKmlvcmVxKQo+ICt7Cj4gKyAg
ICBpZiAoaW9yZXEtPmJ1ZikKPiArICAgICAgICBxZW11X3ZmcmVlKGlvcmVxLT5idWYpOwo+ICsg
ICAgaW9yZXEtPmJ1ZiA9IE5VTEw7Cj4gK30KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
