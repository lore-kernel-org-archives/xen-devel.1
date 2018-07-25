From: <bercarug@amazon.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Wed, 25 Jul 2018 17:05:35 +0300
Message-ID: <9f85c7af-1115-6888-da0d-d5f93376939f@amazon.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
 <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5mrz=kj=amazon.com=prvs=737c83cf7=bercarug@srs-us1.protection.inumbo.net>)
 id 1fiKTL-000611-9I
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 14:08:59 +0000
In-Reply-To: <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, abelgun@amazon.com, David Woodhouse <dwmw2@infradead.org>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjUvMjAxOCAwNTowMiBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEp1bCAyNSwg
MjAxOCBhdCAwMzo0MToxMVBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyNS8w
Ny8xOCAxNTozNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+PiBXaGF0IGNvdWxkIGJlIGNh
dXNpbmcgdGhlIGF2YWlsYWJsZSBtZW1vcnkgbG9zcyBwcm9ibGVtPwo+Pj4gVGhhdCBzZWVtcyB0
byBiZSBMaW51eCBhZ2dyZXNzaXZlbHkgYmFsbG9vbmluZyBvdXQgbWVtb3J5LCB5b3UgZ28gZnJv
bQo+Pj4gNzEyOU0gdG90YWwgbWVtb3J5IHRvIDI0Nk0uIEFyZSB5b3UgY3JlYXRpbmcgYSBsb3Qg
b2YgZG9tYWlucz8KPj4gVGhpcyBtaWdodCBiZSByZWxhdGVkIHRvIHRoZSB0b29scyB0aGlua2lu
ZyBkb20wIGlzIGEgUFYgZG9tYWluLgo+IEdvb2QgcG9pbnQuCj4KPiBJbiB0aGF0IGNhc2UsIHhl
bnN0b3JlLWxzIC1mcCB3b3VsZCBhbHNvIGJlIHVzZWZ1bC4gVGhlIG91dHB1dCBzaG91bGQKPiBz
aG93IHRoZSBiYWxsb29uIHRhcmdldCBmb3IgRG9tMC4KPgo+IFlvdSBjYW4gYWxzbyB0cnkgdG8g
c2V0IHRoZSBhdXRvYmFsbG9vbiB0byBvZmYgaW4gL2V0Yy94ZW4veGwuY2ZnIHRvIHNlZQo+IGlm
IGl0IG1ha2VzIGFueSBkaWZmZXJlbmNlLgo+Cj4gV2VpLgpBbHNvIHRyaWVkIHNldHRpbmcgYXV0
b2JhbGxvb25pbmcgb2ZmLCBidXQgaXQgaGFkIG5vIGVmZmVjdC4KCkdhYnJpZWwKPgo+Pgo+PiBK
dWVyZ2VuCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWwKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIChSb21hbmlhKSBTLlIu
TC4gcmVnaXN0ZXJlZCBvZmZpY2U6IDI3QSBTZi4gTGF6YXIgU3RyZWV0LCBVQkM1LCBmbG9vciAy
LCBJYXNpLCBJYXNpIENvdW50eSwgNzAwMDQ1LCBSb21hbmlhLiBSZWdpc3RlcmVkIGluIFJvbWFu
aWEuIFJlZ2lzdHJhdGlvbiBudW1iZXIgSjIyLzI2MjEvMjAwNS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
