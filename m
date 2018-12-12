From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 08/16] gic: separate ppi processing
Date: Wed, 12 Dec 2018 14:52:11 +0200
Message-ID: <bfb503ac-b3a6-78aa-5785-546ac685cbac@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-9-git-send-email-andrii.anisov@gmail.com>
 <3fa565bc-caa7-8711-e32c-af0738f8c5bf@gmail.com>
 <12b85eb7-9ce1-7a9f-dca2-c374637bf673@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX3zs-0004Zw-6Z
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:52:16 +0000
Received: by mail-lf1-x144.google.com with SMTP id y11so2145108lfj.4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 04:52:15 -0800 (PST)
In-Reply-To: <12b85eb7-9ce1-7a9f-dca2-c374637bf673@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi4xMi4xOCAxNDo0NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgaGF2ZW4ndCBhbnN3
ZXJlZCBiZWNhdXNlIEkgYW0gd2FpdGluZyB0aGUgbnVtYmVycy4KSSBnb3QgaXQuCkJ1dCBUQk0g
d2lsbCBub3Qgc2hvdyBlZmZlY3Qgb2YgdGhpcyBwYXRjaC4gRXZlbiB0aGUgcGF0Y2ggYnJlYWtz
IFRCTSdzIGZ1bmN0aW9uYWxpdHkgYmVjYXVzZSBUQk0gcmVsaWVzIG9uIGEgcGh5cyB0aW1lciBp
bnRlcnJ1cHQgdG8gYmUgYXNzaWduZWQgdG8gdGhlIGRvbWFpbiAoZ28gdGhyb3VnaCB0aGUgc3Bp
IHBhdGgpLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
