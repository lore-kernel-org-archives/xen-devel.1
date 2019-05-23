From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libacpi: report PCI slots as enabled only
 for hotpluggable devices
Date: Thu, 23 May 2019 16:20:07 +0100
Message-ID: <20190523152007.GH2373@zion.uk.xensource.com>
References: <1558548634-25154-1-git-send-email-igor.druzhinin@citrix.com>
 <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTpVv-0004iq-GZ
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 15:20:15 +0000
Content-Disposition: inline
In-Reply-To: <5CE6608D02000078002319C3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDI6NTc6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjA1LjE5IGF0IDIwOjEwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBEU0RUIGZvciBxZW11LXhlbiBsYWNrcyBfU1RBIG1ldGhvZCBvZiBQQ0kg
c2xvdCBvYmplY3QuIElmIF9TVEEgbWV0aG9kCj4gPiBkb2Vzbid0IGV4aXN0IHRoZW4gdGhlIHNs
b3QgaXMgYXNzdW1lZCB0byBiZSBhbHdheXMgcHJlc2VudCBhbmQgYWN0aXZlCj4gPiB3aGljaCBp
biBjb25qdW5jdGlvbiB3aXRoIF9FSjAgbWV0aG9kIG1ha2VzIGV2ZXJ5IGRldmljZSBlamVjdGFi
bGUgZm9yCj4gPiBhbiBPUyBldmVuIGlmIGl0J3Mgbm90IHRoZSBjYXNlLgo+ID4gCj4gPiBxZW11
LWt2bSBpcyBhYmxlIHRvIGR5bmFtaWNhbGx5IGFkZCBfRUowIG1ldGhvZCBvbmx5IHRvIHRob3Nl
IHNsb3RzCj4gPiB0aGF0IGVpdGhlciBoYXZlIGhvdHBsdWdnYWJsZSBkZXZpY2VzIG9yIGZyZWUg
Zm9yIFBDSSBwYXNzdGhyb3VnaC4KPiA+IEFzIFhlbiBsYWNrcyB0aGlzIGNhcGFiaWxpdHkgd2Ug
Y2Fubm90IHVzZSB0aGVpciB3YXkuCj4gPiAKPiA+IHFlbXUteGVuLXRyYWRpdGlvbmFsIERTRFQg
aGFzIF9TVEEgbWV0aG9kIHdoaWNoIG9ubHkgcmVwb3J0cyB0aGF0Cj4gPiB0aGUgc2xvdCBpcyBw
cmVzZW50IGlmIHRoZXJlIGlzIGEgUENJIGRldmljZXMgaG90cGx1Z2dlZCB0aGVyZS4KPiA+IFRo
aXMgaXMgZG9uZSB0aHJvdWdoIHF1ZXJ5aW5nIG9mIGl0cyBQQ0kgaG90cGx1ZyBjb250cm9sbGVy
Lgo+ID4gcWVtdS14ZW4gaGFzIHNpbWlsYXIgY2FwYWJpbGl0eSB0aGF0IHJlcG9ydHMgaWYgZGV2
aWNlIGlzICJob3RwbHVnZ2FibGUKPiA+IG9yIGFic2VudCIgd2hpY2ggd2UgY2FuIHVzZSB0byBh
Y2hpZXZlIHRoZSBzYW1lIHJlc3VsdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKCkphbiwgRkFPRCBzaW5jZSB5b3UncmUgdGhl
IG1haW50YWluZXIgSSdtIGV4cGVjdGluZyB5b3UgdG8gcHVzaCB0aGlzCnBhdGNoIHlvdXJzZWxm
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
