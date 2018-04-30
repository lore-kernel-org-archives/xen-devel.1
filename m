From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: char: Remove unnecessary (uart->irq >
 0) check
Date: Mon, 30 Apr 2018 02:19:02 -0600
Message-ID: <5AE6D17602000078001BF7D9@prv1-mh.provo.novell.com>
References: <1524906494-6917-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fD41i-0003su-KR
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 08:19:14 +0000
In-Reply-To: <1524906494-6917-1-git-send-email-amittomer25@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Singh Tomar <amittomer25@gmail.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, andre.przywara@arm.com, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, baozich@gmail.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA0LjE4IGF0IDExOjA4LCA8YW1pdHRvbWVyMjVAZ21haWwuY29tPiB3cm90ZToK
PiBXaGlsZSB3b3JraW5nIG9uIE1WRUJVIHVhcnQgZHJpdmVyLCBKdWxpZW4gcG9pbnRlZCBvdXQg
dGhhdCAodWFydC0+aXJxID4gMCkKPiBjaGVjayBpcyB1bm5lY2Vzc2FyeSBkdXJpbmcgaXJxIHNl
dCB1cC5pZiBldmVyIHRoZXJlIGlzIGFuIGludmFsaWQgaXJxLCBkcml2ZXIKPiBpbml0aWFsaXph
dGlvbiBpdHNlbGYgd291bGQgYmUgYmFpbGVkIG91dCBmcm9tIHBsYXRmb3JtX2dldF9pcnEuCj4g
Cj4gVGhpcyBwYXRjaCB3b3VsZCByZW1vdmUgc2ltaWxhciBjaGVjayBmb3Igb3RoZXIgdWFydCBk
cml2ZXJzIHByZXNlbnQgaW4gWEVOLgoKQXQgdGhlIGV4YW1wbGUgb2YgdGhlIGNoYW5nZXMgdG8g
bnMxNjU1MC5jIHlvdSBkbywgdGhpcyBpcyBub3QgY29ycmVjdC4gSQpjYW4ndCBqdWRnZSBhYm91
dCB0aGUgdmFyaW91cyBBUk0gc3BlY2lmaWMgZHJpdmVycywgYnV0IHRoZSAxNjU1MCBjYW4gd2Vs
bApiZSBydW4gaW4gcG9sbGluZyBtb2RlLCBhbmQgaGVuY2UgZmFpbHVyZSB0byBzZXQgdXAgYW4g
aW50ZXJydXB0IGlzIG5vdCBmYXRhbAp0byBvdmVyYWxsIGRyaXZlciBpbml0aWFsaXphdGlvbi4K
Cj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29t
Pgo+IC0tLQo+ICAgICAqIFRoaXMgcGF0Y2ggaXMgb25seSBjb21waWxlZCB0ZXN0ZWQuCgpJbiB3
aGljaCBjYXNlIHRoaXMgc2hvdWxkIGJlIG1hcmtlZCBSRkMgaW1vLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
