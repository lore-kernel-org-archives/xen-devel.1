From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] remove dead code in allocate_memory
Date: Thu, 18 Jan 2018 13:53:56 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801181351570.6440@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801121619160.5767@sstabellini-ThinkPad-X260>
 <7f6cec19-7883-5494-0809-f547fc4a3ae3@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ybr3=en=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ecI8J-0007ur-OI
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 21:54:03 +0000
In-Reply-To: <7f6cec19-7883-5494-0809-f547fc4a3ae3@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNSBKYW4gMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDEvMTMvMjAxOCAxMjoyOSBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
bG93bWVtIGlzIHVuY2hhbmdlZCB1bnRpbCBhZnRlciB0aGlzIGxvb3AsIHRoZXJlIGlzIG5vIHBv
aW50IGluIHRlc3RpbmcKPiA+IGZvciBpdHMgdmFsdWUuIE1vcmVvdmVyLCBDb3Zlcml0eSBjb21w
bGFpbnMgYWJvdXQgZGVhZCBjb2RlLgo+ID4gCj4gPiBSZW1vdmUgdGhlIGxvd21lbSB0ZXN0IGlu
IHRoZSBmaXJzdCBsb29wLgo+IAo+IFdoaWxlIEkgdW5kZXJzdGFuZCBDb3Zlcml0eSBjb21wbGFp
bnMgYWJvdXQgZGVhZCBjb2RlLCBpbiB0aGF0IHBhcnRpY3VsYXIgY2FzZQo+IEkgZG9uJ3QgdGhp
bmsgcmVtb3ZpbmcgdGhpcyB0ZXN0IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KPiAKPiBJdCBp
cyB2ZXJ5IGVhc3kgdG8gdG9nZ2xlIGxvd21lbiB0byBmYWxzZSBpbiB0aGUgZGVjbGFyYXRpb24g
YXMgdGhpcyB3YXMgZG9uZQo+IGJlZm9yZSBhYjViMDBhICJ4ZW4vYXJtOiBkb21haW5fYnVpbGQ6
IGFsbG9jYXRlIGxvd21lbSBmb3IgZG9tMCBhcyBtdWNoIGFzCj4gcG9zc2libGUiLiBPbmUgZXhh
bXBsZSB3b3VsZCBiZSBrZWVwIGxvdyBtZW1vcnkgZnJlZSBmb3Igb3RoZXIgcHVycG9zZS4KIApG
YWlyIGVub3VnaAoKCj4gPiAKPiA+IENJRDogMTM4MTgzMgo+ID4gU2lnbmVkLW9mZi1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4gPiBpbmRleCAxNTVjOTUyLi5mYTU4OTA2IDEwMDY0NAo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiA+IEBAIC0yNzcsNyArMjc3LDcgQEAgc3RhdGljIHZvaWQgYWxsb2NhdGVfbWVtb3J5KHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdAo+ID4ga2VybmVsX2luZm8gKmtpbmZvKQo+ID4gICAgICAg
ICovCj4gPiAgICAgICB3aGlsZSAoIG9yZGVyID49IG1pbl9sb3dfb3JkZXIgKQo+ID4gICAgICAg
ewo+ID4gLSAgICAgICAgZm9yICggYml0cyA9IG9yZGVyIDsgYml0cyA8PSAobG93bWVtID8gMzIg
OiBQQUREUl9CSVRTKTsgYml0cysrICkKPiA+ICsgICAgICAgIGZvciAoIGJpdHMgPSBvcmRlciA7
IGJpdHMgPD0gMzI7IGJpdHMrKyApCj4gPiAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICBw
ZyA9IGFsbG9jX2RvbWhlYXBfcGFnZXMoZCwgb3JkZXIsIE1FTUZfYml0cyhiaXRzKSk7Cj4gPiAg
ICAgICAgICAgICAgIGlmICggcGcgIT0gTlVMTCApCj4gPiAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
