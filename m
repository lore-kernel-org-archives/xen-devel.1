From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 6/9] x86: move memory_type_changed to mm.c
Date: Tue, 7 Aug 2018 17:19:41 +0100
Message-ID: <20180807161941.qgon4tiytdbehgsf@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <305664028519f455e05c99c9b1a5c580a0f52ecc.1533636027.git-series.wei.liu2@citrix.com>
 <5B69838F02000078001DB82F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fn4i1-0001KD-1I
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:19:45 +0000
Content-Disposition: inline
In-Reply-To: <5B69838F02000078001DB82F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDU6MzM6MzVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGlzIGZ1bmN0aW9uIGlzIGNvbW1vbiB0byBib3RoIFBWIGFuZCBIVk0uIE1vdmUg
aXQgdG8geDg2IGNvbW1vbgo+ID4gY29kZS4KPiAKPiBJJ20gYWZyYWlkIHRoYXQncyB0aGUgd3Jv
bmcgd2F5IHJvdW5kOiBwMm1fbWVtb3J5X3R5cGVfY2hhbmdlZCgpCj4gaXMgSFZNIChpbiBmYWN0
IEVQVCkgc3BlY2lmaWMuIFRoZSBvbmx5IHVzZXMgb2YgdGhlIGZ1bmN0aW9uIHRoYXQgYXJlbid0
Cj4gYWxyZWFkeSBIVk0tc3BlY2lmaWMgYXJlIGZyb20gZG9tY3RsLmMgYW5kIGZyb20gaW9tbXVf
Y29uc3RydWN0KCksCj4geWV0IEkgZG91YnQgdGhlIGZsdXNoX2FsbChGTFVTSF9DQUNIRSkgaGFz
IGFueSByZWxldmFuY2UgdGhlcmUgaW4KPiB0aGUgUFYgY2FzZS4KClllYWgsIEkgZ290IHRoZSBp
bXByZXNzaW9uIHRoYXQgZmx1c2hpbmcgaXMgcmVsZXZhbnQgdG8gUFYgZnJvbSByZWFkaW5nCmV4
aXN0aW5nIGNvZGUuCgpJZiBpdCBpcyBIVk0gb25seSBJIHN1Z2dlc3Qgd2UgYWRkIGh2bSBwcmVm
aXggdG8gaXQgYW5kIG9ubHkgY2FsbCBpdAp3aGVuIHRoZSBkb21haW4gaW4gcXVlc3Rpb24gaXMg
aHZtLiBUaGlzIGZvbGxvd3Mgd2hhdCB3ZSBhbHJlYWR5IGRvIGluCm90aGVyIHBsYWNlcy4KCiAg
IGlmICggaXNfaHZtX2RvbWFpbihkKSApCiAgICAgICBodm1fbWVtb3J5X3R5cGVfY2hhbmdlKC4u
LikKCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
