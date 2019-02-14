From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 14 Feb 2019 11:54:54 +0000
Message-ID: <20190214115454.uxo7sjhjyblkpnos@zion.uk.xensource.com>
References: <20190214111009.16448-1-wei.liu2@citrix.com>
 <5C6555C10200007800216A6F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OyKq=QV=citrix.com=prvs=941dd85b8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1guFbV-0004au-Tj
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 11:54:57 +0000
Content-Disposition: inline
In-Reply-To: <5C6555C10200007800216A6F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMDQ6NDk6MjFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjAyLjE5IGF0IDEyOjEwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
ID4gCj4gPiBkb20wX2NvbnN0cnVjdF9wdigpIGhhcyBsb2dpYyB0byB0cmFuc2l0aW9uIGRvbTAg
aW50byBhIGNvbXBhdCBkb21haW4gd2hlbgo+ID4gYm9vdGluZyBhbiBFTEYzMiBpbWFnZS4KPiA+
IAo+ID4gT25lIGFzcGVjdCB3aGljaCBpcyBtaXNzaW5nIGlzIHRoZSBDUFVJRCBwb2xpY3kgcmVj
YWxjdWxhdGlvbiwgbWVhbmluZyB0aGF0IGEKPiA+IDMyYml0IGRvbTAgc2VlcyBhIDY0Yml0IHBv
bGljeSwgd2hpY2ggZGlmZmVyIGJ5IHRoZSBMb25nIE1vZGUgZmVhdHVyZSBmbGFnIGluCj4gPiBw
YXJ0aWN1bGFyLiAgQW5vdGhlciBtaXNzaW5nIGl0ZW0gaXMgdGhlIHg4N19maXBfd2lkdGggaW5p
dGlhbGlzYXRpb24uCj4gPiAKPiA+IFVwZGF0ZSBkb20wX2NvbnN0cnVjdF9wdigpIHRvIHVzZSBz
d2l0Y2hfY29tcGF0KCksIHJhdGhlciB0aGFuIHJldGFpbmluZyB0aGUKPiA+IG9wZW5jb2Rpbmcu
ICBQb3NpdGlvbiB0aGUgY2FsbCB0byBzd2l0Y2hfY29tcGF0KCkgc3VjaCB0aGF0IHRoZSBjb21w
YXQzMiBsb2NhbAo+ID4gdmFyaWFibGUgY2FuIGRpc2FwcGVhciBlbnRpcmVseS4KPiA+IAo+ID4g
VGhlIDMyYml0IG1vbml0b3IgdGFibGUgaXMgbm93IGNyZWF0ZWQgYnkgc2V0dXBfY29tcGF0X2w0
KCksIGF2b2lkaW5nIHRoZSBuZWVkCj4gPiB0byBmb3IgbWFudWFsIGNyZWF0aW9uIGxhdGVyLiAg
RnVydGhlcm1vcmUsIHRoZSBMMyB0YWJsZSBjcmVhdGlvbiBpcyByZWR1bmRhbnQKPiA+IHdpdGgg
dGhlIGxvZ2ljIGluc2lkZSB0aGUgbWFpbiBtYXBwaW5nIGxvb3AsIHNvIGNhbiBiZSBkcm9wcGVk
IGFzIHdlbGwuCj4gCj4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vIGxvbmdlciBhcHBsaWNhYmxl
IGFmYWljdC4KCkdvb2QgY2F0Y2guCgpJIHRoaW5rIHRoZSBzdWJqZWN0IGxpbmUgYWxzbyBuZWVk
cyBmaXhpbmcuIEl0IHNob3VsZCByZWFkOgoKICAgIHg4Ni9wdjogRml4IGNvbnN0cnVjdGlvbiBv
ZiAzMmJpdCBkb20wCgppLmUuIHRoZSBwb3NzZXNzaXZlIGZvcm0gaXMgd3JvbmcuCgo+IAo+ID4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gV2l0
aCB0aGF0IGxpbmUgZHJvcHBlZAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpUaGFua3MuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
