From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Thu, 20 Sep 2018 02:27:51 -0600
Message-ID: <5BA35A0702000078001EA2A5@prv1-mh.provo.novell.com>
References: <20180919091303.75918-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gjef=mc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2uJW-000071-O0
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 08:27:54 +0000
In-Reply-To: <20180919091303.75918-1-roger.pau@citrix.com>
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

Pj4+IE9uIDE5LjA5LjE4IGF0IDExOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IElkZW50aXR5IG1hcHBpbmcgUkFNIHJlZ2lvbnMgb24gdGhlIGxvdyAxTUIgZm9yIERvbTAgaXMg
bm90IGlkZWFsLAo+IHNpbmNlIHRoZXJlJ3MgZGF0YSB0aGVyZSB0aGF0IGNvdWxkIGJlIHVzZWQg
YnkgWGVuIGR1cmluZyBydW50aW1lCj4gKGxpa2UgdGhlIEFQIHRyYW1wb2xpbmUpLCBzbyBpbnN0
ZWFkIG9mIGlkZW50aXR5IG1hcHBpbmcgdGhlIGxvdyAxTUIKPiBpbnRvIHRoZSBEb20wIHBoeXNt
YXAgcG9wdWxhdGUgdGhvc2UgUkFNIHJlZ2lvbnMgYW5kIGNvcHkgdGhlIGRhdGEuCj4gCj4gTm90
ZSB0aGF0IHRoaXMgYWxsb3dzIHRvIHJlbW92ZSB1bnNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qg
c2luY2UgdGhlCj4gb25seSBjYWxsZXIgd2FzIHRoZSBQVkggRG9tMCBidWlsZGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IEFj
a2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
