From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] PCI: Mark expected switch fall-throughs
Date: Mon, 25 Mar 2019 07:25:09 -0600
Message-ID: <5C98D6B502000078002219FB__42191.3169602462$1553520389$gmane$org@prv1-mh.provo.novell.com>
References: <20190320182715.GA9406@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h8PbL-0001s1-NW
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 13:25:19 +0000
In-Reply-To: <20190320182715.GA9406@embeddedor>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A.R.Silva" <gustavo@embeddedor.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, keescook@chromium.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE5IGF0IDE5OjI3LCA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4gd3JvdGU6
Cj4gSW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFy
ayBzd2l0Y2gKPiBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4K
PiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4gCj4gZHJpdmVy
cy9wY2kvcHJvYy5jOiBJbiBmdW5jdGlvbiDigJhwcm9jX2J1c19wY2lfaW9jdGzigJk6Cj4gZHJp
dmVycy9wY2kvcHJvYy5jOjIxNjo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0
aHJvdWdoIAo+IFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBpZiAoYXJjaF9jYW5fcGNp
X21tYXBfd2MoKSkgewo+ICAgICAgIF4KPiBkcml2ZXJzL3BjaS9wcm9jLmM6MjI1OjI6IG5vdGU6
IGhlcmUKPiAgIGRlZmF1bHQ6Cj4gICBefn5+fn5+Cj4gCj4gZHJpdmVycy9wY2kveGVuLXBjaWZy
b250LmM6IEluIGZ1bmN0aW9uIOKAmHBjaWZyb250X2JhY2tlbmRfY2hhbmdlZOKAmToKPiBkcml2
ZXJzL3BjaS94ZW4tcGNpZnJvbnQuYzoxMTA1OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1h
eSBmYWxsIHRocm91Z2ggCj4gWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIGlmICh4ZGV2
LT5zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NlZCkKPiAgICAgICBeCj4gZHJpdmVycy9wY2kveGVu
LXBjaWZyb250LmM6MTEwODoyOiBub3RlOiBoZXJlCj4gICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2lu
ZzoKPiAgIF5+fn4KPiAKPiBOb3RpY2UgdGhhdCwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRo
ZSAvKiBmYWxsIHRocm91Z2ggKi8KPiBjb21tZW50IGlzIHBsYWNlZCBhdCB0aGUgdmVyeSBib3R0
b20gb2YgdGhlIGNhc2Ugc3RhdGVtZW50LAo+IHdoaWNoIGlzIHdoYXQgR0NDIGlzIGV4cGVjdGlu
ZyB0byBmaW5kLgo+IAo+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD0zCj4gCj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMg
dG8gZW5hYmxlCj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KCk5vbmUgb2YgdGhlIGFib3ZlIGV4
cGxhaW5zIHdoeSAuLi4KCj4gLS0tIGEvZHJpdmVycy9wY2kveGVuLXBjaWZyb250LmMKPiArKysg
Yi9kcml2ZXJzL3BjaS94ZW4tcGNpZnJvbnQuYwo+IEBAIC0xMTA0LDcgKzExMDQsNyBAQCBzdGF0
aWMgdm9pZCBfX3JlZiBwY2lmcm9udF9iYWNrZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZp
Y2UgKnhkZXYsCj4gIAljYXNlIFhlbmJ1c1N0YXRlQ2xvc2VkOgo+ICAJCWlmICh4ZGV2LT5zdGF0
ZSA9PSBYZW5idXNTdGF0ZUNsb3NlZCkKPiAgCQkJYnJlYWs7Cj4gLQkJLyogTWlzc2VkIHRoZSBi
YWNrZW5kJ3MgQ0xPU0lORyBzdGF0ZSAtLSBmYWxsdGhyb3VnaCAqLwo+ICsJCS8qIGZhbGwgdGhy
b3VnaCAtIE1pc3NlZCB0aGUgYmFja2VuZCdzIENMT1NJTkcgc3RhdGUuICovCgouLi4gdGhlIG9y
aWdpbmFsIGNvbW1lbnQgaGVyZSB3YXNuJ3QgZ29vZCBlbm91Z2guCgpKYW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
