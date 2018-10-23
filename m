From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mm: convert totalram_pages,
 totalhigh_pages and managed_pages to atomic.
Date: Mon, 22 Oct 2018 21:15:37 -0700
Message-ID: <c57bcc584b3700c483b0311881ec3ae8786f88b1.camel__45049.4366385557$1540270342$gmane$org@perches.com>
References: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uew9=nd=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1gEo7A-00084b-Cu
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 04:16:20 +0000
In-Reply-To: <1540229092-25207-1-git-send-email-arunks@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>, Guo Ren <ren_guo@c-sky.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter
 Anvin" <hpa@zytor.com>, x86@kernel.org, David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.in>
Cc: getarunks@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE4LTEwLTIyIGF0IDIyOjUzICswNTMwLCBBcnVuIEtTIHdyb3RlOgo+IFJlbW92
ZSBtYW5hZ2VkX3BhZ2VfY291bnRfbG9jayBzcGlubG9jayBhbmQgaW5zdGVhZCB1c2UgYXRvbWlj
Cj4gdmFyaWFibGVzLgoKUGVyaGFwcyBiZXR0ZXIgdG8gZGVmaW5lIGFuZCB1c2UgbWFjcm9zIGZv
ciB0aGUgYWNjZXNzZXMKaW5zdGVhZCBvZiBzcGVjaWZpYyB1c2VzIG9mIGF0b21pY19sb25nXzxp
bmMvZGVjL3JlYWQ+CgpTb21ldGhpbmcgbGlrZToKCiNkZWZpbmUgdG90YWxyYW1fcGFnZXMoKQko
dW5zaWduZWQgbG9uZylhdG9taWNfbG9uZ19yZWFkKCZfdG90YWxyYW1fcGFnZXMpCiNkZWZpbmUg
dG90YWxyYW1fcGFnZXNfaW5jKCkJKHVuc2lnbmVkIGxvbmcpYXRvbWljX2xvbmdfaW5jKCZfdG90
YWxyYW1fcGFnZXMpCiNkZWZpbmUgdG90YWxyYW1fcGFnZXNfZGVjKCkJKHVuc2lnbmVkIGxvbmcp
YXRvbWljX2xvbmdfZGVjKCZfdG90YWxyYW1fcGFnZXMpCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
