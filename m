From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/5] pci: switch PCI capabilities related
 functions to use pci_sbdf_t
Date: Fri, 24 May 2019 04:52:13 -0600
Message-ID: <5CE7CCDD0200007800231F48@prv1-mh.provo.novell.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU7o7-00035d-W4
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 10:52:16 +0000
In-Reply-To: <20190510161056.48648-6-roger.pau@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3BjaS9wY2kuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3BjaS9wY2ku
Ywo+IEBAIC04LDE4ICs4LDEyIEBACj4gICNpbmNsdWRlIDx4ZW4vcGNpLmg+Cj4gICNpbmNsdWRl
IDx4ZW4vcGNpX3JlZ3MuaD4KPiAgCj4gLWludCBwY2lfZmluZF9jYXBfb2Zmc2V0KHUxNiBzZWcs
IHU4IGJ1cywgdTggZGV2LCB1OCBmdW5jLCB1OCBjYXApCj4gK2ludCBwY2lfZmluZF9jYXBfb2Zm
c2V0KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IGNhcCkKClRoZSBzZWNvbmRhcnkgdHlw
ZSBjaGFuZ2UgaGVyZSBhbmQgLi4uCgo+IEBAIC00NSwxNSArMzksMTAgQEAgaW50IHBjaV9maW5k
X2NhcF9vZmZzZXQodTE2IHNlZywgdTggYnVzLCB1OCBkZXYsIHU4IGZ1bmMsIHU4IGNhcCkKPiAg
ICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+IC1pbnQgcGNpX2ZpbmRfbmV4dF9jYXAodTE2IHNlZywg
dTggYnVzLCB1bnNpZ25lZCBpbnQgZGV2Zm4sIHU4IHBvcywgaW50IGNhcCkKPiAraW50IHBjaV9m
aW5kX25leHRfY2FwKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHBvcywgdW5zaWduZWQg
aW50IGNhcCkKCi4uLiB0aGUgdHdvIG9uZXMgaGVyZSBhcmVuJ3Qgb2J2aW91c2x5IHNhZmUsIHNv
IHNob3VsZCBhdCBsZWFzdCBiZQptZW50aW9uZWQgaW4gdGhlIGRlc2NyaXB0aW9uLiBUaGUgbGF0
dGVyIGZ1bmN0aW9uIGhhcyBubyBjYWxsZXIgYXQKYWxsLCBzbyBpcyBmaW5lIHNpbXBseSBieSB0
aGF0IGZhY2UsIGZvciB0aGUgZm9ybWVyIHRoaXMgY291bGQgaW4gcHJpbmNpcGxlCnJlc3VsdCBp
biBjaGFuZ2UgaW4gYmVoYXZpb3IgZHVlIHRvIHRoZSBjb21waWxlciBubyBsb25nZXIgdHJ1bmNh
dGluZwpwb3NzaWJsZSBvdXQtb2YtcmFuZ2UgYXJndW1lbnRzLiBBbGwgY2FsbGVycyBsb29rIHRv
IGJlIGZpbmUgdGhvdWdoLgooSSBkb24ndCB2aWV3IHRoaXMgYXMgYSBwb3RlbnRpYWwgaXNzdWUg
Zm9yIHRoZSAiZXh0IiBjb3VudGVycGFydHMsIGFzCnRoZXJlIGl0J3Mgb25seSBhIGNoYW5nZSBm
cm9tIHBsYWluIGludCB0byB1bnNpZ25lZCBpbnQuKQoKU29tZSBvZiB0aGUgY29tbWVudHMgZ2l2
ZW4gb24gZWFybGllciBwYXRjaGVzIGFwcGx5IGhlcmUgYXMgd2VsbC4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
