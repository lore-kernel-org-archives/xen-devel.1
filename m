From: Borislav Petkov <bp@alien8.de>
Subject: Re: AMD EPYC Topology problems
Date: Sun, 9 Dec 2018 13:56:48 +0100
Message-ID: <20181209125648.GA15262__9271.90826409987$1544360151$gmane$org@zn.tnic>
References: <7369db0c-4917-0807-eef4-cba5e5ae0d4e@citrix.com>
 <20181203111359.GA31670@zn.tnic>
 <9e392fcd-4829-afe4-6f36-73d5cf03ee7c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <9e392fcd-4829-afe4-6f36-73d5cf03ee7c@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Jan Beulich <JBeulich@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xen-devel List <xen-devel@lists.xen.org>, Ingo Molnar <mingo@redhat.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Brijesh Singh <brijeshkumar.singh@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMDMsIDIwMTggYXQgMTE6MjM6NDlBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBSaWdodCwgYnV0IHRoZSBkb2N1bWVudGF0aW9uIGFsc28gc3RhdGVzIHRoYXQgd2hl
cmUgaXQgc2F5cyBwYWNrYWdlLCBpdAo+IG1lYW5zICJOb2RlIiBpbiBBTUQncyB0ZXJtaW5vbG9n
eSwgYW5kIHRoZSBpbmZvcm1hdGlvbiBpbiBDUFVJRCBpcyBwZXIKPiBzb2NrZXQsIG5vdCBwZXIg
bm9kZS4KPiAKPiBNeSBwb2ludCBpcyB0aGF0IHRoZSBudW1iZXJzIGVuZGluZyB1cCBpbiBjcHVp
bmZvX3g4NiBkb24ndCBtYXRjaCB0aGUKPiBzZW1hbnRpY3MgZGVzY3JpYmVkIGJ5IHRoZSBkb2N1
bWVudGF0aW9uLgoKT2ssIEkgdGhpbmsgSSBrbm93IHdoZXJlIHRoZSBpc3N1ZSBzdGVtcyBmcm9t
OgoKCWRlZmluaXRpb24gb2YgInBhY2thZ2UiIGluIHRoZSBBTUQgZG9jcyAhPSBkZWZpbml0aW9u
IG9mICJwYWNrYWdlIiBpbiBEb2N1bWVudGF0aW9uL3g4Ni90b3BvbG9neS50eHQKCkFNRCdzIGlz
ICJQcm9jZXNzb3I6IEEgcGFja2FnZSBjb250YWluaW5nIG9uZSBvciBtb3JlIE5vZGVzLiIgd2hl
cmVhcwpvdXJzIGlzOgoKICAiUGFja2FnZXMgY29udGFpbiBhIG51bWJlciBvZiBjb3JlcyBwbHVz
IHNoYXJlZCByZXNvdXJjZXMsIGUuZy4gRFJBTQogICBjb250cm9sbGVyLCBzaGFyZWQgY2FjaGVz
IGV0Yy4iCgphbmQgcGh5c2ljYWwgc29ja2V0cyB3ZSBkb24ndCBjYXJlIGFib3V0IGJlY2F1c2Ug
dGhleSdyZSBub3QgcmVsZXZhbnQgdG8Kc3cuCgpZZWFoLCBsZW1tZSBkaXNjdXNzIHRoaXMgd2l0
aCB0Z2x4IHRvIHJlZnJlc2ggd2hhdCB3ZSB3ZXJlIHRoaW5raW5nIHRoZW4uIDopCgpTdGF5IHR1
bmVkLgoKLS0gClJlZ2FyZHMvR3J1c3MsCiAgICBCb3Jpcy4KCkdvb2QgbWFpbGluZyBwcmFjdGlj
ZXMgZm9yIDQwMDogYXZvaWQgdG9wLXBvc3RpbmcgYW5kIHRyaW0gdGhlIHJlcGx5LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
