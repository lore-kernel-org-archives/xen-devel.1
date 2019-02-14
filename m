From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 14 Feb 2019 12:09:21 +0000
Message-ID: <20190214120921.v4lqiuuedrcrfqtr@zion.uk.xensource.com>
References: <20190214111009.16448-1-wei.liu2@citrix.com>
 <5C6555C10200007800216A6F@prv1-mh.provo.novell.com>
 <20190214115454.uxo7sjhjyblkpnos@zion.uk.xensource.com>
 <5C6558920200007800216A7D@prv1-mh.provo.novell.com>
 <de3e137e-28c8-53a4-6361-429751fe2033@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OyKq=QV=citrix.com=prvs=941dd85b8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1guFpV-0005sD-4T
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 12:09:25 +0000
Content-Disposition: inline
In-Reply-To: <de3e137e-28c8-53a4-6361-429751fe2033@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMTI6MDI6MzZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNC8wMi8yMDE5IDEyOjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+IE9u
IDE0LjAyLjE5IGF0IDEyOjU0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24g
VGh1LCBGZWIgMTQsIDIwMTkgYXQgMDQ6NDk6MjFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gPj4+Pj4+IE9uIDE0LjAyLjE5IGF0IDEyOjEwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPj4+PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+ID4+Pj4KPiA+Pj4+IGRvbTBfY29uc3RydWN0X3B2KCkgaGFzIGxvZ2ljIHRvIHRyYW5zaXRp
b24gZG9tMCBpbnRvIGEgY29tcGF0IGRvbWFpbiB3aGVuCj4gPj4+PiBib290aW5nIGFuIEVMRjMy
IGltYWdlLgo+ID4+Pj4KPiA+Pj4+IE9uZSBhc3BlY3Qgd2hpY2ggaXMgbWlzc2luZyBpcyB0aGUg
Q1BVSUQgcG9saWN5IHJlY2FsY3VsYXRpb24sIG1lYW5pbmcgdGhhdCBhCj4gPj4+PiAzMmJpdCBk
b20wIHNlZXMgYSA2NGJpdCBwb2xpY3ksIHdoaWNoIGRpZmZlciBieSB0aGUgTG9uZyBNb2RlIGZl
YXR1cmUgZmxhZyBpbgo+ID4+Pj4gcGFydGljdWxhci4gIEFub3RoZXIgbWlzc2luZyBpdGVtIGlz
IHRoZSB4ODdfZmlwX3dpZHRoIGluaXRpYWxpc2F0aW9uLgo+ID4+Pj4KPiA+Pj4+IFVwZGF0ZSBk
b20wX2NvbnN0cnVjdF9wdigpIHRvIHVzZSBzd2l0Y2hfY29tcGF0KCksIHJhdGhlciB0aGFuIHJl
dGFpbmluZyB0aGUKPiA+Pj4+IG9wZW5jb2RpbmcuICBQb3NpdGlvbiB0aGUgY2FsbCB0byBzd2l0
Y2hfY29tcGF0KCkgc3VjaCB0aGF0IHRoZSBjb21wYXQzMiBsb2NhbAo+ID4+Pj4gdmFyaWFibGUg
Y2FuIGRpc2FwcGVhciBlbnRpcmVseS4KPiA+Pj4+Cj4gPj4+PiBUaGUgMzJiaXQgbW9uaXRvciB0
YWJsZSBpcyBub3cgY3JlYXRlZCBieSBzZXR1cF9jb21wYXRfbDQoKSwgYXZvaWRpbmcgdGhlIG5l
ZWQKPiA+Pj4+IHRvIGZvciBtYW51YWwgY3JlYXRpb24gbGF0ZXIuICBGdXJ0aGVybW9yZSwgdGhl
IEwzIHRhYmxlIGNyZWF0aW9uIGlzIHJlZHVuZGFudAo+ID4+Pj4gd2l0aCB0aGUgbG9naWMgaW5z
aWRlIHRoZSBtYWluIG1hcHBpbmcgbG9vcCwgc28gY2FuIGJlIGRyb3BwZWQgYXMgd2VsbC4KPiA+
Pj4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vIGxvbmdlciBhcHBsaWNhYmxlIGFmYWljdC4KPiA+
PiBHb29kIGNhdGNoLgo+ID4+Cj4gPj4gSSB0aGluayB0aGUgc3ViamVjdCBsaW5lIGFsc28gbmVl
ZHMgZml4aW5nLiBJdCBzaG91bGQgcmVhZDoKPiA+Pgo+ID4+ICAgICB4ODYvcHY6IEZpeCBjb25z
dHJ1Y3Rpb24gb2YgMzJiaXQgZG9tMAo+ID4+Cj4gPj4gaS5lLiB0aGUgcG9zc2Vzc2l2ZSBmb3Jt
IGlzIHdyb25nLgo+ID4gUGVyaGFwcy4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBB
bmRyZXcgbWVhbnQgcGx1cmFsLgo+IAo+IEkgZGlkLCBiZWNhdXNlIGluIHByYWN0aWNlIHRoaXMg
aXMgImZpeCBydW5uaW5nIDMyYml0IFBWIFhURiB0ZXN0cyB3aGVuCj4geW91ciB3b3JraW5nIG9u
IFhlbiBpbiBQVkggbW9kZSIuCgpPa2F5LCBJIHdpbGwgbGVhdmUgdGhlIHN1YmplY3QgbGluZSBh
cy1pcy4KCldlaS4KCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
