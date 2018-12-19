From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 02/49] x86emul: support AVX512{F,
 BW} shift/rotate insns
Date: Wed, 19 Dec 2018 16:00:04 +0000
Message-ID: <b586a102-4e82-77fc-84c7-9a6d5bca610d@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C1A52ED0200007800207865@prv1-mh.provo.novell.com>
 <5C1A576902000078002078A1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zx63=O4=citrix.com=prvs=884ade4f2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZeGf-0007ZI-LB
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 16:00:17 +0000
In-Reply-To: <5C1A576902000078002078A1@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMjAxOCAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZSB0aGF0IHNpbWRf
cGFja2VkX2ZwIGZvciB0aGUgb3Bjb2RlIHNwYWNlIDBmMzggbWFqb3Igb3Bjb2RlcyAxNCBhbmQK
PiAxNSBpcyBub3QgcmVhbGx5IGNvcnJlY3QsIGJ1dCBzdWZmaWNpZW50IGZvciB0aGUgcHVycG9z
ZXMgaGVyZS4gRnVydGhlcgo+IGFkanVzdG1lbnRzIG1heSBsYXRlciBiZSBuZWVkZWQgZm9yIHRo
ZSBkb3duIGNvbnZlcnNpb24gdW5zaWduZWQKPiBzYXR1cmF0aW5nIFZQTU9WKiBpbnNucywgZmly
c3QgYW5kIGZvcmVtb3N0IGZvciB0aGUgZGlmZmVyZW50IERpc3A4Cj4gc2NhbGluZyB0aG9zZSBv
bmVzIHVzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
