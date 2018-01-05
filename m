From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 16/74] x86/fixmap: Modify
 fix_to_virt() to return a void pointer
Date: Fri, 05 Jan 2018 04:05:27 -0700
Message-ID: <5A4F6A07020000780019B535@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-17-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ivak=ea=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eXPob-0002lf-Se
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 11:05:33 +0000
In-Reply-To: <20180104130625.28605-17-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2RyaXZlcnMvYWNwaS9hcGVpL2FwZWktaW8uYwo+ICsrKyBiL3hlbi9kcml2ZXJz
L2FjcGkvYXBlaS9hcGVpLWlvLmMKPiBAQCAtOTIsNyArOTIsNyBAQCBzdGF0aWMgdm9pZCBfX2lv
bWVtICpfX2luaXQgYXBlaV9yYW5nZV9tYXAocGFkZHJfdCBwYWRkciwgdW5zaWduZWQgbG9uZyBz
aXplKQo+ICAJCWFwZWlfcmFuZ2VfbnIrKzsKPiAgCX0KPiAgCj4gLQlyZXR1cm4gKHZvaWQgX19p
b21lbSAqKWZpeF90b192aXJ0KEZJWF9BUEVJX1JBTkdFX0JBU0UgKyBzdGFydF9ucik7Cj4gKwly
ZXR1cm4gZml4X3RvX3ZpcnQoRklYX0FQRUlfUkFOR0VfQkFTRSArIHN0YXJ0X25yKTsKPiAgfQoK
R3JhbnRlZCB3ZSBwcm9iYWJseSBkb24ndCB1c2UgIl9faW9tZW0iIGNvbnNpc3RlbnRseSwgYW5k
IHdlIG1heQpoZW5jZSB3ZWxsIHdhbnQgdG8gY29uc2lkZXIgZHJvcHBpbmcgaXQgYWx0b2dldGhl
ci4gQnV0IHdpdGhvdXQgdGhhdApiZWluZyBjYWxsZWQgb3V0IGluIHRoZSBkZXNjcmlwdGlvbiwg
SSBkb24ndCB0aGluayBpdCBzaG91bGQgYmUgZHJvcHBlZApoZXJlIGFuZCBmdXJ0aGVyIGRvd24u
CgpBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBpbnRyb2R1Y2Ugc29tZXRoaW5nIGxpa2UgZml4
X3RvX2lvX3ZpcnQoKSwKd2l0aCB0aGF0IGFubm90YXRpb24gaW5jbHVkZWQgaW4gdGhlIGNhc3Qu
Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYXBpY2RlZi5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9hcGljZGVmLmgKPiBAQCAtMTE5LDcgKzExOSw3IEBACj4gIC8qIE9ubHkgYXZh
aWxhYmxlIGluIHgyQVBJQyBtb2RlICovCj4gICNkZWZpbmUJCUFQSUNfU0VMRl9JUEkJMHgzRjAK
PiAgCj4gLSNkZWZpbmUgQVBJQ19CQVNFIChmaXhfdG9fdmlydChGSVhfQVBJQ19CQVNFKSkKPiAr
I2RlZmluZSBBUElDX0JBU0UgKF9fZml4X3RvX3ZpcnQoRklYX0FQSUNfQkFTRSkpCgpQbGVhc2Ug
dGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZ2V0IHJpZCBvZiB0aGUgdW5uZWNlc3NhcnkKcGFyZW50
aGVzZXMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
