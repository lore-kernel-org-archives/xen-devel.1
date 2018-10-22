From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: Consolidate the storage of
 MSR_AMD64_DR{0-3}_ADDRESS_MASK
Date: Mon, 22 Oct 2018 11:53:17 +0100
Message-ID: <20181022105317.nlvizgox4wcmschg@zion.uk.xensource.com>
References: <1539962062-9406-1-git-send-email-andrew.cooper3@citrix.com>
 <f864baa1-c151-4437-ebf4-c0ada29b147b@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <f864baa1-c151-4437-ebf4-c0ada29b147b@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDY6NTI6MDJQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDEwLzE5LzE4IDExOjE0IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21zci5oCj4gPiBpbmRleCA3YTA2MWIyLi5jMWNiMzhmIDEwMDY0NAo+ID4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tc3IuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3Iu
aAo+ID4gQEAgLTI4Nyw2ICsyODcsMTIgQEAgc3RydWN0IHZjcHVfbXNycwo+ID4gICAgICAgICAg
ICAgIGJvb2wgY3B1aWRfZmF1bHRpbmc6MTsKPiA+ICAgICAgICAgIH07Cj4gPiAgICAgIH0gbWlz
Y19mZWF0dXJlc19lbmFibGVzOwo+ID4gKwo+ID4gKyAgICAvKgo+ID4gKyAgICAgKiAweGMwMDEx
MHsyNywxOS0xYn0gTVNSX0FNRDY0X0RSezAtM31fQUREUkVTU19NQVNLCj4gPiArICAgICAqIFRP
RE86IE5vdCB5ZXQgaGFuZGxlZCBieSBndWVzdF97cmQsd3J9bXNyKCkgaW5mcmFzdHJ1Y3R1cmUu
Cj4gPiArICAgICAqLwo+ID4gKyAgICB1aW50MzJfdCBkcl9tYXNrWzRdOwo+ID4gIH07Cj4gPiAg
Cj4gCj4gWW91IGRvbid0IHRoaW5rIHdyYXBwaW5nIHRoZXNlIGludG8gYW4gaW50ZWwvYW1kIHVu
aW9uIHdvdWxkIGJlIHVzZWZ1bD8KClNhbWUgcXVlc3Rpb24gaGVyZS4gRFIgbWFza3Mgc2VlbSB0
byBiZSBBTUQgc3BlY2lmaWMuCgpUaGUgY29kZSBjaGFuZ2UgaXRzZWxmIGxvb2tzIGdvb2QgdG8g
bWUuCgpUaGFua3MgZm9yIHBvc3RpbmcgdGhpcyBwYXRjaC4KCldlaS4KCj4gCj4gLWJvcmlzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
