From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 17:57:07 +0200
Message-ID: <66802142-617c-ee02-2a02-327c897f3bec@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
 <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
 <17e191b5-7252-c1d7-1f0f-39f98fdb9895@arm.com>
 <934f091c-234c-9bd6-52bc-2e78f9de4e17@gmail.com>
 <74fb1410-5ba6-2da8-2be3-6de3bd89af38@arm.com>
 <6d82b734-acbf-a089-858e-9fa0475ac127@gmail.com>
 <e381b039-67fe-0d56-4163-b8d5605690b8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX6sr-0006Jb-BQ
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 15:57:13 +0000
Received: by mail-lj1-x22f.google.com with SMTP id n18-v6so16724877lji.7
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 07:57:11 -0800 (PST)
In-Reply-To: <e381b039-67fe-0d56-4163-b8d5605690b8@arm.com>
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

Ck9uIDEyLjEyLjE4IDE3OjA4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSXMgaXQganVzdCBiZWNh
dXNlIGl0IGFkZHMgYSBjb3VwbGUgbW9yZSBpbnN0cnVjdGlvbiBpbiB0aGUgZ3Vlc3QgY2FzZT8K
QW5kIGFkZCB1bmxpa2VseSBmb3IgWEVOIElSUSBjYXNlLiBUaGF0IHdhcyB0aGUgaWRlYS4KCj4g
VGhlIGNoZWNrIGlzIG1haW5seSB0aGVyZSB0byBjYXRjaCBlcnJvciBpbiBkZWJ1ZyBidWlsZC4K
SSBzdXBwb3NlZCBhIHJhY2Ugd2l0aCBgcmVsZWFzZV9pcnEoKWAsIGJ1dCBmb3VuZCBvdXQgdGhh
dCB3ZSBhcmUgc2FmZSB3aXRoIGBfSVJRX0RJU0FCTEVEYCBmbGFnIHdoZW4gYGFjdGlvbmAgaXMg
bm90IHNldC4KU28gSSdsbCBrZWVwIHRoZSBjb2RlIGluIGl0cyBjdXJyZW50IHBsYWNlIChhcyBv
ZiBtYWlubGluZSkgYW5kIHdyYXAgaXQgd2l0aCBgI2lmbmRlZiBOREVCVUdgLgoKLS0gClNpbmNl
cmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
