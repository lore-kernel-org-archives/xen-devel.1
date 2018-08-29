From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Wed, 29 Aug 2018 18:15:53 +0100
Message-ID: <d0531953-521f-9a0f-8e1b-8709b69da3b3@citrix.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv44b-0000Bi-8M
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 17:16:05 +0000
In-Reply-To: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDcvMTggMTQ6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IERvbid0IGNoYW5jZSBoYXZp
bmcgU3BlY3RyZSB2MSAoaW5jbHVkaW5nIEJDQlMpIGdhZGdldHMuIEluIHNvbWUgb2YgdGhlCj4g
Y2FzZXMgdGhlIGluc2VydGlvbnMgYXJlIG1vcmUgb2YgcHJlY2F1dGlvbmFyeSBuYXR1cmUgcmF0
aGVyIHRoYW4gdGhlcmUKPiBwcm92YWJseSBiZWluZyBhIGdhZGdldCwgYnV0IEkgdGhpbmsgd2Ug
c2hvdWxkIGVyciBvbiB0aGUgc2FmZSAoc2VjdXJlKQo+IHNpZGUgaGVyZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkknbSBzdGlsbCBub3QgY29u
dmluY2VkIGJ5IHRoZSB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oKSBjaGFuZ2UuwqAgSXQgaXMK
YSBCQ0JTIGdhZGdldCwgYnV0IGlzIHJlc3RyaWN0ZWQgdG8gdGhlIHRvb2xzdGFjayBvbmx5IHdo
aWNoIGNhbiBnZXQgYXQKYWxsIHRoZSBpbnRlcmVzdGluZyBkYXRhIHZpYSBsZWdpdGltYXRlIG1l
YW5zLCBhbmQgYWxzbyBub3QgbG9uZyBmb3IKdGhpcyB3b3JsZC4KCkV2ZXJ5dGhpbmcgZWxzZSBM
R1RNLsKgIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
