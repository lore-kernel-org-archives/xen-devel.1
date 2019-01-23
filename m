From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/sched: Introduce domain_vcpu() helper
Date: Wed, 23 Jan 2019 16:09:05 +0100
Message-ID: <7f6d8be8-af4a-6f06-319e-d473555cfd4a@suse.com>
References: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxNTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgcHJvZ3Jlc3Np
b24gb2YgbXVsdGktdmNwdSBzdXBwb3J0IGluIFhlbiAob3JpZ2luYWxseSBhIHNpbmdsZSBwb2lu
dGVyLAo+IHRoZW4gYW4gZW1iZWRkZWQgZC0+dmNwdVtdIGFycmF5LCB0aGVuIGEgZHluYW1pY2Fs
bHkgYWxsb2NhdGVkIGFycmF5KSBoYXMKPiByZXN1bHRlZCBpbiBhIGxhcmdlIHF1YW50aXR5IG9m
IGFkLWhvYyBjb2RlIGZvciBsb29raW5nIGEgdmNwdSB1cCBieSBpZCwgYW5kIGEKPiBsYXJnZSBu
dW1iZXIgb2Ygd2F5cyB0aGF0IHRoZSB0b29sc3RhY2sgY2FuIGNhdXNlIFhlbiB0byB0cmlwIG92
ZXIgYSBOVUxMCj4gcG9pbnRlci4gIFNvbWUgb2YgdGhpcyBoYXMgYmVlbiBhZGRyZXNzZWQgaW4g
WGVuIDQuMTIsIGFuZCB3b3JrIGlzIG9uZ29pbmcuCj4gCj4gQW5vdGhlciBwcm9wZXJ0eSBvZiBs
b29raW5nIGEgdmNwdSB1cCBieSBpZCBpcyBmcmVxdWVudGx5IGRvbmUgaW4gdW5wcml2aWxlZ2Vk
Cj4gaHlwZXJjYWxsIGNvbnRleHQsIG1ha2luZyBpdCBhbiBhdHRyYWN0aXZlIHRhcmdldCBmb3Ig
c3BlY3VsYXRpdmUgc2lkZWNoYW5uZWwKPiBhdHRhY2tzLgo+IAo+IEludHJvZHVjZSBhIGhlbHBl
ciB0byBkbyB0aGUgbG9va3VwIGNvcnJlY3RseSwgYW5kIHdpdGhvdXQgc3BlY3VsYXRpdmUKPiBp
bnRlcmZlcmVuY2UuICBGb3IgcGVyZm9ybWFuY2UgcmVhc29ucywgaXQgaXMgdXNlZnVsIG5vdCB0
byBoYXZlIGFuIHNtcF9ybWIoKQo+IGluIHRoaXMgaGVscGVyIG9uIEFSTSwgYW5kIGx1Y2tpbHkg
dGhpcyBpcyBzYWZlIHRvIGRvLCBiZWNhdXNlIG9mIHRoZQo+IHNlcmlhbGlzYXRpb24gb2ZmZXJl
ZCBieSB0aGUgZ2xvYmFsIGRvbWhlYXAgbG9jay4KPiAKPiBBcyBhIG1pbm9yIGNoYW5nZSBub3Rp
Y2VkIHdoZW4gY2hlY2tpbmcgdGhlIHNhZmV0eSBvZiB0aGlzIGNvbnN0cnVjdCwgc2FuaXR5Cj4g
Y2hlY2sgZHVyaW5nIGJvb3QgdGhhdCBpZGxlLT5tYXhfdmNwdXMgaXMgYSBzdWl0YWJsZSB1cHBl
ciBib3VuZCBmb3IKPiBpZGxlLT52Y3B1W10uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
