From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RESEND v1 5/7] x86: Implement Intel
 Processor Trace context switch
Date: Wed, 02 May 2018 09:43:33 -0600
Message-ID: <5AE9DCA502000078001C037E@prv1-mh.provo.novell.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-6-git-send-email-luwei.kang@intel.com>
 <20180426121148.36sxgfj2cjdbkhzn@citrix.com>
 <82D7661F83C1A047AF7DC287873BF1E167F673ED@SHSMSX101.ccr.corp.intel.com>
 <20180502151916.27bz45goyxso674f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180502151916.27bz45goyxso674f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Luwei Kang <luwei.kang@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE4IGF0IDE3OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDg6NTM6MzBBTSArMDAwMCwgS2FuZywgTHV3ZWkgd3Jv
dGU6Cj4+ID4gPiBMb2FkL1N0b3JlIEludGVsIHByb2Nlc3NvciB0cmFjZSByZWdpc3RlciBpbiBj
b250ZXh0IHN3aXRjaC4KPj4gPiA+IE1TUiBJQTMyX1JUSVRfQ1RMIGlzIGxvYWRlZC9zdG9yZWQg
YXV0b21hdGljYWxseSBmcm9tIFZNQ1MuCj4+ID4gPiBXaGVuIEludGVsIFBUIGlzIHN1cHBvcnRl
ZCBpbiBndWVzdCwgd2UgbmVlZCBsb2FkL3Jlc3RvcmUgUFQgTVNScyBvbmx5Cj4+ID4gPiB3aGVu
IFBUIGlzIGVuYWJsZWQgaW4gZ3Vlc3QuCj4+ID4gPgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogTHV3
ZWkgS2FuZyA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+Cj4+ID4gCj4+ID4gSXMgdGhlcmUgYSByZWFz
b24gdG8gbm90IHVzZSB4c2F2ZXMveHJzdG9ycyB3aGVuIHRoZXkgYXJlIGF2YWlsYWJsZT8KPj4g
PiAKPj4gVGhlcmUgaGF2ZSB0d28gbWV0aG9kIHRvIGltcGxlbWVudCBjb250ZXh0IHN3aXRjaCht
YW51YWwgYW5kIHhzYXZlL3hyc3RvcnMpLgo+PiBUaGUgZmlyc3QgbWV0aG9kIGlzIG1vcmUgZGly
ZWN0bHkgYW5kIGFsc28gd29uJ3QgaGF2ZSBhbnkgcGVyZm9ybWFuY2UgCj4gb3ZlcmhlYWQgaWYg
aW50ZWwgUFQgaXMgZGlzYWJsZWQuCj4+IElmIHVzZSB4c2F2ZS94cnN0b3JzIHdlIG5lZWQgdG8g
Y2hlY2sgaWYgaXQgYXZhaWxhYmxlIGFuZCB3aGV0aGVyIFBUIGlzIAo+IHN1cHBvcnRlZCAgaW4g
WFNTIChDUFVJRC4wRChlY3g9MSkuZWN4KS4KPj4gSSB3aWxsIHRoaW5rIGFib3V0IHRoaXMgc2Nl
bmFyaW8gYW5kIG1heSBtYWtlIGFuIGluZGVwZW5kZW50IHBhdGNoIHRvIGVuYWJsZSAKPiBpdC4g
Cj4gCj4gRmFpciBlbm91Z2guCj4gCj4gSSBmaWd1cmUgWGVuIGRvZXNuJ3QgdW5kZXJzdGFuZCB4
c2F2ZXMgKGFtb25nIG90aGVyIHhzYXZlKiBmZWF0dXJlcykgYXQKPiB0aGUgbW9tZW50IHNvIGEg
ZGVkaWNhdGVkIHNlcmllcyB0byBlbmFibGUgdGhhdCBpcyByZXF1aXJlZC4KCkkgd291bGRuJ3Qg
YmUgc3VycHJpc2VkIGlmIHRoZXJlIHdlcmUgYnVncywgYnV0IGlmIHlvdSBsb29rIGF0IHhzdGF0
ZS5jIHlvdSdsbApmaW5kIGEgbnVtYmVyIG9mIHJlZmVyZW5jZXMgdG8gWFNBVkVTLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
