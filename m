From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 3/8] xen/arm: Rename p2m_map_foreign to
 p2m_map_foreign_rw
Date: Thu, 15 Nov 2018 13:42:50 +0200
Message-ID: <CAC1WxdiM=oduMgMN=EGO5a1JOiz4VWaiGKYQLSzz4u0aGHM02A@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=abz7=n2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gNG34-0001ls-DC
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 11:43:02 +0000
Received: by mail-oi1-x243.google.com with SMTP id r127-v6so16479775oie.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 03:43:01 -0800 (PST)
In-Reply-To: <20181106191454.22143-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKSSdtIG5vdCBzdXJlIHdoeSBkbyB5b3UgbmVlZCB0aGlzIHBhdGNoIHRv
IGJlIHNlcGFyYXRlZCBmcm9tICJbUEFUQ0gKNC84XSB4ZW4vYXJtOiBBZGQgc3VwcG9ydCBmb3Ig
cmVhZC1vbmx5IGZvcmVpZ24gbWFwcGluZ3MiLgpCdXQgSSB3b3VsZCBub3QgYXJndWUgZm9yIHRo
YXQuCiAgICBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNv
bT4KClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
