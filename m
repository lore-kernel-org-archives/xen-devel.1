From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 3/5] xen/vm-event: Remove unnecessary
 vm_event_domain indirection
Date: Mon, 3 Jun 2019 17:31:53 +0300
Message-ID: <9b0878cc-df5b-3bb5-d5de-9a3046d7b979@bitdefender.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXo0H-0000Hl-Of
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:32:01 +0000
In-Reply-To: <1559564728-17167-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIHVzZSBvZiAoKnZl
ZCktPiBsZWFkcyB0byBwb29yIGNvZGUgZ2VuZXJhdGlvbiwgYXMgdGhlIGNvbXBpbGVyIGNhbid0
Cj4gYXNzdW1lIHRoZSBwb2ludGVyIGhhc24ndCBjaGFuZ2VkLCBhbmQgcmVzdWx0cyBpbiBoYXJk
LXRvLWZvbGxvdyBjb2RlLgo+IAo+IEZvciBib3RoIHZtX2V2ZW50X3tlbixkaXN9YWJsZSgpLCBy
ZW5hbWUgdGhlIHZlZCBwYXJhbWV0ZXIgdG8gcF92ZWQsIGFuZAo+IHdvcmsgcHJpbWFyaWx5IHdp
dGggYSBsb2NhbCB2ZWQgcG9pbnRlci4KPiAKPiBUaGlzIGhhcyBhIGtleSBhZHZhbnRhZ2UgaW4g
dm1fZXZlbnRfZW5hYmxlKCksIGluIHRoYXQgdGhlIHBhcnRpYWxseQo+IGNvbnN0cnVjdGVkIHZt
X2V2ZW50X2RvbWFpbiBvbmx5IGJlY29tZXMgZ2xvYmFsbHkgdmlzaWJsZSBvbmNlIGl0IGlzCj4g
ZnVsbHkgY29uc3RydWN0ZWQuICBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgc3BpbmxvY2sgZG9lc24n
dCBuZWVkIGhvbGRpbmcuCj4gCj4gRnVydGhlcm1vcmUsIHJlYXJyYW5nZSB0aGUgb3JkZXIgb2Yg
b3BlcmF0aW9ucyB0byBiZSBtb3JlIHNlbnNpYmxlLgo+IENoZWNrIGZvciByZXBlYXRlZCBlbmFi
bGVzIGFuZCBhbiBiYWQgSFZNX1BBUkFNIGJlZm9yZSBhbGxvY2F0aW5nCj4gbWVtb3J5LCBhbmQg
Z2F0aGVyIHRoZSB0cml2aWFsIHNldHVwIGludG8gb25lIHBsYWNlLCBkcm9wcGluZyB0aGUKPiBy
ZWR1bmRhbnQgemVyb2luZy4KPiAKPiBObyBwcmFjdGljYWwgY2hhbmdlIHRoYXQgY2FsbGVycyB3
aWxsIG5vdGljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
