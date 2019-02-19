From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/shadow: don't pass wrong L4 MFN to
 guest_walk_tables()
Date: Tue, 19 Feb 2019 13:19:00 +0100
Message-ID: <db1ebeb5-c598-a447-02a7-082be499f633@suse.com>
References: <5C6BF02B0200007800217F32@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3cQP=Q2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gw4NX-0003a9-7z
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 12:20:03 +0000
In-Reply-To: <5C6BF02B0200007800217F32@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMjAxOSAxMzowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gNjQtYml0IFBWIGd1ZXN0
IHVzZXIgbW9kZSBydW5zIG9uIGEgZGlmZmVyZW50IEw0IHRhYmxlLiBNYWtlIHN1cmUKPiAtIHRo
ZSBhY2Nlc3NlZCBiaXQgZ2V0cyBzZXQgaW4gdGhlIGNvcnJlY3QgdGFibGUgKGFuZCBpbiBsb2ct
ZGlydHkKPiAgIG1vZGUgdGhlIGNvcnJlY3QgcGFnZSBnZXRzIG1hcmtlZCBkaXJ0eSkgZHVyaW5n
IGd1ZXN0IHdhbGtzLAo+IC0gdGhlIGNvcnJlY3QgdGFibGUgZ2V0cyBhdWRpdGVkIGJ5IHNoX2F1
ZGl0X2d3KCksCj4gLSBjb3JyZWN0IGluZm8gZ2V0cyBsb2dnZWQgYnkgcHJpbnRfZ3coKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZWxlYXNl
LWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
