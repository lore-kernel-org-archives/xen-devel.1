From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: allow libxl_domain_suspend to simply
 suspend a domain, without saving it
Date: Fri, 23 Feb 2018 18:47:57 +0000
Message-ID: <20180223184757.5iwsch7sf4p5tvcg@citrix.com>
References: <20180208231404.3857-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180208231404.3857-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Marcus of Wetware Labs <marcus@wetwa.re>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDksIDIwMTggYXQgMTI6MTQ6MDNBTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFdoZW4gZmQ9LTEsIG5vIHNhdmVmaWxlIHdpbGwgYmUgd3Jp
dHRlbiwgYnV0IHRoZSBkb21haW4gd2lsbCBzdGlsbCBiZQo+IHN1c3BlbmRlZCAoYnV0IG5vdCBk
ZXN0cm95ZWQpLiBUaGUgbWFpbiByZWFzb24gZm9yIHRoaXMgZnVuY3Rpb25hbGl0eSBpcwo+IHRv
IHN1c3BlbmQgdGhlIGhvc3Qgd2hpbGUgc29tZSBkb21haW5zIGFyZSBydW5uaW5nLCBwb3RlbnRp
YWxseSBob2xkaW5nCj4gUENJIGRldmljZXMuIFRoaXMgd2lsbCBnaXZlIGEgY2hhbmNlIHRvIGEg
ZHJpdmVyIGluIHN1Y2ggYSBkb21haW4gdG8KPiBwcm9wZXJseSBzdXNwZW5kIGRldmljZS4KPiAK
PiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBzZXBhcmF0ZSBmdW5jdGlvbiBmb3IgdGhpcywg
YnV0IGluIGZhY3QgaXQKPiBzaG91bGQgYmUgbmFtZWQgbGlieGxfZG9tYWluX3N1c3BlbmQsIHRo
ZW4gdGhlIGN1cnJlbnQgb25lIHJlbmFtZWQgdG8KPiBsaWJ4bF9kb21haW5fc2F2ZS4gU2luY2Ug
dGhhdCB3b3VsZCBicmVhayBBUEkgY29tcGF0aWJpbGl0eSwga2VlcCBpdCBpbgo+IHRoZSBzYW1l
IGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJj
dXMgb2YgV2V0d2FyZSBMYWJzIDxtYXJjdXNAd2V0d2EucmU+CgpUaGUgYmFzaWMgaWRlYSBzZWVt
cyBzZW5zaWJsZS4KClBsZWFzZSBhZGQgYSBjb21tZW50IHRvIGxpYnhsLmggdG8gc3BlY2lmeSB0
aGUgbmV3IHNlbWFudGljcy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
