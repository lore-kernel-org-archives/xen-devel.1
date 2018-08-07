From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Tue, 7 Aug 2018 12:19:12 -0700
Message-ID: <60dbd3d6-4b75-b375-8661-d921d77e0bbd@csail.mit.edu>
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
 <20180807191531.GA28682@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d3mv=kw=csail.mit.edu=srivatsa@srs-us1.protection.inumbo.net>)
 id 1fn7Wg-0000JM-20
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 19:20:14 +0000
In-Reply-To: <20180807191531.GA28682@kroah.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Hansen <dave@sr71.net>, catalin.marinas@arm.com, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?B?TWlja2HDq2xTYWxhw7xu?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>, srinidhir@vmware.com, KarimAllah Ahmed <karahmed@a>
List-Id: xen-devel@lists.xenproject.org

T24gOC83LzE4IDEyOjE1IFBNLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDA3LCAyMDE4
IGF0IDEyOjA4OjA3UE0gLTA3MDAsIFNyaXZhdHNhIFMuIEJoYXQgd3JvdGU6Cj4+IEFsc28sIHVw
c3RyZWFtIGNvbW1pdCBlMDFlODA2MzRlY2RkZTEgKGZvcms6IHVuY29uZGl0aW9uYWxseSBjbGVh
cgo+PiBzdGFjayBvbiBmb3JrKSBhcHBsaWVzIGNsZWFubHkgb24gNC4xNCBzdGFibGUsIHNvIGl0
IHdvdWxkIGJlIGdyZWF0IHRvCj4+IGNoZXJyeS1waWNrIGl0IHRvIDQuMTQgc3RhYmxlIGFzIHdl
bGwuCj4gCj4gSXQgaXMgYWxyZWFkeSBpbiB0aGUgNC4xNC42MCByZWxlYXNlLCBkaWQgSSBzb21l
aG93IG1lc3MgdXAgdGhlCj4gYmFja3BvcnQ/Cj4gCgpTb3JyeSwgbXkgYmFkISBUaGUgYmFja3Bv
cnQgaW4gNC4xNC42MCBsb29rcyBmaW5lLiBUaGFuayB5b3UhCiAKUmVnYXJkcywKU3JpdmF0c2EK
Vk13YXJlIFBob3RvbiBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
