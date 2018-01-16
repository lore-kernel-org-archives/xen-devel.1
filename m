From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 1/2] x86: Meltdown band-aid against
 malicious 64-bit PV guests
Date: Tue, 16 Jan 2018 19:02:51 +0000
Message-ID: <20180116190251.m3n2z77y4jgdmle6@citrix.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5E2574020000780019F27A@prv-mh.provo.novell.com>
 <5A5E26A0020000780019F28C@prv-mh.provo.novell.com>
 <20180116172840.GF29360@bitfolk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xstf=el=citrix.com=prvs=5473c9914=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ebWW3-0003Ka-IP
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 19:03:23 +0000
Content-Disposition: inline
In-Reply-To: <20180116172840.GF29360@bitfolk.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Smith <andy@strugglers.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMDU6Mjg6NDBQTSArMDAwMCwgQW5keSBTbWl0aCB3cm90
ZToKPiBIaSBKYW4sCj4gCj4gT24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMDg6MjE6NTJBTSAtMDcw
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBUaGlzIGlzIGEgdmVyeSBzaW1wbGlzdGljIGNoYW5n
ZSBsaW1pdGluZyB0aGUgYW1vdW50IG9mIG1lbW9yeSBhIHJ1bm5pbmcKPiA+IDY0LWJpdCBQViBn
dWVzdCBoYXMgbWFwcGVkIChhbmQgaGVuY2UgYXZhaWxhYmxlIGZvciBhdHRhY2tpbmcpOiBPbmx5
IHRoZQo+ID4gbWFwcGluZ3Mgb2Ygc3RhY2ssIElEVCwgYW5kIFRTUyBhcmUgYmVpbmcgY2xvbmVk
IGZyb20gdGhlIGRpcmVjdCBtYXAKPiA+IGludG8gcGVyLUNQVSBwYWdlIHRhYmxlcy4KPiAKPiBD
YW4gdGhpcyBiZSB1c2VkIHdpdGggQ29tZXQvVml4ZW4gdG8gZnVydGhlciBwcm90ZWN0IFBWIGd1
ZXN0cz8gaS5lLgo+IGlmIHRoZSBzaGltIGh5cGVydmlzb3IgaGFzIHRoZXNlIGNoYW5nZXMgdGhl
biB3aWxsIGl0IGFsc28gbGltaXQKPiB3aGF0IGEgcHJvY2VzcyBpbiB0aGUgUFYgZ3Vlc3QgY2Fu
IHNlZSBpbiB0aGF0IHNoaW0gaHlwZXJ2aXNvciwKPiB3aGljaCB0aGVyZWZvcmUgcHJvdGVjdHMg
aXRzIG93biBndWVzdCBrZXJuZWwgYSBiaXQgdG9vPwo+IAoKWWVzLCBidXQgcGxlYXNlIGJlIHdh
cm5lZCB0aGF0IHRoZSBndWVzdCBpcyB2ZXJ5IHZlcnkgc2xvdy4gSSBkb24ndAp0aGluayBYUFRJ
ICsgc2hpbSBpcyB2ZXJ5IHVzYWJsZSBhdCB0aGlzIHN0YWdlLgoKSWYgeW91J3JlIGludGVyZXN0
ZWQgaW4gdHJ5aW5nIHRoYXQgb3V0LCBjaGVjayBvdXQgc3RhZ2luZyBicmFuY2ggYW5kCmJ1aWxk
IGEgc2hpbSBmcm9tIHRoZXJlLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
