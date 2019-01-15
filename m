From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Tue, 15 Jan 2019 15:24:31 +0000
Message-ID: <3b12744b-ab92-3c77-319d-6b468006a7b5@citrix.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <20181128152209.hqpgqtuy2mx7ytk6@mac> <20181129044325.GD23701@gao-cwp>
 <20181129095653.d2jwozb7xbuq6cq2@mac> <20181130090131.GC32365@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3OYV=PX=citrix.com=prvs=91139fb13=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gjQbe-0005dP-E0
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 15:26:22 +0000
In-Reply-To: <20181130090131.GC32365@gao-cwp>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>, Ashok Raj <ashok.raj@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMTEvMjAxOCAwOTowMSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVGh1LCBOb3YgMjksIDIw
MTggYXQgMTA6NTY6NTNBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVGh1
LCBOb3YgMjksIDIwMTggYXQgMTI6NDM6MjVQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4+PiBP
biBXZWQsIE5vdiAyOCwgMjAxOCBhdCAwNDoyMjowOVBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pj4+IE9uIFdlZCwgTm92IDI4LCAyMDE4IGF0IDAxOjM0OjE2UE0gKzA4MDAsIENo
YW8gR2FvIHdyb3RlOgo+Pj4+PiBUaGlzIHBhdGNoIHBvcnRzIG1pY3JvY29kZSBpbXByb3ZlbWVu
dCBwYXRjaGVzIGZyb20gbGludXgga2VybmVsLgo+Pj4+Pgo+Pj4+PiBCZWZvcmUgeW91IHJlYWQg
YW55IGZ1cnRoZXI6IHRoZSBlYXJseSBsb2FkaW5nIG1ldGhvZCBpcyBzdGlsbCB0aGUKPj4+Pj4g
cHJlZmVycmVkIG9uZSBhbmQgeW91IHNob3VsZCBhbHdheXMgZG8gdGhhdC4gVGhlIGZvbGxvd2lu
ZyBwYXRjaCBpcwo+Pj4+PiBpbXByb3ZpbmcgdGhlIGxhdGUgbG9hZGluZyBtZWNoYW5pc20gZm9y
IGxvbmcgcnVubmluZyBqb2JzIGFuZCBjbG91ZCB1c2UKPj4+Pj4gY2FzZXMuCj4+Pj4+Cj4+Pj4+
IEdhdGhlciBhbGwgY29yZXMgYW5kIHNlcmlhbGl6ZSB0aGUgbWljcm9jb2RlIHVwZGF0ZSBvbiB0
aGVtIGJ5IGRvaW5nIGl0Cj4+Pj4+IG9uZS1ieS1vbmUgdG8gbWFrZSB0aGUgbGF0ZSB1cGRhdGUg
cHJvY2VzcyBhcyByZWxpYWJsZSBhcyBwb3NzaWJsZSBhbmQKPj4+Pj4gYXZvaWQgcG90ZW50aWFs
IGlzc3VlcyBjYXVzZWQgYnkgdGhlIG1pY3JvY29kZSB1cGRhdGUuCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+Pj4+IFRlc3RlZC1ieTog
Q2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPj4+Pj4gW2xpbnV4IGNvbW1pdDogYTUzMjFh
ZWM2NDEyYjIwYjVhZDE1ZGIyZDZiOTE2YzA1MzQ5ZGJmZl0KPj4+Pj4gW2xpbnV4IGNvbW1pdDog
YmI4YzEzZDYxYTYyOTI3NmExNjJjMWQyYjFhMjBhODE1Y2JjZmJiN10KPj4+PiBJZiB0aGlzIHBh
dGNoIGlzIHRoZSBzcXVhc2ggb2YgdHdvIExpbnV4IGNvbW1pdHMsIHBsZWFzZSBwb3N0IHRoZQo+
Pj4+IHBvcnRlZCB2ZXJzaW9ucyBvZiB0aGUgdHdvIGNvbW1pdHMgc2VwYXJhdGVseS4KPj4+IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIG9uZS4KPj4gWW91IHJlZmVyZW5jZSB0d28gTGludXggY29t
bWl0cyBhYm92ZSwgd2h5IGlzIHRoaXMgZG9uZT8KPj4KPj4gSSBhc3N1bWUgdGhpcyBpcyBiZWNh
dXNlIHlvdSBhcmUgcG9ydGluZyB0d28gTGludXggY29tbWl0cyB0byBYZW4sIGluCj4+IHdoaWNo
IGNhc2UgSSB0aGluayB0aGF0IHNob3VsZCBiZSBkb25lIGluIHR3byBkaWZmZXJlbnQgcGF0Y2hl
cywgb3IgYQo+PiBub3RlIG5lZWRzIHRvIGJlIGFkZGVkIHRvIHdoeSB5b3UgbWVyZ2UgdHdvIExp
bnV4IGNvbW1pdHMgaW50byBhCj4+IHNpbmdsZSBYZW4gcGF0Y2guCj4gVGhlIGxhdHRlciBmaXhl
ZCBhIHNldmVyZSBidWcgaW50cm9kdWNlZCB0aGUgZmlyc3Qgb25lLiBNYXliZSBJIG5lZWQKPiB0
byBhZGQgYSBub3RlIHRvIGNsYXJpZnkgdGhpcy4KClRoYXQgaXMgZmluZS7CoCBHaXZlbiB0aGF0
IHRoZXJlIGlzIGEgbGFyZ2UgZGl2ZXJnZW5jZSBiZXR3ZWVuIHRoZSBMaW51eAphbmQgWGVuIGNv
ZGUsIEkgd291bGQgcmVjb21tZW5kIG5vdCB0cnlpbmcgdG8gcG9ydCB0aGUgTGludXggY2hhbmdl
cwpwYXRjaCBmb3IgcGF0Y2guCgpUaGlzIHBhdGNoIGlzIGZpbmUgaW4gdGhpcyBmb3JtLCBJTU8u
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
