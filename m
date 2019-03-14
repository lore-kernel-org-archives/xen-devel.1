From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH RESEND 1/3] OvmfPkg/XenSupport: remove usage
 of prefetchable PCI host bridge aperture
Date: Thu, 14 Mar 2019 19:45:56 +0000
Message-ID: <096a1987-a898-9896-8ffd-9fc8512e25f6@citrix.com>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
 <1551876056-28223-2-git-send-email-igor.druzhinin@citrix.com>
 <20190314174121.GB11621@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbPr=RR=citrix.com=prvs=969963b1b=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1h4WJA-0001dS-9G
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 19:46:28 +0000
In-Reply-To: <20190314174121.GB11621@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, edk2-devel@lists.01.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNzo0MSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gSGksCj4gCj4gT24g
V2VkLCBNYXIgMDYsIDIwMTkgYXQgMTI6NDA6NTRQTSArMDAwMCwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+IFRoaXMgYXBlcnR1cmUgZG9lc24ndCBleGlzdCBpbiBPVk1GIGFuZCB0cnlpbmcgdG8g
dXNlIGl0IGNhdXNlcwo+IAo+IEknbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFu
IGJ5IHdyaXRpbmcgImRvZXNuJ3QgZXhpc3QgaW4KPiBPVk1GIi4gQXJlIHByZWZldGNoYWJsZSBC
QVIgbm90IGhhbmRsZWQgYnkgU2NhbkZvclJvb3RCcmlkZ2VzKCkgPwo+IE9yIGlzIGl0IHRoZSBl
bXVsYXRpb24gb2YgdGhlIGNvbmZpZyBzcGFjZSB0aGF0IGlzbid0IGNvcnJlY3Q/Cj4gTWF5YmUg
UUVNVSBzaG91bGQgbGllcyBhYm91dCBhIEJBUiBiZWVuIHByZWZldGNoYWJsZT8KClRoZSBwcm9i
bGVtIGhlcmUgaXM6IGh2bWxvYWRlciBwbGFjZXMgQkFScyBpbml0aWFsbHkgZGlzcmVnYXJkaW5n
CnByZWZldGNoYWJsZSBiaXQgaW4gYW4gYXJiaXRyYXJ5IG9yZGVyIGJlY2F1c2UgZXNzZW50aWFs
bHkgdGhlcmUgaXMgb25seQoxIGFwZXJ0dXJlIGZvciB0aGUgaG9zdCBicmlkZ2UgaW4gZW11bGF0
ZWQgc3lzdGVtIHVuZGVyIFhlbiAoYW5kIEtWTSBhcwp3ZWxsKS4gSW4gUGNhdFBjaVJvb3RCcmlk
Z2VQYXJzZUJhcnMoKSB3ZSBjb25zdHJ1Y3QgYXBlcnR1cmVzIGZvciBoaWdoCmxldmVsIE9WTUYg
Y29kZSBieSByZWFkaW5nIHRoZSBCQVIgcGxhY2VtZW50IGluZm9ybWF0aW9uIGFmdGVyCmh2bWxv
YWRlci4gSXQgb2Z0ZW4gYXBwZWFycyB0aGF0IHRoZXJlIGFyZSBwcmVmZXRjaGFibGUgYW5kCm5v
bi1wcmVmZXRjaGFibGUgQkFScyBjb2V4aXN0IHdpdGggZWFjaCBvdGhlciBhbmQgbWFrZSBwcmVm
ZXRjaGFibGUgYW5kCm5vbi1wcmVmZXRjaGFibGUgYXBlcnR1cmVzIG92ZXJsYXAuIFRoaXMgZXZl
bnR1YWxseSB0cmlnZ2VycyBhbgphc3NlcnRpb24gaW4gaGlnaCBsZXZlbCBPVk1GIGNvZGUgYmVj
YXVzZSB0aGF0IHNob3VsZG4ndCBoYXBwZW4uCgpPVk1GIGZvciBLVk0gaXMgbm90IHVzaW5nIHBy
ZWZldGNoYWJsZSBCQVIgYXQgYWxsIC0gc2VlClBjaUhvc3RCcmlkZ2VHZXRSb290QnJpZGdlcygp
IGluIHdoaWNoIGl0IHBhc3NlcyBtTm9uRXhpc3RBcGVydHVyZSBkdW1teQpvYmplY3QgdG8gaGln
aCBsZXZlbCBjb2RlLiBJIHRoaW5rIGl0J3Mgd3JvbmcgdG8gY29uc3RydWN0IGEKcHJlZmV0Y2hh
YmxlIGFwZXJ0dXJlIGZvciBYZW4gYW5kIHRoaXMgY29kZSBzaG91bGQgYmUgcmVtb3ZlZCBhcyBp
dCdzCmRvbmUgZm9yIFFFTVUtS1ZNLiBEbyB5b3UgdGhpbmsgdGhpcyBwYXRjaCBuZWVkcyB0byBk
byB0aGF0PwoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
