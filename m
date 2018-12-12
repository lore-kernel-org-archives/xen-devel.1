From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 06/16] gic: drop interrupts enabling on
 interrupts processing
Date: Wed, 12 Dec 2018 12:10:12 +0000
Message-ID: <a4cccf69-916a-da33-336a-1519a5455426@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-7-git-send-email-andrii.anisov@gmail.com>
 <8a5794cb-f5f1-1135-0101-2114fa999894@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH0D=OV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gX3LD-00008P-K6
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:10:15 +0000
In-Reply-To: <8a5794cb-f5f1-1135-0101-2114fa999894@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, nd@arm.com, Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyOC8xMS8yMDE4IDIyOjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMjgvMTEv
MjAxOCAyMTozMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gRnJvbTogQW5kcmlpIEFuaXNvdiA8
YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPj4KPj4gVGhpcyByZWR1Y2VzIHRoZSBudW1iZXIgb2Yg
Y29udGV4dCBzd2l0Y2hlcyBpbiBjYXNlIHdlIGhhdmUgYW4KPj4gaW50ZXJydXB0IHN0b3JtLiBX
ZSB3aWxsIHJlYWQgb3V0IGFsbCBvZiB0aG9zZSBpbnRlcnJ1cHQgaW4gdGhlCj4+IGxvb3AgYW55
d2F5Lgo+IAo+IFRoaXMgbmVlZHMgYSBiZXR0ZXIgZXhwbGFuYXRpb24uIFlvdSBtaWdodCB3YW50
IHRvIGhhdmUgYSBsb29rIGF0IHRoZSBkZXRhaWxzIEkgCj4gcHJvdmlkZWQgaW4gYW5vdGhlciBk
aXNjdXNzaW9uLgo+IAo+IEluIGdlbmVyYWwsIEkgd291bGQgbGlrZSBhbnkgY2hhbmdlcyBpbiB0
aGUgdkdJQyB0byBiZSB2ZXJ5IGRldGFpbGVkLiBBcyB0aGV5IAo+IGFyZSB1c3VhbGx5IHN1YmJ0
bGUgaW1wbGljYXRpb24gb24gdGhlIHJlc3Qgb2YgdGhlIGNvZGUgYmFzZS4KClRoaXMgcGF0Y2gg
aXMgc3VpdGFibGUgZm9yIFhlbiA0LjEyIHdpdGggbW9yZSBjb21tZW50cyBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
