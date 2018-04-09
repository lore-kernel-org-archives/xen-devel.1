From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/7] add current_time function to time
 manager
Date: Mon, 9 Apr 2018 10:25:54 +0100
Message-ID: <20180409092554.l24q37srtrsh2z5u@MacBook-Pro-de-Roger.local>
References: <20180404155054.99335-1-wipawel@amazon.de>
 <20180404155054.99335-2-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zyed=g6=citrix.com=prvs=630451c49=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f5T4J-0004tO-54
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 09:26:31 +0000
Content-Disposition: inline
In-Reply-To: <20180404155054.99335-2-wipawel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Cc: semelpaul@gmail.com, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMDM6NTA6NDlQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogd3JvdGU6Cj4gRnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cj4gCj4g
dGhpcyBmdW5jdGlvbiByZXR1cm5zIHRoZSAiZXBvY2giIHRpbWUKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIFNlbWVsIDxwaGVudGV4QGFtYXpvbi5kZT4KPiAKPiBjciBodHRwczovL2NvZGUuYW1h
em9uLmNvbS9yZXZpZXdzL0NSLTc4NjIyNAo+IC0tLQo+ICBjb21tb24vdGltZS5jICAgICAgfCAx
NiArKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUveHRmL3RpbWUuaCB8ICA0ICsrKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi90
aW1lLmMgYi9jb21tb24vdGltZS5jCj4gaW5kZXggMTFhYzE2OC4uMzdhOWZhZiAxMDA2NDQKPiAt
LS0gYS9jb21tb24vdGltZS5jCj4gKysrIGIvY29tbW9uL3RpbWUuYwo+IEBAIC03Niw2ICs3Niwy
MiBAQCB1aW50NjRfdCBzaW5jZV9ib290X3RpbWUodm9pZCkKPiAgICAgIHJldHVybiBzeXN0ZW1f
dGltZTsKPiAgfQo+ICAKPiArLyogVGhpcyBmdW5jdGlvbiByZXR1cm4gdGhlIGVwb2NoIHRpbWUg
KG51bWJlciBvZiBzZWNvbmRzIGVsYXBzZWQKPiArICogc2luY2UgSnVhbmFyeSAxLCAxOTcwKSAq
Lwo+ICsjaWYgZGVmaW5lZChfX2kzODZfXykKPiArdWludDMyX3QgY3VycmVudF90aW1lKHZvaWQp
Cj4gKyNlbHNlCj4gK3VpbnQ2NF90IGN1cnJlbnRfdGltZSh2b2lkKQo+ICsjZW5kaWYKPiArewo+
ICsjaWYgZGVmaW5lZChfX2kzODZfXykKPiArICAgIHVpbnQzMl90IHNlY29uZHMgPSBzaGFyZWRf
aW5mby53Y19zZWM7Cj4gKyNlbHNlCj4gKyAgICB1aW50NjRfdCBzZWNvbmRzID0gKCh1aW50NjRf
dClzaGFyZWRfaW5mby53Y19zZWNfaGkgPDwgMzIpIHwgc2hhcmVkX2luZm8ud2Nfc2VjOwo+ICsj
ZW5kaWYKPiArICAgIHJldHVybiBzZWNvbmRzICsgKHNpbmNlX2Jvb3RfdGltZSgpIC8gMTAwMDAw
MDAwMCk7CgpZb3UgbmVlZCBiYXJyaWVycyBhbmQgY2hlY2tpbmcgd2NfdmVyc2lvbiwgc2VlOgoK
aHR0cHM6Ly9naXRodWIuY29tL2ZyZWVic2QvZnJlZWJzZC9ibG9iL21hc3Rlci9zeXMveDg2L3g4
Ni9wdmNsb2NrLmMjTDE1NgoKQW5kIGFzIGNvbW1lbnRlZCBpbiBwYXRjaCAxLCBJIHRoaW5rIHlv
dSBzaG91bGQgcmV0dXJuIGEgNjRiaXQgdmFsdWUKcmVnYXJkbGVzcyBvZiB0aGUgYml0bmVzcyBv
ZiB0aGUgYmluYXJ5LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
