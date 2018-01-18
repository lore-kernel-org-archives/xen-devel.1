From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Thu, 18 Jan 2018 10:14:20 +0000
Message-ID: <20180118101420.qq22nz4x5ewctnwx@MacBook-Pro-de-Roger.local>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
 <20180117173205.h2etk5yh3se4e5hj@MacBook-Pro-de-Roger.local>
 <75449e60-6e31-b1ba-8224-52400d9810d2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lqax=en=citrix.com=prvs=549fb6881=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ec7DL-0000kd-L1
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 10:14:31 +0000
Content-Disposition: inline
In-Reply-To: <75449e60-6e31-b1ba-8224-52400d9810d2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMDU6NTg6NDNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wMS8xOCAxNzozMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgSmFuIDE3LCAyMDE4IGF0IDA0OjI0OjI3UE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3Rl
Ogo+ID4+IFJvZ2VyIFBhdSBNb25uZSB3cml0ZXMgKCJbUEFUQ0ggNi82XSBmaXJtd2FyZS9zaGlt
OiBmaXggYnVpbGQgcHJvY2VzcyB0byB1c2UgUE9TSVggZmluZCBvcHRpb25zIik6Cj4gPj4+IFRo
ZSAtcHJpbnRmIGZpbmQgb3B0aW9uIGlzIG5vdCBQT1NJWCBjb21wYXRpYmxlLCBzbyByZXBsYWNl
IGl0IHdpdGgKPiA+Pj4gYW5vdGhlciBydW5lLgo+ID4+IC4uLgo+ID4+PiAgCQkgIGNkICQoRCkv
JChkKTsgXAo+ID4+PiAtCQkgIGZpbmQgJChYRU5fUk9PVCkvJChkKS8gLXR5cGUgZCAtcHJpbnRm
ICIuLyVQXG4iIHwgIHhhcmdzIG1rZGlyIC1wKTspCj4gPj4+ICsJCSAgZmluZCAkKFhFTl9ST09U
KS8kKGQpLyAtdHlwZSBkIC1leGVjIHNoIC1jIFwKPiA+Pj4gKwkJICAgICAgImVjaG8ge30gfCBz
ZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdzIG1rZGlyIC1wIiBcOyk7KQo+ID4+
IFRoaXMgaXMgbm93IGEgcHJldHR5IG5hc3R5IHNoZWxsIGNvbnN0cnVjdC4KPiA+Pgo+ID4+IElm
IHlvdSdyZSBnb2luZyB0byB1c2Ugc2VkLCB5b3UgY291bGQganVzdAo+ID4+ICAgIGZpbmQgLi4u
IC1wcmludCB8IHNlZCAuLi4gfCB4YXJncyBta2RpciAtcAo+ID4gSSB0aGluayBJIHdpbGwgZ28g
d2l0aCB0aGlzIG9uZS4uLgoKV2hhdCBhYm91dCB1c2luZzoKCmZpbmQgJChYRU5fUk9PVCkvJChk
KS8gLXR5cGUgZCB8IHNlZCAncyxeJChYRU5fUk9PVCkvJChkKS8sLGcnIHwgeGFyZ3MgbWtkaXIg
LXAKClRoaXMgQUZBSUNUIHdvcmtzIGZpbmUsIGFuZCBzaG91bGQgYmUgdGhlIG9uZSBpbnZvbHZp
bmcgbGVzcyBmb3JrcwpzaW5jZSB0aGUgd2hvbGUgb3V0cHV0IGlzIHByb2Nlc3NlZCBhdCBvbmNl
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
