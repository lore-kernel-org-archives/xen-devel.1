From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Sun, 15 Jul 2018 13:26:05 +0200
Message-ID: <20180715112605.GA31680@kroah.com>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9enq=j7=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fefAJ-0007Jv-Fy
 for xen-devel@lists.xenproject.org; Sun, 15 Jul 2018 11:26:11 +0000
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
ZXQKPiBkb2Vzbid0IGhhdmUgYWxsIHRoYXQgbXVjaCBub2lzZS4gCgpJJ3ZlIGFwcGxpZWQgdGhl
ICJpbml0aWFsIiBwYXRjaGVzIHRvIHRoZSA0LjQtc3RhYmxlIHF1ZXVlIHJpZ2h0IG5vdywgYXMK
dGhvc2Ugd2VyZSBhbGwganVzdCAiaG91c2VrZWVwaW5nIiBzdHVmZi4gIEknbGwgbGV0IG90aGVy
cyByZXZpZXcgdGhlCnJlc3Qgb2YgdGhlIHNlcmllcyB0aGlzIHdlZWsgYW5kIHNlZSBpZiBhbnlv
bmUgb2JqZWN0cyBiZWZvcmUgdGhyb3dpbmcKdGhlbSBhdCB0aGUgdGVzdC1ib3RzLgoKTWFueSB0
aGFua3MgZm9yIGRvaW5nIGFsbCBvZiB0aGlzIHdvcmsuCgpncmVnIGstaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
