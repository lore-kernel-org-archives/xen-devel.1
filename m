From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3] x86/p2m: force return value checking of
 p2m_set_entry()
Date: Thu, 25 Jan 2018 17:15:32 +0000
Message-ID: <054370a8-2c99-951e-ec17-2bf7b43c1bc5@citrix.com>
References: <5A6714E102000078001A1718@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fhrq=eu=citrix.com=prvs=556fd874a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eel7h-0004Xw-Ib
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 17:15:37 +0000
In-Reply-To: <5A6714E102000078001A1718@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjMvMjAxOCAwOTo1NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQXMgWFNBcyAyNDYg
YW5kIDI0NyBoYXZlIHNob3duLCBub3QgZG9pbmcgc28gaXMgcmF0aGVyIGRhbmdlcm91cy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKVGhhbmtzLAoKUmV2aWV3ZWQtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
