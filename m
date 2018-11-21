From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/4] x86: correct instances of PGC_allocated
 clearing
Date: Tue, 20 Nov 2018 19:47:57 -0700
Message-ID: <CABfawhkmP60zWScH-j2_W5zXdXB_5Zqdz_96kbGHpyDSO1+Cqw@mail.gmail.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5BF433E702000078001FE270@prv1-mh.provo.novell.com>
 <7cdc3f95-b97d-11ad-a8a2-5f7f325d57f4@citrix.com>
 <5BF4406B02000078001FE35F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j9eg=oa=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gPIZC-0007Pb-Cr
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 02:48:38 +0000
Received: by mail-ed1-f68.google.com with SMTP id f23so3669460edb.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 18:48:37 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id p21-v6sm1956453ejz.45.2018.11.20.18.48.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 18:48:35 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id j17-v6so4014697wrq.11
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 18:48:34 -0800 (PST)
In-Reply-To: <5BF4406B02000078001FE35F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjAsIDIwMTggYXQgMTA6MTIgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAyMC4xMS4xOCBhdCAxNzo1OSwgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gT24gMjAvMTEvMjAxOCAxNjoxOCwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4gPj4gRm9yIGRvbWFpbiBoZWFwIHBhZ2VzIGFzc2lnbmVkIHRvIGEgZG9tYWlu
IGRyb3BwaW5nIHRoZSBwYWdlIHJlZmVyZW5jZQo+ID4+IHRpZWQgdG8gUEdDX2FsbG9jYXRlZCBt
YXkgbm90IGRyb3AgdGhlIGxhc3QgcmVmZXJlbmNlLCBhcyBvdGhlcndpc2UgdGhlCj4gPj4gdGVz
dF9hbmRfY2xlYXJfYml0KCkgbWlnaHQgYWxyZWFkeSBhY3Qgb24gYW4gdW5vd25lZCBwYWdlLgo+
ID4+Cj4gPj4gV29yayBhcm91bmQgdGhpcyB3aGVyZSBwb3NzaWJsZSwgYnV0IHRoZSBuZWVkIHRv
IGFjcXVpcmUgZXh0cmEgcGFnZQo+ID4+IHJlZmVyZW5jZXMgaXMgYSBmYWlyIGhpbnQgdGhhdCBy
ZWZlcmVuY2VzIHNob3VsZCBoYXZlIGJlZW4gYWNxdWlyZWQgaW4KPiA+PiBvdGhlciBwbGFjZXMg
aW5zdGVhZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiA+PiAtLS0KPiA+PiBDb21waWxlIHRlc3RlZCBvbmx5LCBhcyBJIGhhdmUgbmVp
dGhlciBhIG1lbS1zaGFyaW5nIG5vciBhIG1lbS1wYWdpbmcKPiA+PiBlbnZpcm9ubWVudCBzZXQg
dXAgcmVhZHkgdG8gYmUgdXNlZCBmb3Igc3VjaCB0ZXN0aW5nLgoKVGhpcyBpcyBob3cgSSB0ZXN0
IG1lbXNoYXJpbmc6IHlvdSBzYXZlIGEgdm0gc3VjaCB0aGF0IGl0J3Mga2VwdApwYXVzZWQgKHhs
IHNhdmUgLXApLCBjb3B5IGl0cyBjb25maWcgZmlsZSBidXQgY2hhbmdlIHRoZSBuYW1lLCByZXN0
b3JlCnRoZSBzYXZlZCBpbWFnZSB3aXRoIHRoaXMgbmV3IGNvbmZpZyBmaWxlIGFuZCB0aGUgdm0g
a2VwdCBwYXVzZWQgKHhsCnJlc3RvcmUgLXApLiBUaGVuIHlvdSBjYW4gdXNlIHRlc3RzL21lbS1z
aGFyaW5nIG9uIHRoZSB0d28gVk1zOgouL21lbXNocnRvb2wgZW5hYmxlIDxmaXJzdF92bT4gJiYu
L21lbXNocnRvb2wgZW5hYmxlIDxzZWNvbmRfdm0+ICYmCi4vbWVtc2hydG9vbCByYW5nZSA8Zmly
c3Rfdm0+IDxzZWNvbmRfdm0+IDAgMTAwMAoKVW5wYXVzaW5nIHRoZSBzZWNvbmQgdm0gYWZ0ZXJ3
YXJkcyB3aWxsIGV4ZXJjaXNlIG1lbXNoYXJpbmcuCgo+ID4KPiA+IFBlcmhhcHMgd2Ugc2hvdWxk
IGNvbXBpbGUgdGhlbSBvdXQgYnkgZGVmYXVsdD8gIEl0J3MgY2xlYXIgdGhlcmUgYXJlIG5vCj4g
PiBwcm9kdWN0aW9uIHVzZXJzLCBnaXZlbiB0aGUgcXVhbGl0eSBvZiB0aGUgY29kZSBhbmQgaG93
IG1hbnkgc2VjdXJpdHkKPiA+IGlzc3VlcyB3ZSBzcG90IGFjY2lkZW50YWxseS4KPgo+IFllYWgs
IHdlbGwgLSBpZiB3ZSdyZSBnb2luZyB0byBoYXZlIGEgcGVyaGFwcyBtdWNoIHdpZGVyIHNldCBv
Zgo+IGNvbmZpZyBvcHRpb25zLCB0aGVuIHRoZXNlIHR3byBzdXJlbHkgc2hvdWxkIGJlY29tZSAi
ZGVmYXVsdCBuIgo+IHVudGlsIHRoZXkndmUgYmVlbiBicm91Z2h0IG91dCBvZiB0aGVpciBzb3Jy
eSBzdGF0ZS4KCisxCgpDb2RlIGFsc28gbG9va3MgT0sgdG8gbWU6CgpBY2tlZC1ieTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
