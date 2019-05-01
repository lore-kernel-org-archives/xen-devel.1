From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 08:53:50 -0600
Message-ID: <CABfawh=Q6iYej3xAEAwwJd=X_HzbU0iLLUTHby=1QDstBZf4QA@mail.gmail.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
 <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLqcz-0005PB-8q
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 14:54:33 +0000
Received: by mail-wr1-f51.google.com with SMTP id k23so1892808wrd.4
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 07:54:28 -0700 (PDT)
In-Reply-To: <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCA4OjIwIEFNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzEvMTkgNDo1OCBQTSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4+PiBJdCBtaWdodCBiZSB3b3J0aCBpbnRyb2R1Y2luZyBhICJzeW5j
IHN0YXRlIGZyb20gaHciIGhvb2sgd2hpY2ggY29sbGVjdHMKPiA+Pj4gYWxsIHRoZSBkYXRhIHdl
IGludGVuZCB0byBwYXNzIHRvIHRoZSBpbnRyb3NwZWN0aW9uIGFnZW50Lgo+ID4+Cj4gPj4gWW91
IG1lYW4gYWRkaW5nIGFub3RoZXIgaHZtIGhvb2s/Cj4gPgo+ID4gQWN0dWFsbHksIGluc3RlYWQg
b2YgYW5vdGhlciBob29rIEkgdGhpbmsgd2hhdCB3b3VsZCBtYWtlIHNlbnNlIGl0IHRvCj4gPiBq
dXN0IHVwZGF0ZSB2bXhfc2F2ZV92bWNzX2N0eHQgdG8gYXV0b21hdGljYWxseSByZWZyZXNoIHRo
ZSBjYWNoZWQKPiA+IHJlZ2lzdGVyIHZhbHVlcyB3aGVuIGl0J3MgY2FsbGVkIHdpdGggInYgPT0g
Y3VycmVudCIuIFRob3VnaHRzPwo+Cj4gVGhhdCdzIHByb2JhYmx5IHRoZSBiZXR0ZXIgd2F5IHRv
IGdvIGFib3V0IGl0LCBzaW5jZSBvdGhlcndpc2UgdGhlCj4geGNfaHZtX2dldGNvbnRleHRfcGFy
dGlhbCgpIGh5cGVyY2FsbCB3aWxsIHN1ZmZlciBmcm9tIHRoZSBzYW1lIHByb2JsZW0uCj4gKHRo
ZXJlIGFyZSB0d28gd2F5cyBvZiBnZXR0aW5nIGd1ZXN0IHN0YXRlOiBvbmUgaXMgdmlhIHRoZSB2
bV9ldmVudAo+IGNhY2hlZCB2YWx1ZXMsIHRoZSBvdGhlciBpcyB2aWEgdGhlIGFmb3JlbWVudGlv
bmVkIGh5cGVyY2FsbCkuCgpUcnVlLCBhbHRob3VnaCBpc3N1aW5nIHRoZSBoeXBlcmNhbGwgaW4g
dGhlIHZtX2V2ZW50IGNhbGxiYWNrIGlzCmFjdHVhbGx5IGZpbmUgLSB0aGF0J3MgaG93IEkgZm91
bmQgdGhlIGlzc3VlIHRvIGJlZ2luIHdpdGgsIHNpbmNlIHRoZQp2Q1BVIHdpbGwgYmUgc2NoZWR1
bGVkIG91dCB3aXRoIHRoZSBjYWNoZWQgcmVnaXN0ZXJzIHJlZnJlc2hlZCBhbmQKdGh1cyBiZSBk
aWZmZXJlbnQgdGhlbiB3aGF0IHRoZSB2bV9ldmVudCBpdHNlbGYgaGFkLiBCdXQgb3RoZXIgY2Fs
bGVycwpvZiB0aGUgaHlwZXJjYWxsIGNhbiBydW4gaW50byB0aGUgcHJvYmxlbSBpZiB0aGUgZ3Vl
c3QvdmNwdSBpcyBub3QKcGF1c2VkLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
