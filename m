From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/8] tools/libvchan: init_xs_srv: Simplify
 error handling (1)
Date: Tue, 6 Nov 2018 09:47:18 +0000
Message-ID: <20181106094718.ldrxrvejavtthfbj@zion.uk.xensource.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-4-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ji3p=nr=citrix.com=prvs=84126674e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJxxC-0000WN-3Y
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 09:47:22 +0000
Content-Disposition: inline
In-Reply-To: <20181102170113.11646-4-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDU6MDE6MDhQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gKiBVc2UgeHNfY2xvc2UgaW5zdGVhZCBvZiB0aGUgZGVwcmVjYXRlZCB4c19kYWVtb25f
Y2xvc2UuCj4gCj4gKiBJbml0aWFsaXNlIHhzIHRvIE5VTEwuICAgIFRoYXQgbWVhbnMgeHNfY2xv
c2UgY2FuIG5vdyBiZSBjYWxsZWQgaW4KPiAgIGFsbCBjYXNlcy4gIE1vdmUgaXQgdG8gdGhlIGZh
aWwgY2xhdXNlLgo+IAo+ICogZnJlZShkb21pZF9zdHIpIGlzIGFscmVhZHkgc2FmZSBpbiBhbGwg
Y2FzZXMgc2luY2UgZG9taWRfc3RyIGlzCj4gICBpbml0aWFsaXNlZCB0byBOVUxMLiAgTW92ZSBp
dCB0byB0aGUgZmFpbCBjbGF1c2UuCj4gCj4gTm8gb3ZlcmFsbCBmdW5jdGlvbmFsIGNoYW5nZTog
eHNfY2xvc2UgaXMgdGhlIHNhbWUgYXMgeHNfZGFlbW9uX2Nsb3NlOwo+IGFuZCBpdCBhbmQgZnJl
ZSBhcmUgbm93IHNvbWV0aW1lcyBjYWxsZWQgb24gTlVMTCwgYnV0IHRob3NlIGFyZSBuby1vcHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gLS0tCj4gIHRvb2xzL2xpYnZjaGFuL2luaXQuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnZjaGFuL2luaXQuYyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwo+IGluZGV4IDE4
MDgzM2RjMmYuLjljNjFjNzIwZDEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlidmNoYW4vaW5pdC5j
Cj4gKysrIGIvdG9vbHMvbGlidmNoYW4vaW5pdC5jCj4gQEAgLTI0NSw3ICsyNDUsNyBAQCBmYWls
Ogo+ICBzdGF0aWMgaW50IGluaXRfeHNfc3J2KHN0cnVjdCBsaWJ4ZW52Y2hhbiAqY3RybCwgaW50
IGRvbWFpbiwgY29uc3QgY2hhciogeHNfYmFzZSwgaW50IHJpbmdfcmVmKQo+ICB7Cj4gIAlpbnQg
cmV0ID0gLTE7Cj4gLQlzdHJ1Y3QgeHNfaGFuZGxlICp4czsKPiArCXN0cnVjdCB4c19oYW5kbGUg
KnhzID0gTlVMTDsKPiAgCXN0cnVjdCB4c19wZXJtaXNzaW9ucyBwZXJtc1syXTsKPiAgCWNoYXIg
YnVmWzY0XTsKPiAgCWNoYXIgcmVmWzE2XTsKPiBAQCAtMjkyLDkgKzI5Miw5IEBAIHJldHJ5X3Ry
YW5zYWN0aW9uOgo+ICAJCXJldCA9IDA7Cj4gIAl9Cj4gICBmYWlsX3hzX29wZW46CgpUaGlzIGxh
YmVsIGNhbiBiZSBkZWxldGVkIG5vdy4KCj4gLQlmcmVlKGRvbWlkX3N0cik7Cj4gLQl4c19kYWVt
b25fY2xvc2UoeHMpOwo+ICAgZmFpbDoKPiArCWZyZWUoZG9taWRfc3RyKTsKPiArCXhzX2Nsb3Nl
KHhzKTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
