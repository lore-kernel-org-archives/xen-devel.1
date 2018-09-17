From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Mon, 17 Sep 2018 11:30:01 +0100
Message-ID: <20180917103001.5uwtrky23moosrve@zion.uk.xensource.com>
References: <20180914111611.23008-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ktui=l7=citrix.com=prvs=791268a98=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g1qn7-0008Lr-PH
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 10:30:05 +0000
Content-Disposition: inline
In-Reply-To: <20180914111611.23008-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDE6MTY6MTFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IElkZW50aXR5IG1hcHBpbmcgUkFNIHJlZ2lvbnMgb24gdGhlIGxvdyAxTUIgZm9y
IERvbTAgaXMgbm90IGlkZWFsLAo+IHNpbmNlIHRoZXJlJ3MgZGF0YSB0aGVyZSB0aGF0IGNvdWxk
IGJlIHVzZWQgYnkgWGVuIGR1cmluZyBydW50aW1lCj4gKGxpa2UgdGhlIEFQIHRyYW1wb2xpbmUp
LCBzbyBpbnN0ZWFkIG9mIGlkZW50aXR5IG1hcHBpbmcgdGhlIGxvdyAxTUIKPiBpbnRvIHRoZSBE
b20wIHBoeXNtYXAgcG9wdWxhdGUgdGhvc2UgUkFNIHJlZ2lvbnMgYW5kIGNvcHkgdGhlIGRhdGEu
Cj4gCj4gTm90ZSB0aGF0IHRoaXMgYWxsb3dzIHRvIHJlbW92ZSB1bnNoYXJlX3hlbl9wYWdlX3dp
dGhfZ3Vlc3Qgc2luY2UgdGhlCj4gb25seSBjYWxsZXIgd2FzIHRoZSBQVkggRG9tMCBidWlsZGVy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2V3ci5wYXVAY2l0cml4
LmNvbT4KCkFuZCB5b3Ugc2VlbWVkIHRvIGhhdmUgbWFkZSBhIHR5cG8gaW4geW91ciBvd24gZW1h
aWwgYWRkcmVzcy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
