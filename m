From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RESEND v1 5/7] x86: Implement Intel
 Processor Trace context switch
Date: Wed, 2 May 2018 16:19:16 +0100
Message-ID: <20180502151916.27bz45goyxso674f@citrix.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-6-git-send-email-luwei.kang@intel.com>
 <20180426121148.36sxgfj2cjdbkhzn@citrix.com>
 <82D7661F83C1A047AF7DC287873BF1E167F673ED@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E167F673ED@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Kang, Luwei" <luwei.kang@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDg6NTM6MzBBTSArMDAwMCwgS2FuZywgTHV3ZWkgd3Jv
dGU6Cj4gPiA+IExvYWQvU3RvcmUgSW50ZWwgcHJvY2Vzc29yIHRyYWNlIHJlZ2lzdGVyIGluIGNv
bnRleHQgc3dpdGNoLgo+ID4gPiBNU1IgSUEzMl9SVElUX0NUTCBpcyBsb2FkZWQvc3RvcmVkIGF1
dG9tYXRpY2FsbHkgZnJvbSBWTUNTLgo+ID4gPiBXaGVuIEludGVsIFBUIGlzIHN1cHBvcnRlZCBp
biBndWVzdCwgd2UgbmVlZCBsb2FkL3Jlc3RvcmUgUFQgTVNScyBvbmx5Cj4gPiA+IHdoZW4gUFQg
aXMgZW5hYmxlZCBpbiBndWVzdC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTHV3ZWkgS2Fu
ZyA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+Cj4gPiAKPiA+IElzIHRoZXJlIGEgcmVhc29uIHRvIG5v
dCB1c2UgeHNhdmVzL3hyc3RvcnMgd2hlbiB0aGV5IGFyZSBhdmFpbGFibGU/Cj4gPiAKPiBUaGVy
ZSBoYXZlIHR3byBtZXRob2QgdG8gaW1wbGVtZW50IGNvbnRleHQgc3dpdGNoKG1hbnVhbCBhbmQg
eHNhdmUveHJzdG9ycykuCj4gVGhlIGZpcnN0IG1ldGhvZCBpcyBtb3JlIGRpcmVjdGx5IGFuZCBh
bHNvIHdvbid0IGhhdmUgYW55IHBlcmZvcm1hbmNlIG92ZXJoZWFkIGlmIGludGVsIFBUIGlzIGRp
c2FibGVkLgo+IElmIHVzZSB4c2F2ZS94cnN0b3JzIHdlIG5lZWQgdG8gY2hlY2sgaWYgaXQgYXZh
aWxhYmxlIGFuZCB3aGV0aGVyIFBUIGlzIHN1cHBvcnRlZCAgaW4gWFNTIChDUFVJRC4wRChlY3g9
MSkuZWN4KS4KPiBJIHdpbGwgdGhpbmsgYWJvdXQgdGhpcyBzY2VuYXJpbyBhbmQgbWF5IG1ha2Ug
YW4gaW5kZXBlbmRlbnQgcGF0Y2ggdG8gZW5hYmxlIGl0LiAKCkZhaXIgZW5vdWdoLgoKSSBmaWd1
cmUgWGVuIGRvZXNuJ3QgdW5kZXJzdGFuZCB4c2F2ZXMgKGFtb25nIG90aGVyIHhzYXZlKiBmZWF0
dXJlcykgYXQKdGhlIG1vbWVudCBzbyBhIGRlZGljYXRlZCBzZXJpZXMgdG8gZW5hYmxlIHRoYXQg
aXMgcmVxdWlyZWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
