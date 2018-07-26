From: Kees Cook <keescook@chromium.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Thu, 26 Jul 2018 16:09:34 -0700
Message-ID: <CAGXu5jJvTF0KXs+3J32u5v1Ba5gZd0Umgib6D6++ie+LzqnuWA@mail.gmail.com>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
 <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
 <nycvar.YFH.7.76.1807242351500.997@cbobk.fhfr.pm>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1/f0=kk=google.com=keescook@srs-us1.protection.inumbo.net>)
 id 1fipO5-0001eg-26
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 23:09:37 +0000
Received: by mail-yb0-x241.google.com with SMTP id c3-v6so1318609ybi.13
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jul 2018 16:09:36 -0700 (PDT)
In-Reply-To: <nycvar.YFH.7.76.1807242351500.997@cbobk.fhfr.pm>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Dave Hansen <dave@sr71.net>, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?B?TWlja2HDq2xTYWxhw7xu?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMzowMiBQTSwgSmlyaSBLb3NpbmEgPGppa29zQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgMjQgSnVsIDIwMTgsIFNyaXZhdHNhIFMuIEJoYXQgd3Jv
dGU6Cj4KPj4gSG93ZXZlciwgaWYgeW91IGFyZSBwcm9wb3NpbmcgdGhhdCB5b3UnZCBsaWtlIHRv
IGNvbnRyaWJ1dGUgdGhlIGVuaGFuY2VkCj4+IFBUSS9TcGVjdHJlICh1cHN0cmVhbSkgcGF0Y2hl
cyBmcm9tIHRoZSBTTEVTIDQuNCB0cmVlIHRvIDQuNCBzdGFibGUsIGFuZAo+PiBoYXZlIHRoZW0g
bWVyZ2VkIGluc3RlYWQgb2YgdGhpcyBwYXRjaCBzZXJpZXMsIHRoZW4gSSB3b3VsZCBjZXJ0YWlu
bHkKPj4gd2VsY29tZSBpdCEKPgo+IEknZCBpbiBwcmluY2lwbGUgbG92ZSB1cyB0byBwdXNoIGV2
ZXJ5dGhpbmcgYmFjayB0byA0LjQsIGJ1dCB0aGVyZSBhcmUgYQo+IGZldyByZWFzb25zICgqKSB3
aHkgdGhhdCdzIG5vdCBoYXBwZW5pbmcgc2hvcnRseS4KPgo+IEFueXdheSwgdG8gcG9pbnQgb3V0
IGV4cGxpY2l0bHkgd2hhdCdzIHJlYWxseSBuZWVkZWQgZm9yIHRob3NlIGZvbGtzCj4gcnVubmlu
ZyA0LjQtc3RhYmxlIGFuZCByZWx5aW5nIG9uIFBUSSBwcm92aWRpbmcgVGhlIFJlYWwgVGhpbmco
VE0pLCBpdCdzCj4gZWl0aGVyIGEgNC40LXN0YWJsZSBwb3J0IG9mCj4KPiAgICAgICAgIGh0dHA6
Ly9rZXJuZWwuc3VzZS5jb20vY2dpdC9rZXJuZWwtc291cmNlL3BsYWluL3BhdGNoZXMuc3VzZS94
ODYtZW50cnktNjQtdXNlLWEtcGVyLWNwdS10cmFtcG9saW5lLXN0YWNrLnBhdGNoP2lkPTM0Mjhh
NzdiMDJiMWJhMDNlNDVkOGZjMzUyZWMzNTA0MjlmNTdmYzcKPgo+IG9yIG1ha2luZyBUSFJFQURJ
TkZPX0dGUCBpbXBseSBfX0dGUF9aRVJPLgoKVGhpcyBpcyB0cnVlIGluIExpbnVzJ3MgdHJlZSBu
b3cuIFNob3VsZCBiZSB0cml2aWFsIHRvIGJhY2twb3J0OgpodHRwczovL2dpdC5rZXJuZWwub3Jn
L2xpbnVzL2UwMWU4MDYzNGVjZGQKCi1LZWVzCgotLSAKS2VlcyBDb29rClBpeGVsIFNlY3VyaXR5
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
