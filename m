From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Tue, 15 Jan 2019 17:24:45 +0100
Message-ID: <20190115162445.6bvfzknniq6dp3uk@mac>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <20181128152209.hqpgqtuy2mx7ytk6@mac>
 <20181129044325.GD23701@gao-cwp>
 <20181129095653.d2jwozb7xbuq6cq2@mac>
 <20181130090131.GC32365@gao-cwp>
 <3b12744b-ab92-3c77-319d-6b468006a7b5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2vyh=PX=citrix.com=prvs=911eac428=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gjRWO-0003pB-7r
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 16:25:00 +0000
Content-Disposition: inline
In-Reply-To: <3b12744b-ab92-3c77-319d-6b468006a7b5@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org, Ashok Raj <ashok.raj@intel.com>, Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMDM6MjQ6MzFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMC8xMS8yMDE4IDA5OjAxLCBDaGFvIEdhbyB3cm90ZToKPiA+IE9uIFRodSwg
Tm92IDI5LCAyMDE4IGF0IDEwOjU2OjUzQU0gKzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPj4gT24gVGh1LCBOb3YgMjksIDIwMTggYXQgMTI6NDM6MjVQTSArMDgwMCwgQ2hhbyBHYW8g
d3JvdGU6Cj4gPj4+IE9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDA0OjIyOjA5UE0gKzAxMDAsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+PiBPbiBXZWQsIE5vdiAyOCwgMjAxOCBhdCAwMToz
NDoxNlBNICswODAwLCBDaGFvIEdhbyB3cm90ZToKPiA+Pj4+PiBUaGlzIHBhdGNoIHBvcnRzIG1p
Y3JvY29kZSBpbXByb3ZlbWVudCBwYXRjaGVzIGZyb20gbGludXgga2VybmVsLgo+ID4+Pj4+Cj4g
Pj4+Pj4gQmVmb3JlIHlvdSByZWFkIGFueSBmdXJ0aGVyOiB0aGUgZWFybHkgbG9hZGluZyBtZXRo
b2QgaXMgc3RpbGwgdGhlCj4gPj4+Pj4gcHJlZmVycmVkIG9uZSBhbmQgeW91IHNob3VsZCBhbHdh
eXMgZG8gdGhhdC4gVGhlIGZvbGxvd2luZyBwYXRjaCBpcwo+ID4+Pj4+IGltcHJvdmluZyB0aGUg
bGF0ZSBsb2FkaW5nIG1lY2hhbmlzbSBmb3IgbG9uZyBydW5uaW5nIGpvYnMgYW5kIGNsb3VkIHVz
ZQo+ID4+Pj4+IGNhc2VzLgo+ID4+Pj4+Cj4gPj4+Pj4gR2F0aGVyIGFsbCBjb3JlcyBhbmQgc2Vy
aWFsaXplIHRoZSBtaWNyb2NvZGUgdXBkYXRlIG9uIHRoZW0gYnkgZG9pbmcgaXQKPiA+Pj4+PiBv
bmUtYnktb25lIHRvIG1ha2UgdGhlIGxhdGUgdXBkYXRlIHByb2Nlc3MgYXMgcmVsaWFibGUgYXMg
cG9zc2libGUgYW5kCj4gPj4+Pj4gYXZvaWQgcG90ZW50aWFsIGlzc3VlcyBjYXVzZWQgYnkgdGhl
IG1pY3JvY29kZSB1cGRhdGUuCj4gPj4+Pj4KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdh
byA8Y2hhby5nYW9AaW50ZWwuY29tPgo+ID4+Pj4+IFRlc3RlZC1ieTogQ2hhbyBHYW8gPGNoYW8u
Z2FvQGludGVsLmNvbT4KPiA+Pj4+PiBbbGludXggY29tbWl0OiBhNTMyMWFlYzY0MTJiMjBiNWFk
MTVkYjJkNmI5MTZjMDUzNDlkYmZmXQo+ID4+Pj4+IFtsaW51eCBjb21taXQ6IGJiOGMxM2Q2MWE2
MjkyNzZhMTYyYzFkMmIxYTIwYTgxNWNiY2ZiYjddCj4gPj4+PiBJZiB0aGlzIHBhdGNoIGlzIHRo
ZSBzcXVhc2ggb2YgdHdvIExpbnV4IGNvbW1pdHMsIHBsZWFzZSBwb3N0IHRoZQo+ID4+Pj4gcG9y
dGVkIHZlcnNpb25zIG9mIHRoZSB0d28gY29tbWl0cyBzZXBhcmF0ZWx5Lgo+ID4+PiBJIGRvbid0
IHVuZGVyc3RhbmQgdGhpcyBvbmUuCj4gPj4gWW91IHJlZmVyZW5jZSB0d28gTGludXggY29tbWl0
cyBhYm92ZSwgd2h5IGlzIHRoaXMgZG9uZT8KPiA+Pgo+ID4+IEkgYXNzdW1lIHRoaXMgaXMgYmVj
YXVzZSB5b3UgYXJlIHBvcnRpbmcgdHdvIExpbnV4IGNvbW1pdHMgdG8gWGVuLCBpbgo+ID4+IHdo
aWNoIGNhc2UgSSB0aGluayB0aGF0IHNob3VsZCBiZSBkb25lIGluIHR3byBkaWZmZXJlbnQgcGF0
Y2hlcywgb3IgYQo+ID4+IG5vdGUgbmVlZHMgdG8gYmUgYWRkZWQgdG8gd2h5IHlvdSBtZXJnZSB0
d28gTGludXggY29tbWl0cyBpbnRvIGEKPiA+PiBzaW5nbGUgWGVuIHBhdGNoLgo+ID4gVGhlIGxh
dHRlciBmaXhlZCBhIHNldmVyZSBidWcgaW50cm9kdWNlZCB0aGUgZmlyc3Qgb25lLiBNYXliZSBJ
IG5lZWQKPiA+IHRvIGFkZCBhIG5vdGUgdG8gY2xhcmlmeSB0aGlzLgo+IAo+IFRoYXQgaXMgZmlu
ZS7CoCBHaXZlbiB0aGF0IHRoZXJlIGlzIGEgbGFyZ2UgZGl2ZXJnZW5jZSBiZXR3ZWVuIHRoZSBM
aW51eAo+IGFuZCBYZW4gY29kZSwgSSB3b3VsZCByZWNvbW1lbmQgbm90IHRyeWluZyB0byBwb3J0
IHRoZSBMaW51eCBjaGFuZ2VzCj4gcGF0Y2ggZm9yIHBhdGNoLgo+IAo+IFRoaXMgcGF0Y2ggaXMg
ZmluZSBpbiB0aGlzIGZvcm0sIElNTy4KClNvcnJ5LCBzb21laG93IHRoaXMgc2xpcHBlZCB0aHJv
dWdoIHRoZSBjcmFja3MgYW5kIEkgZGlkbid0IHJlcGx5LiBJCmFncmVlIGl0J3MgZmluZSBhcyBh
IHNpbmdsZSBjb21taXQgc2luY2UgaXQgZG9lc24ndCBtYWtlIGFueSBzZW5zZSB0bwpjb21taXQg
c29tZXRoaW5nIHdpdGggYSBrbm93IGJ1ZyB0aGF0J3MgZml4ZWQgYnkgdGhlIG5leHQgY29tbWl0
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
