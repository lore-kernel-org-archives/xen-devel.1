From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: mark expected switch fall-through
Date: Tue, 12 Feb 2019 18:50:41 -0500
Message-ID: <20190212235041.GA4463__24046.6311852046$1550015539$gmane$org@localhost.localdomain>
References: <20190212203720.GA24175@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FOUo=QT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gthpT-0003ii-Mn
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 23:51:07 +0000
Content-Disposition: inline
In-Reply-To: <20190212203720.GA24175@embeddedor>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTIsIDIwMTkgYXQgMDI6Mzc6MjBQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0
aHJvdWdoLCBtYXJrIHN3aXRjaAo+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFs
bCB0aHJvdWdoLgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+
IAo+IGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jOiBJbiBmdW5jdGlvbiDigJh4ZW5f
cGNpYmtfZnJvbnRlbmRfY2hhbmdlZOKAmToKPiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5i
dXMuYzo1NDU6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgaWYgKHhlbmJ1c19kZXZfaXNfb25saW5lKHhkZXYp
KQo+ICAgICAgIF4KPiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYzo1NDg6Mjogbm90
ZTogaGVyZQo+ICAgY2FzZSBYZW5idXNTdGF0ZVVua25vd246Cj4gICBefn5+Cj4gCj4gV2Fybmlu
ZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPiAKPiBOb3RpY2Ug
dGhhdCwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBjb2RlIGNvbW1lbnQgaXMgbW9kaWZp
ZWQKPiBpbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0MgaXMgZXhwZWN0aW5nIHRvIGZpbmQuCj4g
Cj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4g
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIu
IFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgoKQXBwbGllZCB0byBmb3ItbGludXMtNS4w
CgooeGVuLXNjc2liYWNrIHBhdGNoIHRvbykKCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
