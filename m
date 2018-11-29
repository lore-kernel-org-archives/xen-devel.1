From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 0/3] Remove tmem
Date: Thu, 29 Nov 2018 11:42:23 +0000
Message-ID: <20181129114223.p52k4qcy2hb7kcev@zion.uk.xensource.com>
References: <20181128135806.20201-1-wei.liu2@citrix.com>
 <20181129025033.GD24916@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WpH9=OI=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSKjG-0000xp-8F
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 11:43:34 +0000
Content-Disposition: inline
In-Reply-To: <20181129025033.GD24916@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDk6NTA6MzNQTSAtMDUwMCwgS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIHdyb3RlOgo+IE9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDAxOjU4OjAzUE0gKzAwMDAs
IFdlaSBMaXUgd3JvdGU6Cj4gPiBJdCBpcyBhZ3JlZWQgdGhhdCB0bWVtIGNhbiBiZSByZW1vdmVk
IGZyb20geGVuLmdpdC4gU2VlIHRoZSB0aHJlYWQgc3RhcnRpbmcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAo+ID4gZnJvbSA8RDVFODY2QjItOTZGNC00RTg5LTk0MUUtNzNGNTc4REYyRjE3QGNp
dHJpeC5jb20+Lgo+ID4gCj4gPiBJbiB0aGlzIHZlcnNpb246Cj4gPiAKPiA+IDEuIFJlbW92ZSBz
b21lIHJlc2lkdWFscyBmcm9tIHByZXZpb3VzIHZlcnNpb24gYW5kIGZpeCBhbGwgYnVpbGQgZXJy
b3JzCj4gPiAgICBkaXNjb3ZlcmVkIGJ5IEdpdGxhYiBDSS4KPiA+IDIuIFN3YXAgdGhlIG9yZGVy
IG9mIHBhdGNoZXMgdG8gbWFrZSBzdXJlIGJpc2VjdGlvbiBzdGlsbCB3b3Jrcy4gVGhpcwo+ID4g
ICAgaXMgdmVyaWZpZWQgYnkgY2FsbGluZwo+ID4gICAgICAgYC4vYXV0b21hdGlvbi9zY3JpcHRz
L2J1aWxkLXRlc3Quc2ggb3JpZ2luL3N0YWdpbmcgSEVBRGAKPiA+IDMuIE1ha2Ugc3VyZSBYZW4g
c3RpbGwgYm9vdHMgYW5kIHBhc3NlcyBhbGwgWFRGIHRlc3RzIGFmdGVyIHRoZSByZW1vdmFsLgo+
ID4gNC4gS2VlcCBwdWJsaWMvdG1lbS5oLgo+IAo+IFBsZWFzZSBhbHNvIHJlbW92ZSB0aGUgZW50
cnkgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUuCgpTdXJlLiBJIHdpbGwgZm9sZCB0aGF0IGludG8g
dGhlIGh5cGVydmlzb3IgcGF0Y2guCgo+IAo+IEFja2VkLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CgpUaGFuayB5b3UhCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
