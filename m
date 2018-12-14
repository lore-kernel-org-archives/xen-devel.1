From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v4 16/18] xen: automatically create
 XenBlockDevice-s
Date: Fri, 14 Dec 2018 14:50:24 +0000
Message-ID: <6291f3bff540494a9f1b2e7ce72570ac@AMSPEX02CL02.citrite.net>
References: <1544543862-9997-1-git-send-email-paul.durrant@citrix.com>
 <1544543862-9997-17-git-send-email-paul.durrant@citrix.com>
 <20181213115152.GA5427@linux.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KWVA=OX=citrix.com=prvs=8792ba347=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gXonM-0003Mc-9L
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 14:50:28 +0000
In-Reply-To: <20181213115152.GA5427@linux.fritz.box>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Kevin Wolf' <kwolf@redhat.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+ICsKPiA+ICsgICAgYmxvY2tk
ZXYtPmF1dG9faW90aHJlYWQgPSBpb3RocmVhZDsKPiA+ICsKPiA+ICsgICAgb2JqZWN0X3Byb3Bl
cnR5X3NldF9ib29sKE9CSkVDVChkZXYpLCB0cnVlLCAicmVhbGl6ZWQiLAo+ICZsb2NhbF9lcnIp
Owo+ID4gKyAgICBpZiAobG9jYWxfZXJyKSB7Cj4gPiArICAgICAgICBlcnJvcl9wcm9wYWdhdGVf
cHJlcGVuZChlcnJwLCBsb2NhbF9lcnIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiaW5pdGlhbGl6YXRpb24gb2YgZGV2aWNlICVzIGZhaWxlZDogIiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUpOwo+ID4gKyAgICAgICAgZ290byB1bnJlZjsK
PiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICBibG9ja2Rldl9tYXJrX2F1dG9fZGVsKGJsayk7Cj4g
Cj4gWW91IGRvbid0IG5lZWQgdGhpcyBvbmUgYW55IG1vcmUgdGhlbiAoaWYgeW91IGxvb2sgaW50
byB0aGUgZGV0YWlscywKPiBpdCdzIG9uZSBvZiB0aGUgbW9yZSBjb25mdXNpbmcgcGFydHMgb2Yg
dGhlIGRyaXZlXyooKSBtYWdpYywgc28gaXQncwo+IGdvb2QgdG8gZ2V0IHJpZCBvZiBpdCkuIFdo
ZW4geW91IHVzZSB0aGUgYW5vbnltb3VzIEJsb2NrQmFja2VuZCBjcmVhdGVkCj4gYnkgdGhlIHFk
ZXYgZHJpdmUgcHJvcGVydHkgKGJlY2F1c2UgeW91IHBhc3NlZCBpdCBhIG5vZGUtbmFtZSByYXRo
ZXIKPiB0aGFuIGEgQmxvY2tCYWNrZW5kIG5hbWUpIG1lYW5zIHRoYXQgdGhlIEJsb2NrQmFja2Vu
ZCBkaXNhcHBlYXJzCj4gdG9nZXRoZXIgd2l0aCB0aGUgZHJpdmUuCj4gCj4gTm90ZSB0aGF0IGV4
cGxpY2l0bHkgY3JlYXRlZCBibG9jayBub2RlcyBtdXN0IGFsc28gYmUgdW5yZWZlcmVuY2VkCj4g
ZXhwbGljaXRseSAoYmRydl9vcGVuKCkgc2hvdWxkIGJlIHBhaXJlZCB3aXRoIGJkcnZfdW5yZWYo
KSBhbmQKPiBxbXBfYmxvY2tkZXZfYWRkKCkgd2l0aCBxbXBfYmxvY2tkZXZfZGVsKCkpLiBNYXli
ZSBYZW5CYWNrZW5kSW5mbyBuZWVkcwo+IGEgLmRlc3Ryb3kgY2FsbGJhY2sgc28gd2UgY2FuIGRv
IGRlc3RydWN0aW9uIHN5bW1ldHJpY2FsbHkgdG8gZGV2aWNlCj4gY3JlYXRpb24/Cj4gCgpJIGhh
dmUgc29tZXRoaW5nIGltcGxlbWVudGVkIHVzaW5nIHFtcF9ibG9ja2Rldl9hZGQoKSBub3cgYW5k
IGl0IHNlZW1zIHRvIHdvcmssIGJ1dCB3aGVuIEkgY2FsbCBpbnRvIHFtcF9ibG9ja2Rldl9kZWwo
KSAocGFzc2luZyBpbiB0aGUgbm9kZS1uYW1lIEkgdXNlZCB0byB0aGUgc2V0IHRoZSAiZHJpdmUi
IHBhcmFtZXRlcikgZHVyaW5nIHVucmVhbGl6ZSB0aGVuIGl0IHRlbGxzIG1lIHRoYXQgdGhlIGRl
dmljZSBpcyBpbiB1c2UuIERvIEkgbmVlZCBhIGNhbGxiYWNrIHRoYXQgcnVucyBhZnRlciB1bnJl
YWxpemUgb2YgdGhlIGRldmljZT8KCiAgUGF1bCAKCj4gPiArICAgIHJldHVybjsKPiA+ICsKPiA+
ICt1bnJlZjoKPiA+ICsgICAgaWYgKGRldikgewo+ID4gKyAgICAgICAgb2JqZWN0X3VucGFyZW50
KE9CSkVDVChkZXYpKTsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICBpZiAoaW90aHJlYWQpIHsK
PiA+ICsgICAgICAgIGlvdGhyZWFkX2Rlc3Ryb3koaW90aHJlYWQpOwo+ID4gKyAgICB9Cj4gPiAr
Cj4gPiArICAgIGlmIChibGspIHsKPiA+ICsgICAgICAgIG1vbml0b3JfcmVtb3ZlX2JsayhibGsp
Owo+ID4gKyAgICAgICAgYmxrX3VucmVmKGJsayk7Cj4gPiArICAgIH0KPiA+ICt9Cj4gCj4gS2V2
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
