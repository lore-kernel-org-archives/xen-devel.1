From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 1/8] ARM: VGIC: drop unneeded
 gic_restore_pending_irqs()
Date: Tue, 30 Jan 2018 09:26:44 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801300926290.11958@sstabellini-ThinkPad-X260>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-2-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ilxa=ez=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1egZgJ-0006BJ-Ri
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 17:26:51 +0000
In-Reply-To: <20180124181058.6157-2-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNCBKYW4gMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSW4gZ2ljX3Jlc3Rv
cmVfcGVuZGluZ19pcnFzKCkgd2UgcHVzaCBvdXIgcGVuZGluZyB2aXJ0dWFsIElSUXMgaW50byB0
aGUKPiBsaXN0IHJlZ2lzdGVycy4gVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgb25jZSBmcm9tIGdp
Y19pbmplY3QoKSwganVzdAo+IGJlZm9yZSB3ZSByZXR1cm4gdG8gdGhlIGd1ZXN0LCBidXQgYWxz
byBpbiBnaWNfcmVzdG9yZV9zdGF0ZSgpLCB3aGVuCj4gd2UgY29udGV4dC1zd2l0Y2ggYSBWQ1BV
LiBIYXZpbmcgYSBjbG9zZXIgbG9vayBpdCB0dXJucyBvdXQgdGhhdCB0aGUKPiBsYXRlciBjYWxs
IGlzIG5vdCBuZWVkZWQsIHNpbmNlIHdlIHdpbGwgYWx3YXlzIGNhbGwgZ2ljX2luamVjdCgpIGFu
eXdheS4KPiBTbyByZW1vdmUgdGhhdCBjYWxsIChhbmQgdGhlIGZvcndhcmQgZGVjbGFyYXRpb24p
IHRvIHN0cmVhbWxpbmUgdGhpcwo+IGludGVyZmFjZSBhbmQgbWFrZSBzZXBhcmF0aW5nIHRoZSBH
SUMgZnJvbSB0aGUgVkdJQyB3b3JsZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQ
cnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2FyY2gv
YXJtL2dpYy5jIHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKPiBp
bmRleCBiYWM4YWRhMmJiLi43MjFhMTdhOWQ3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9n
aWMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMuYwo+IEBAIC0zNiw4ICszNiw2IEBACj4gICNp
bmNsdWRlIDxhc20vdmdpYy5oPgo+ICAjaW5jbHVkZSA8YXNtL2FjcGkuaD4KPiAgCj4gLXN0YXRp
YyB2b2lkIGdpY19yZXN0b3JlX3BlbmRpbmdfaXJxcyhzdHJ1Y3QgdmNwdSAqdik7Cj4gLQo+ICBz
dGF0aWMgREVGSU5FX1BFUl9DUFUodWludDY0X3QsIGxyX21hc2spOwo+ICAKPiAgI2RlZmluZSBs
cl9hbGxfZnVsbCgpICh0aGlzX2NwdShscl9tYXNrKSA9PSAoKDEgPDwgZ2ljX2h3X29wcy0+aW5m
by0+bnJfbHJzKSAtIDEpKQo+IEBAIC05MSw4ICs4OSw2IEBAIHZvaWQgZ2ljX3Jlc3RvcmVfc3Rh
dGUoc3RydWN0IHZjcHUgKnYpCj4gICAgICBnaWNfaHdfb3BzLT5yZXN0b3JlX3N0YXRlKHYpOwo+
ICAKPiAgICAgIGlzYigpOwo+IC0KPiAtICAgIGdpY19yZXN0b3JlX3BlbmRpbmdfaXJxcyh2KTsK
PiAgfQo+ICAKPiAgLyogZGVzYy0+aXJxIG5lZWRzIHRvIGJlIGRpc2FibGVkIGJlZm9yZSBjYWxs
aW5nIHRoaXMgZnVuY3Rpb24gKi8KPiAtLSAKPiAyLjE0LjEKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
