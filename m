From: Kees Cook <keescook@chromium.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Thu, 2 Aug 2018 15:22:01 -0700
Message-ID: <CAGXu5j+Y5TNBY1WCz=4E8B5nFo2jzyswg6iaQja_92GZB+hE0w@mail.gmail.com>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
 <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
 <nycvar.YFH.7.76.1807242351500.997@cbobk.fhfr.pm>
 <CAGXu5jJvTF0KXs+3J32u5v1Ba5gZd0Umgib6D6++ie+LzqnuWA@mail.gmail.com>
 <c616c38b-52cc-2f88-7ea3-00f3a572255a@csail.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i0fr=kr=google.com=keescook@srs-us1.protection.inumbo.net>)
 id 1flLyw-0005x6-3b
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 22:22:06 +0000
Received: by mail-yb0-x241.google.com with SMTP id i9-v6so1940511ybo.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Aug 2018 15:22:03 -0700 (PDT)
In-Reply-To: <c616c38b-52cc-2f88-7ea3-00f3a572255a@csail.mit.edu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Dave Hansen <dave@sr71.net>, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, "Van De Ven,
 Arjan" <arjan.van.de.ven@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?B?TWlja2HDq2xTYWxhw7xu?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>, srinidhir@vmware.com, KarimAllah
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMiwgMjAxOCBhdCAxMjoyMiBQTSwgU3JpdmF0c2EgUy4gQmhhdAo8c3JpdmF0
c2FAY3NhaWwubWl0LmVkdT4gd3JvdGU6Cj4gT24gNy8yNi8xOCA0OjA5IFBNLCBLZWVzIENvb2sg
d3JvdGU6Cj4+IE9uIFR1ZSwgSnVsIDI0LCAyMDE4IGF0IDM6MDIgUE0sIEppcmkgS29zaW5hIDxq
aWtvc0BrZXJuZWwub3JnPiB3cm90ZToKPj4+IE9uIFR1ZSwgMjQgSnVsIDIwMTgsIFNyaXZhdHNh
IFMuIEJoYXQgd3JvdGU6Cj4+Pgo+Pj4+IEhvd2V2ZXIsIGlmIHlvdSBhcmUgcHJvcG9zaW5nIHRo
YXQgeW91J2QgbGlrZSB0byBjb250cmlidXRlIHRoZSBlbmhhbmNlZAo+Pj4+IFBUSS9TcGVjdHJl
ICh1cHN0cmVhbSkgcGF0Y2hlcyBmcm9tIHRoZSBTTEVTIDQuNCB0cmVlIHRvIDQuNCBzdGFibGUs
IGFuZAo+Pj4+IGhhdmUgdGhlbSBtZXJnZWQgaW5zdGVhZCBvZiB0aGlzIHBhdGNoIHNlcmllcywg
dGhlbiBJIHdvdWxkIGNlcnRhaW5seQo+Pj4+IHdlbGNvbWUgaXQhCj4+Pgo+Pj4gSSdkIGluIHBy
aW5jaXBsZSBsb3ZlIHVzIHRvIHB1c2ggZXZlcnl0aGluZyBiYWNrIHRvIDQuNCwgYnV0IHRoZXJl
IGFyZSBhCj4+PiBmZXcgcmVhc29ucyAoKikgd2h5IHRoYXQncyBub3QgaGFwcGVuaW5nIHNob3J0
bHkuCj4+Pgo+Pj4gQW55d2F5LCB0byBwb2ludCBvdXQgZXhwbGljaXRseSB3aGF0J3MgcmVhbGx5
IG5lZWRlZCBmb3IgdGhvc2UgZm9sa3MKPj4+IHJ1bm5pbmcgNC40LXN0YWJsZSBhbmQgcmVseWlu
ZyBvbiBQVEkgcHJvdmlkaW5nIFRoZSBSZWFsIFRoaW5nKFRNKSwgaXQncwo+Pj4gZWl0aGVyIGEg
NC40LXN0YWJsZSBwb3J0IG9mCj4+Pgo+Pj4gICAgICAgICBodHRwOi8va2VybmVsLnN1c2UuY29t
L2NnaXQva2VybmVsLXNvdXJjZS9wbGFpbi9wYXRjaGVzLnN1c2UveDg2LWVudHJ5LTY0LXVzZS1h
LXBlci1jcHUtdHJhbXBvbGluZS1zdGFjay5wYXRjaD9pZD0zNDI4YTc3YjAyYjFiYTAzZTQ1ZDhm
YzM1MmVjMzUwNDI5ZjU3ZmM3Cj4+Pgo+Pj4gb3IgbWFraW5nIFRIUkVBRElORk9fR0ZQIGltcGx5
IF9fR0ZQX1pFUk8uCj4+Cj4+IFRoaXMgaXMgdHJ1ZSBpbiBMaW51cydzIHRyZWUgbm93LiBTaG91
bGQgYmUgdHJpdmlhbCB0byBiYWNrcG9ydDoKPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9saW51
cy9lMDFlODA2MzRlY2RkCj4+Cj4KPiBIaSBKaXJpLCBLZWVzLAo+Cj4gVGhhbmsgeW91IGZvciBz
dWdnZXN0aW5nIHRoZSBwYXRjaCEgSSBoYXZlIGF0dGFjaGVkIHRoZSAobG9jYWxseQo+IHRlc3Rl
ZCkgNC40IGFuZCA0LjkgYmFja3BvcnRzIG9mIHRoYXQgcGF0Y2ggd2l0aCB0aGlzIG1haWwuIChU
aGUKPiBtYWlubGluZSBjb21taXQgYXBwbGllcyBjbGVhbmx5IG9uIDQuMTQpLgo+Cj4gR3JlZywg
Y291bGQgeW91IHBsZWFzZSBjb25zaWRlciBpbmNsdWRpbmcgdGhlbSBpbiBzdGFibGUgNC40LCA0
LjkKPiBhbmQgNC4xND8KCkkgZG9uJ3QgdGhpbmsgeW91ciB2NC45IGlzIHN1ZmZpY2llbnQ6IGl0
IGxlYXZlcyB0aGUgdm1hcHBlZCBzdGFjawp1bmNsZWFyZWQuIHY0LjkgbmVlZHMgY2ExODI1NTE4
NTcgKCJrbWVtbGVhazogY2xlYXIgc3RhbGUgcG9pbnRlcnMKZnJvbSB0YXNrIHN0YWNrcyIpIGlu
Y2x1ZGVkIGluIHRoZSBiYWNrcG9ydCAocmVhbGx5LCBqdXN0IGFkZGluZyB0aGUKbWVtc2V0KCkp
LgoKT3RoZXJ3aXNlLCB5dXAsIGxvb2tzIGdvb2QuCgotS2VlcwoKLS0gCktlZXMgQ29vawpQaXhl
bCBTZWN1cml0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
