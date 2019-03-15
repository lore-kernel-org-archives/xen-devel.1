From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 07/50] x86emul: support AVX512{F,
 BW} zero- and sign-extending moves
Date: Fri, 15 Mar 2019 18:02:57 +0000
Message-ID: <4008b3ca-d10f-bb5d-5934-2c93dba4e9dc@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B810A020000780021F128@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OIle=RS=citrix.com=prvs=970d66146=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4rCv-0000HX-Ry
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 18:05:25 +0000
In-Reply-To: <5C8B810A020000780021F128@prv1-mh.provo.novell.com>
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

T24gMTUvMDMvMjAxOSAxMDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZSB0aGF0IHRoZSB0
ZXN0aW5nIGluIHNpbWQuYyBkb2Vzbid0IHJlYWxseSBmb2xsb3cgdGhlIElTQSBleHRlbnNpb24K
PiBwYXR0ZXJuIC0gdG8gZml0IHRoZSBzY2hlbWUsIGV4dGVuc2lvbnMgZnJvbSBieXRlIGFuZCB3
b3JkIGdyYW51bGFyCj4gdmVjdG9ycyBjYW4gKGN1cnJlbnRseSkgc2Vuc2libHkgb25seSBoYXBw
ZW4gaW4gdGhlIEFWWDUxMkJXIGNhc2UgKGFuZAo+IGhlbmNlIHJlc3BlY3RpdmUgYWJzdHJhY3Rp
b24gbWFjcm9zIHdpbGwgYmUgYWRkZWQgdGhlcmUgcmF0aGVyIHRoYW4KPiBoZXJlKS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
