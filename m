From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/3] xen: xenbus_dev_frontend: Fix
 XS_TRANSACTION_END handling
Date: Wed, 21 Mar 2018 17:13:21 -0400
Message-ID: <a0a062fa-3245-359a-2d1b-0542a1b274d8__32154.0632554845$1521666633$gmane$org@oracle.com>
References: <20180315024322.27429-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvqy=gl=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eyl1A-0004sJ-VL
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 21:11:33 +0000
In-Reply-To: <20180315024322.27429-1-simon@invisiblethingslab.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTQvMjAxOCAxMDo0MyBQTSwgU2ltb24gR2Fpc2VyIHdyb3RlOgo+IENvbW1pdCBmZDhh
YTkwOTVhOTUgKCJ4ZW46IG9wdGltaXplIHhlbmJ1cyBkcml2ZXIgZm9yIG11bHRpcGxlCj4gY29u
Y3VycmVudCB4ZW5zdG9yZSBhY2Nlc3NlcyIpIG1hZGUgYSBzdWJ0bGUgY2hhbmdlIHRvIHRoZSBz
ZW1hbnRpYyBvZgo+IHhlbmJ1c19kZXZfcmVxdWVzdF9hbmRfcmVwbHkoKSBhbmQgeGVuYnVzX3Ry
YW5zYWN0aW9uX2VuZCgpLgo+Cj4gQmVmb3JlIG9uIGFuIGVycm9yIHJlc3BvbnNlIHRvIFhTX1RS
QU5TQUNUSU9OX0VORAo+IHhlbmJ1c19kZXZfcmVxdWVzdF9hbmRfcmVwbHkoKSB3b3VsZCBub3Qg
ZGVjcmVtZW50IHRoZSBhY3RpdmUKPiB0cmFuc2FjdGlvbiBjb3VudGVyLiBCdXQgeGVuYnVzX3Ry
YW5zYWN0aW9uX2VuZCgpIGhhcyBhbHdheXMgY291bnRlZCB0aGUKPiB0cmFuc2FjdGlvbiBhcyBm
aW5pc2hlZCByZWdhcmRsZXNzIG9mIHRoZSByZXNwb25zZS4KPgo+IFRoZSBuZXcgYmVoYXZpb3Ig
aXMgdGhhdCB4ZW5idXNfZGV2X3JlcXVlc3RfYW5kX3JlcGx5KCkgYW5kCj4geGVuYnVzX3RyYW5z
YWN0aW9uX2VuZCgpIHdpbGwgYWx3YXlzIGNvdW50IHRoZSB0cmFuc2FjdGlvbiBhcyBmaW5pc2hl
ZAo+IHJlZ2FyZGxlc3MgdGhlIHJlc3BvbnNlIGNvZGUgKGhhbmRsZWQgaW4geHNfcmVxdWVzdF9l
eGl0KCkpLgo+Cj4gQnV0IHhlbmJ1c19kZXZfZnJvbnRlbmQgdHJpZXMgdG8gZW5kIGEgdHJhbnNh
Y3Rpb24gb24gY2xvc2luZyBvZiB0aGUKPiBkZXZpY2UgaWYgdGhlIFhTX1RSQU5TQUNUSU9OX0VO
RCBmYWlsZWQgYmVmb3JlLiBUcnlpbmcgdG8gY2xvc2UgdGhlCj4gdHJhbnNhY3Rpb24gdHdpY2Ug
Y29ycnVwdHMgdGhlIHJlZmVyZW5jZSBjb3VudC4gU28gZml4IHRoaXMgYnkgYWxzbwo+IGNvbnNp
ZGVyaW5nIGEgdHJhbnNhY3Rpb24gY2xvc2VkIGlmIHdlIGhhdmUgc2VudCBYU19UUkFOU0FDVElP
Tl9FTkQgb25jZQo+IHJlZ2FyZGxlc3Mgb2YgdGhlIHJldHVybiBjb2RlLgo+Cj4gQ2M6IDxzdGFi
bGVAdmdlci5rZXJuZWwub3JnPiAjIDQuMTEKPiBGaXhlczogZmQ4YWE5MDk1YTk1ICgieGVuOiBv
cHRpbWl6ZSB4ZW5idXMgZHJpdmVyIGZvciBtdWx0aXBsZSBjb25jdXJyZW50IHhlbnN0b3JlIGFj
Y2Vzc2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+CgpBcHBsaWVkIHRoZSBzZXJpZXMgdG8gZm9yLWxpbnVzLTQuMTcKCi1ib3Jp
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
