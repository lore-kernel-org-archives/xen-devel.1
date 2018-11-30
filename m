From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Fri, 30 Nov 2018 17:01:31 +0800
Message-ID: <20181130090131.GC32365@gao-cwp>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <20181128152209.hqpgqtuy2mx7ytk6@mac>
 <20181129044325.GD23701@gao-cwp>
 <20181129095653.d2jwozb7xbuq6cq2@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XPNG=OJ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1gSedU-0000vr-N0
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 08:58:56 +0000
Content-Disposition: inline
In-Reply-To: <20181129095653.d2jwozb7xbuq6cq2@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>, Ashok Raj <ashok.raj@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMTA6NTY6NTNBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIFRodSwgTm92IDI5LCAyMDE4IGF0IDEyOjQzOjI1UE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBPbiBXZWQsIE5vdiAyOCwgMjAxOCBhdCAwNDoyMjowOVBNICswMTAwLCBS
b2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiA+T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDE6MzQ6
MTZQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4+ID4+IFRoaXMgcGF0Y2ggcG9ydHMgbWljcm9j
b2RlIGltcHJvdmVtZW50IHBhdGNoZXMgZnJvbSBsaW51eCBrZXJuZWwuCj4+ID4+IAo+PiA+PiBC
ZWZvcmUgeW91IHJlYWQgYW55IGZ1cnRoZXI6IHRoZSBlYXJseSBsb2FkaW5nIG1ldGhvZCBpcyBz
dGlsbCB0aGUKPj4gPj4gcHJlZmVycmVkIG9uZSBhbmQgeW91IHNob3VsZCBhbHdheXMgZG8gdGhh
dC4gVGhlIGZvbGxvd2luZyBwYXRjaCBpcwo+PiA+PiBpbXByb3ZpbmcgdGhlIGxhdGUgbG9hZGlu
ZyBtZWNoYW5pc20gZm9yIGxvbmcgcnVubmluZyBqb2JzIGFuZCBjbG91ZCB1c2UKPj4gPj4gY2Fz
ZXMuCj4+ID4+IAo+PiA+PiBHYXRoZXIgYWxsIGNvcmVzIGFuZCBzZXJpYWxpemUgdGhlIG1pY3Jv
Y29kZSB1cGRhdGUgb24gdGhlbSBieSBkb2luZyBpdAo+PiA+PiBvbmUtYnktb25lIHRvIG1ha2Ug
dGhlIGxhdGUgdXBkYXRlIHByb2Nlc3MgYXMgcmVsaWFibGUgYXMgcG9zc2libGUgYW5kCj4+ID4+
IGF2b2lkIHBvdGVudGlhbCBpc3N1ZXMgY2F1c2VkIGJ5IHRoZSBtaWNyb2NvZGUgdXBkYXRlLgo+
PiA+PiAKPj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4K
Pj4gPj4gVGVzdGVkLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+PiA+PiBbbGlu
dXggY29tbWl0OiBhNTMyMWFlYzY0MTJiMjBiNWFkMTVkYjJkNmI5MTZjMDUzNDlkYmZmXQo+PiA+
PiBbbGludXggY29tbWl0OiBiYjhjMTNkNjFhNjI5Mjc2YTE2MmMxZDJiMWEyMGE4MTVjYmNmYmI3
XQo+PiA+Cj4+ID5JZiB0aGlzIHBhdGNoIGlzIHRoZSBzcXVhc2ggb2YgdHdvIExpbnV4IGNvbW1p
dHMsIHBsZWFzZSBwb3N0IHRoZQo+PiA+cG9ydGVkIHZlcnNpb25zIG9mIHRoZSB0d28gY29tbWl0
cyBzZXBhcmF0ZWx5Lgo+PiAKPj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgb25lLgo+Cj5Zb3Ug
cmVmZXJlbmNlIHR3byBMaW51eCBjb21taXRzIGFib3ZlLCB3aHkgaXMgdGhpcyBkb25lPwo+Cj5J
IGFzc3VtZSB0aGlzIGlzIGJlY2F1c2UgeW91IGFyZSBwb3J0aW5nIHR3byBMaW51eCBjb21taXRz
IHRvIFhlbiwgaW4KPndoaWNoIGNhc2UgSSB0aGluayB0aGF0IHNob3VsZCBiZSBkb25lIGluIHR3
byBkaWZmZXJlbnQgcGF0Y2hlcywgb3IgYQo+bm90ZSBuZWVkcyB0byBiZSBhZGRlZCB0byB3aHkg
eW91IG1lcmdlIHR3byBMaW51eCBjb21taXRzIGludG8gYQo+c2luZ2xlIFhlbiBwYXRjaC4KClRo
ZSBsYXR0ZXIgZml4ZWQgYSBzZXZlcmUgYnVnIGludHJvZHVjZWQgdGhlIGZpcnN0IG9uZS4gTWF5
YmUgSSBuZWVkCnRvIGFkZCBhIG5vdGUgdG8gY2xhcmlmeSB0aGlzLgoKVGhhbmtzCkNoYW8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
