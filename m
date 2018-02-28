From: Paul Semel <semelpaul@gmail.com>
Subject: Re: [PATCH v2] fuzz/x86_emulate: fix bounds for input
 size
Date: Wed, 28 Feb 2018 18:30:34 +0100
Message-ID: <40872474-fec8-61ea-4d08-c414bd64feac@gmail.com>
References: <20180223163009.b42xfl3euanth3b7@citrix.com>
 <20180223224857.10212-1-semelpaul@gmail.com>
 <6ce2fed1-7b1f-ef5a-5954-c14b35212b5d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kuuf=fw=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1er5D2-0003Nl-B0
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 17:08:04 +0000
Received: by mail-wr0-x231.google.com with SMTP id z12so3208443wrg.4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2018 09:08:02 -0800 (PST)
In-Reply-To: <6ce2fed1-7b1f-ef5a-5954-c14b35212b5d@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, wei.liu2@citrix.com, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SGV5IEdlb3JnZSwKCk9uIDAyLzI3LzIwMTggMTE6MzkgQU0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6
Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIExvb2tpbmcgYSBiaXQgbW9yZSBhdCB0aGUgY29kZSBv
dmVyIHRoZSB3ZWVrZW5kLAo+IEkgZmlndXJlZCBvdXQgd2hhdCB0aGF0IEJVSUxEX0JVR19PTigp
IGlzIGZvciAtLSBpbiBhZmxfaGFybmVzcy5jLCB3ZQo+IHN0YXRpY2FsbHkgYWxsb2NhdGUgYSBi
dWZmZXIgb2Ygc2l6ZSBJTlBVVF9TSVpFIHRvIGhvbGQgdGhlIGZ1enogZGF0YS4KPiBUaGUgQlVJ
TERfQlVHX09OKCkgaXMgdG8gbWFrZSBzdXJlIHRoYXQgdGhpcyBidWZmZXIgaXMgYWx3YXlzIGJp
ZyBlbm91Z2gKPiB0byBob2xkIHRoZSBtaW5pbXVtIGlucHV0IHNpemUuICBBbmQgaW5jcmVhc2lu
ZyB0aGUgc2l6ZSBhY2NlcHRlZCBieQo+IExMVk1GdXp6ZXJUZXN0T25lSW5wdXQoKSB3b24ndCBo
YXZlIGFueSBlZmZlY3QgZm9yIGFueWJvZHkgdXNpbmcKPiBhZmwtaGFybmVzcywgYXMgdGhlIHNp
emUgcGFzc2VkIGluIHdpbGwgbmV2ZXIgYmUgbGFyZ2VyIHRoYW4gSU5QVVRfU0laRS4KPgoKVGhh
bmtzIGZvciByZXBseWluZyBtZSAhIEFjdHVhbGx5LCBJIHVuZGVyc3Rvb2Qgd2hhdCB0aGlzIEJV
SUxEX0JVR19PTigpIHdhcyBmb3IgCmFuZCBJIHRvdGFsbHkgYWdyZWUgd2l0aCB5b3Ug8J+ZggoK
QW55d2F5LCBJIGFtIHByZXR0eSBzdXJlIHRoYXQgdGhpcyBjaGVjayBpcyBub3QgbmVlZGVkIGFu
eW1vcmUgZm9yIHRoZSBuZXcgCmNoYW5nZXMgSSBtYWRlLCBhcyB0aGUgY29uZGl0aW9uIGlzIG5l
dmVyIHJlYWNoYWJsZSBhbnltb3JlLgoKPiBBcmUgeW91IHJ1bm5pbmcgYWZsLWhhcm5lc3MsIG9y
IGFyZSB5b3UgdXNpbmcgZnV6ei1lbXVsIGRpcmVjdGx5IHNvbWUKPiBvdGhlciB3YXkgKGUuZy4s
IHRocm91Z2ggR29vZ2xlJ3MgZnV6emluZyBzZXJ2aWNlKT8KPgoKSSBhbSBhY3R1YWxseSBub3Qg
dXNpbmcgaXQsIGJ1dCBJIGRpc2NvdmVyZWQgdGhpcyB0b29sIHNvbWUgdGltZSBiZWZvcmUsIGFu
ZCBJIAphbSBub3cgdHJ5aW5nIHRvIHBvcnQgdGhlIGlkZWEgb24gYW4gb3RoZXIgZW11bGF0b3Ig
cHJvamVjdC4uIPCfmYIKQW55d2F5LCBJIG1hZGUgbXVjaCBjaGFuZ2VzIG9uIG15IG93biB2ZXJz
aW9uLCBhbmQgaWYgaXQgc3RpbGwgZG9lcyBpbnRlcmVzdCAKeW91LCBJIGNhbiBzaGFyZSB0aG9z
ZSBjaGFuZ2VzIHdpdGggeW91IG9uY2UgSSdtIGRvbmUgd2l0aCBteSB0aGluZyAhCgo+ICAtR2Vv
cmdlCi0tIApQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
