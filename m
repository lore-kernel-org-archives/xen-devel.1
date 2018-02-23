From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] x86/time: Rework pv_soft_rdtsc() to aid
 further cleanup
Date: Fri, 23 Feb 2018 07:38:49 -0700
Message-ID: <5A90358902000078001AAF1D@prv-mh.provo.novell.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519127923-23539-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDEyOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSGF2aW5nIHB2X3NvZnRfcmR0c2MoKSBlbXVsYXRlIGFsbCBwYXJ0cyBvZiBhbiByZHRz
Y3AgaXMgYXdrd2FyZCwgYW5kIGdldHMgaW4KPiB0aGUgd2F5IG9mIHNvbWUgaW50ZW5kZWQgY2xl
YW51cC4KPiAKPiAgKiBEcm9wIHRoZSByZHRzY3AgcGFyYW1ldGVyIGFuZCBhbHdheXMgbWFrZSB0
aGUgY2FsbGVyIHJlc3BvbnNpYmxlIGZvciBlY3gKPiAgICB1cGRhdGVzIHdoZW4gYXBwcm9wcmlh
dGUuCj4gICogU3dpdGNoIHRoZSBmdW5jdGlvbiBmcm9tIGJlaW5nIHZvaWQsIGFuZCByZXR1cm4g
dGhlIG1haW4gdGltZXN0YW1wIGluIHRoZQo+ICAgIHJldHVybiB2YWx1ZS4KPiAKPiBUaGUgcmVn
cyBwYXJhbWV0ZXIgaXMgc3RpbGwgbmVlZGVkLCBidXQgb25seSBmb3IgdGhlIHN0YXRzIGNvbGxl
Y3Rpb24sIG9uY2UKPiBhZ2FpbiBicmluZ2luZyBpbnRvIHF1ZXN0aW9uIHRoZWlyIHV0aWxpdHku
ICBUaGUgcGFyYW1ldGVyIGNhbiBob3dldmVyIAo+IHN3aXRjaAo+IHRvIGJlaW5nIGNvbnN0Lgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
