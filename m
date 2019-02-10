From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: make set_pmd_at() paravirt aware
Date: Sun, 10 Feb 2019 19:47:37 +0100
Message-ID: <be740453-81b6-6e4c-f7ae-2c9a43d94607__34649.6093714208$1549824527$gmane$org@suse.com>
References: <20190210074056.11842-1-jgross@suse.com>
 <CAHk-=wj4CYgo7=LJOcXmCOUS5ovcu6ep_TJQdHrEOoUO5G4PFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l340=QR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gsu8o-00087a-QZ
 for xen-devel@lists.xenproject.org; Sun, 10 Feb 2019 18:47:46 +0000
In-Reply-To: <CAHk-=wj4CYgo7=LJOcXmCOUS5ovcu6ep_TJQdHrEOoUO5G4PFA@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: sstabellini@kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Sander Eikelenboom <linux@eikelenboom.it>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Anvin <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDIvMjAxOSAxOToxNCwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4gT24gU2F0LCBGZWIg
OSwgMjAxOSBhdCAxMTo0MSBQTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3Rl
Ogo+Pgo+PiBNYWtlIHNldF9wbWRfYXQoKSBwYXJhdmlydCBhd2FyZSBieSBqdXN0IGxldHRpbmcg
aXQgdXNlIHNldF9wbWQoKS4KPiAKPiBXZWxsLCB0aGF0IHdhcyBzaW1wbGVyIHRoYW4gSSB3b3Jy
aWVkLgo+IAo+IEp1c3QgY2hlY2tpbmc6IElzIHRoaXMgcHVyZWx5IGFuIHg4NiBpc3N1ZT8gQVJN
IGlzIG9rIHBlcmhhcHMgYmVjYXVzZQo+IHRoZXJlJ3Mgbm8gUFYgc3VwcG9ydD8KCkNvcnJlY3Qu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
