From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: enable building rombios with
 clang
Date: Wed, 18 Jul 2018 07:47:39 +0100
Message-ID: <20180718064739.ydu4hy5gz3d6qura@citrix.com>
References: <20180717083935.25964-1-wei.liu2@citrix.com>
 <20180717215433.dsp6oaikeyrd7dgn@MacBook-Pro.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffgFT-0004sM-9Q
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 06:47:43 +0000
Content-Disposition: inline
In-Reply-To: <20180717215433.dsp6oaikeyrd7dgn@MacBook-Pro.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDQ6NTQ6MzNQTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDk6Mzk6MzVBTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFByZXZpb3VzbHkgaXQgaXMgZGlzYWJsZWQgYmVjYXVzZSB0aGUgZW1iZWRk
ZWQgaXB4ZSBjYW4ndCBiZSBidWlsdAo+ID4gd2l0aCBjbGFuZy4gTm93IHRoYXQgaXB4ZSBpcyBz
cGxpdCBvdXQgd2UgY2FuIHVzZSAtLXdpdGgtc3lzdGVtLWlweGUKPiA+IHRvIHdvcmsgYXJvdW5k
IHRoZSBpc3N1ZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiA+IC0tLQo+ID4gRGVwZW5kcyBvbiB0aGUgaXB4ZSBzZXJpZXMganVzdCBjb21t
aXR0ZWQuCj4gPiAtLS0KPiA+ICBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQgfCA0ICsrLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkIGIvYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkCj4gPiBpbmRleCAwNTQyMjZiZDczLi40ZGNhYWJmNGJkIDEwMDc1NQo+ID4gLS0t
IGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCj4gPiArKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQKPiA+IEBAIC0xNiw4ICsxNiw4IEBAIGNmZ2FyZ3MrPSgiLS1lbmFibGUtZG9jcyIpCj4g
PiAgaWYgW1sgIiR7Q0N9IiA9PSAiY2xhbmciIF1dOyB0aGVuCj4gPiAgICAgICMgU2VhQklPUyBj
YW5ub3QgYmUgYnVpbHQgd2l0aCBjbGFuZwo+ID4gICAgICBjZmdhcmdzKz0oIi0td2l0aC1zeXN0
ZW0tc2VhYmlvcz0vdXNyL3NoYXJlL3NlYWJpb3MvYmlvcy5iaW4iKQo+ID4gLSAgICAjIGlQWEUg
Y2Fubm90IGJlIGJ1aWx0IHdpdGggY2xhbmcgc28gd2UgY2Fubm90IGJ1aWxkIHJvbWJpb3MKPiA+
IC0gICAgY2ZnYXJncys9KCItLWRpc2FibGUtcm9tYmlvcyIpCj4gPiArICAgICMgaVBYRSBjYW5u
b3QgYmUgYnVpbHQgd2l0aCBjbGFuZwo+ID4gKyAgICBjZmdhcmdzKz0oIi0td2l0aC1zeXN0ZW0t
aXB4ZT0vdXNyL3NoYXJlL2lweGUvaXB4ZS5iaW4iKQo+IAo+IFRoaXMgZmlsZSBkb2Vzbid0IGV4
aXN0IG9uIHRoZSBVYnVudHUgY29udGFpbmVycyBJJ3ZlIHRyaWVkLiBFdmVuIGFmdGVyCj4gaW5z
dGFsbGluZyBpcHhlIGFuZCBpcHhlLXFlbXUuIFdoYXQgZGlzdHJvIHByb3ZpZGVkIGlQWEUgZmls
ZSBjYW4gd2UKPiB1c2U/CgpUaGUgZWZmZWN0IG9mIC0td2l0aC1zeXN0ZW0taXB4ZSBvbmx5IHB1
dHMgdGhhdCBwYXRoIGludG8gbGlieGwgYW5kCnRoYXQncyBpdC4gIFRoYXQgaXMganVzdCBhIHJh
bmRvbSBwYXRoIEkgcHV0IGluLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
