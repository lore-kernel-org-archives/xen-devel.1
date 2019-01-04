From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] x86/passthrough: move io.c to the x86
 subfolder
Date: Fri, 04 Jan 2019 10:03:21 -0700
Message-ID: <5C2F91D9020000780020A562@prv1-mh.provo.novell.com>
References: <20190104103329.35741-1-roger.pau@citrix.com>
 <20190104103329.35741-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gfSsa-0004CU-J8
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 17:03:28 +0000
In-Reply-To: <20190104103329.35741-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE5IGF0IDExOjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEl0IG1ha2VzIG5vIHNlbnNlIGZvciBpby5jIHRvIGJlIG9uIHRoZSB0b3AgbGV2ZWwgcGFzc3Ro
cm91Z2gKPiBkaXJlY3RvcnksIHNpbmNlIGl0J3MgeDg2IHNwZWNpZmljLgoKSSdtIG5vdCBzdXJl
IGl0IHJlYWxseSBpcy4gSXQncyBsYXJnZWx5IGFib3V0IGludGVycnVwdCBhcnJhbmdlbWVudHMK
Zm9yIGd1ZXN0cywgd2hpY2ggKGJlaW5nIFBDSS1yZWxhdGVkKSBtYXkgb3IgbWF5IG5vdCBiZSBy
ZS0KdXNhYmxlIGJ5IEFybSBvbmNlIHRoZXkgZ2V0IHRvIHN1cHBvcnQgUENJLiBJJ2QgbGlrZSB0
byBoYXZlIGFuCkFybSBtYWludGFpbmVyJ3MgdmlldyBvbiB0aGlzIGJlZm9yZSBnaXZpbmcgYW4g
YWNrIGhlcmUuIEFuZApvbmNlIG1vdmluZyBpdCBhcm91bmQsIGNoYW5naW5nIGl0cyBuYW1lIHRv
IHNvbWV0aGluZyBtb3JlCnN1aXRhYmxlIHNob3VsZCBhbHNvIGJlIGNvbnNpZGVyZWQuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
