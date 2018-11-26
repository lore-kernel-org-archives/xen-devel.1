From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: fix test harness 32-bit "clean"
 target handling
Date: Mon, 26 Nov 2018 14:16:01 +0000
Message-ID: <31a5bf07-60d3-ddbf-a46b-243b32c6461c@citrix.com>
References: <5BFBFF8D020000780020006B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8lfc=of=citrix.com=prvs=861a7224f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gRHgV-0003hy-NW
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:16:23 +0000
In-Reply-To: <5BFBFF8D020000780020006B@prv1-mh.provo.novell.com>
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTEvMjAxOCAxNDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hlbiBwcmVwYXJpbmcg
d2hhdCBpcyBub3cgNTJjMzdmN2FiOSAoIng4NmVtdWw6IGFsc28gYWxsb3cgcnVubmluZyB0aGUK
PiAzMi1iaXQgaGFybmVzcyBvbiBhIDY0LWJpdCBkaXN0cm8iKSBJIGZpcnN0IHdyb25nbHkgdXNl
ZCBYRU5fVEFSR0VUX0FSQ0gKPiBpbnN0ZWFkIG9mIFhFTl9DT01QSUxFX0FSQ0guIFdoZW4gcmVh
bGl6aW5nIHRoZSBtaXN0YWtlIEkgZm9yZ290IHRvIGFsc28KPiBzd2l0Y2ggYXJvdW5kIHRoZSB1
c2UgaW4gdGhlIGV4cHJlc3Npb24gY29udHJvbGxpbmcgdGhlIHJ1bGUKPiBkZXBlbmRlbmNpZXMs
IGNhdXNpbmcgIm1ha2UgZGlzdGNsZWFuIiB0byBmYWlsIG9uIDY0LWJpdCBkaXN0cm9zLgo+Cj4g
UmVwb3J0ZWQtYnk6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFRlc3RlZC1ieTog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
