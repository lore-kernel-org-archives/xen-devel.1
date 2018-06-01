From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/VT-x: Fix printing of EFER in
 vmcs_dump_vcpu()
Date: Fri, 01 Jun 2018 01:55:25 -0600
Message-ID: <5B10FBED02000078001C75C3@prv1-mh.provo.novell.com>
References: <1527782593-2421-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527782593-2421-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA1LjE4IGF0IDE4OjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBlc3NlbnRpYWxseSBhICJ0YWtlIDIiIG9mIGMvcyA4MjU0MGI2NmNlICJ4
ODYvVlQteDogRml4IGRldGVybWluYXRpb24KPiBvZiBFRkVSLkxNQSBpbiB2bWNzX2R1bXBfdmNw
dSgpIiBiZWNhdXNlIGluIGhpbmRpZ2h0LCB0aGF0IGNoYW5nZSB3YXMgbW9yZQo+IHByb2JsZW1h
dGljIHRoYW4gdXNlZnVsLgo+IAo+IFRoZSBvcmlnaW5hbCByZWFzb24gd2FzIHRvIGZpeCB0aGUg
bG9naWMgZm9yIGRldGVybWluaW5nIHdoZW4gbm90IHRvIHByaW50IHRoZQo+IFBEUFRFIHBvaW50
ZXJzLiAgSG93ZXZlciwgbXV0YXRpbmcgdGhlIGVmZXIgdmFyaWFibGUgKHBhcnRpY3VsYXJseSBM
TUUgYW5kCj4gTE1BKSBiZWZvcmUgcHJpbnRpbmcgaXQgaW50ZXJmZXJlcyB3aXRoIGRpYWdub3Np
bmcgdm1lbnRyeSBmYWlsdXJlcy4KCkkgd2FzIHdvbmRlcmluZyB0aGVuLCBidXQgbm90IGVub3Vn
aCB0byBhc2sgYmFjay4KCj4gSW5zdGVhZCBvZiBtb2RpZnlpbmcgZWZlciwgY2hhbmdlIHRoZSBQ
RFBURSBjb25kaXRpb25hbCB0byB1c2UKPiBWTV9FTlRSWV9JQTMyRV9NT0RFLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
