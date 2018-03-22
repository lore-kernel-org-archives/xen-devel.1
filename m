From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 05/39] ARM: timer: Handle level triggered
 IRQs correctly
Date: Thu, 22 Mar 2018 01:58:52 +0000
Message-ID: <07178a97-4e1b-4f25-84ed-9d2e8e116b7b@arm.com>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-6-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlws=gm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eypVJ-0006Fe-Rl
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 01:58:57 +0000
In-Reply-To: <20180321163235.12529-6-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8yMS8yMDE4IDA0OjMyIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgQVJNIEdlbmVyaWMgVGltZXIgdXNlcyBhIGxldmVsLXNlbnNpdGl2ZSBpbnRlcnJ1cHQg
c2VtYW50aWMuIFdlCj4gZWFzaWx5IGNhdGNoIHdoZW4gdGhlIGxpbmUgZ29lcyBoaWdoLCBhcyB0
aGlzIHRyaWdnZXJzIHRoZSBoYXJkd2FyZSBJUlEuCj4gSG93ZXZlciB3ZSBhbHNvIGhhdmUgdG8g
a2VlcCB0cmFjayBvZiB3aGVuIHRoZSBsaW5lIGxvd2VycywgYXMgdGhlCj4gZW11bGF0aW9uIGRl
cGVuZHMgb24gaXQ6IFVwb24gZW50ZXJpbmcgdGhlIGd1ZXN0LCB0aGUgbmV3IFZHSUMgd2lsbAo+
ICpjbGVhciogdGhlIHZpcnR1YWwgaW50ZXJydXB0IGxpbmUsIHNvIGl0IG5lZWRzIHRvIHJlLXNh
bXBsZSB0aGUgYWN0dWFsCj4gc3RhdGUgYWZ0ZXIgcmV0dXJuaW5nIGZyb20gdGhlIGd1ZXN0Lgo+
IFNvIHdlIGhhdmUgdG8gc3luYyB0aGUgc3RhdGUgb2YgdGhlIGludGVycnVwdCBjb25kaXRpb24g
YXQgY2VydGFpbgo+IHBvaW50cyB0byBjYXRjaCB3aGVuIHRoZSBsaW5lIGdvZXMgbG93IGFuZCB3
ZSBjYW4gcmVtb3ZlIHRoZSB2dGltZXIgdklSUQo+IGZyb20gdGhlIHZHSUMgKGFuZCB0aGUgTFIp
Lgo+IFRoZSBWR0lDIGluIFhlbiBzbyBmYXIgb25seSBpbXBsZW1lbnRlZCBlZGdlIHRyaWdnZXJl
ZCB2SVJRcywgcmVhbGx5LCBzbwo+IHdlIG5lZWQgdG8gYWRkIG5ldyBmdW5jdGlvbmFsaXR5IHRv
IHJlLXNhbXBsZSB0aGUgaW50ZXJydXB0IHN0YXRlLgo+IERvIHRoaXMgb25seSB3aGVuIHRoZSBu
ZXcgVkdJQyBpcyBpbiB1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFu
ZHJlLnByenl3YXJhQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
