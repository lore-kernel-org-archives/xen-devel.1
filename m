From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.7] arm: constify atomic_read parameter
Date: Wed, 15 Aug 2018 09:29:32 +0100
Message-ID: <cce88130-c26d-7b02-a31a-138b6077f3e5@citrix.com>
References: <20180815082836.6046-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwwv=k6=citrix.com=prvs=758086435=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fprBP-0004Fw-Py
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 08:29:35 +0000
In-Reply-To: <20180815082836.6046-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDgvMjAxOCAwOToyOCwgV2VpIExpdSB3cm90ZToKPiBkZWQyYTM3ZDYzIGFkZGVkIGNv
bnN0IHRvIGF0b21pY19yZWFkLiBEbyB0aGUgc2FtZSBmb3IgQXJtCj4gY291bnRlcnBhcnQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpNb3N0IGxpa2VseSBu
ZWVkZWQgZm9yIDQuNiBhcyB3ZWxsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
