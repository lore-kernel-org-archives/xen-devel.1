From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH -resend 01/27] linkage: new macros for
 assembler symbols
Date: Mon, 14 May 2018 10:03:05 +0200
Message-ID: <20180514080305.GA6607__21401.7617902302$1526284947$gmane$org@gmail.com>
References: <20180510080644.19752-1-jslaby@suse.cz>
 <20180510080644.19752-2-jslaby@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rr70=ib=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1fI8Rq-0004R8-Ni
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 08:03:10 +0000
Received: by mail-wr0-x241.google.com with SMTP id h5-v6so11220969wrm.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 May 2018 01:03:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180510080644.19752-2-jslaby@suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: linux-arch@vger.kernel.org, Juergen Gross <jgross@suse.com>, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, jpoimboe@redhat.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, mingo@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

CiogSmlyaSBTbGFieSA8anNsYWJ5QHN1c2UuY3o+IHdyb3RlOgoKPiAgRG9jdW1lbnRhdGlvbi9h
c20tYW5ub3RhdGlvbnMucnN0IHwgMjE4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2xpbmthZ2UuaCAgICB8ICAxMCArLQo+ICBpbmNsdWRl
L2xpbnV4L2xpbmthZ2UuaCAgICAgICAgICAgfCAyNTcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0NzUgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2FzbS1hbm5v
dGF0aW9ucy5yc3QKCkNvdWxkIHlvdSBwbGVhc2Ugc3BsaXQgdGhlIGRvY3VtZW50YXRpb24gcGF0
Y2ggZnJvbSB0aGUgaGVhZGVyIGZpbGUgY2hhbmdlcz8KClRoYW5rcywKCglJbmdvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
