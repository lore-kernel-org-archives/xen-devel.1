From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Tue, 7 Aug 2018 21:15:31 +0200
Message-ID: <20180807191531.GA28682@kroah.com>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
 <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
 <nycvar.YFH.7.76.1807242351500.997@cbobk.fhfr.pm>
 <CAGXu5jJvTF0KXs+3J32u5v1Ba5gZd0Umgib6D6++ie+LzqnuWA@mail.gmail.com>
 <c616c38b-52cc-2f88-7ea3-00f3a572255a@csail.mit.edu>
 <CAGXu5j+Y5TNBY1WCz=4E8B5nFo2jzyswg6iaQja_92GZB+hE0w@mail.gmail.com>
 <8a87a705-97c0-eb3d-8878-8ffe052f065d@csail.mit.edu>
 <20180807134934.GA16837@kroah.com>
 <824c77d3-93d8-fb90-6eb0-afa4aeef6644@csail.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kyc7=kw=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fn7SD-0007zR-7L
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 19:15:37 +0000
Content-Disposition: inline
In-Reply-To: <824c77d3-93d8-fb90-6eb0-afa4aeef6644@csail.mit.edu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Dave Hansen <dave@sr71.net>, catalin.marinas@arm.com, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?iso-8859-1?Q?Micka=EBlSala=FCn?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>, srinidhir@vmware.com, KarimAllah Ahmed <karahmed>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMTI6MDg6MDdQTSAtMDcwMCwgU3JpdmF0c2EgUy4gQmhh
dCB3cm90ZToKPiBBbHNvLCB1cHN0cmVhbSBjb21taXQgZTAxZTgwNjM0ZWNkZGUxIChmb3JrOiB1
bmNvbmRpdGlvbmFsbHkgY2xlYXIKPiBzdGFjayBvbiBmb3JrKSBhcHBsaWVzIGNsZWFubHkgb24g
NC4xNCBzdGFibGUsIHNvIGl0IHdvdWxkIGJlIGdyZWF0IHRvCj4gY2hlcnJ5LXBpY2sgaXQgdG8g
NC4xNCBzdGFibGUgYXMgd2VsbC4KCkl0IGlzIGFscmVhZHkgaW4gdGhlIDQuMTQuNjAgcmVsZWFz
ZSwgZGlkIEkgc29tZWhvdyBtZXNzIHVwIHRoZQpiYWNrcG9ydD8KCnRoYW5rcywKCmdyZWcgay1o
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
