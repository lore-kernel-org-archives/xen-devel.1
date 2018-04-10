From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] x86/HVM: suppress I/O completion for
 port output
Date: Tue, 10 Apr 2018 14:20:18 +0200
Message-ID: <73d7aa0f-9643-c1ec-d723-a313d99a1b72@suse.com>
References: <5ACB849B02000078001B9934@prv1-mh.provo.novell.com>
 <5ACB857A02000078001B994D@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e8hv=g7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f5sG5-0006IY-W0
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 12:20:22 +0000
In-Reply-To: <5ACB857A02000078001B994D@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMTggMTU6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlIGRvbid0IGJyZWFrIHVw
IHBvcnQgcmVxdWVzdHMgaW4gY2FzZSB0aGV5IGNyb3NzIGVtdWxhdGlvbiBlbnRpdHkKPiBib3Vu
ZGFyaWVzLCBhbmQgYSB3cml0ZSB0byBhbiBJL08gcG9ydCBpcyBuZWNlc3NhcmlseSB0aGUgbGFz
dAo+IG9wZXJhdGlvbiBvZiBhbiBpbnN0cnVjdGlvbiBpbnN0YW5jZSwgc28gdGhlcmUncyBubyBu
ZWVkIHRvIHJlLWludm9rZQo+IHRoZSBmdWxsIGVtdWxhdGlvbiBwYXRoIHVwb24gcmVjZWl2aW5n
IHRoZSByZXN1bHQgZnJvbSBhbiBleHRlcm5hbAo+IGVtdWxhdG9yLgo+IAo+IEluIGNhc2Ugd2Ug
d2FudCB0byBwcm9wZXJseSBzcGxpdCBwb3J0IGFjY2Vzc2VzIGluIHRoZSBmdXR1cmUsIHRoaXMK
PiBjaGFuZ2Ugd2lsbCBuZWVkIHRvIGJlIHJldmVydGVkLCBhcyBpdCB3b3VsZCBwcmV2ZW50IHRo
aW5ncyB3b3JraW5nCj4gY29ycmVjdGx5IHdoZW4gZS5nLiB0aGUgZmlyc3QgcGFydCBuZWVkcyB0
byBnbyB0byBhbiBleHRlcm5hbCBlbXVsYXRvciwKPiB3aGlsZSB0aGUgc2Vjb25kIHBhcnQgaXMg
dG8gYmUgaGFuZGxlZCBpbnRlcm5hbGx5Lgo+IAo+IFdoaWxlIHRoaXMgYWRkcmVzc2VzIHRoZSBy
ZXBvcnRlZCBwcm9ibGVtIG9mIFdpbmRvd3MgcGFnaW5nIG91dCB0aGUKPiBidWZmZXIgdW5kZXJu
ZWF0aCBhbiBpbi1wcm9jZXNzIFJFUCBPVVRTLCBpdCBkb2VzIG5vdCBhZGRyZXNzIHRoZSB3aWRl
cgo+IHByb2JsZW0gb2YgdGhlIHJlLWlzc3VlZCBpbnNuICh0byB0aGUgaW5zbiBlbXVsYXRvcikg
YmVpbmcgcHJvbmUgdG8KPiByYWlzZSBhbiBleGNlcHRpb24gKCNQRikgZHVyaW5nIGEgcmVwbGF5
ZWQsIHByZXZpb3VzbHkgc3VjY2Vzc2Z1bCBtZW1vcnkKPiBhY2Nlc3MgKHdlIG9ubHkgcmVjb3Jk
IHByaW9yIE1NSU8gYWNjZXNzZXMpLgo+IAo+IExlYXZpbmcgYXNpZGUgdGhlIHByb2JsZW0gdHJp
ZWQgdG8gYmUgd29ya2VkIGFyb3VuZCBoZXJlLCBJIHRoaW5rIHRoZQo+IHBlcmZvcm1hbmNlIGFz
cGVjdCBhbG9uZSBpcyBhIGdvb2QgcmVhc29uIHRvIGNoYW5nZSB0aGUgYmVoYXZpb3IuCj4gCj4g
QWxzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgY2hhbmdlIGJvb2xfdCAtPiBib29sIGFzCj4g
aHZtX3ZjcHVfaW9fbmVlZF9jb21wbGV0aW9uKCkncyByZXR1cm4gdHlwZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
