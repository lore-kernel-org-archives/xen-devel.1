From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 7/9] common/memory: block
 speculative out-of-bound accesses
Date: Fri, 22 Feb 2019 05:55:41 -0700
Message-ID: <5C6FF14D0200007800219261@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-8-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAOe-0004WG-EQ
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:57:44 +0000
In-Reply-To: <1550737003-25779-8-git-send-email-nmanthey@amazon.de>
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

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBU
aGUgZ2V0X3BhZ2VfZnJvbV9nZm4gbWV0aG9kIHJldHVybnMgYSBwb2ludGVyIHRvIGEgcGFnZSB0
aGF0IGJlbG9uZ3MKPiB0byBhIGdmbi4gQmVmb3JlIHJldHVybmluZyB0aGUgcG9pbnRlciwgdGhl
IGdmbiBpcyBjaGVja2VkIGZvciBiZWluZwo+IHZhbGlkLiBVbmRlciBzcGVjdWxhdGlvbiwgdGhl
c2UgY2hlY2tzIGNhbiBiZSBieXBhc3NlZCwgc28gdGhhdAo+IHRoZSBmdW5jdGlvbiBnZXRfcGFn
ZSBpcyBzdGlsbCBleGVjdXRlZCBwYXJ0aWFsbHkuIENvbnNlcXVlbnRseSwgdGhlCj4gZnVuY3Rp
b24gcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVyZW5jZSBtaWdodCBiZSBleGVjdXRlZCBwYXJ0aWFs
bHkgYXMKPiB3ZWxsLiBJbiB0aGlzIGZ1bmN0aW9uLCB0aGUgY29tcHV0ZWQgcG9pbnRlciBpcyBh
Y2Nlc3NlZCwgcmVzdWx0aW5nIGluCj4gYSBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91bmQgYWRkcmVz
cyBsb2FkLiBBcyB0aGUgZ2ZuIGNhbiBiZSBjb250cm9sbGVkIGJ5Cj4gYSBndWVzdCwgdGhpcyBh
Y2Nlc3MgaXMgcHJvYmxlbWF0aWMuCj4gCj4gVG8gbWl0aWdhdGUgdGhlIHJvb3QgY2F1c2UsIGFu
IGxmZW5jZSBpbnN0cnVjdGlvbiBpcyBhZGRlZCB2aWEgdGhlCj4gZXZhbHVhdGVfbm9zcGVjIG1h
Y3JvLiBUbyBtYWtlIHRoZSBwcm90ZWN0aW9uIGdlbmVyaWMsIHdlIGRvIG5vdAo+IGludHJvZHVj
ZSB0aGUgbGZlbmNlIGluc3RydWN0aW9uIGZvciB0aGlzIHNpbmdsZSBjaGVjaywgYnV0IGFkZCBp
dCB0bwo+IHRoZSBtZm5fdmFsaWQgZnVuY3Rpb24uIFRoaXMgd2F5LCBvdGhlciBwb3RlbnRpYWxs
eSBwcm9ibGVtYXRpYyBhY2Nlc3Nlcwo+IGFyZSBwcm90ZWN0ZWQgYXMgd2VsbC4KPiAKPiBUaGlz
IGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
