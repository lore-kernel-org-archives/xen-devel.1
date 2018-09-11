From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] net: xenbus: remove redundant condition
 check before debugfs_remove_recursive
Date: Tue, 11 Sep 2018 08:01:50 +0000
Message-ID: <a2da243c370c4447bd5d0fcc9c2a6fdf__22791.8904544369$1536652837$gmane$org@AMSPEX02CL03.citrite.net>
References: <1536413706-31838-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sdwv=lz=citrix.com=prvs=7852997cf=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fzdcQ-0004Uv-0t
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 08:01:54 +0000
In-Reply-To: <1536413706-31838-1-git-send-email-zhongjiang@huawei.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IHpob25nIGppYW5nIFttYWlsdG86
emhvbmdqaWFuZ0BodWF3ZWkuY29tXQo+IFNlbnQ6IDA4IFNlcHRlbWJlciAyMDE4IDE0OjM1Cj4g
VG86IGRhdmVtQGRhdmVtbG9mdC5uZXQ7IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJp
eC5jb20+OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZwo+IFN1YmplY3Q6IFtQ
QVRDSF0gbmV0OiB4ZW5idXM6IHJlbW92ZSByZWR1bmRhbnQgY29uZGl0aW9uIGNoZWNrIGJlZm9y
ZQo+IGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZQo+IAo+IGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2
ZSBoYXMgdGFrZW4gdGhlIElTX0VSUl9PUl9OVUxMIGludG8gYWNjb3VudC4KPiBKdXN0Cj4gcmVt
b3ZlIHRoZSB1bm5lY2Vzc2FyeSBjb25kaXRpb24gY2hlY2suCj4gCj4gU2lnbmVkLW9mZi1ieTog
emhvbmcgamlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKPiAtLS0KPiAgZHJpdmVycy9uZXQveGVu
LW5ldGJhY2sveGVuYnVzLmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9uZXQveGVuLQo+IG5ldGJhY2sveGVuYnVzLmMKPiBpbmRl
eCBjZDUxNDkyLi5mZTFkNTIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNr
L3hlbmJ1cy5jCj4gKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMKPiBAQCAt
MjU0LDggKzI1NCw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9kZWJ1Z2ZzX2RlbGlmKHN0cnVjdCB4
ZW52aWYgKnZpZikKPiAgCWlmIChJU19FUlJfT1JfTlVMTCh4ZW5fbmV0YmFja19kYmdfcm9vdCkp
Cj4gIAkJcmV0dXJuOwo+IAo+IC0JaWYgKCFJU19FUlJfT1JfTlVMTCh2aWYtPnhlbnZpZl9kYmdf
cm9vdCkpCj4gLQkJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKHZpZi0+eGVudmlmX2RiZ19yb290
KTsKPiArCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSh2aWYtPnhlbnZpZl9kYmdfcm9vdCk7Cj4g
IAl2aWYtPnhlbnZpZl9kYmdfcm9vdCA9IE5VTEw7Cj4gIH0KPiAgI2VuZGlmIC8qIENPTkZJR19E
RUJVR19GUyAqLwo+IC0tCj4gMS43LjEyLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
