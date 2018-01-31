From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/7] xen/arm32: Add skeleton to harden
 branch predictor aliasing attacks
Date: Wed, 31 Jan 2018 08:40:27 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801310840130.11958@sstabellini-ThinkPad-X260>
References: <20180119134103.3390-1-julien.grall@linaro.org>
 <20180119134103.3390-5-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801241545580.6440@sstabellini-ThinkPad-X260>
 <bc492613-35a6-57ad-41e4-b024429549eb@linaro.org>
 <alpine.DEB.2.10.1801251042590.11958@sstabellini-ThinkPad-X260>
 <be044a8e-aa82-ffbe-3b6e-386ce5d91177@linaro.org>
 <alpine.DEB.2.10.1801251136070.11958@sstabellini-ThinkPad-X260>
 <ec7f0351-372f-cbfc-1a9b-7b203d5eb0e0@linaro.org>
 <e146fe16-5998-82e8-0722-952e4823582c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e146fe16-5998-82e8-0722-952e4823582c@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAzMSBKYW4gMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI2LzAxLzE4IDE2
OjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ICJUaGVyZWZvcmUgaHlwZXJ2aXNvciBjb2Rl
IHJ1bm5pbmcgd2l0aCBndWVzdCB2ZWN0b3JzIHRhYmxlIHNob3VsZCBiZQo+ID4gPiBtaW5pbWl6
ZWQgYW5kIGFsd2F5cyBoYXZlIGludGVycnVwdHMgYW5kIGFzeW5jIGFib3J0cyBtYXNrZWQgdG8g
cmVkdWNlCj4gPiA+IHRoZSByaXNrIHRvIHVzZSB0aGVtLiIKPiA+ID4gCj4gPiA+IERvIHlvdSB0
aGluayB0aGF0IGl0IGlzIGNsZWFyZXI/Cj4gPiAKPiA+IFdlbGwsIHRoYXQgd2FzIGNvdmVyZWQg
YnkgImludGVycnVwdHMiLiBJZiB5b3UgbG9vayBhdCB0aGUgQXJtIEFybSwgQSwgSSwgRgo+ID4g
YXJlIGNvbnNpZGVyZWQgYWxsIGludGVycnVwdHMuCj4gCj4gSSByZXdvcmtlZCB0aGUgcGFyYWdy
YXBoIGFuZCBpdCBpcyBub3c6Cj4gCj4gIkhvd2V2ZXIsIG9uIGFybTMyLCBlYWNoIHZlY3RvciBj
b250YWluIGEgc2luZ2xlIGluc3RydWN0aW9uLiBUaGlzIG1lYW5zIHRoYXQKPiB0aGUgaGFyZGVu
ZWQgdmVjdG9yIHRhYmxlcyBtYXkgcmVseSBvbiB0aGUgc3RhdGUgb2YgcmVnaXN0ZXJzIHRoYXQg
ZG9lcyBub3QKPiBob2xkIHdoZW4gaW4gdGhlIGh5cGVydmlzb3IgKGUuZyBTUCBpcyA4IGJ5dGVz
IGFsaWduZWQpLiBUaGVyZWZvcmUgaHlwZXJ2aXNvcgo+IGNvZGUgcnVubmluZyB3aXRoIGd1ZXN0
IHZlY3RvcnMgdGFibGUgc2hvdWxkIGJlCj4gbWluaW1pemVkIGFuZCBhbHdheXMgaGF2ZSBJUlEg
YW5kIFNFcnJvciBtYXNrZWQgdG8gcmVkdWNlIHRoZSByaXNrIHRvIHVzZQo+IHRoZW0uIgoKSSB0
aGluayBpdCdzIG11Y2ggYmV0dGVyLCB0aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
