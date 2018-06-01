From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/VT-x: Fix printing of EFER in
 vmcs_dump_vcpu()
Date: Fri, 1 Jun 2018 06:05:56 +0200
Message-ID: <934a46bd-d4f4-f0df-1f73-124e0fbd1735@suse.com>
References: <1527782593-2421-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527782593-2421-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMTggMTg6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhpcyBpcyBlc3NlbnRp
YWxseSBhICJ0YWtlIDIiIG9mIGMvcyA4MjU0MGI2NmNlICJ4ODYvVlQteDogRml4IGRldGVybWlu
YXRpb24KPiBvZiBFRkVSLkxNQSBpbiB2bWNzX2R1bXBfdmNwdSgpIiBiZWNhdXNlIGluIGhpbmRp
Z2h0LCB0aGF0IGNoYW5nZSB3YXMgbW9yZQo+IHByb2JsZW1hdGljIHRoYW4gdXNlZnVsLgo+IAo+
IFRoZSBvcmlnaW5hbCByZWFzb24gd2FzIHRvIGZpeCB0aGUgbG9naWMgZm9yIGRldGVybWluaW5n
IHdoZW4gbm90IHRvIHByaW50IHRoZQo+IFBEUFRFIHBvaW50ZXJzLiAgSG93ZXZlciwgbXV0YXRp
bmcgdGhlIGVmZXIgdmFyaWFibGUgKHBhcnRpY3VsYXJseSBMTUUgYW5kCj4gTE1BKSBiZWZvcmUg
cHJpbnRpbmcgaXQgaW50ZXJmZXJlcyB3aXRoIGRpYWdub3Npbmcgdm1lbnRyeSBmYWlsdXJlcy4K
PiAKPiBJbnN0ZWFkIG9mIG1vZGlmeWluZyBlZmVyLCBjaGFuZ2UgdGhlIFBEUFRFIGNvbmRpdGlv
bmFsIHRvIHVzZQo+IFZNX0VOVFJZX0lBMzJFX01PREUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
