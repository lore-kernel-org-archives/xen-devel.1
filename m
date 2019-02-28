From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12] x86/altp2m: Fix build with
 !CONFIG_HVM
Date: Thu, 28 Feb 2019 12:53:45 +0000
Message-ID: <20190228125345.rfst6ujtkgbjfeme@zion.uk.xensource.com>
References: <1551358272-666-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1551358272-666-1-git-send-email-andrew.cooper3@citrix.com>
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

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMTI6NTE6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgMGVjOWI0ZWYzMTQ4ICJ4ODYvdm14OiBGaXggc2VjdXJpdHkgaXNzdWUgd2hl
biBhIGd1ZXN0IGJhbGxvb25zIG91dCB0aGUKPiBjL3MgZTcyZWNjNzYxNTQxICJ4ODYvYWx0cDJt
OiBSZXdvcmsgI1ZFIGVuYWJsZS9kaXNhYmxlIHBhdGhzIiBkaWRuJ3QgaGF2ZSBhCj4gc3VpdGFi
bGUgcHJvdG90eXBlIGluIHRoZSAhQ09ORklHX0hWTSBjYXNlLgo+IAo+IEludHJvZHVjZSBvbmUg
dG8gZml4IHRoZSBidWlsZC4KPiAKPiBTcG90dGVkIGJ5IFRyYXZpcy4KCkkgdGhpbmsgeW91IG1l
YW50IEdpdGxhYiBDST8KCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgoKCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBD
QzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9hbHRwMm0uaCB8IDEgKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9hbHRwMm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYWx0cDJtLmgKPiBpbmRleCA4MTM5
YmY4Li5iMjA2ZTk1IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYWx0cDJtLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FsdHAybS5oCj4gQEAgLTUwLDYgKzUwLDcgQEAg
c3RhdGljIGlubGluZSBib29sIGFsdHAybV9hY3RpdmUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkK
PiAgCj4gIC8qIE9ubHkgZGVjbGFyYXRpb24gaXMgbmVlZGVkLiBEQ0Ugd2lsbCBvcHRpbWlzZSBp
dCBvdXQgd2hlbiBsaW5raW5nLiAqLwo+ICB1aW50MTZfdCBhbHRwMm1fdmNwdV9pZHgoY29uc3Qg
c3RydWN0IHZjcHUgKnYpOwo+ICt2b2lkIGFsdHAybV92Y3B1X2Rpc2FibGVfdmUoc3RydWN0IHZj
cHUgKnYpOwo+ICAKPiAgI2VuZGlmCj4gIAo+IC0tIAo+IDIuMS40Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
