From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH] libxc/arm: remove useless conditional in
	meminit
Date: Wed, 14 Mar 2018 11:01:13 +0000
Message-ID: <CAFLBxZZSaNP3-Bs5XVQ-j8ufk_P+T5q-Z63g4XQ-+1M2O_M+Pw@mail.gmail.com>
References: <20180314105811.23809-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zknl=ge=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ew49k-0008FG-Vr
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 11:01:17 +0000
Received: by mail-qk0-x233.google.com with SMTP id z184so2946235qkc.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 04:01:14 -0700 (PDT)
In-Reply-To: <20180314105811.23809-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTA6NTggQU0sIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+IHdyb3RlOgo+IFRoZSB2YXJpYWJsZSBuYW1lZCByYW1zaXplIGlzIGFsd2F5cyBub24t
emVybyBhdCB0aGF0IHBvaW50IGJlY2F1c2UKPiB0aGVyZSBpcyBhIGNoZWNrIGZvciB6ZXJvIGEg
ZmV3IGxpbmVzIGJlZm9yZS4KCkJ1dCB0aGlzIGlzIGEgbG9vcCwgYW5kIHJhbXNpemUgaXMgbW9k
aWZpZWQgZHVyaW5nIHRoZSBsb29wLiAgaWYKYmFua21heFtpXSA+IHJhbXNpemUsIHRoZW4gYmFu
a3NpemUgaXMgc2V0IHRvIHJhbXNpemUsIGFuZCB0aGUgbG9vcApzaG91bGQgdGVybWluYXRlIG5l
eHQgdGltZSBhcm91bmQuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
