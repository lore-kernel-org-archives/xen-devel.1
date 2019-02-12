From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v6 6/9] is_control_domain:
 block speculation
Date: Tue, 12 Feb 2019 07:11:14 -0700
Message-ID: <5C62D4020200007800215F4F@prv1-mh.provo.novell.com>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-7-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CF2AAF02000039B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtYmR-0004wi-R7
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 14:11:23 +0000
In-Reply-To: <01CF2AAF02000039B1E090C7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE5IGF0IDE0OjQ0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBD
aGVja3Mgb2YgZG9tYWluIHByb3BlcnRpZXMsIHN1Y2ggYXMgaXNfaGFyZHdhcmVfZG9tYWluIG9y
IGlzX2h2bV9kb21haW4sCj4gbWlnaHQgYmUgYnlwYXNzZWQgYnkgc3BlY3VsYXRpdmVseSBleGVj
dXRpbmcgdGhlc2UgaW5zdHJ1Y3Rpb25zLiBBIHJlYXNvbgo+IGZvciBieXBhc3NpbmcgdGhlc2Ug
Y2hlY2tzIGlzIHRoYXQgdGhlc2UgbWFjcm9zIGFjY2VzcyB0aGUgZG9tYWluCj4gc3RydWN0dXJl
IHZpYSBhIHBvaW50ZXIsIGFuZCBjaGVjayBhIGNlcnRhaW4gZmllbGQuIFNpbmNlIHRoaXMgbWVt
b3J5Cj4gYWNjZXNzIGlzIHNsb3csIHRoZSBDUFUgYXNzdW1lcyBhIHJldHVybmVkIHZhbHVlIGFu
ZCBjb250aW51ZXMgdGhlCj4gZXhlY3V0aW9uLgo+IAo+IEluIGNhc2UgYW4gaXNfY29udHJvbF9k
b21haW4gY2hlY2sgaXMgYnlwYXNzZWQsIGZvciBleGFtcGxlIGR1cmluZyBhCj4gaHlwZXJjYWxs
LCBkYXRhIHRoYXQgc2hvdWxkIG9ubHkgYmUgYWNjZXNzaWJsZSBieSB0aGUgY29udHJvbCBkb21h
aW4gY291bGQKPiBiZSBsb2FkZWQgaW50byB0aGUgY2FjaGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Tm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gCj4gLS0tCj4gCj4gTm90ZXM6
Cj4gICB2NjogRHJvcCBub3NwZWMuaCBpbmNsdWRlCgpBbmQgdGhpcyB3YXMgYmVjYXVzZSBvZiB3
aGF0PyBJIHRoaW5rIGl0IGlzIGdvb2QgcHJhY3RpY2UgdG8gaW5jbHVkZQpvdGhlciBoZWFkZXJz
IHdoaWNoIGFkZGVkIGRlZmluaXRpb25zIHJlbHkgb24sIGV2ZW4gaWYgaW4gcHJhY3RpY2UKX3Jp
Z2h0IG5vd18gdGhhdCBoZWFkZXIgZ2V0cyBpbmNsdWRlZCBhbHJlYWR5IGJ5IG90aGVyIG1lYW5z
LiBJZgp0aGVyZSdzIHNvbWUgcmVjdXJzaW9uIGluIGhlYWRlciBkZXBlbmRlbmNpZXMsIHRoZW4g
aXQgd291bGQgaGF2ZQpiZWVuIG5pY2UgaWYgeW91IGhhZCBwb2ludGVkIG91dCB0aGUgYWN0dWFs
IGlzc3VlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
