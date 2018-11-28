From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Xen stable-4.11 crash when trying to start a VM on
 fedora 29
Date: Wed, 28 Nov 2018 16:46:56 +0000
Message-ID: <141iAKOMS78aTtc5NNHFk6GVJglW_gZhWtlSThWd1BhnzTWHhU9LnS-hgEJzEpL24Qj8HZ_lKRaw6g-vUpv1uIaQZC-sDtzIW7kxxmY6Vb0=@protonmail.com>
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xs6n=oh=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1gS2zR-0000Uh-GK
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:47:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpJIG1hbmFnZWQgdG8gY29tcGlsZSBhbmQgaW5zdGFsbCBYZW4gZnJvbSBzb3VyY2UsdXNp
bmcgdGhlwqAgc3RhYmxlLTQuMTEgYnJhbmNoLgoKSSBjb25maWd1cmVkIG15IFZNcyBpbiBsaWJ2
aXJ0LCBidXQgd2hlbiBJIHRyeSB0byBzdGFydCBvbmUgb2YgdGhlbSwgdGhlIGhvc3QgY29tcGxl
dGVseSBjcmFzaGVzIGFmdGVyIGEgZmV3IHNlY29uZHMgKHRoZSBWTSBpcyBuZXZlciBzdGFydGVk
KSwgYW5kIHJlYm9vdHMuCgpJIHJhbiBkbWVzZyAtdyBiZWZvcmUgc3RhcnRpbmcgdGhlIFZNLCBh
bmQgdGhlIG91cHV0CmlzIDIgZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0czoKaHR0cHM6Ly9naXN0
LmdpdGh1Yi5jb20vV2VuemVsLzc2M2IxN2ZhZTc3M2Y3ZGQ2YjFkOGIzMDMxODdmM2MwCgoKQ2Fu
IGFueW9uZSBsb29rIGludG8gdGhpcyBhbmQgdGVsbCBtZSBpZiB0aGlzIGlzIGEgYnVnIGluIFhl
biA/CgpUaGFua3MgIQotLQpNYXRoaWV1IFRhcnJhbAoKU2VudCB3aXRoIFByb3Rvbk1haWwgU2Vj
dXJlIEVtYWlsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
