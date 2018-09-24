From: David Miller <davem@davemloft.net>
Subject: Re: Ping: [PATCH 0/3] xen-netback: hash mapping hanling
 adjustments
Date: Mon, 24 Sep 2018 09:49:20 -0700 (PDT)
Message-ID: <20180924.094920.655625438524720848.davem__34080.171728465$1537807686$gmane$org@davemloft.net>
References: <5B9778D702000078001E7069@prv1-mh.provo.novell.com>
 <20180911101623.3tuzvlyr7musocrg@zion.uk.xensource.com>
 <5BA895B602000078001EB059@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y6jt=mg=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1g4U31-0002u6-Gj
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 16:49:23 +0000
In-Reply-To: <5BA895B602000078001EB059@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: JBeulich@suse.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+CkRhdGU6IE1vbiwgMjQgU2Vw
IDIwMTggMDE6NDM6NTAgLTA2MDAKCj4+Pj4gT24gMTEuMDkuMTggYXQgMTI6MTYsIDx3ZWkubGl1
MkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDI6MTI6MDdB
TSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiA+Pj4gT24gMjguMDguMTggYXQgMTY6NTQs
ICB3cm90ZToKPj4+ID4gRmlyc3QgYW5kIGZvcmVtb3N0IHRoZSBmaXggZm9yIFhTQS0yNzAuIE9u
IHRvcCBvZiB0aGF0IGZ1cnRoZXIgY2hhbmdlcwo+Pj4gPiB3aGljaCBsb29rZWQgZGVzaXJhYmxl
IHRvIG1lIHdoaWxlIGludmVzdGlnYXRpbmcgdGhhdCBYU0EuCj4+PiA+IAo+Pj4gPiAxOiBmaXgg
aW5wdXQgdmFsaWRhdGlvbiBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4+PiA+IDI6IHZh
bGlkYXRlIHF1ZXVlIG51bWJlcnMgaW4geGVudmlmX3NldF9oYXNoX21hcHBpbmcoKQo+Pj4gPiAz
OiBoYW5kbGUgcGFnZSBzdHJhZGRsaW5nIGluIHhlbnZpZl9zZXRfaGFzaF9tYXBwaW5nKCkKPj4+
ID4gCj4+PiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4+IAo+Pj4gV2hhdCBpcyB0aGUgd2F5IGZvcndhcmQgaGVyZT8gSSd2ZSBnb3QgUi1iLXMgZnJv
bSBQYXVsIGZvciBhbGwgdGhyZWUKPj4+IHBhdGNoZXMsIGFuZCBhIG1pbm9yIGNoYW5nZSByZXF1
ZXN0IG9uIHBhdGNoIDIgZnJvbSBXZWkuIEknbSBub3QKPj4+IHJlYWxseSBjZXJ0YWluIHdoYXQg
dG8gZG8gaW4gdGhpcyBjYXNlIChoaW50cyBhcHByZWNpYXRlZCksIGJ1dCBjb3VsZAo+Pj4gYXQg
bGVhc3QgdGhlIHNlY3VyaXR5IGZpeCAocGF0Y2ggMSkgYmUgYXBwbGllZCBpbW1lZGlhdGVseT8K
Pj4gCj4+IElmIHlvdSBoYXBwZW4gdG8gcmVzZW5kLCBwbGVhc2UgbWFrZSB0aGUgYWRqdXN0bWVu
dDsgb3RoZXJ3aXNlIEknbSBmaW5lCj4+IHdpdGggdGhlIHBhdGNoZXMgYXMgdGhleSBhcmUuIEkg
ZG9uJ3Qgd2FudCB0byBibG9jayB1c2VmdWwgdGhpbmdzIG9uCj4+IGNvc21ldGljIGlzc3Vlcy4K
PiAKPiBEYXZlPyBJIG5vdGljZSBub25lIG9mIHRoZSBwYXRjaGVzIGlzIGluIDQuMTktcmM1LCBu
b3QgZXZlbiB0aGUgc2VjdXJpdHkKPiBmaXgsIHRoZSBhZHZpc29yeSBmb3Igd2hpY2ggaGFkIGdv
bmUgcHVibGljIG92ZXIgYSBtb250aCBhZ28uCgpJZiBpdCdzIG5vdCBpbiBteSBwYXRjaHdvcmsg
cXVldWUsIHlvdSBoYXZlIHRvIHJlc2VuZCB0aGUgc2VyaWVzIGFuZAptYWtlIGl0IGNsZWFyIHRo
YXQgaXQgc2hvdWxkIGJlIGFwcGxpZWQgdG8gdGhlIG5ldHdvcmtpbmcgdHJlZSBieQpwdXR0aW5n
ICJbUEFUQ0ggbmV0IE4vTV0iIGluIHRoZSBTdWJqZWN0IGxpbmVzLgoKVGhhbmsgeW91LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
