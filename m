From: Julien Grall <julien.grall@arm.com>
Subject: Re: [XEN][ARM64]: Qemu unhandled level 1 translation
 fault and p2m failure
Date: Mon, 14 Jan 2019 17:11:24 +0000
Message-ID: <e341dc16-29ec-951e-8663-61fb8805004e@arm.com>
References: <CAFR-8FESDXiqKt9-jcnCLbhd_nJU24CjgTBWB7vq_oizx0aDzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0cWC=PW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gj5ln-0003pd-J5
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 17:11:27 +0000
In-Reply-To: <CAFR-8FESDXiqKt9-jcnCLbhd_nJU24CjgTBWB7vq_oizx0aDzQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "vikram k.s." <vikram.ks123@gmail.com>, xen-devel@lists.xenproject.org, "Andrushchenko, Oleksandr" <andr2000@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

KCsgU3RlZmFubyBhbmQgT2xla3NhbmRyKQoKT24gMDkvMDEvMjAxOSAwNjo1NCwgdmlrcmFtIGsu
cy4gd3JvdGU6Cj4gSGVsbG8sCgpIZWxsbywKCkkgaGF2ZSBzZWVuIHRoaXMgZS1tYWlsIHBvc3Rl
ZCBhIGNvdXBsZSBvZiB0aW1lcy4gSSB3aWxsIG9ubHkgYW5zd2VyIHRvIHRoaXMgZS1tYWlsLgoK
Rmlyc3Qgb2YgYWxsLCBJIHdvdWxkIHJlY29tbWVuZCB0byBDQyBwZW9wbGUgdGhhdCBtaWdodCBi
ZSBpbnRlcmVzdGVkIHdpdGggdGhlIAp0b3BpYywgc28gdGhlIHRocmVhZCBnZXQgZmxhZ2dlZCBp
biBvdXIgaW5ib3guIE90aGVyd2lzZSwgeW91IG1heSBoYXZlIHRvIHdhaXQgCmxvbmdlciBmb3Ig
YW4gYW5zd2VyLiBEb24ndCB3b3JyeSBpZiB5b3UgZG9uJ3QgZ2V0IHRoZSByaWdodCBwZW9wbGUs
IHRoZXkgd2lsbCAKQ0MgcmVsZXZhbnQgcGVvcGxlLgoKPiAKPiAgICogV2UgYXJlIHVzaW5nIFhF
Ti00LjEyLgoKWGVuIDQuMTIgaXMgbm90IHlldCByZWxlYXNlZC4gU28gd2hhdCBpcyB0aGUgY29t
bWl0IHVzZWQ/Cgo+ICAgKiBMaW51eCA0LjE0IGFzIGRvbTAgYW5kIExpbnV4NC4xOSBhcyBkb21V
LgoKUGxlYXNlIHByb3ZpZGUgbW9yZSBkZXRhaWxzIHN1Y2ggYXMgdGhlIGhhcmR3YXJlIHlvdSB1
c2UsIHRoZSBndWVzdCAKY29uZmlndXJhdGlvbiwgdGhlIGZ1bGwgbG9nIChYZW4gKyBEb20wICsg
RG9tVSkuCgo+IAo+IFdoZW4gZG9tVSBpcyBjcmVhdGUgZ2V0dGluZyBiZWxvdyBsb2cuCj4gcWVt
dS1zeXN0ZW0taTM4WzM0NzhdOiB1bmhhbmRsZWQgbGV2ZWwgMSB0cmFuc2xhdGlvbiBmYXVsdCAo
MTEpIGF0IDB4MDAwMDAwMTAsIAo+IGVzciAweDkyMDAwMDA1LCBpbiBsaWJ4ZW5nbnR0YWIuc28u
MS4yWzdmYWY5Y2QwMDArMzAwMF0KCldoYXQgUFYgZHJpdmVycyBhcmUgeW91IHVzaW5nPwoKPiAK
PiBBbHNvwqAgcDJtIGlzIGZhaWxpbmcgLgo+IChYRU4pIHAybS5jOjE0NTY6IGQydjQ6IGd2aXJ0
X3RvX21hZGRyIGZhaWxlZCB2YT0weGZmZmY4MDAwMWRmYTEwOTAgZmxhZ3M9MHgxIAo+IHBhcj0w
eDgwCgpJIHRoaW5rIHRoaXMgaXMgdW5yZWxhdGVkLCB0aGlzIGlzIG1vcmUgbGlrZWx5IHJlbGF0
ZWQgdG8gS1BUSSBhbmQgYSBrbm93biBpc3N1ZSAKdGhhdCBuZWVkcyB0byBiZSBmaXhlZC4gSXQg
aXMgaW4gbXkgVE9ETyBsaXN0LCBub3Qgc3VyZSB3aGVuIGl0IGlzIGdvaW5nIHRvIGJlIApyZXNv
bHZlZCB0aG91Z2guIEFueSBoZWxwIHdvdWxkIGJlIHdlbGNvbWVkIGhlcmUuCgpCZXN0IHJlZ2Fy
ZHMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
