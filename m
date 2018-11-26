From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 1/6] vpci: fix updating the command
 register
Date: Mon, 26 Nov 2018 04:20:40 -0700
Message-ID: <5BFBD70802000078001FFE4D@prv1-mh.provo.novell.com>
References: <20181120160153.45259-1-roger.pau@citrix.com>
 <20181120160153.45259-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=azgn=of=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gREwY-0000WT-1z
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 11:20:46 +0000
In-Reply-To: <20181120160153.45259-2-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE3OjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFdoZW4gc3dpdGNoaW5nIHRoZSBtZW1vcnkgZGVjb2RpbmcgYml0IGluIHRoZSBjb21tYW5kIHJl
Z2lzdGVyIHRoZQo+IHJlc3Qgb2YgdGhlIGNoYW5nZXMgd2hlcmUgZHJvcHBlZCwgbGVhZGluZyB0
byBvbmx5IHRoZSBtZW1vcnkgZGVjb2RpbmcKPiBiaXQgYmVpbmcgdXBkYXRlZC4KPiAKPiBGaXgg
dGhpcyBieSB3cml0aW5nIHRoZSBjb21tYW5kIHJlZ2lzdGVyIG9uY2UgdGhlIGd1ZXN0IHBoeXNt
YXAKPiBtYW5pcHVsYXRpb25zIGFyZSBkb25lIGlmIHRoZXJlIGFyZSBjaGFuZ2VzIHRvIHRoZSBt
ZW1vcnkgZGVjb2RpbmcKPiBiaXQuCj4gCj4gTm90ZSB0aGF0IHdoZW4gb25seSBtYXBwaW5nL3Vu
bWFwcGluZyB0aGUgUk9NIEJBUiBhIGZhYnJpY2F0ZWQgY29tbWFuZAo+IHJlZ2lzdGVyIHZhbHVl
IGlzIHBhc3NlZCB0byBtb2RpZnlfYmFycyB3aGljaCBpcyBvbmx5IHVzZWQgdG8gc2lnbmFsCj4g
d2hldGhlciB0aGUgYWN0aW9uIGlzIGEgbWFwcGluZyBvciB1bm1hcHBpbmcsIGJ1dCB0aGUgdmFs
dWUgaXMgbmV2ZXIKPiB3cml0dGVuIHRvIHRoZSBkZXZpY2UgY29tbWFuZCByZWdpc3Rlci4gVHVy
biB0aGUgbWFvZGlmeV9kZWNvZGluZwo+IEFTU0VSVCBpbnRvIGFuIEFTU0VSVF9VTlJFQUNIQUJM
RSBhbmQgbWFrZSBzdXJlIHRoYXQgbm9uLWRlYnVnIGJ1aWxkcwo+IHdvbid0IGVuZCB1cCB3cml0
aW5nIHRvIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGlmIG9ubHkgbW9kaWZ5aW5nIHRoZSBST00KPiBC
QVIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
