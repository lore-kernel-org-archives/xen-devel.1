From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH RESEND v1 5/7] x86: Implement Intel
 Processor Trace context switch
Date: Fri, 27 Apr 2018 08:53:30 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167F673ED@SHSMSX101.ccr.corp.intel.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-6-git-send-email-luwei.kang@intel.com>
 <20180426121148.36sxgfj2cjdbkhzn@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180426121148.36sxgfj2cjdbkhzn@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IExvYWQvU3RvcmUgSW50ZWwgcHJvY2Vzc29yIHRyYWNlIHJlZ2lzdGVyIGluIGNvbnRleHQg
c3dpdGNoLgo+ID4gTVNSIElBMzJfUlRJVF9DVEwgaXMgbG9hZGVkL3N0b3JlZCBhdXRvbWF0aWNh
bGx5IGZyb20gVk1DUy4KPiA+IFdoZW4gSW50ZWwgUFQgaXMgc3VwcG9ydGVkIGluIGd1ZXN0LCB3
ZSBuZWVkIGxvYWQvcmVzdG9yZSBQVCBNU1JzIG9ubHkKPiA+IHdoZW4gUFQgaXMgZW5hYmxlZCBp
biBndWVzdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMdXdlaSBLYW5nIDxsdXdlaS5rYW5nQGlu
dGVsLmNvbT4KPiAKPiBJcyB0aGVyZSBhIHJlYXNvbiB0byBub3QgdXNlIHhzYXZlcy94cnN0b3Jz
IHdoZW4gdGhleSBhcmUgYXZhaWxhYmxlPwo+IApUaGVyZSBoYXZlIHR3byBtZXRob2QgdG8gaW1w
bGVtZW50IGNvbnRleHQgc3dpdGNoKG1hbnVhbCBhbmQgeHNhdmUveHJzdG9ycykuClRoZSBmaXJz
dCBtZXRob2QgaXMgbW9yZSBkaXJlY3RseSBhbmQgYWxzbyB3b24ndCBoYXZlIGFueSBwZXJmb3Jt
YW5jZSBvdmVyaGVhZCBpZiBpbnRlbCBQVCBpcyBkaXNhYmxlZC4KSWYgdXNlIHhzYXZlL3hyc3Rv
cnMgd2UgbmVlZCB0byBjaGVjayBpZiBpdCBhdmFpbGFibGUgYW5kIHdoZXRoZXIgUFQgaXMgc3Vw
cG9ydGVkICBpbiBYU1MgKENQVUlELjBEKGVjeD0xKS5lY3gpLgpJIHdpbGwgdGhpbmsgYWJvdXQg
dGhpcyBzY2VuYXJpbyBhbmQgbWF5IG1ha2UgYW4gaW5kZXBlbmRlbnQgcGF0Y2ggdG8gZW5hYmxl
IGl0LiAKQnV0IEkgdGhpbmsgbWFudWFsIHNhdmUvcmVzdG9yZSB3aWxsIGFsc28gbmVlZGVkIGlu
IGNhc2UgeHNhdmUvcnN0b3JlcyBub3QgYXZhaWxhYmxlLCBhbHRob3VnaCBJIHRoaW5rIHRoaXMg
bWF5IGNhbid0IGJlIGhhcHBlbmVkLgoKVGhhbmtzLApMdXdlaSBLYW5nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
