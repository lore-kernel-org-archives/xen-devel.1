From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 for-4.12] x86/hvm: Fix bit checking for
 CR4 and MSR_EFER
Date: Mon, 28 Jan 2019 16:51:33 +0000
Message-ID: <20190128165133.vduyiwtfzdy5rens@zion.uk.xensource.com>
References: <1548693659-28825-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548693659-28825-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMDQ6NDA6NTlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBCZWZvcmUgdGhlIGNwdWlkX3BvbGljeSBsb2dpYyBjYW1lIGFsb25nLCAlY3I0L0VG
RVIgYXVkaXRpbmcgb24gbWlncmF0ZS1pbiB3YXMKPiBjb21wbGljYXRlZCwgYmVjYXVzZSBhdCB0
aGF0IHBvaW50IG5vIENQVUlEIGluZm9ybWF0aW9uIGhhZCBiZWVuIHNldCBmb3IgdGhlCj4gZ3Vl
c3QuICBBdWRpdGluZyBhZ2FpbnN0IHRoZSBob3N0IENQVUlEIHdhcyBiZXR0ZXIgdGhhbiBub3Ro
aW5nLCBidXQgbm90Cj4gaWRlYWwuCj4gCj4gU2ltaWxhcmx5IGF0IHRoZSB0aW1lLCBQVkh2MSBs
YWNrZWQgdGhlICJDUFVJRCBwYXNzZWQgdGhyb3VnaCBmcm9tIGhhcmR3YXJlIgo+IGJlaGF2aW91
ciB3aXRoIFBWIGd1ZXN0cyBoYWQsIGFuZCBQVkggZG9tMCBoYWQgdG8gYmUgc3BlY2lhbC1jYXNl
ZCB0byBiZSBhYmxlCj4gdG8gYm9vdC4KPiAKPiBPcmRlciBvZiBpbmZvcm1hdGlvbiBpbiB0aGUg
bWlncmF0aW9uIHN0cmVhbSBpcyBzdGlsbCBhbiBpc3N1ZSAoaGVuY2Ugd2Ugc3RpbGwKPiBuZWVk
IHRvIGtlZXAgdGhlIHJlc3RvcmUgcGFyYW1ldGVyIHRvIGNvcGUgd2l0aCBhIG5lc3RlZCB2aXJ0
IGNvcm5lciBjYXNlIGluCj4gdGhlICVjcjQgY2FzZSksIGJ1dCBzaW5jZSBYZW4gNC45LCBhbGwg
ZG9tYWlucyBzdGFydCB3aXRoIGEgc3VpdGFibGUgQ1BVSUQKPiBwb2xpY3ksIHdoaWNoIGlzIGEg
bW9yZSBhcHByb3ByaWF0ZSB1cHBlciBib3VuZCB0aGFuIGhvc3RfY3B1aWRfcG9saWN5Lgo+IAo+
IEZpbmFsbHksIHJlcG9zaXRpb24gdGhlIFVNSVAgbG9naWMgYXMgaXQgaXMgdGhlIG9ubHkgcm93
IG91dCBvZiBvcmRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
