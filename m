From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 14/44] x86emul: support AVX512F
 legacy-equivalent logic insns
Date: Tue, 13 Nov 2018 19:30:24 +0000
Message-ID: <6d798999-9a12-6f2d-f2a2-393ce8999882@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA397002000078001EBA4B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fay+=ny=citrix.com=prvs=848d83c09=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gMeOJ-0006qb-Hm
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 19:30:27 +0000
In-Reply-To: <5BAA397002000078001EBA4B@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMjAxOCAxNDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUGx1cyB2cHRlcm5sb2d7
ZCxxfSBhcyBiZWluZyBleHRlbnNpdmVseSB1c2VkIGJ5IHRoZSBjb21waWxlciwgaW4gb3JkZXIK
PiB0byBmYWNpbGl0YXRlIHRlc3QgZW5hYmxpbmcgaW4gdGhlIGhhcm5lc3MgYXMgc29vbiBhcyBw
b3NzaWJsZS4gQWxzbyB0aGUKPiB0d29ieXRlX3RhYmxlW10gZW50cmllcyBmb3IgYSBmZXcgbW9y
ZSBpbnNucyBnZXQgdGhlaXIgLmQ4cyBmaWVsZCBzZXQKPiByaWdodCBhd2F5LCBpbiBvcmRlciB0
byBub3Qgc3BsaXQgYW5kIGxhdGVyIHJlLWNvbWJpbmUgdGhlIGdyb3Vwcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
