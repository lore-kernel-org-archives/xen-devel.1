From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next RFC 0/4] tools: Python 3
 compatibility
Date: Wed, 6 Mar 2019 13:57:55 +0000
Message-ID: <20190306135755.pmvr456e3di6s377@zion.uk.xensource.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <350c989b-dcec-906f-9364-20b0a8e409e0@citrix.com>
 <bbe5c5b7-f82b-e011-cb30-3d66fb13093c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ECHp=RJ=citrix.com=prvs=9619a384d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1X3c-0006zG-6s
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 13:58:04 +0000
Content-Disposition: inline
In-Reply-To: <bbe5c5b7-f82b-e011-cb30-3d66fb13093c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDE6NTM6MDFQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAzLzYvMTkgMTo0OSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiA+IE9uIDMv
NS8xOSA0OjQyIFBNLCBXZWkgTGl1IHdyb3RlOgo+ID4+IFRoaXMgc2VyaWVzIG1ha2VzIHRvb2xz
IGJ1aWxkIHdpdGggUHl0aG9uIDMuCj4gPj4KPiA+PiBDb21waWxlIHRlc3Qgb25seSB3aXRoIDIu
NyBhbmQgMy41IHRodXMgZmFyLCBoZW5jZSB0aGUgUkZDLiBUaGlzIHNob3VsZCBiZSBhYmxlCj4g
Pj4gdG8gZ2l2ZSBwZW9wbGUgc29tZSBpZGVhIHdoYXQgc29ydCBvZiB3b3JrIGlzIGludm9sdmVk
Lgo+ID4+Cj4gPj4gWW91IHdpbGwgYWxzbyBuZWVkIEFuZHJldydzICJ0b29scy94ZW4tZm9yZWln
bjogVXBkYXRlIHB5dGhvbiBzY3JpcHRzIHRvIGJlCj4gPj4gUHkzIGNvbXBhdGlibGUiLgo+ID4g
Cj4gPiBUb3NzaW5nIHRoaXMgb3V0IHRoZXJlOiBHaXZlbiB0aGF0IHB5dGhvbjIgaXMgKHRoZW9y
ZXRpY2FsbHkpIEVPTCBpbgo+ID4gbGVzcyB0aGFuIGEgeWVhciwgaXMgaXQgd29ydGggbWFpbnRh
aW5pbmcgY29tcGF0aWJpbGl0eSB3aXRoIHB5dGhvbjIsIG9yCj4gPiB3b3VsZCBpdCBiZSBiZXR0
ZXIgdG8ganVzdCBnbyB3aG9sZS1ob2cgaW50byBweXRob24zPwo+IAo+IEkgbWVhbiAtLSBsb29r
aW5nIGF0IHNvbWUgb2YgdGhlIGRpc2N1c3Npb25zIGFib3V0IGhvdyBkaWZmZXJlbnRseQo+IGNl
cnRhaW4ga2luZHMgb2YgdGhpbmdzIGFyZSBpbnRlcnByZXRlZCBiZXR3ZWVuIHB5dGhvbjIgYW5k
IHB5dGhvbjMsIGl0Cj4gc2VlbXMgYSBiaXQgbWFkIHRvIHRyeSB0byB3cml0ZSBjb2RlIHRoYXQg
d29ya3MgaW4gYm90aDogd2UncmUganVzdAo+IGFza2luZyBmb3IgdHJvdWJsZS4KCkkgdGhpbmsg
UHl0aG9uIGlzIG5vdCB2ZXJ5IGNvbnNpc3RlbnQgZXZlbiB3aXRoaW4gYSBtYWpvciB2ZXJzaW9u
LiBOZXcKc3ludGF4IGFuZCBjb25zdHJ1Y3RzIGdldCBhZGRlZCB0byBwb2ludCByZWxlYXNlcy4g
U29tZSBvZiB0aGUKZGlzY3Vzc2lvbnMgcmUgY29kZSBpc24ndCBhYm91dCB0aGUgZGlmZmVyZW5j
ZXMgYmV0d2VlbiAyIGFuZCAzLiAgVGhlcmUKaXMgYXQgbGVhc3Qgb25lIGFib3V0IDIuNCB2cyAy
LjcuCgpJIGFtIGFsbCBmb3IgbW92aW5nIGF3YXkgZnJvbSAyLjQuCgpXZWkuCgo+IAo+ICAtR2Vv
cmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
