From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] xen-netfront: wait xenbus state change when
 load module manually
Date: Fri, 24 Aug 2018 13:12:52 +0200
Message-ID: <83ad1e3c-5e3b-8b24-430b-13e12b59ae8b__36364.4344536171$1535109106$gmane$org@suse.cz>
References: <20180727095608.25210-1-xiliang@redhat.com>
 <20180729.083040.53901922165497594.davem@davemloft.net>
 <60e93e09-7dc2-d2f6-379d-c1d086aa1f49@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4ds6=lh=gmail.com=jirislaby@srs-us1.protection.inumbo.net>)
 id 1ftA1R-0004nb-MH
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 11:12:57 +0000
Received: by mail-wr1-f68.google.com with SMTP id o37-v6so7162104wrf.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 04:12:56 -0700 (PDT)
In-Reply-To: <60e93e09-7dc2-d2f6-379d-c1d086aa1f49@redhat.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xiao Liang <xiliang@redhat.com>, David Miller <davem@davemloft.net>
Cc: jgross@suse.com, netdev@vger.kernel.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMzAvMjAxOCwgMTA6MTggQU0sIFhpYW8gTGlhbmcgd3JvdGU6Cj4gT24gMDcvMjkvMjAx
OCAxMTozMCBQTSwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+PiBGcm9tOiBYaWFvIExpYW5nIDx4aWxp
YW5nQHJlZGhhdC5jb20+Cj4+IERhdGU6IEZyaSwgMjcgSnVsIDIwMTggMTc6NTY6MDggKzA4MDAK
Pj4KPj4+IEBAIC0xMzMwLDYgKzEzMzEsMTEgQEAgc3RhdGljIHN0cnVjdCBuZXRfZGV2aWNlCj4+
PiAqeGVubmV0X2NyZWF0ZV9kZXYoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKPj4+IMKgwqDC
oMKgwqAgbmV0aWZfY2Fycmllcl9vZmYobmV0ZGV2KTsKPj4+IMKgIMKgwqDCoMKgwqAgeGVuYnVz
X3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlSW5pdGlhbGlzaW5nKTsKPj4+ICvCoMKgwqAg
d2FpdF9ldmVudChtb2R1bGVfbG9hZF9xLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlKGRldi0+b3RoZXJlbmQpICE9Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYZW5idXNTdGF0ZUNsb3NlZCAmJgo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlKGRldi0+b3RoZXJl
bmQpICE9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYZW5idXNTdGF0ZVVua25v
d24pOwo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gbmV0ZGV2Owo+Pj4gwqAgwqDCoCBleGl0Ogo+PiBX
aGF0IHBlcmZvcm1zIHRoZSB3YWtldXBzIHRoYXQgd2lsbCB0cmlnZ2VyIGZvciB0aGlzIHNsZWVw
IHNpdGU/Cj4gSW4gbXkgdW5kZXJzdGFuZGluZywgYmFja2VuZCBsZWF2aW5nIGNsb3NlZC91bmtu
b3cgc3RhdGUgY2FuIHRyaWdnZXIgdGhlCj4gd2FrZXVwcy4gSSBtZWFuIHRvIG1ha2Ugc3VyZSBi
b3RoIHNpZGVzIGFyZSByZWFkeSBmb3IgY3JlYXRpbmcgY29ubmVjdGlvbi4KCldoaWxlIGJhY2tw
b3J0aW5nIHRoaXMgdG8gNC4xMiwgSSB3YXMgc3VycHJpc2VkIGJ5IHRoZSBjb21taXQgdGhlIHNh
bWUKYXMgQm9yaXMgYW5kIERhdmlkLgoKU28gSSBhc3N1bWUgdGhlIGV4cGxhbmF0aW9uIGlzIHRo
YXQgd2FrZV91cF9hbGwgb2YgbW9kdWxlX3VubG9hZF9xIGluCm5ldGJhY2tfY2hhbmdlZCB3YWtl
cyBhbHNvIGFsbCB0aGUgcHJvY2Vzc2VzIHdhaXRpbmcgb24gbW9kdWxlX2xvYWRfcT8KSWYgc28s
IHdoYXQgbWFrZXMgc3VyZSB0aGF0IG1vZHVsZV91bmxvYWRfcSBpcyBxdWV1ZWQgYW5kIHRoZSBw
cm9jZXNzIGlzCnRoZSBzYW1lIGFzIGZvciBtb2R1bGVfbG9hZF9xPwoKVG8gbWUsIGl0IGxvb2tz
IHJhdGhlciBlcnJvci1wcm9uZS4gVW5sZXNzIGl0IGlzIGVycm9uZW91cyBub3csIGF0IGxlYXN0
CmZvciBmdXR1cmUgY2hhbmdlcy4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byB3YWtlIHVwIG1v
ZHVsZV9sb2FkX3EKYWxvbmcgd2l0aCBtb2R1bGVfdW5sb2FkX3EgaW4gbmV0YmFja19jaGFuZ2Vk
PyBPciBkcm9wIG1vZHVsZV9sb2FkX3EKY29tcGxldGVseSBhbmQgdXNlIG9ubHkgbW9kdWxlX3Vu
bG9hZF9xIChpLmUuIGluIHhlbm5ldF9jcmVhdGVfZGV2IHRvbyk/Cgp0aGFua3MsCi0tIApqcwpz
dXNlIGxhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
