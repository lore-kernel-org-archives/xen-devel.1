From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] sched/credit: avoid priority boost for
 capped domains when unpark
Date: Mon, 6 May 2019 16:35:22 +0100
Message-ID: <7a9fed04-6158-3f86-a429-ee340abeb461@citrix.com>
References: <20190503194349.42831-1-elnikety@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Pjh=TG=citrix.com=prvs=022dda640=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hNfeT-0000IK-Sw
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:35:37 +0000
In-Reply-To: <20190503194349.42831-1-elnikety@amazon.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eslam Elnikety <elnikety@amazon.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Lars Kurth <lars.kurth@xen.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDUvMjAxOSAyMDo0MywgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gV2hlbiB1bnBhdXNp
bmcgYSBjYXBwZWQgZG9tYWluLCB0aGUgc2NoZWR1bGVyIGN1cnJlbnRseSBjbGVhcnMgdGhlCj4g
Q1NDSEVEX0ZMQUdfVkNQVV9QQVJLRUQgZmxhZyBiZWZvcmUgdmNwdV93YWtlKCkuIFRoaXMsIGlu
IHR1cm4sIGNhdXNlcyB0aGUKPiB2Y3B1X3dha2UgdG8gc2V0IENTQ0hFRF9QUklfVFNfQk9PU1Qs
IHJlc3VsdGluZyBpbiBhbiB1bmZhaXIgY3JlZGl0IGJvb3N0LiBUaGUKPiBjb21tZW50IGFyb3Vu
ZCB0aGUgY2hhbmdlZCBsaW5lcyBhbHJlYWR5IHN0YXRlcyB0aGF0IGNsZWFyaW5nIHRoZSBmbGFn
IHNob3VsZAo+IGhhcHBlbiBBRlRFUiB0aGUgdW5wYXVzZS4gVGhpcyBidWcgd2FzIGludHJvZHVj
ZWQgaW4gY29tbWl0IGJlNjUwNzUwOTQ1Cj4gImNyZWRpdDE6IFVzZSBhdG9taWMgYml0IG9wZXJh
dGlvbnMgZm9yIHRoZSBmbGFncyBzdHJ1Y3R1cmUiLgo+Cj4gT3JpZ2luYWwgcGF0Y2ggYXV0aG9y
IGNyZWRpdDogWGkgWGlvbmcgd2hpbGUgYXQgQW1hem9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXNs
YW0gRWxuaWtldHkgPGVsbmlrZXR5QGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IExlb25hcmQg
Rm9lcnN0ZXIgPGZvZXJzbGVvQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogUGV0cmUgRWZ0aW1l
IDxlcGV0cmVAYW1hem9uLmNvbT4KPiBBY2tlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9s
aUBzdXNlLmNvbT4KClB1bGxlZCBpbnRvIHg4Ni1uZXh0LgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
