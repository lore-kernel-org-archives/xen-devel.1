From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 9/9] x86: move declaration of
 arch_set_info_hvm_guest and provide stub
Date: Thu, 16 Aug 2018 11:42:17 +0100
Message-ID: <20180816104217.xuxamizindko2hun@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <db8890926bbfd8ac9381eb767d1bff362bcaf9c0.1533636027.git-series.wei.liu2@citrix.com>
 <5B69867E02000078001DB851@prv1-mh.provo.novell.com>
 <20180807162415.fsfw4oojk57c2f23@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aicj=k7=citrix.com=prvs=7595339f3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqFjR-00066Z-JP
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 10:42:21 +0000
Content-Disposition: inline
In-Reply-To: <20180807162415.fsfw4oojk57c2f23@citrix.com>
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

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDU6MjQ6MTVQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
ID4gCj4gPiBBbGwgdXNlcyBzaXQgZWl0aGVyIGluIEhWTS1zcGVjaWZpYyBjb2RlIG9yIGluc2lk
ZSBpc19odm1fLi4uKCkKPiA+IGNvbmRpdGlvbmFsczogV2h5IGRvIHdlIG5lZWQgdGhlIGlubGlu
ZSBzdHViPyBJZiB0aGUgZGVjbGFyYXRpb24KPiA+IHdhcyB2aXNpYmxlIGluZGVwZW5kZW50IG9m
IENPTkZJR19IVk0sIGNvZGUgd291bGQgY29tcGlsZQo+ID4gZmluZSwgYW5kIHJlZmVyZW5jZXMg
dG8gdGhlIGZ1bmN0aW9uIHdvdWxkIGJlIHJlbW92ZWQgYnkgdGhlCj4gPiBjb21waWxlciwgc28g
bGlua2luZyB3b3VsZCBhbHNvIHN1Y2NlZWQgZGVzcGl0ZSB0aGVyZSBub3QgYmVpbmcKPiA+IGFu
eSBkZWZpbml0aW9uIG9mIHRoZSBmdW5jdGlvbi4KPiAKPiBMYXN0IHRpbWUgSSB0cmllZCBEQ0Ug
d2Fzbid0IHdvcmtpbmcgc28gd2VsbC4gTGV0IG1lIHRyeSBhZ2FpbiBhbmQgaWYKPiBEQ0Ugd29y
a3MgaXQgd291bGQgc2F2ZSBtZSBhIGxvdCBvZiBlZmZvcnQgdG8gcHJvdmlkZSBzdHVicy4KPiAK
CkRDRSBzZWVtcyB0byB3b3JrIGJldHRlciB0aGlzIHRpbWUuCgpUaGUgb25seSBwcm9ibGVtIGlz
IHRoYXQgc29tZSBBU1NFUlRzIHdpbGwgbmVlZCB0byB0dXJuIGludG8gcGFuaWMgb3IKQlVHKCkg
aWYgd2Ugd2FudCB0byBmdWxseSB1dGlsaXNlIERDRS4gSXMgdGhhdCBva2F5PwoKVG8gZ2l2ZSB5
b3UgYW4gZXhhbXBsZSwgYWZ0ZXIgbWFraW5nIGlzX2h2bV9kb21haW4gZXZhbHVhdGUgdG8gMCB3
aGVuCiFDT05GSUdfSFZNLCB2bV9ldmVudF9maWxsX3JlZ3MgKyAhQ09ORklHX0hWTSBjb21waWxl
cyBmaW5lIGZvciBkZWJ1ZwpidWlsZCBiZWNhdXNlIEFTU0VSVCBoaW50cyB0aGUgY29tcGlsZXIg
dGhhdCB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24gaXMKbmV2ZXIgZ29pbmcgdG8gYmUgcmVhY2hh
YmxlLiBCdXQgZm9yIG5vbi1kZWJ1ZyBidWlsZCwgQVNTRVJUIGlzIGVtcHR5LApzbyBjb21waWxl
ciB3aWxsIG5vdCBlbGltaW5hdGUgdGhlIHJlc3Qgb2YgdGhlIGZ1bmN0aW9uLCBjb21wbGFpbmlu
Zwpodm1fZ2V0X3NlZ21lbnRfcmVnaXN0ZXIgaXMgbm90IGF2YWlsYWJsZS4gSXQgaXMgc29sdmFi
bGUgYnkgYWRkaW5nCnBhbmljIG9yIEJVRy4KClRoZXJlIGlzIGdvaW5nIHRvIGJlIHF1aXRlIGEg
ZmV3IGNhc2VzIGxpa2UgdGhhdC4gSSBoYXZlbid0IGdvbmUgdGhyb3VnaAphbGwgb2YgdGhlbS4K
CkxldCBtZSBrbm93IHlvdXIgb3Bpbmlvbi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
