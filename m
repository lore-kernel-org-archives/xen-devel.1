From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] xen-netback: remove unecessary condition
 check before debugfs_remove_recursive
Date: Tue, 11 Sep 2018 08:00:02 +0000
Message-ID: <06106022e5344ccca2127e5afd6928d9__40867.6002095037$1536652761$gmane$org@AMSPEX02CL03.citrite.net>
References: <1536414822-32911-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sdwv=lz=citrix.com=prvs=7852997cf=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fzdbB-0004Ob-DJ
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 08:00:37 +0000
In-Reply-To: <1536414822-32911-1-git-send-email-zhongjiang@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'zhong jiang' <zhongjiang@huawei.com>, "davem@davemloft.net" <davem@davemloft.net>, Wei Liu <wei.liu2@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IHpob25nIGppYW5nIFttYWlsdG86
emhvbmdqaWFuZ0BodWF3ZWkuY29tXQo+IFNlbnQ6IDA4IFNlcHRlbWJlciAyMDE4IDE0OjU0Cj4g
VG86IGRhdmVtQGRhdmVtbG9mdC5uZXQ7IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJp
eC5jb20+OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtCj4ga2Vy
bmVsQHZnZXIua2VybmVsLm9yZwo+IFN1YmplY3Q6IFtQQVRDSF0geGVuLW5ldGJhY2s6IHJlbW92
ZSB1bmVjZXNzYXJ5IGNvbmRpdGlvbiBjaGVjayBiZWZvcmUKPiBkZWJ1Z2ZzX3JlbW92ZV9yZWN1
cnNpdmUKPiAKPiBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUgaGFzIHRha2VuIElTX0VSUl9PUl9O
VUxMIGludG8gYWNjb3VudC4gU28ganVzdAo+IHJlbW92ZSB0aGUgY29uZGl0aW9uIGNoZWNrIGJl
Zm9yZSBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogemhvbmcg
amlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKPiAtLS0KPiAgZHJpdmVycy9uZXQveGVuLW5ldGJh
Y2svbmV0YmFjay5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9u
ZXRiYWNrLmMgYi9kcml2ZXJzL25ldC94ZW4tCj4gbmV0YmFjay9uZXRiYWNrLmMKPiBpbmRleCAz
NjIxZTA1Li44MGFhZTNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25l
dGJhY2suYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYwo+IEBAIC0x
NjYwLDggKzE2NjAsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBuZXRiYWNrX2luaXQodm9pZCkKPiAg
c3RhdGljIHZvaWQgX19leGl0IG5ldGJhY2tfZmluaSh2b2lkKQo+ICB7Cj4gICNpZmRlZiBDT05G
SUdfREVCVUdfRlMKPiAtCWlmICghSVNfRVJSX09SX05VTEwoeGVuX25ldGJhY2tfZGJnX3Jvb3Qp
KQo+IC0JCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSh4ZW5fbmV0YmFja19kYmdfcm9vdCk7Cj4g
KwlkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoeGVuX25ldGJhY2tfZGJnX3Jvb3QpOwo+ICAjZW5k
aWYgLyogQ09ORklHX0RFQlVHX0ZTICovCj4gIAl4ZW52aWZfeGVuYnVzX2ZpbmkoKTsKPiAgfQo+
IC0tCj4gMS43LjEyLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
