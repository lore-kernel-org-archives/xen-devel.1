From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 v2] libxl: prepare environment for
 domcreate_stream_done
Date: Mon, 11 Mar 2019 07:42:34 +0100
Message-ID: <e9071805-77e3-12f2-00f6-043e838131be@suse.com>
References: <20190308122415.29972-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1Ho2=RO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h3Ee2-0007Vc-QH
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 06:42:42 +0000
In-Reply-To: <20190308122415.29972-1-olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMjAxOSAxMzoyNCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIGRv
bWNyZWF0ZV9ib290bG9hZGVyX2RvbmUgbWF5IGJyYW5jaCBlYXJseSB0bwo+IGRvbWNyZWF0ZV9z
dHJlYW1fZG9uZSwgaW4gY2FzZSBzb21lIGVycm9yIG9jY291cmVkLiBIZXJlIHNycy0+ZGNzIHdp
bGwgYmUKPiBOVUxMLCB3aGljaCBsZWFkcyB0byBhIGNyYXNoLgo+IAo+IEl0IGlzIHVuY2xlYXIg
d2hhdCB0aGUgcHVycG9zZSBvZiB0aGF0IGJhY2twb2ludGVyIGlzLiBQZXJoYXBzIGl0IGNhbiBi
ZQo+IHJlbW92ZWQsIGFuZCBkb21jcmVhdGVfc3RyZWFtX2RvbmUgY291bGQgdXNlIENPTlRBSU5F
Ul9PRi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CgpB
cyB3ZSBhcmUgdmVyeSBjbG9zZSB0byBhIDQuMTIgcmVsZWFzZSBhbmQgdGhpcyBpcyBubyByZWNl
bnQgcmVncmVzc2lvbgpJJ2QgbGlrZSB0byBkZWZlciB0aGlzIHBhdGNoIHRvIDQuMTMuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
