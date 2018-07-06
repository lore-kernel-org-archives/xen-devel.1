From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 01/13] libx86: Introduce libx86/cpuid.h
Date: Thu, 5 Jul 2018 20:35:12 -0500
Message-ID: <20180706013512.v2y524cqcmoaelrh@doug-macbook.localdomain>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-2-git-send-email-andrew.cooper3@citrix.com>
 <5B3C838C02000078001D0E0E@prv1-mh.provo.novell.com>
 <12cff264-ae47-75b6-602c-6b867aea49ad@citrix.com>
 <5B3CD24A02000078001D1156@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5B3CD24A02000078001D1156@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDc6NTc6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjA3LjE4IGF0IDE0OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAwNC8wNy8xOCAwOToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+
Pj4gT24gMDMuMDcuMTggYXQgMjI6NTUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90
ZToKPiA+Pj4gLS0tIGEvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZQo+ID4+PiArKysgYi90b29scy9p
bmNsdWRlL01ha2VmaWxlCj4gPj4+IEBAIC0yMSw2ICsyMSw5IEBAIHhlbi8uZGlyOgo+ID4+PiAg
CWxuIC1zZiAkKGFkZHByZWZpeCAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS94ZW4vLGxpYmVsZi5o
IGVsZnN0cnVjdHMuaCkgeGVuL2xpYmVsZi8KPiA+Pj4gIAlsbiAtcyAuLi94ZW4tZm9yZWlnbiB4
ZW4vZm9yZWlnbgo+ID4+PiAgCWxuIC1zZiAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS9hY3BpIGFj
cGkKPiA+Pj4gK2lmZXEgKCQoQ09ORklHX1g4NikseSkKPiA+Pj4gKwlsbiAtc2YgJChYRU5fUk9P
VCkveGVuL2luY2x1ZGUveGVuL2xpYng4NiB4ZW4vbGlieDg2Cj4gPj4+ICtlbmRpZgo+ID4+IFdo
eSBub3Qgc2V0IHRoZSBpbmNsdWRlIHBhdGggc3VpdGFibHk/Cj4gPiAKPiA+IEJlY2F1c2UgdGhp
cyBpcyBob3cgZXZlcnl0aGluZyBlbHNlIGlzIGN1cnJlbnRseSBkb25lLiAgSWYgd2Ugd2FudCB0
bwo+ID4gY2hhbmdlIGhvdyB0b29scyBnZXQgdGhlaXIgaHlwZXJ2aXNvciBoZWFkZXIgZmlsZXMs
IHRoYXQgc2hvdWxkIGJlCj4gPiBpbmRlcGVuZGVudCB3b3JrLgo+IAo+IEhvdyB0aGlzIGdldHMg
ZG9uZSBoZXJlIGhhcyBubyBkaXJlY3QgaW1wbGljYXRpb25zIG9uIHByZS1leGlzdGluZwo+IG1l
Y2hhbmlzbXMuCgpXaGlsZSBub3Qgd3JvbmcgcmVmYWN0b3JpbmcgdGhlIGJ1aWxkIHN5c3RlbSBh
cHBlYXJzIHRvIGJlIG9ydGhvZ29uYWwgdG8KdGhlIGVudGlyZSBzZXJpZXMuIFRoaXMgaGFkIGJl
ZW4gcHJvcG9zZWQgYmVmb3JlIHdoZW4gSSB0cmllZCB0bwpzZXBhcmF0ZSB0aGUgeGVuIGFuZCB0
b29scyBidWlsZCBzeXN0ZW1zIGFwYXJ0IGJlZm9yZSBhbmQgSSBkbyBub3QKcmVjYWxsIHdoeSBp
dCB3YXNuJ3QgZG9uZS4KCkluIHNob3J0IGRvbid0IGJsb2NrIHRoaXMgc2VyaWVzIG9uIHRoaXMg
aXRlbS4KCi0tCkRvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
