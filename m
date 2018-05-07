From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/pv: Unconditionally hide
 EFER.SVME from PV guests
Date: Mon, 7 May 2018 08:28:52 +0200
Message-ID: <a2a8f534-498d-02fe-e28b-9706b02c3f3e@suse.com>
References: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1525454911-26552-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDUvMTggMTk6MjgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gV2UgZG9uJ3QgYWR2ZXJ0
aXNlIFNWTSBpbiBDUFVJRCBzbyBhIFBWIGd1ZXN0IHNob3VsZG4ndCBiZSB1bmRlciB0aGUKPiBp
bXByZXNzaW9uIHRoYXQgaXQgY2FuIHVzZSBTVk0gZnVuY3Rpb25hbGl0eSwgYnV0IGRlc3BpdGUg
dGhpcywgaXQgcmVhbGx5Cj4gc2hvdWxkbid0IHNlZSBTVk1FIHNldCB3aGVuIHJlYWRpbmcgRUZF
Ui4KPiAKPiBJbnRyb2R1Y2UgRUZFUl9LTk9XTl9NQVNLIHRvIHdoaXRlbGlzdCB0aGUgZmVhdHVy
ZXMgWGVuIGtub3dzIGFib3V0LCBhbmQgdXNlCj4gdGhpcyB0byBjbGFtcCB0aGUgZ3Vlc3RzIHZp
ZXcuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmV1c2UgdGhlIG1hc2sgdG8gc2ltcGxp
Znkgc3ZtX3ZtY2JfaXN2YWxpZCgpLCBhbmQKPiBjaGFuZ2UgInVuZGVmaW5lZCIgdG8gInVua25v
d24iIGluIHRoZSBwcmludCBtZXNzYWdlLCBhcyB0aGVyZSBpcyBhdCBsZWFzdAo+IEVGRVIuVENF
IChUcmFuc2xhdGlvbiBDYWNoZSBFeHRlbnNpb24pIGRlZmluZWQgYnV0IHVua25vd24gdG8gWGVu
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
