From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: AMD EPYC Topology problems
Date: Mon, 10 Dec 2018 22:52:24 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1812102245360.1667__36490.7877672978$1544478693$gmane$org@nanos.tec.linutronix.de>
References: <7369db0c-4917-0807-eef4-cba5e5ae0d4e@citrix.com>
 <20181203111359.GA31670@zn.tnic>
 <9e392fcd-4829-afe4-6f36-73d5cf03ee7c@citrix.com>
 <20181209125648.GA15262@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181209125648.GA15262@zn.tnic>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xen-devel List <xen-devel@lists.xen.org>, Ingo Molnar <mingo@redhat.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Brijesh Singh <brijeshkumar.singh@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCA5IERlYyAyMDE4LCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cgo+IE9uIE1vbiwgRGVj
IDAzLCAyMDE4IGF0IDExOjIzOjQ5QU0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiBS
aWdodCwgYnV0IHRoZSBkb2N1bWVudGF0aW9uIGFsc28gc3RhdGVzIHRoYXQgd2hlcmUgaXQgc2F5
cyBwYWNrYWdlLCBpdAo+ID4gbWVhbnMgIk5vZGUiIGluIEFNRCdzIHRlcm1pbm9sb2d5LCBhbmQg
dGhlIGluZm9ybWF0aW9uIGluIENQVUlEIGlzIHBlcgo+ID4gc29ja2V0LCBub3QgcGVyIG5vZGUu
Cj4gPiAKPiA+IE15IHBvaW50IGlzIHRoYXQgdGhlIG51bWJlcnMgZW5kaW5nIHVwIGluIGNwdWlu
Zm9feDg2IGRvbid0IG1hdGNoIHRoZQo+ID4gc2VtYW50aWNzIGRlc2NyaWJlZCBieSB0aGUgZG9j
dW1lbnRhdGlvbi4KPiAKPiBPaywgSSB0aGluayBJIGtub3cgd2hlcmUgdGhlIGlzc3VlIHN0ZW1z
IGZyb206Cj4gCj4gCWRlZmluaXRpb24gb2YgInBhY2thZ2UiIGluIHRoZSBBTUQgZG9jcyAhPSBk
ZWZpbml0aW9uIG9mICJwYWNrYWdlIiBpbiBEb2N1bWVudGF0aW9uL3g4Ni90b3BvbG9neS50eHQK
PiAKPiBBTUQncyBpcyAiUHJvY2Vzc29yOiBBIHBhY2thZ2UgY29udGFpbmluZyBvbmUgb3IgbW9y
ZSBOb2Rlcy4iIHdoZXJlYXMKPiBvdXJzIGlzOgo+IAo+ICAgIlBhY2thZ2VzIGNvbnRhaW4gYSBu
dW1iZXIgb2YgY29yZXMgcGx1cyBzaGFyZWQgcmVzb3VyY2VzLCBlLmcuIERSQU0KPiAgICBjb250
cm9sbGVyLCBzaGFyZWQgY2FjaGVzIGV0Yy4iCj4gCj4gYW5kIHBoeXNpY2FsIHNvY2tldHMgd2Ug
ZG9uJ3QgY2FyZSBhYm91dCBiZWNhdXNlIHRoZXkncmUgbm90IHJlbGV2YW50IHRvCj4gc3cuCgpS
aWdodC4gUGh5c2ljYWwgc29ja2V0cyBhcmUgbm90IGludGVyZXN0aW5nIGF0IGFsbC4KCj4gWWVh
aCwgbGVtbWUgZGlzY3VzcyB0aGlzIHdpdGggdGdseCB0byByZWZyZXNoIHdoYXQgd2Ugd2VyZSB0
aGlua2luZyB0aGVuLiA6KQoKV2hhdCBJbnRlbCBjYWxscyBwYWNrYWdlIGlzIGNhbGxlZCBOb2Rl
IG9uIEFNRC4gWWVzLCBpdCdzIGEgbWVzcywgYnV0IHdlCmNhbid0IGRvIG11Y2ggYWJvdXQgaXQg
YW5kIGFzIGxvdHMgb2YgZXhpc3RpbmcgY29kZSBhbHJlYWR5IHVzZWQgJ3BhY2thZ2UnCmZvciBi
b3RoIEludGVsIGFuZCBBTUQsIHRoZXJlIHdhcyBubyBwb2ludCB0byBpbnZlbnQgeWV0IGFub3Ro
ZXIgbmFtZSBmb3IKaXQuIE1heWJlIHdlIHNob3VsZCBoYXZlLi4uCgpUaGFua3MsCgoJdGdseAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
