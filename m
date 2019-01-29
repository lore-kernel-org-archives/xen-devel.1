From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH v2 for-4.12] gic-vgic: fix an assert
 condition
Date: Tue, 29 Jan 2019 18:06:25 +0200
Message-ID: <7aef5df8-8fdd-dd1b-6778-bcb584e3134e@gmail.com>
References: <1548435962-29797-1-git-send-email-andrii.anisov@gmail.com>
 <71c6093b-c805-deab-94f9-22f47821c23b@suse.com>
 <16c3f4fd-cbcf-570b-88c0-a67a08f19491@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KUKg=QF=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1goVuA-0003kK-6K
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 16:06:30 +0000
Received: by mail-lf1-x143.google.com with SMTP id p6so15076557lfc.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jan 2019 08:06:29 -0800 (PST)
In-Reply-To: <16c3f4fd-cbcf-570b-88c0-a67a08f19491@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Stefan Nuernberger <snu@amazon.de>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS4wMS4xOSAxNzozNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFuZHJpaSwgcGxlYXNl
IHRyeSB0byBhZGQgdGhlIHN1YnN5c3RlbSB5b3UgbW9kaWZ5IGluIHRoZSBjb21taXQgdGl0bGUg
KGkuZSB4ZW4vYXJtKS4gVGhpcyBoZWxwcyBmb3IgdGhlIHJldmlld2VyIHRvIGtub3cgd2hhdCB5
b3UgYXJlIG1vZGlmeWluZyBhbmQgYWxzbyBoZWxwcyB3aGVuIGxvb2tpbmcgYXQgc2hvcnRsb2cu
Ck9oLCBJIG1pc3NlZCAiYXJtLyIgdGhpcyB0aW1lLgpXaWxsIHRyeSB0byBub3QgbWlzcyBpdCBm
dXJ0aGVyLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
