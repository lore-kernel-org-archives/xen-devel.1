From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Thu, 21 Feb 2019 20:53:35 +0200
Message-ID: <52ea302e-20fa-f689-5eec-c40945ae6006@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
 <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
 <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
 <ffc9d12a-0579-bcfd-428b-401524949009@arm.com>
 <0839f3bf-384b-ceb6-4412-677575367387@gmail.com>
 <2ccd6cca-57c0-d9b0-2a82-7459b72ab555@gmail.com>
 <854eb0c4-c5e5-d19f-cc50-ba623d19a24f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BJfP=Q4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gwtTY-0002JQ-4l
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 18:53:40 +0000
Received: by mail-lj1-x244.google.com with SMTP id a17so8599255ljd.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Feb 2019 10:53:38 -0800 (PST)
In-Reply-To: <854eb0c4-c5e5-d19f-cc50-ba623d19a24f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDIxLjAyLjE5IDIwOjQzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+IE9uIDIvMjEvMTkgNjoyMiBQTSwgT2xla3NhbmRyIHdyb3RlOgo+ID0+
Pj4+PiBBY3R1YWxseSwgdGhlIG1haW4gZGlmZmVyZW5jZSBmb3IgdGhlICJlYXJseSBwcmludGsi
IHN1cHBvcnQgaXMgaW4KPj4+Pj4+IHR3byByZWcgb2Zmc2V0czoKPj4+Pj4+Cj4+Pj4+PiArI2Rl
ZmluZSBTQ0lGQV9TQ0FTU1LCoMKgIDB4MTTCoMKgwqAgLyogU2VyaWFsIHN0YXR1cyByZWdpc3Rl
ciAqLwo+Pj4+Pj4gKyNkZWZpbmUgU0NJRkFfU0NBRlREUsKgIDB4MjDCoMKgwqAgLyogVHJhbnNt
aXQgRklGTyBkYXRhIHJlZ2lzdGVyICovCj4+Pj4+Pgo+Pj4+Pj4gKyNkZWZpbmUgU0NJRl9TQ0ZT
UsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDEwwqDCoMKgIC8qIFNlcmlhbCBzdGF0dXMgcmVn
aXN0ZXIgKi8KPj4+Pj4+ICsjZGVmaW5lIFNDSUZfU0NGVERSwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAweDBjwqDCoMKgIC8qIFRyYW5zbWl0IEZJRk8gZGF0YSAKPj4+Pj4+IHJlZ2lzdGVyICovCj4+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEkgYW0gbm90IG1pc3Rha2VuLCB3ZSB3aWxsIGhhdmUgdG8gaW50
cm9kdWNlIHR3byBvcHRpb25zIHRvIGNvdmVyIAo+Pj4+Pj4gdGhpcyBjYXNlLCBhcyB0aGUgb2Zm
c2V0cyBhcmUgbm90IGNvcnJlbGF0ZWQgd2l0aCBlYWNoIG90aGVyLCBubz8KPj4+Pgo+Pj4+IFlv
dSBkb24ndCBuZWVkIHR3byBvcHRpb25zLiBGb3IgaW5zdGFuY2UsIHlvdSBjYW4gb25seSBpbnRy
b2R1Y2UgYW4gCj4+Pj4gb3B0aW9uIFNDSUZfVkVSU0lPTiB0aGF0IHdvdWxkIGJlIDAgZm9yIFND
SUYgYW5kIDYxIChhc2NpaSAnYScpIGZvciAKPj4+PiBTQ0lGQS4KPj4+Pgo+Pj4+IFRoZW4gaW4g
dGhlIGNvZGUsIHlvdSBjYW4gdXNlIFNDSUZfVkVSU0lPTiB0byBkZWNpZGVzIHdoaWNoIHNldHMg
b2YgCj4+Pj4gbWFjcm9zIHlvdSBhcmUgdXNpbmcuCj4+Pgo+Pj4gSSB0aGluayBJIHVuZGVyc3Rh
bmQgdGhlIGlkZWEuIFdpbGwgdHJ5Lgo+Pgo+Pgo+PiBJcyBpdCBzb21ldGhpbmcgeW91IHdvdWxk
IGxpa2UgdG8gc2VlPwo+Cj4gWW91ciBzb2x1dGlvbiBiZWxvdyByZXF1aXJlIHRvIG92ZXJ3cml0
ZSBFQVJMWV9QUklOVEtfSU5DIGFuZCBub3QgdmVyeSAKPiBlYXN5IHRvIGV4dGVuZCBvZiBvdGhl
ciB2ZXJzaW9uIChlLmcgc2NpZmIpLiBBcyBJIHN1Z2dlc3RlZCBlYXJsaWVyLCAKPiB3ZSBjYW4g
aW50cm9kdWNlIGFuIG9wdGlvbiB0aGUgc2FtZSB3YXkgUkVHX1NISUZUIGV4aXN0IGZvciA4MjUw
LiBUaGUgCj4gZGVmaW5pdGlvbiBvZiBDT05GSUdfRUFSTFlfUFJJTlRLIGlzOgo+Cj4gQ09ORklH
X0VBUkxZX1BSSU5USz08SU5DPiw8QkFTRV9BRERSRVNTPiw8T1RIRVJfT1BUSU9OUz4KPgo+IDxP
VEhFUl9PUFRJT05TPiB3b3VsZCBiZSB0aGUgdmVyc2lvbi4gTm90aGluZyBmb3IgU0NJRiBhbmQg
QSBmb3IgU0NGSUEuCj4KPiBUaGVuIGluIFJ1bGVzLm1rLCB5b3Ugd291bGQgaGF2ZSBzb21ldGhp
bmcgbGlrZToKPgo+IGlmbmVxICgkKHdvcmQgMywkKEVBUkxZX1BSSU5US19DRkcpKSwpCj4gQ0ZM
QUdTLXkgKz0gLURDT05GSUdfRUFSTFlfUFJJTlRLX1ZFUlNJT05fJCh3b3JkIDMsICQoRUFSTFlf
UFJJTlRLX0NGRykKPiBlbHNlCj4gQ0ZMQUdTLXkgKz0gLURDT05GSUdfRUFSTFlfUFJJTlRLX1ZF
UlNJT05fTk9ORQo+IGVuZGlmCj4KPiBkZWJ1Zy1zY2lmLmluYyB3b3VsZCB0aGVuIGNvbnRhaW46
Cj4KPiAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5US19WRVJTSU9OX0EKPiAjZGVmaW5lIGZvbwo+
ICNkZWZpbmUgYmFyCj4gI2VsaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5US19WRVJTSU9OX05PTkUK
PiAjZGVmaW5lIGZvbwo+ICNkZWZpbmUgYmFyCj4gI2VuZGlmCj4KPiBUaGUgQ09ORklHX0VBUkxZ
X1BSSU5US19WRVJTSU9OX05PTkUgaXMgaGVyZSB0byBoZWxwIGNhdGNoaW5nIG5ldyAKPiBhZGRp
dGlvbi4gSWYgc29tZW9uZSBpZiB1c2luZyBhIGRpZmZlcmVudCB2ZXJzaW9uLCBpdCB3b3VsZCBu
b3QgY29tcGlsZS4KPiBBbHNvLCB0aGUgY29kZSBpbiBSdWxlcy5tayBpcyBnZW5lcmljIGVub3Vn
aCB0byBleHRlbmQgZm9yIG90aGVyIAo+IHZlcnNpb24gKGUuZyBzY2lmYikuCj4KPiBEb2VzIGl0
IG1ha2Ugc2Vuc2U/CgpBYnNvbHV0ZWx5LiBUaGFuayB5b3UKCgo+Cj4gQ2hlZXJzLAo+Ci0tIApS
ZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
