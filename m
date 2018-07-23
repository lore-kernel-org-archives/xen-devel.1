From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Mon, 23 Jul 2018 13:26:24 +0200
Message-ID: <20180723112624.GA29710@kroah.com>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bb7k=kh=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fhYyz-0000oS-FF
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 11:26:29 +0000
Content-Disposition: inline
In-Reply-To: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Dave Hansen <dave@sr71.net>, Wanpeng Li <kernellwp@gmail.com>, ak@linux.intel.com, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, arjan.van.de.ven@intel.com, xen-devel@lists.xenproject.org, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?iso-8859-1?Q?Micka=EBlSala=FCn?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org, dwmw@amazon.co.uk, karahmed@amazon.de, dave.hansen@linux.intel.com, linux@dominikbrodowski.net, Bo Gan <ganb@vmware.com>, Andrey Ryabinin <ryabinin.a.>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdWwgMTQsIDIwMTggYXQgMDI6MjU6NDNBTSAtMDcwMCwgU3JpdmF0c2EgUy4gQmhh
dCB3cm90ZToKPiBIaSBHcmVnLAo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgYmFja3BvcnQg
b2YgdGhlIFNwZWN0cmUtdjIgZml4ZXMgKElCUEIvSUJSUykKPiBhbmQgcGF0Y2hlcyBmb3IgdGhl
IFNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzcyB2dWxuZXJhYmlsaXR5IHRvIDQuNC55Cj4gKHRoZXkg
YXBwbHkgY2xlYW5seSBvbiB0b3Agb2YgNC40LjE0MCkuCj4gCj4gSSB1c2VkIDQuOS55IGFzIG15
IHJlZmVyZW5jZSB3aGVuIGJhY2twb3J0aW5nIHRvIDQuNC55IChhcyBJIHRob3VnaHQKPiB0aGF0
IHdvdWxkIG1pbmltaXplIHRoZSBhbW91bnQgb2YgZml4aW5nIHVwIG5lY2Vzc2FyeSkuIFVuZm9y
dHVuYXRlbHkKPiBJIGhhZCB0byBza2lwIHRoZSBLVk0gZml4ZXMgZm9yIHRoZXNlIHZ1bG5lcmFi
aWxpdGllcywgYXMgdGhlIEtWTQo+IGNvZGViYXNlIGlzIGRyYXN0aWNhbGx5IGRpZmZlcmVudCBp
biA0LjQgYXMgY29tcGFyZWQgdG8gNC45LiAoSSB0cmllZAo+IG15IGJlc3QgdG8gYmFja3BvcnQg
dGhlbSBpbml0aWFsbHksIGJ1dCB3YXNuJ3QgY29uZmlkZW50IHRoYXQgdGhleQo+IHdlcmUgY29y
cmVjdCwgc28gSSBkZWNpZGVkIHRvIGRyb3AgdGhlbSBmcm9tIHRoaXMgc2VyaWVzKS4KPiAKPiBZ
b3UnbGwgbm90aWNlIHRoYXQgdGhlIGluaXRpYWwgZmV3IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMg
aW5jbHVkZQo+IGNsZWFudXBzIGV0Yy4sIHRoYXQgYXJlIG5vbi1jcml0aWNhbCB0byBJQlBCL0lC
UlMvU1NCRC4gTW9zdCBvZiB0aGVzZQo+IHBhdGNoZXMgYXJlIGFpbWVkIGF0IGdldHRpbmcgdGhl
IGNwdWZlYXR1cmUuaCB2cyBjcHVmZWF0dXJlcy5oIHNwbGl0Cj4gaW50byA0LjQsIHNpbmNlIGEg
bG90IG9mIHRoZSBzdWJzZXF1ZW50IHBhdGNoZXMgdXBkYXRlIHRoZXNlIGhlYWRlcnMuCj4gT24g
bXkgZmlyc3QgYXR0ZW1wdCB0byBiYWNrcG9ydCB0aGVzZSBwYXRjaGVzIHRvIDQuNC55LCBJIGhh
ZCBhY3R1YWxseQo+IHRyaWVkIHRvIGRvIGFsbCB0aGUgdXBkYXRlcyBvbiB0aGUgY3B1ZmVhdHVy
ZS5oIGZpbGUgaXRzZWxmLCBidXQgaXQKPiBzdGFydGVkIGdldHRpbmcgdmVyeSBjdW1iZXJzb21l
LCBzbyBJIHJlc29ydGVkIHRvIGJhY2twb3J0aW5nIHRoZQo+IGNwdWZlYXR1cmUuaCB2cyBjcHVm
ZWF0dXJlcy5oIHNwbGl0IGFuZCB0aGVpciBkZXBlbmRlbmNpZXMgYXMgd2VsbC4gSQo+IHRoaW5r
IGFwYXJ0IGZyb20gdGhlc2UgaW5pdGlhbCBwYXRjaGVzLCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hz
ZXQKPiBkb2Vzbid0IGhhdmUgYWxsIHRoYXQgbXVjaCBub2lzZS4gCj4gCj4gVGhpcyBwYXRjaHNl
dCBoYXMgYmVlbiB0ZXN0ZWQgb24gYm90aCBJbnRlbCBhbmQgQU1EIG1hY2hpbmVzIChJbnRlbAo+
IFhlb24gQ1BVIEU1LTI2NjAgdjQgYW5kIEFNRCBFUFlDIDcyODEgMTYtQ29yZSBQcm9jZXNzb3Is
IHJlc3BlY3RpdmVseSkKPiB3aXRoIHVwZGF0ZWQgbWljcm9jb2RlLiBBbGwgdGhlIHBhdGNoIGJh
Y2twb3J0cyBoYXZlIGJlZW4KPiBpbmRlcGVuZGVudGx5IHJldmlld2VkIGJ5IE1hdHQgSGVsc2xl
eSwgQWxleGV5IE1ha2hhbG92IGFuZCBCbyBHYW4uCj4gCj4gSSB3b3VsZCBhcHByZWNpYXRlIGlm
IHlvdSBjb3VsZCBraW5kbHkgY29uc2lkZXIgdGhlc2UgcGF0Y2hlcyBmb3IKPiByZXZpZXcgYW5k
IGluY2x1c2lvbiBpbiBhIGZ1dHVyZSA0LjQueSByZWxlYXNlLgoKR2l2ZW4gbm8gb25lIGhhcyBj
b21wbGFpbmVkIGFib3V0IHRoZXNlIHlldCwgSSd2ZSBxdWV1ZWQgdGhlbSBhbGwgdXAsCmluY2x1
ZGluZyB0aGUgMiBleHRyYSBvbmVzIHlvdSBzZW50IGFmdGVyd2FyZC4KCkxldCdzIHNlZSB3aGF0
IGJyZWFrcyA6KQoKdGhhbmtzLAoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
