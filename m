From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] public/io/blkif.h: make the comments on
 "sectors" self-consistent
Date: Thu, 21 Mar 2019 18:01:48 +0000
Message-ID: <07675a6aa9ff4078a1409020194fed14@AMSPEX02CL02.citrite.net>
References: <20190320125228.36440-1-paul.durrant@citrix.com>
 <20190321122211.GB10145@perard.uk.xensource.com>
 <59c47c75ca664fd6b38dbaf42fd7d935@AMSPEX02CL02.citrite.net>
 <20190321152338.GQ11621@perard.uk.xensource.com>
 <31b7b852a09143db8a00dd2385f6f80d@AMSPEX02CL02.citrite.net>
 <20190321172308.GR11621@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J9cw=RY=citrix.com=prvs=9762bf382=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h720s-0005ZF-FE
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 18:01:58 +0000
In-Reply-To: <20190321172308.GR11621@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAyMSBNYXJjaCAyMDE5IDE3OjIz
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHB1Ymxp
Yy9pby9ibGtpZi5oOiBtYWtlIHRoZSBjb21tZW50cyBvbiAic2VjdG9ycyIgc2VsZi1jb25zaXN0
ZW50Cj4gCj4gPiA+IEkgdGhpbmsgdGhpcyBpcyBob3cgdGhlIGN1cnJlbnRzIGltcGxlbWVudGF0
aW9ucyBhcmUgd29ya2luZzoKPiA+ID4gICAgIG1lZGlhL2Rpc2sgc2l6ZSA9ICJzZWN0b3JzIiAq
ICJzZWN0b3Itc2l6ZSIKPiA+ID4gdGhlbiwgInNlY3RvcnMiIGFuZCAic2VjdG9yLXNpemUiIGFy
ZSBuZXZlciB1c2VkIGFnYWluLgo+ID4KPiA+IE5vdCB0cnVlLCB1bmZvcnR1bmF0ZWx5LiBBdCBs
ZWFzdCB0aGUgV2luZG93cyBmcm9udGVuZHMgYXJlIChtaXMpY29kZWQgdG8gdXNlIHNlY3RvciBu
dW1iZXJzCj4gZGlyZWN0bHkgaW4gYmxraWZfcmVxdWVzdF90IGFuZCBibGtpZl9yZXF1ZXN0X3Nl
Z21lbnQgcmF0aGVyIHRoYW4gcmUtc2NhbGluZyB0byA1MTIgYnl0ZXMsIHNvIHNldHRpbmcKPiBz
ZWN0b3Itc2l6ZSAhPSA1MTIgd2lsbCBjZXJ0YWlubHkgbWFrZSB0aGVtIG1pc2JlaGF2ZSBhY2Nv
cmRpbmcgdG8gdGhlIHByb3RvY29sLiBUaGlzIGNhbiwgb2YgY291cnNlLAo+IGJlIGZpeGVkIGJ1
dCBJIHRoaW5rIHdlJ3JlIGF0IHBvaW50IHdoZXJlIHRoZSBvbmx5IHNhZmUgd2F5IHRvIHNldCBh
IGxhcmdlciBzZWN0b3Itc2l6ZSB3b3VsZCBiZSB0bwo+IGhhdmUgdGhlIGZyb250ZW5kIHdyaXRl
IGFuICdJJ20gbm90IGJyb2tlbicgZmxhZyBpbnRvIHhlbnN0b3JlIHRoYXQgdGhlIGJhY2tlbmQg
cmVhZHMgYmVmb3JlIHNldHRpbmcKPiBzZWN0b3Itc2l6ZSAoYW5kIGlmIHRoYXQgbWVhbnMgdGhh
dCB0aGUgYmFja2VuZCBoYXMgdG8gZG8gcmVhZC1tb2RpZnktd3JpdGUgY3ljbGVzIGZvciBhbiB1
bmRlcmx5aW5nCj4gc3RvcmFnZSBkZXZpY2Ugd2l0aCBhIGxhcmdlciBsb2dpY2FsIGJsb2NrIHNp
emUgdGhlbiBzbyBiZSBpdCkuCj4gCj4gU28sIGhhcmQtY29kaW5nICJzZWN0b3Itc2l6ZSIgdG8g
NTEyIGluIGJsa2lmLmggc291bmQgZ29vZCB0byBtZS4KCk9rLCBJJ2xsIHNlbmQgYSB2MiB0aGF0
IGRvZXMgdGhhdC4gSSB0aGluayBpdCBiZXN0IGlmIEkgYWxzbyBpbmNsdWRlIGEgc3BlY2lmaWNh
dGlvbiBteSBwcm9wb3NlZCAnSSdtIG5vdCBicm9rZW4nIGZsYWcgc28gYSBmcm9udGVuZCBjYW4g
ZW5hYmxlIGEgYmFja2VuZCB0byBzZXQgYSBub24tNTEyIHNlY3RvciBzaXplLgoKICBQYXVsCgo+
IAo+IC0tCj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
