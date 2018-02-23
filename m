From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] x86: slightly reduce RSB overwrite
 overhead
Date: Fri, 23 Feb 2018 06:06:58 -0700
Message-ID: <5A90200202000078001AAE5A@prv-mh.provo.novell.com>
References: <5A8D619302000078001A9E5D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1epD48-0006qh-LD
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 13:07:08 +0000
In-Reply-To: <5A8D619302000078001A9E5D@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDEyOjA5LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IEF2
b2lkaW5nIHRoZSBQQVVTRS9MRkVOQ0UgcGFpciBvbiB0aGUgZmlyc3Qgb2YgdGhlIHR3byB1bnJv
bGxlZAo+IGl0ZXJhdGlvbnMgbm90IG9ubHkgcmVkdWNlcyBjb2RlIHNpemUsIGJ1dCBhbHNvIGlt
cHJvdmVzIHBlcmZvcm1hbmNlCj4gYWNjb3JkaW5nIHRvIG15IChsaW1pdGVkKSBtZWFzdXJlbWVu
dHMgKGJ5IDE1LTIwIGN5Y2xlcyBvbiBteSBXZXN0bWVyZTsKPiBncmFudGVkIEkgY2FuJ3QgcmVh
bGx5IGV4cGxhaW4gd2h5IHRoYXQgaXMpLiBOb3cgdGhhdCB0aGUgdHdvIGl0ZXJhdGlvbnMKPiBh
cmUgc3VmZmljaWVudGx5IGRpZmZlcmVudCwgcmVtb3ZlIHRoZSB1c2Ugb2YgLmlycDsgb3RoZXJ3
aXNlIC5pZiB3b3VsZAo+IG5lZWQgdG8gYmUgYWRkZWQgdG8gaXRzIGJvZHkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFJGQyBiZWNh
dXNlIHRoaXMgcHJlc3VtYWJseSB3YW50cyB2ZXJpZmljYXRpb24gb24gb3RoZXIgQ1BVIG1vZGVs
cy4KCkknbSB3aXRoZHJhd2luZyB0aGlzIHBhdGNoIC0gSSd2ZSBqdXN0IGNoZWNrZWQgYW5kIGl0
IG1ha2VzIHRoaW5ncwp3b3JzZSBvbiBTYW5keWJyaWRnZS4KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
