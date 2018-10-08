From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vtd: fix iommu_share_p2m_table
Date: Mon, 08 Oct 2018 05:58:54 -0600
Message-ID: <5BBB467E02000078001EF89D@prv1-mh.provo.novell.com>
References: <20181008101445.38735-1-roger.pau@citrix.com>
 <5BBB326002000078001EF7D2@prv1-mh.provo.novell.com>
 <20181008103739.zlou3uwv7mlevrn6@mac.bytemobile.com>
 <20181008105033.yahoyswwjui7u7tg@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9UBg-00046F-R5
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 11:59:00 +0000
In-Reply-To: <20181008105033.yahoyswwjui7u7tg@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjEwLjE4IGF0IDEyOjUwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDA4LCAyMDE4IGF0IDEyOjM3OjM5UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4+IE9uIE1vbiwgT2N0IDA4LCAyMDE4IGF0IDA0OjMzOjA0QU0gLTA2MDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+PiA+ID4+PiBPbiAwOC4xMC4xOCBhdCAxMjoxNCwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2lvbW11LmMKPj4gPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPj4g
PiA+IEBAIC01MDUsNyArNTA1LDcgQEAgaW50IGlvbW11X2RvX2RvbWN0bCgKPj4gPiA+ICAKPj4g
PiA+ICB2b2lkIGlvbW11X3NoYXJlX3AybV90YWJsZWlvbW11X3NoYXJlX3AybV90YWJsZShzdHJ1
Y3QgZG9tYWluKiBkKQo+PiA+ID4gIHsKPj4gPiA+IC0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0
KGQpICkKPj4gPiA+ICsgICAgaWYgKCBpb21tdV9lbmFibGVkICYmIGhhcF9lbmFibGVkKGQpICYm
IGlvbW11X2hhcF9wdF9zaGFyZSApCj4+ID4gCj4+ID4gQ29uc2lkZXJpbmcgdGhlIG9ubHkgY2Fs
bGVyLCB0aGUgaGFwX2VuYWJsZWQoKSBwYXJ0IGlzIChhbmQgd2FzKSBub3QKPj4gPiBuZWVkZWQg
aGVyZS4KPj4gCj4+IFdvdWxkIHlvdSBsaWtlIG1lIHRvIHJlbW92ZSBpdCBpbiB0aGlzIHBhdGNo
Pwo+IAo+IEkndmUgY29udmVydGVkIGl0IHRvIGFuIEFTU0VSVCBpbnN0ZWFkIG9mIGp1c3QgcmVt
b3ZpbmcgaXQuCgpUaGF0J3MgZmluZSBvZiBjb3Vyc2UgKGFuZCBJIHdhcyBhYm91dCB0byBzdWdn
ZXN0IHRoaXMgaW4gcmVwbHkKdG8geW91ciBlYXJsaWVyIG1haWwsIGJ1dCBsdWNraWx5IGhhdmUg
bG9va2VkIGhlcmUgZmlyc3QpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
