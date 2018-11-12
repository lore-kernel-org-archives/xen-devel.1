From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: fix hvm_migrate_irq assertion
Date: Mon, 12 Nov 2018 15:13:05 +0000
Message-ID: <20181112151305.rl6bg4dkqt3hswwy@zion.uk.xensource.com>
References: <20181112140459.23480-1-wei.liu2@citrix.com>
 <5BE98FCD02000078001FB077@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v6tt=nx=citrix.com=prvs=847216550=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gMDtn-0006Hf-Bl
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:13:11 +0000
Content-Disposition: inline
In-Reply-To: <5BE98FCD02000078001FB077@prv1-mh.provo.novell.com>
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

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDc6MzU6NTdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEyLjExLjE4IGF0IDE1OjA0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiA3ODJjZjhiYTQ2ICgicGFzcy10aHJvdWdoOiBhZGp1c3QgcElSUSBtaWdyYXRpb24i
KSBhZGRlZCBhbiBhc3NlcnRpb24KPiA+IHRvIGh2bV9taWdyYXRlX2lycS4KPiA+IAo+ID4gUFZI
IERvbTAgaXMgYnJva2VuIGJlY2F1c2UgaXQgZG9lc24ndCBoYXZlIGRwY2kgYWxsb2NhdGVkLiBB
ZGQgYW4KPiA+IGlzX2hhcmR3YXJlX2RvbWFpbiBjaGVjayB0byB0aGUgYXNzZXJ0aW9uLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSSdtIHNvcnJ5
IGZvciB0aGUgYnJlYWthZ2UuCj4gCgpObyB3b3JyaWVzLiBJIHNob3VsZCBoYXZlIG5vdGljZWQg
dGhpcyB3aGlsZSByZXZpZXdpbmcgeW91ciBwYXRjaCwgc28gSQpkb24ndCBibGFtZSB5b3UuCgpX
ZWkuCgo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
