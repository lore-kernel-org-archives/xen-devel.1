From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/sched: Introduce domain_vcpu() helper
Date: Thu, 24 Jan 2019 16:31:19 +0000
Message-ID: <20190124163119.bhamyy3cloesuk7v@zion.uk.xensource.com>
References: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDI6NTk6MjlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgcHJvZ3Jlc3Npb24gb2YgbXVsdGktdmNwdSBzdXBwb3J0IGluIFhlbiAob3Jp
Z2luYWxseSBhIHNpbmdsZSBwb2ludGVyLAo+IHRoZW4gYW4gZW1iZWRkZWQgZC0+dmNwdVtdIGFy
cmF5LCB0aGVuIGEgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGFycmF5KSBoYXMKPiByZXN1bHRlZCBp
biBhIGxhcmdlIHF1YW50aXR5IG9mIGFkLWhvYyBjb2RlIGZvciBsb29raW5nIGEgdmNwdSB1cCBi
eSBpZCwgYW5kIGEKPiBsYXJnZSBudW1iZXIgb2Ygd2F5cyB0aGF0IHRoZSB0b29sc3RhY2sgY2Fu
IGNhdXNlIFhlbiB0byB0cmlwIG92ZXIgYSBOVUxMCj4gcG9pbnRlci4gIFNvbWUgb2YgdGhpcyBo
YXMgYmVlbiBhZGRyZXNzZWQgaW4gWGVuIDQuMTIsIGFuZCB3b3JrIGlzIG9uZ29pbmcuCj4gCj4g
QW5vdGhlciBwcm9wZXJ0eSBvZiBsb29raW5nIGEgdmNwdSB1cCBieSBpZCBpcyBmcmVxdWVudGx5
IGRvbmUgaW4gdW5wcml2aWxlZ2VkCj4gaHlwZXJjYWxsIGNvbnRleHQsIG1ha2luZyBpdCBhbiBh
dHRyYWN0aXZlIHRhcmdldCBmb3Igc3BlY3VsYXRpdmUgc2lkZWNoYW5uZWwKPiBhdHRhY2tzLgo+
IAo+IEludHJvZHVjZSBhIGhlbHBlciB0byBkbyB0aGUgbG9va3VwIGNvcnJlY3RseSwgYW5kIHdp
dGhvdXQgc3BlY3VsYXRpdmUKPiBpbnRlcmZlcmVuY2UuICBGb3IgcGVyZm9ybWFuY2UgcmVhc29u
cywgaXQgaXMgdXNlZnVsIG5vdCB0byBoYXZlIGFuIHNtcF9ybWIoKQo+IGluIHRoaXMgaGVscGVy
IG9uIEFSTSwgYW5kIGx1Y2tpbHkgdGhpcyBpcyBzYWZlIHRvIGRvLCBiZWNhdXNlIG9mIHRoZQo+
IHNlcmlhbGlzYXRpb24gb2ZmZXJlZCBieSB0aGUgZ2xvYmFsIGRvbWhlYXAgbG9jay4KCkkgdGhp
bmsgeW91IG1lYW4gZG9tbGlzdCBsb2NrIGhlcmU/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
