From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Fix {set,
 clear}_foreign_p2m_mapping on autotranslating guests
Date: Thu, 8 Feb 2018 10:42:22 +0100
Message-ID: <da5677a0-992a-03d2-d8a5-5bc5ffcef268__27205.0635227517$1518082896$gmane$org@suse.com>
References: <20180207204740.518-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=35gd=fc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ejiio-0003uB-T3
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 09:42:26 +0000
In-Reply-To: <20180207204740.518-1-simon@invisiblethingslab.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMTggMjE6NDcsIFNpbW9uIEdhaXNlciB3cm90ZToKPiBDb21taXQgODI2MTZmOTU5
OWE3ICgieGVuOiByZW1vdmUgdGVzdHMgZm9yIHB2aCBtb2RlIGluIHB1cmUgcHYgcGF0aHMiKQo+
IHJlbW92ZWQgdGhlIGNoZWNrIGZvciBhdXRvdHJhbnNsYXRpb24gZnJvbSB7c2V0LGNsZWFyfV9m
b3JlaWduX3AybV9tYXBwaW5nCj4gYnV0IHRob3NlIGFyZSBjYWxsZWQgYnkgZ3JhbnQtdGFibGUu
YyBhbHNvIG9uIFBWSC9IVk0gZ3Vlc3RzLgo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9y
Zz4gIyA0LjE0Cj4gRml4ZXM6IDgyNjE2Zjk1OTlhNyAoInhlbjogcmVtb3ZlIHRlc3RzIGZvciBw
dmggbW9kZSBpbiBwdXJlIHB2IHBhdGhzIikKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHYWlzZXIg
PHNpbW9uQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCkNvbW1pdHRlZCB0byB4ZW4udGlwIGZvci1saW51cy00LjE2
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
