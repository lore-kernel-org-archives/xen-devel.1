From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2] gic-vgic: skip irqs locking in
 gic_restore_pending_irqs()
Date: Tue, 22 Jan 2019 15:11:28 +0200
Message-ID: <50844a64-46c1-4a27-1134-10317b94b009@gmail.com>
References: <1545418456-9207-1-git-send-email-andrii.anisov@gmail.com>
 <cd2d9916-f3a0-83e1-848f-0458c030cbbc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqM6=P6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glvq6-0006zT-G8
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 13:11:38 +0000
Received: by mail-lf1-x142.google.com with SMTP id y11so18039585lfj.4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jan 2019 05:11:36 -0800 (PST)
In-Reply-To: <cd2d9916-f3a0-83e1-848f-0458c030cbbc@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS4wMS4xOSAxOTo0MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEkgd2lsbCBxdWV1ZSB0aGlz
IHBhdGNoIGZvciA0LjEzLgoKVGhhbmsgeW91LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNv
di4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
