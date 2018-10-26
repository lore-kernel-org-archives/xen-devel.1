From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2 0/2] ns16550: enable use of PCI MSI
Date: Fri, 26 Oct 2018 05:06:00 -0600
Message-ID: <5BD2F51802000078001F50BA@prv1-mh.provo.novell.com>
References: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n7n6=ng=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFzwL-0000GI-4A
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 11:06:05 +0000
In-Reply-To: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDE4OjAzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFBh
dGNoIDIgaXMgbm8gbG9uZ2VyIFJGQywgbm93IHRoYXQgSSBoYXZlIGEgZGV2aWNlIHdoZXJlIE1T
SSBhY3R1YWxseQo+IHdvcmtzIChzdWdnZXN0aW5nIHRoYXQgaXQgd2FzIHJlYWxseSB0aGUgb3Ro
ZXIgZGV2aWNlJ3MgZmF1bHQgdGhhdCB0aGluZ3MKPiBkaWRuJ3Qgd29yaykuCj4gCj4gMTogY29u
c29sZTogYWRqdXN0IElSUSBpbml0aWFsaXphdGlvbgo+IDI6IG5zMTY1NTA6IGVuYWJsZSB1c2Ug
b2YgUENJIE1TSQo+IAo+IEphbgo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyAKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVsIAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
