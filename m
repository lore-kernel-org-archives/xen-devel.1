From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 17:19:14 +0300
Message-ID: <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WEFG=TB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hLq5b-0002Jz-Dt
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 14:20:03 +0000
In-Reply-To: <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xLzE5IDQ6NTggUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IEl0IG1pZ2h0IGJl
IHdvcnRoIGludHJvZHVjaW5nIGEgInN5bmMgc3RhdGUgZnJvbSBodyIgaG9vayB3aGljaCBjb2xs
ZWN0cwo+Pj4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRvIHRoZSBpbnRyb3NwZWN0
aW9uIGFnZW50Lgo+Pgo+PiBZb3UgbWVhbiBhZGRpbmcgYW5vdGhlciBodm0gaG9vaz8KPiAKPiBB
Y3R1YWxseSwgaW5zdGVhZCBvZiBhbm90aGVyIGhvb2sgSSB0aGluayB3aGF0IHdvdWxkIG1ha2Ug
c2Vuc2UgaXQgdG8KPiBqdXN0IHVwZGF0ZSB2bXhfc2F2ZV92bWNzX2N0eHQgdG8gYXV0b21hdGlj
YWxseSByZWZyZXNoIHRoZSBjYWNoZWQKPiByZWdpc3RlciB2YWx1ZXMgd2hlbiBpdCdzIGNhbGxl
ZCB3aXRoICJ2ID09IGN1cnJlbnQiLiBUaG91Z2h0cz8KClRoYXQncyBwcm9iYWJseSB0aGUgYmV0
dGVyIHdheSB0byBnbyBhYm91dCBpdCwgc2luY2Ugb3RoZXJ3aXNlIHRoZQp4Y19odm1fZ2V0Y29u
dGV4dF9wYXJ0aWFsKCkgaHlwZXJjYWxsIHdpbGwgc3VmZmVyIGZyb20gdGhlIHNhbWUgcHJvYmxl
bS4KKHRoZXJlIGFyZSB0d28gd2F5cyBvZiBnZXR0aW5nIGd1ZXN0IHN0YXRlOiBvbmUgaXMgdmlh
IHRoZSB2bV9ldmVudApjYWNoZWQgdmFsdWVzLCB0aGUgb3RoZXIgaXMgdmlhIHRoZSBhZm9yZW1l
bnRpb25lZCBoeXBlcmNhbGwpLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
