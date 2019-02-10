From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] x86: make set_pmd_at() paravirt aware
Date: Sun, 10 Feb 2019 10:14:06 -0800
Message-ID: <CAHk-=wj4CYgo7=LJOcXmCOUS5ovcu6ep_TJQdHrEOoUO5G4PFA__44496.2402268843$1549822528$gmane$org@mail.gmail.com>
References: <20190210074056.11842-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bbxN=QR=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gstcb-0005eI-5x
 for xen-devel@lists.xenproject.org; Sun, 10 Feb 2019 18:14:29 +0000
Received: by mail-lf1-x143.google.com with SMTP id v7so1752851lfd.2
 for <xen-devel@lists.xenproject.org>; Sun, 10 Feb 2019 10:14:26 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id n189sm427997lfn.82.2019.02.10.10.14.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Feb 2019 10:14:23 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id r10-v6so6957560ljj.4
 for <xen-devel@lists.xenproject.org>; Sun, 10 Feb 2019 10:14:22 -0800 (PST)
In-Reply-To: <20190210074056.11842-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Sander Eikelenboom <linux@eikelenboom.it>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Anvin <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBGZWIgOSwgMjAxOSBhdCAxMTo0MSBQTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gTWFrZSBzZXRfcG1kX2F0KCkgcGFyYXZpcnQgYXdhcmUgYnkganVz
dCBsZXR0aW5nIGl0IHVzZSBzZXRfcG1kKCkuCgpXZWxsLCB0aGF0IHdhcyBzaW1wbGVyIHRoYW4g
SSB3b3JyaWVkLgoKSnVzdCBjaGVja2luZzogSXMgdGhpcyBwdXJlbHkgYW4geDg2IGlzc3VlPyBB
Uk0gaXMgb2sgcGVyaGFwcyBiZWNhdXNlCnRoZXJlJ3Mgbm8gUFYgc3VwcG9ydD8KCiAgICAgICAg
ICAgICBMaW51cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
