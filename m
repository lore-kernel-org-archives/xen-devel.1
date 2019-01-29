From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 for-4.12] x86/hvm: Fix bit checking for
 CR4 and MSR_EFER
Date: Tue, 29 Jan 2019 10:40:16 +0100
Message-ID: <7d9f5268-6e3e-d974-fd28-e4a4e75c1f8a@suse.com>
References: <1548693659-28825-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548693659-28825-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDEvMjAxOSAxNzo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBCZWZvcmUgdGhlIGNw
dWlkX3BvbGljeSBsb2dpYyBjYW1lIGFsb25nLCAlY3I0L0VGRVIgYXVkaXRpbmcgb24gbWlncmF0
ZS1pbiB3YXMKPiBjb21wbGljYXRlZCwgYmVjYXVzZSBhdCB0aGF0IHBvaW50IG5vIENQVUlEIGlu
Zm9ybWF0aW9uIGhhZCBiZWVuIHNldCBmb3IgdGhlCj4gZ3Vlc3QuICBBdWRpdGluZyBhZ2FpbnN0
IHRoZSBob3N0IENQVUlEIHdhcyBiZXR0ZXIgdGhhbiBub3RoaW5nLCBidXQgbm90Cj4gaWRlYWwu
Cj4gCj4gU2ltaWxhcmx5IGF0IHRoZSB0aW1lLCBQVkh2MSBsYWNrZWQgdGhlICJDUFVJRCBwYXNz
ZWQgdGhyb3VnaCBmcm9tIGhhcmR3YXJlIgo+IGJlaGF2aW91ciB3aXRoIFBWIGd1ZXN0cyBoYWQs
IGFuZCBQVkggZG9tMCBoYWQgdG8gYmUgc3BlY2lhbC1jYXNlZCB0byBiZSBhYmxlCj4gdG8gYm9v
dC4KPiAKPiBPcmRlciBvZiBpbmZvcm1hdGlvbiBpbiB0aGUgbWlncmF0aW9uIHN0cmVhbSBpcyBz
dGlsbCBhbiBpc3N1ZSAoaGVuY2Ugd2Ugc3RpbGwKPiBuZWVkIHRvIGtlZXAgdGhlIHJlc3RvcmUg
cGFyYW1ldGVyIHRvIGNvcGUgd2l0aCBhIG5lc3RlZCB2aXJ0IGNvcm5lciBjYXNlIGluCj4gdGhl
ICVjcjQgY2FzZSksIGJ1dCBzaW5jZSBYZW4gNC45LCBhbGwgZG9tYWlucyBzdGFydCB3aXRoIGEg
c3VpdGFibGUgQ1BVSUQKPiBwb2xpY3ksIHdoaWNoIGlzIGEgbW9yZSBhcHByb3ByaWF0ZSB1cHBl
ciBib3VuZCB0aGFuIGhvc3RfY3B1aWRfcG9saWN5Lgo+IAo+IEZpbmFsbHksIHJlcG9zaXRpb24g
dGhlIFVNSVAgbG9naWMgYXMgaXQgaXMgdGhlIG9ubHkgcm93IG91dCBvZiBvcmRlci4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
