From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 08/21] memblock: drop __memblock_alloc_base()
Date: Wed, 16 Jan 2019 09:15:45 -0600
Message-ID: <CAL_Jsq+7=yiOYS0Nq7euXK4qghjAu9-mzruW0Jt1N146gK+DCQ__15995.5900664956$1547651686$gmane$org@mail.gmail.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-9-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iaAE=PY=kernel.org=robh+dt@srs-us1.protection.inumbo.net>)
 id 1gjmvA-0000Zk-M3
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 15:16:00 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4C58217D4
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 15:15:58 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id g125so3936640qke.4
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 07:15:58 -0800 (PST)
In-Reply-To: <1547646261-32535-9-git-send-email-rppt@linux.ibm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, SH-Linux <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Petr Mladek <pmladek@suse.com>l
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgNzo0NSBBTSBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhlIF9fbWVtYmxvY2tfYWxsb2NfYmFzZSgpIGZ1bmN0aW9u
IHRyaWVzIHRvIGFsbG9jYXRlIGEgbWVtb3J5IHVwIHRvIHRoZQo+IGxpbWl0IHNwZWNpZmllZCBi
eSBpdHMgbWF4X2FkZHIgcGFyYW1ldGVyLiBEZXBlbmRpbmcgb24gdGhlIHZhbHVlIG9mIHRoaXMK
PiBwYXJhbWV0ZXIsIHRoZSBfX21lbWJsb2NrX2FsbG9jX2Jhc2UoKSBjYW4gaXMgcmVwbGFjZWQg
d2l0aCB0aGUgYXBwcm9wcmlhdGUKPiBtZW1ibG9ja19waHlzX2FsbG9jKigpIHZhcmlhbnQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0t
Cj4gIGFyY2gvc2gva2VybmVsL21hY2hpbmVfa2V4ZWMuYyB8ICAzICsrLQo+ICBhcmNoL3g4Ni9r
ZXJuZWwvZTgyMC5jICAgICAgICAgfCAgMiArLQo+ICBhcmNoL3g4Ni9tbS9udW1hLmMgICAgICAg
ICAgICAgfCAxMiArKysrLS0tLS0tLS0KPiAgZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYyAg
IHwgIDcgKystLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggICAgICAgfCAgMiAtLQo+
ICBtbS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICAgfCAgOSArKy0tLS0tLS0KPiAgNiBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
