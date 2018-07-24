From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Tue, 24 Jul 2018 13:13:18 -0700
Message-ID: <e57d5ac9-68d7-8ccf-6117-5a2f9d9e1112@csail.mit.edu>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=izex=ki=csail.mit.edu=srivatsa@srs-us1.protection.inumbo.net>)
 id 1fi3hY-0006Nw-8k
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 20:14:32 +0000
In-Reply-To: <nycvar.YFH.7.76.1807232357440.997@cbobk.fhfr.pm>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Dave Hansen <dave@sr71.net>, Wanpeng Li <kernellwp@gmail.com>, Andi Kleen <ak@linux.intel.com>, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, arjan.van.de.ven@intel.com, xen-devel@lists.xenproject.org, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?B?TWlja2HDq2xTYWxhw7xu?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>, KarimAllah Ahmed <karahmed@amazon.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux@
List-Id: xen-devel@lists.xenproject.org

T24gNy8yMy8xOCAzOjA2IFBNLCBKaXJpIEtvc2luYSB3cm90ZToKPiBPbiBTYXQsIDE0IEp1bCAy
MDE4LCBTcml2YXRzYSBTLiBCaGF0IHdyb3RlOgo+IAo+PiBUaGlzIHBhdGNoIHNlcmllcyBpcyBh
IGJhY2twb3J0IG9mIHRoZSBTcGVjdHJlLXYyIGZpeGVzIChJQlBCL0lCUlMpCj4+IGFuZCBwYXRj
aGVzIGZvciB0aGUgU3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNzIHZ1bG5lcmFiaWxpdHkgdG8gNC40
LnkKPj4gKHRoZXkgYXBwbHkgY2xlYW5seSBvbiB0b3Agb2YgNC40LjE0MCkuCj4gCj4gRldJVyAt
LSBub3Qgc3VyZSBob3cgbXVjaCBpbnNwaXJhdGlvbiB5b3UgdG9vayBmcm9tIG91ciBTTEUgNC40
LWJhc2VkIAo+IHRyZWUsIGJ1dCBtb3N0IG9mIHRoZSBzdHVmZiBpcyBhbHJlYWR5IHRoZXJlIGZv
ciBxdWl0ZSBzb21lIHRpbWUgCj4gKGluY2x1ZGluZyB0aGUgbm9uLXVwc3RyZWFtIElCUlMgb24g
a2VybmVsIGJvdW5kYXJ5IG9uIFNLTCssIHRyYW1wb2xpbmUgCj4gc3RhY2sgZm9yIFBUSSAod2hp
Y2ggdGhlIG9yaWdpbmFsIHBvcnQgZGlkbid0IGhhdmUpLCBldGMpLgo+IAo+IFRoZSBJQlJTIFNL
TCsgc3R1ZmYgaGFzIG5vdCBiZWVuIHBpY2tlZCB1cCBieSBHcmVnLCBhcyBpdCdzIG5vbi11cHN0
cmVhbSwgCj4gYW5kIHRoZSB0cmFtcG9saW5lIHN0YWNrIEkgYmVsaWV2ZSB3YXMgcG9pbnRlZCBv
dXQgdG8gc3RhYmxlQCwgYnV0IG5vb25lIAo+IHJlYWxseSBzYXQgZG93biBhbmQgZGlkIHRoZSBw
b3J0IChvdXIgY29kZWJhc2UgaXMgZGlmZmVyZW50IHRoYW4gNC40LnggCj4gc3RhYmxlIGJhc2Up
LCBidXQgaXQgZGVmaW5pdGVseSBzaG91bGQgYmUgZG9uZSBpZiBzb21lb25lIGhhcyB0byBwdXQg
MTAwJSAKPiB0cnVzdCBpbnRvIHRoZSBQVEkgcG9ydCAoZWl0aGVyIHRoYXQsIG9yIGF0IGxlYXN0
IHplcm9pbmcgb3V0IHRoZSBrZXJuZWwgCj4gdGhyZWFkIHRocmVhZCBzdGFjayAuLi4gd2UgdXNl
ZCB0byBoYXZlIHRlbXBvcmFyaWx5IHRoYXQgYmVmb3JlIHdlIAo+IHN3aXRjaGVkIG92ZXIgdG8g
cHJvcGVyIGVudHJ5IHRyYW1wb2xpbmUgaW4gdGhpcyB2ZXJzaW9uIGFzIHdlbGwpLgo+IAoKSSBk
aWQgZ2xhbmNlIGF0IHRoZSBTTEVTIDQuNCBrZXJuZWwgc29tZXRpbWUgYWdvLCBidXQgdGhlcmUg
c2VlbWVkIHRvCmJlIHdheSB0b28gbWFueSBjdXN0b20gcGF0Y2hlcyBhbmQgSSB3YXNuJ3Qgc3Vy
ZSBpbiB3aGF0IHdheXMgeW91cgpQVEkvU3BlY3RyZSBmaXhlcyBkZXBlbmRlZCBvbiB0aGUgb3Ro
ZXIgKHg4NikgcGF0Y2hlcyBpbiB5b3VyIHRyZWUuIFNvCkkgZGVjaWRlZCB0byBiYWNrcG9ydCBl
bnRpcmVseSBmcm9tIHRoZSA0Ljkgc3RhYmxlIHRyZWUgaW5zdGVhZC4gTXkKcmVhc29uaW5nIHdh
cyB0aGF0LCBzaW5jZSB0aGUgNC45IHN0YWJsZSBwYXRjaGVzIHdlcmUgdHJ1c3RlZCB0byB3b3Jr
CndlbGwsIHRoZWlyIDQuNCBiYWNrcG9ydHMgc2hvdWxkIHdvcmsgd2VsbCB0b28sIGFzIGxvbmcg
YXMgdGhleSBhcmUKYmFja3BvcnRlZCBjb3JyZWN0bHkuCiAKSG93ZXZlciwgaWYgeW91IGFyZSBw
cm9wb3NpbmcgdGhhdCB5b3UnZCBsaWtlIHRvIGNvbnRyaWJ1dGUgdGhlCmVuaGFuY2VkIFBUSS9T
cGVjdHJlICh1cHN0cmVhbSkgcGF0Y2hlcyBmcm9tIHRoZSBTTEVTIDQuNCB0cmVlIHRvIDQuNApz
dGFibGUsIGFuZCBoYXZlIHRoZW0gbWVyZ2VkIGluc3RlYWQgb2YgdGhpcyBwYXRjaCBzZXJpZXMs
IHRoZW4gSQp3b3VsZCBjZXJ0YWlubHkgd2VsY29tZSBpdCEKClJlZ2FyZHMsClNyaXZhdHNhClZN
d2FyZSBQaG90b24gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
