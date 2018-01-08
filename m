From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen-netfront: enable device after manual
 module load
Date: Mon, 8 Jan 2018 10:03:55 -0500
Message-ID: <471397aa-7070-b4fe-991a-f35fa5d3b1f7__300.335096153681$1515423788$gmane$org@oracle.com>
References: <20180105084216.21719-1-otubo@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fog3=ed=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eYYy1-0001x9-Q7
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 15:04:01 +0000
In-Reply-To: <20180105084216.21719-1-otubo@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Otubo <otubo@redhat.com>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, netdev@vger.kernel.org, xen-devel@lists.xenproject.org, vkuznets@redhat.com, mgamal@redhat.com, cavery@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDUvMjAxOCAwMzo0MiBBTSwgRWR1YXJkbyBPdHVibyB3cm90ZToKPiBXaGVuIGxvYWRp
bmcgdGhlIG1vZHVsZSBhZnRlciB1bmxvYWRpbmcgaXQsIHRoZSBuZXR3b3JrIGludGVyZmFjZSB3
b3VsZAo+IG5vdCBiZSBlbmFibGVkIGFuZCB0aHVzIHdvdWxkbid0IGhhdmUgYSBiYWNrZW5kIGNv
dW50ZXJwYXJ0IGFuZCB1bmFibGUKPiB0byBiZSB1c2VkIGJ5IHRoZSBndWVzdC4KPgo+IFRoZSBn
dWVzdCB3b3VsZCBmYWNlIGVycm9ycyBsaWtlOgo+Cj4gICBbcm9vdEBndWVzdCB+XSMgZXRodG9v
bCAtaSBldGgwCj4gICBDYW5ub3QgZ2V0IGRyaXZlciBpbmZvcm1hdGlvbjogTm8gc3VjaCBkZXZp
Y2UKPgo+ICAgW3Jvb3RAZ3Vlc3Qgfl0jIGlmY29uZmlnIGV0aDAKPiAgIGV0aDA6IGVycm9yIGZl
dGNoaW5nIGludGVyZmFjZSBpbmZvcm1hdGlvbjogRGV2aWNlIG5vdCBmb3VuZAo+Cj4gVGhpcyBw
YXRjaCBpbml0aWFsaXplcyB0aGUgc3RhdGUgb2YgdGhlIG5ldGZyb250IGRldmljZSB3aGVuZXZl
ciBpdCBpcwo+IGxvYWRlZCBtYW51YWxseSwgdGhpcyBzdGF0ZSB3b3VsZCBjb21tdW5pY2F0ZSB0
aGUgbmV0YmFjayB0byBjcmVhdGUgaXRzCj4gZGV2aWNlIGFuZCBlc3RhYmxpc2ggdGhlIGNvbm5l
Y3Rpb24gYmV0d2VlbiB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogRWR1YXJkbyBPdHVibyA8b3R1
Ym9AcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJv
dnNreUBvcmFjbGUuY29tPgoKU2hvdWxkIHRoaXMgZ28gdG8gc3RhYmxlIHRyZWVzIGFzIHdlbGw/
CgotYm9yaXMKCj4gLS0tCj4gIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3hlbi1uZXRmcm9udC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKPiBpbmRleCBjNWEz
NDY3MWFiZGEuLjliZDdkZGVlYjZhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0
ZnJvbnQuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCj4gQEAgLTEzMjYsNiAr
MTMyNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgbmV0X2RldmljZSAqeGVubmV0X2NyZWF0ZV9kZXYoc3Ry
dWN0IHhlbmJ1c19kZXZpY2UgKmRldikKPiAgCj4gIAluZXRpZl9jYXJyaWVyX29mZihuZXRkZXYp
Owo+ICAKPiArCXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUluaXRpYWxpc2lu
Zyk7Cj4gIAlyZXR1cm4gbmV0ZGV2Owo+ICAKPiAgIGV4aXQ6CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
