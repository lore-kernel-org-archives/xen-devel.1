From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 1 Oct 2018 17:01:47 +0100
Message-ID: <20181001160147.jiwwalvr4ykqta2p@zion.uk.xensource.com>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <20180626191113.2d8e6876.olaf@aepfle.de>
 <20180801181747.170405d8.olaf@aepfle.de>
 <20180913093913.328a523a.olaf@aepfle.de>
 <20180928155052.5d7f66db.olaf@aepfle.de>
 <23473.64592.699718.316856@mariner.uk.xensource.com>
 <5BB2044402000078001ED2E9@prv1-mh.provo.novell.com>
 <f9dc52a3-8f75-d652-ed78-731930017276@citrix.com>
 <5BB2287702000078001ED4A3@prv1-mh.provo.novell.com>
 <83edf05c-8fcd-e9e2-1076-cc70d206ffb2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <83edf05c-8fcd-e9e2-1076-cc70d206ffb2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMDEsIDIwMTggYXQgMDM6MjU6MzZQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAxMC8wMS8yMDE4IDAzOjAwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+
IE9uIDAxLjEwLjE4IGF0IDE1OjM4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToK
PiA+PiBPbiAxMC8wMS8yMDE4IDEyOjI1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gSSB0
aGluayB0aGUgbWFpbiBjb25jZXJuCj4gPj4+IHdhcyB3aXRoIHRoZSB3YXkgbWlncmF0aW9uIG9m
IHRoZSBuZXcgdmFsdWUgd2FzIGltcGxlbWVudGVkLiBCdXQgSQo+ID4+PiByZWFsbHkgaGF2ZSB0
byBkZWZlciB0byBBbmRyZXcgZm9yIHRoYXQsIGlycmVzcGVjdGl2ZSBvZiBoaW0gbm90Cj4gPj4+
IGhhdmluZyByZXNwb25kZWQgKG9uIHRoZSBsaXN0KSB0byBwcmlvciBwaW5ncy4KPiA+Pgo+ID4+
IElzIEFuZHJldyByZWFsbHkgdGhlIG9ubHkgcGVyc29uIHdobyBrbm93cyBlbm91Z2ggYWJvdXQg
bWlncmF0aW9uIHRvCj4gPj4gZ2l2ZSB0aGlzIHRoZSB0aHVtYnMtdXA/Cj4gPiAKPiA+IFRoYXQn
cyBub3QgdGhlIHBvaW50IGhlcmUsIGF0IGxlYXN0IGFmYWljOiBIZSBoYWQgdm9pY2VkIF9zb21l
Xwo+ID4gY29uY2VybiBvbiBhbiBlYXJsaWVyIHZlcnNpb24uIEluIHN1Y2ggYSBjYXNlIGl0IGlz
LCBJIHRoaW5rLCBvbmx5Cj4gPiBhcHByb3ByaWF0ZSB0byB3YWl0IHdpdGggY29tbWl0dGluZyB1
bnRpbCB0aGVyZSB3YXMgaW5kaWNhdGlvbgo+ID4gdGhhdCB0aGUgY29uY2VybnMgd2VyZSBzdWZm
aWNpZW50bHkgYWRkcmVzc2VkICh2ZXJiYWxseSBvciBieQo+ID4gYWRqdXN0bWVudHMgdG8gdGhl
IGNvZGUpLgo+IAo+IFJpZ2h0IC0tIGJ1dCBpdCdzIG5vdCB5b3VyIGpvYiB0byBtYWtlIHN1cmUg
dGhlIG1pZ3JhdGlvbiBzdHVmZiBpcwo+IHByb3Blcmx5IGFkZHJlc3NlZDsgaXQncyBXZWkgYW5k
IElhbidzIGpvYi4gIFdlaSdzIFItYiB3YXMgYSBzdGF0ZW1lbnQKPiBmcm9tIGhpbSB0aGF0IHRo
ZSBjb2RlIHdhcyBnb29kOyB3aGVuIEFuZHkgcXVlc3Rpb25lZCB0aGF0LCBJIHRoaW5rIGl0Cj4g
d2FzIHRoZW4gKldlaSdzKiBqb2IgdG8gYWRkcmVzcyB0aGUgcXVlc3Rpb24sIG5vdCB5b3VycyBv
ciBBbmR5J3MgKG9yCj4gZXZlbiBPbGFmJ3MpLiAgSWYgV2VpIHNheXMsICJJJ3ZlIGNvbnNpZGVy
ZWQgQW5keSdzIG9iamVjdGlvbnMgYW5kIEkKPiB0aGluayB0aGUgcGF0Y2ggaXMgZmluZSBhcy1p
cyIsIHRoZW4gaXQgY2FuIGJlIGNoZWNrZWQgaW4gKGdpdmVuIGEKPiByZWFzb25hYmxlIGFtb3Vu
dCBvZiB0aW1lIGZvciBBbmR5IHRvIHJlc3BvbmQpOyBhbmQgV2VpIGNhbiBvd24gd2hhdGV2ZXIK
PiBjb25zZXF1ZW5jZXMgdGhlcmUgYXJlLgoKVGhpcyBwYXRjaCB0b3VjaGVkIG1vcmUgdGhhbiB0
b29sc3RhY2sgY29kZSwgdGhhdCdzIHdoeSBKYW4gZ2F2ZSBoaXMgUi1iCmluIHRoZSBmaXJzdCBw
bGFjZS4KClRoZSBjb250ZW50aW9uIGlzIG5vdCBvbiB0aGUgY29ycmVjdG5lc3Mgb2YgdGhlIGNv
ZGUsIGJ1dCBvbiBpZiB0aGlzCm1lY2hhbmlzbSBoYWQgdW5pbnRlbmRlZCBjb25zZXF1ZW5jZXMu
IEJvdGggSmFuIGFuZCBJIHRob3VnaHQgdGhlIGNvZGUKd2FzIGNvcnJlY3QsIGJ1dCB3ZSBkaWRu
J3QgZmVlbCBjb21mb3J0YWJsZSBlbm91Z2ggdG8gaWdub3JlIG9iamVjdGlvbnMuCgpTb3JyeSBP
bGFmLgoKV2VpLgoKPiAKPiAgLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
