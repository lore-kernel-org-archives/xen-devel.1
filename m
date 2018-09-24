From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 0/3] xen-netback: hash mapping hanling
 adjustments
Date: Mon, 24 Sep 2018 01:43:50 -0600
Message-ID: <5BA895B602000078001EB059__45147.5736954764$1537774971$gmane$org@prv1-mh.provo.novell.com>
References: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
 <5B9778D702000078001E7069@prv1-mh.provo.novell.com>
 <20180911101623.3tuzvlyr7musocrg@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wm3w=mg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g4LX9-00068y-VP
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 07:43:56 +0000
In-Reply-To: <20180911101623.3tuzvlyr7musocrg@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: davem@davemloft.net
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDEyOjE2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDI6MTI6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyOC4wOC4xOCBhdCAxNjo1NCwgIHdyb3RlOgo+PiA+IEZpcnN0IGFuZCBm
b3JlbW9zdCB0aGUgZml4IGZvciBYU0EtMjcwLiBPbiB0b3Agb2YgdGhhdCBmdXJ0aGVyIGNoYW5n
ZXMKPj4gPiB3aGljaCBsb29rZWQgZGVzaXJhYmxlIHRvIG1lIHdoaWxlIGludmVzdGlnYXRpbmcg
dGhhdCBYU0EuCj4+ID4gCj4+ID4gMTogZml4IGlucHV0IHZhbGlkYXRpb24gaW4geGVudmlmX3Nl
dF9oYXNoX21hcHBpbmcoKQo+PiA+IDI6IHZhbGlkYXRlIHF1ZXVlIG51bWJlcnMgaW4geGVudmlm
X3NldF9oYXNoX21hcHBpbmcoKQo+PiA+IDM6IGhhbmRsZSBwYWdlIHN0cmFkZGxpbmcgaW4geGVu
dmlmX3NldF9oYXNoX21hcHBpbmcoKQo+PiA+IAo+PiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gCj4+IFdoYXQgaXMgdGhlIHdheSBmb3J3YXJkIGhl
cmU/IEkndmUgZ290IFItYi1zIGZyb20gUGF1bCBmb3IgYWxsIHRocmVlCj4+IHBhdGNoZXMsIGFu
ZCBhIG1pbm9yIGNoYW5nZSByZXF1ZXN0IG9uIHBhdGNoIDIgZnJvbSBXZWkuIEknbSBub3QKPj4g
cmVhbGx5IGNlcnRhaW4gd2hhdCB0byBkbyBpbiB0aGlzIGNhc2UgKGhpbnRzIGFwcHJlY2lhdGVk
KSwgYnV0IGNvdWxkCj4+IGF0IGxlYXN0IHRoZSBzZWN1cml0eSBmaXggKHBhdGNoIDEpIGJlIGFw
cGxpZWQgaW1tZWRpYXRlbHk/Cj4gCj4gSWYgeW91IGhhcHBlbiB0byByZXNlbmQsIHBsZWFzZSBt
YWtlIHRoZSBhZGp1c3RtZW50OyBvdGhlcndpc2UgSSdtIGZpbmUKPiB3aXRoIHRoZSBwYXRjaGVz
IGFzIHRoZXkgYXJlLiBJIGRvbid0IHdhbnQgdG8gYmxvY2sgdXNlZnVsIHRoaW5ncyBvbgo+IGNv
c21ldGljIGlzc3Vlcy4KCkRhdmU/IEkgbm90aWNlIG5vbmUgb2YgdGhlIHBhdGNoZXMgaXMgaW4g
NC4xOS1yYzUsIG5vdCBldmVuIHRoZSBzZWN1cml0eQpmaXgsIHRoZSBhZHZpc29yeSBmb3Igd2hp
Y2ggaGFkIGdvbmUgcHVibGljIG92ZXIgYSBtb250aCBhZ28uCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
