From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2] x86/entry/64: Remove %ebx handling from
 error_entry/exit
Date: Wed, 22 Aug 2018 09:19:28 +0200
Message-ID: <20180822071928.GA30415__16311.3643452109$1534922293$gmane$org@kroah.com>
References: <1534479596-7546-1-git-send-email-srn@prgmr.com>
 <CALCETrUs2BYr883a9mMmxuPeTrzbpMfd=V3=guYKn6R5it6ORw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ijtb=lf=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1fsNQT-0005il-NH
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 07:19:34 +0000
Content-Disposition: inline
In-Reply-To: <CALCETrUs2BYr883a9mMmxuPeTrzbpMfd=V3=guYKn6R5it6ORw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, X86 ML <x86@kernel.org>, Brian Gerst <brgerst@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, stable <stable@vger.kernel.org>, Sarah Newman <srn@prgmr.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDY6NDI6NTZQTSAtMDcwMCwgQW5keSBMdXRvbWlyc2tp
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE2LCAyMDE4IGF0IDk6MTkgUE0sIFNhcmFoIE5ld21hbiA8
c3JuQHByZ21yLmNvbT4gd3JvdGU6Cj4gPiBjb21taXQgYjM2ODFkZDU0OGQwNmRlYjJlMTU3Mzg5
MDgyOWRmZjRiMTVhYmY0NiB1cHN0cmVhbS4KPiA+Cj4gPiBUaGlzIHZlcnNpb24gYXBwbGllcyB0
byB2NC45Lgo+IAo+IC4uLgo+IAo+IExvb2tzIG9rYXkgdG8gbWUuCgpUaGFua3MgZm9yIHRoZSBy
ZXZpZXcsIGFuZCBTYXJhaCwgdGhhbmtzIGZvciB0aGUgYmFja3BvcnQuICBOb3cgcXVldWVkCnVw
LgoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
