From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 1/4] asm-x86/monitor: Enable svm monitor
	events
Date: Fri, 9 Feb 2018 09:21:01 -0700
Message-ID: <CABfawhnHHHxrRdfo8atm+1HFnbAxzhuY=ZgO5iAaAN4aHh=atQ@mail.gmail.com>
References: <1518103552-4836-1-git-send-email-aisaila@bitdefender.com>
 <1518103552-4836-2-git-send-email-aisaila@bitdefender.com>
 <CAFLBxZbB65ALGcu1mZ2ajwZ3yXEcMf8hhKf3mwSVN0h_kesQQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZbB65ALGcu1mZ2ajwZ3yXEcMf8hhKf3mwSVN0h_kesQQw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgOSwgMjAxOCBhdCAzOjI4IEFNLCBHZW9yZ2UgRHVubGFwIDxkdW5sYXBnQHVt
aWNoLmVkdT4gd3JvdGU6Cj4gT24gVGh1LCBGZWIgOCwgMjAxOCBhdCAzOjI1IFBNLCBBbGV4YW5k
cnUgSXNhaWxhCj4gPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gVGhpcyBjb21t
aXQgc2VwYXJhdGVzIHRoZSBzdm0gY2FwcyBmcm9tIHRoZSB2bXggY2Fwcy4KPgo+IEkgY2FuIHNl
ZSBob3cgdGhlIHBhdGNoIHJlbGF0ZXMgdG8gdGhlIGRlc2NyaXB0aW9uIGhlcmUsIGJ1dCBpdCdz
IG5vdAo+IGltbWVkaWF0ZWx5IGNsZWFyIGhvdyBpdCByZWxhdGVzIHRvIHRoZSB0aXRsZS4KPgo+
IEEgZ29vZCAidGVtcGxhdGUiIHRvIHN0YXJ0IHdpdGggZm9yIGFueSBjb21taXQgbWVzc2FnZSBp
czoKPiAxLiBXaGF0IHRoZSBjdXJyZW50IHNpdHVhdGlvbiBpcwo+IDIuIFdoeSB0aGF0J3MgYSBw
cm9ibGVtCj4gMy4gSG93IHRoaXMgcGF0Y2ggZml4ZXMgaXQKPgo+IFRoZSBvbmx5IHRpbWUgeW91
IHNob3VsZCBvbWl0IGFueSBvZiB0aGVzZSBpcyBpZiBpdCdzIGNvbXBsZXRlbHkgb2J2aW91cy4K
Pgo+IEluIHRoaXMgY2FzZSwgaXQgbG9va3MgbGlrZSB0aGUgYW5zd2VycyB3b3VsZCBsb29rIGxp
a2U6Cj4KPiAxLiBPbmx5IGEgc3Vic2V0IG9mIHRoZSBtb25pdG9yIGZlYXR1cmVzIGFyZSBhdmFp
bGFibGUgb24gQU1ELCBidXQgYWxsCj4gY2FwYWJpbGl0aWVzIGFyZSBwYXNzZWQgcmVnYXJkbGVz
cyBvZiB0aGUgcHJvY2Vzc29yIGFyY2hpdGVjdHVyZS4KPgo+IDIuIFRoaXMgbWVhbnMgdGhhdCB0
aGUgbWFqb3JpdHkgb2YgZnVuY3Rpb25hbGl0eSBhZHZlcnRpemVkIGluCj4gJ2NhcGFiaWxpdGll
cycgaXMgYWN0dWFsbHkgYnJva2VuIHdoZW4gcnVubmluZyB1bmRlciBBTUQuCgpJdCBpcyBub3Qg
YnJva2VuIHVuZGVyIEFNRC4gV2hhdCBpcyBiZWluZyByZXBvcnRlZCB0aGVyZSBpcyB0aGF0IGl0
IGlzCm5vIG1vbml0b3Igb3B0aW9uIGlzIHN1cHBvcnRlZCAtIGllLiBjYXBhYmlsaXRpZXMgPSAw
LiBUaGUgd2hvbGUgdGhpbmcKaXMgZ2F0ZWQgb24gY3B1X2hhc192bXguCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
