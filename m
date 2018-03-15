From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] xen: xenbus_dev_frontend: Fix
 XS_TRANSACTION_END handling
Date: Thu, 15 Mar 2018 11:33:36 +0100
Message-ID: <3e626882-eac6-12db-9f5e-a75994bbdf2d__8678.32131120867$1521109968$gmane$org@suse.com>
References: <20180315024322.27429-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=t4by=gf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ewQCe-0007oO-Jz
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 10:33:44 +0000
In-Reply-To: <20180315024322.27429-1-simon@invisiblethingslab.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMDM6NDMsIFNpbW9uIEdhaXNlciB3cm90ZToKPiBDb21taXQgZmQ4YWE5MDk1
YTk1ICgieGVuOiBvcHRpbWl6ZSB4ZW5idXMgZHJpdmVyIGZvciBtdWx0aXBsZQo+IGNvbmN1cnJl
bnQgeGVuc3RvcmUgYWNjZXNzZXMiKSBtYWRlIGEgc3VidGxlIGNoYW5nZSB0byB0aGUgc2VtYW50
aWMgb2YKPiB4ZW5idXNfZGV2X3JlcXVlc3RfYW5kX3JlcGx5KCkgYW5kIHhlbmJ1c190cmFuc2Fj
dGlvbl9lbmQoKS4KPiAKPiBCZWZvcmUgb24gYW4gZXJyb3IgcmVzcG9uc2UgdG8gWFNfVFJBTlNB
Q1RJT05fRU5ECj4geGVuYnVzX2Rldl9yZXF1ZXN0X2FuZF9yZXBseSgpIHdvdWxkIG5vdCBkZWNy
ZW1lbnQgdGhlIGFjdGl2ZQo+IHRyYW5zYWN0aW9uIGNvdW50ZXIuIEJ1dCB4ZW5idXNfdHJhbnNh
Y3Rpb25fZW5kKCkgaGFzIGFsd2F5cyBjb3VudGVkIHRoZQo+IHRyYW5zYWN0aW9uIGFzIGZpbmlz
aGVkIHJlZ2FyZGxlc3Mgb2YgdGhlIHJlc3BvbnNlLgo+IAo+IFRoZSBuZXcgYmVoYXZpb3IgaXMg
dGhhdCB4ZW5idXNfZGV2X3JlcXVlc3RfYW5kX3JlcGx5KCkgYW5kCj4geGVuYnVzX3RyYW5zYWN0
aW9uX2VuZCgpIHdpbGwgYWx3YXlzIGNvdW50IHRoZSB0cmFuc2FjdGlvbiBhcyBmaW5pc2hlZAo+
IHJlZ2FyZGxlc3MgdGhlIHJlc3BvbnNlIGNvZGUgKGhhbmRsZWQgaW4geHNfcmVxdWVzdF9leGl0
KCkpLgo+IAo+IEJ1dCB4ZW5idXNfZGV2X2Zyb250ZW5kIHRyaWVzIHRvIGVuZCBhIHRyYW5zYWN0
aW9uIG9uIGNsb3Npbmcgb2YgdGhlCj4gZGV2aWNlIGlmIHRoZSBYU19UUkFOU0FDVElPTl9FTkQg
ZmFpbGVkIGJlZm9yZS4gVHJ5aW5nIHRvIGNsb3NlIHRoZQo+IHRyYW5zYWN0aW9uIHR3aWNlIGNv
cnJ1cHRzIHRoZSByZWZlcmVuY2UgY291bnQuIFNvIGZpeCB0aGlzIGJ5IGFsc28KPiBjb25zaWRl
cmluZyBhIHRyYW5zYWN0aW9uIGNsb3NlZCBpZiB3ZSBoYXZlIHNlbnQgWFNfVFJBTlNBQ1RJT05f
RU5EIG9uY2UKPiByZWdhcmRsZXNzIG9mIHRoZSByZXR1cm4gY29kZS4KPiAKPiBDYzogPHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNC4xMQo+IEZpeGVzOiBmZDhhYTkwOTVhOTUgKCJ4ZW46IG9w
dGltaXplIHhlbmJ1cyBkcml2ZXIgZm9yIG11bHRpcGxlIGNvbmN1cnJlbnQgeGVuc3RvcmUgYWNj
ZXNzZXMiKQo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxldGhp
bmdzbGFiLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
