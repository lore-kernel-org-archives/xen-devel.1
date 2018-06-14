From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Thu, 14 Jun 2018 04:07:39 -0600
Message-ID: <5B223E6B02000078001CB341@prv1-mh.provo.novell.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
 <10af8cc2-43cb-8b9e-e700-56b467c26a7d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vplz=ja=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTPAN-0006wr-3O
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 10:07:43 +0000
In-Reply-To: <10af8cc2-43cb-8b9e-e700-56b467c26a7d@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA2LjE4IGF0IDE4OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMTggMTY6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IDQuIE1vZGlm
eSB0aGUgaW50ZXJmYWNlIGJldHdlZW4gaHlwZXJ2aXNvciBhbmQga2VybmVsOiBpbnN0ZWFkIG9m
IGp1c3QKPj4gICAgcmV0dXJuaW5nIC1FRkFVTFQgbGV0IHRoZSBoeXBlcnZpc29yIGJlaGF2ZSBt
b3JlIGxpa2UgY29weV90b191c2VyIGJ5Cj4+ICAgIHJhaXNpbmcgYSBwYWdlIGZhdWx0IHdoaWNo
IGNhbiB0aGVuIGJlIGZpeGVkIHVwIGluIHRoZSBrZXJuZWwuIFRoaXMKPj4gICAgY2hhbmdlIG11
c3QgYmUgYWN0aXZhdGVkIGJ5IHRoZSBrZXJuZWwsIG9mIGNvdXJzZS4KPj4gICAgUHJvczogLSBy
YXRoZXIgc2ltcGxlIGNoYW5nZSBpbiB0aGUga2VybmVsICJkb2luZyB0aGUgcmlnaHQgdGhpbmci
Cj4+ICAgICAgICAgIC0gaHlwZXJjYWxsIGJvdW5jZSBidWZmZXIgaGFuZGxpbmcgaW4gbGlieGMv
bGlieGVuY2FsbCBjYW4gYmUKPj4gICAgICAgICAgICBzd2l0Y2hlZCBvZmYgZm9yIGEga2VybmVs
IHN1cHBvcnRpbmcgdGhpcyBjaG5hZ2UKPj4gICAgQ29uczogLSBzcGxpdCBzb2x1dGlvbiBiZXR3
ZWVuIGtlcm5lbCBhbmQgWGVuLCBib3RoIG11c3QgYmUgY2hhbmdlZAo+PiAgICAgICAgICAtIG5v
dCBzdXJlIGhvdyBjb21wbGV4IHRoZSByZXF1aXJlZCBoeXBlcnZpc29yIGNoYW5nZSB3aWxsIGJl
Cj4gCj4gU2FkbHksIGFzIEkndmUganVzdCByZWFsaXNlZC4uLgo+IAo+IENvbjogQ2Fubm90IGJl
IHVzZWQgdG8gcmVwbGFjZSBhbGwgLUVGQVVMVHMuCj4gCj4gRmF1bHRzIHdoZW4gY29weWluZyBk
YXRhIGluIGNhbiBiZSByZXNvbHZlZCBieSBwYXNzaW5nICNQRiB0byB0aGUKPiBrZXJuZWwsIGJ1
dCBmYXVsdHMgd2hlbiB0cnlpbmcgdG8gdXBkYXRlIGd1ZXN0IHN0YXRlIChjb250aW51YXRpb24s
IG9yCj4gY29tcGxldGlvbiBpbmZvcm1hdGlvbikgY2Fubm90IGJlIHNhZmVseSByZXN1bWVkIGF0
IGEgbGF0ZXIgcG9pbnQuCgpZZWFoLCBJJ3ZlIHRvbyByZWFsaXplZCB0aGlzIG1lYW53aGlsZS4g
VGhpcyBpcyBub3QgYW4gb3B0aW9uLCBhdCBsZWFzdApub3QgaW4gc2ltcGxlIGVub3VnaCBhIHNo
YXBlIGFzIHdvdWxkIGJlIG5lY2Vzc2FyeSBoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
