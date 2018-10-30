From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 1/1] tools/ocaml: Re-introduce
 Xenctrl.with_intf wrapper
Date: Tue, 30 Oct 2018 16:48:38 +0000
Message-ID: <23512.35686.12194.580031@mariner.uk.xensource.com>
References: <20181030111612.19258-1-christian.lindig@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dpcg=nk=citrix.com=prvs=834417343=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gHXCB-00075L-QS
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:48:47 +0000
In-Reply-To: <20181030111612.19258-1-christian.lindig@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

Q2hyaXN0aWFuIExpbmRpZyB3cml0ZXMgKCJbWGVuLWRldmVsXSBbUEFUQ0ggMS8xXSB0b29scy9v
Y2FtbDogUmUtaW50cm9kdWNlIFhlbmN0cmwud2l0aF9pbnRmIHdyYXBwZXIiKToKPiBDb21taXQg
ODE5NDZhNzNkYzk3NWE3ZGFmZTkwMTdhOGU2MWQxZTY0ZmRiZWRiZiByZW1vdmVkCj4gWGVuY3Ry
bC53aXRoX2ludGYgYmFzZWQgb24gaXRzIHVuZGVzaXJhYmxlIGJlaGF2aW91ciBvZiBvcGVuaW5n
IGFuZAo+IGNsb3NpbmcgYSBYZW5jdHJsIGNvbm5lY3Rpb24gd2l0aCBldmVyeSBpbnZvY2F0aW9u
LiBUaGlzIGNvbW1pdAo+IHJlLWludHJvZHVjZXMgd2l0aF9pbnRmIGJ1dCB3aXRoIGFuIHVwZGF0
ZWQgYmVoYXZpb3VyOiBpdCBtYWludGFpbnMgYQo+IGdsb2JhbCBYZW5jdHJsIGNvbm5lY3Rpb24g
d2hpY2ggaXMgb3BlbmVkIHVwb24gZmlyc3QgdXNhZ2UgYW5kIGtlcHQKPiBvcGVuLiBUaGlzIGhh
bmRsZSBjYW4gYmUgb2J0YWluZWQgYnkgY2xpZW50cyB1c2luZyBuZXcgZnVuY3Rpb25zCj4gZ2V0
X2hhbmRsZSgpIGFuZCBjbG9zZV9oYW5kbGUoKS4KLi4uCj4gK2xldCBoYW5kbGUgPSByZWYgTm9u
ZQo+ICsKPiArbGV0IGdldF9oYW5kbGUgKCkgPSAhaGFuZGxlCj4gKwo+ICtsZXQgY2xvc2VfaGFu
ZGxlICgpID0KPiArCW1hdGNoICFoYW5kbGUgd2l0aAo+ICsJfCBTb21lIGggLT4gaW50ZXJmYWNl
X2Nsb3NlIGgKPiArCXwgTm9uZSAtPiAoKQoKVGhlIHNlbWFudGljcyBvZiBjbG9zZV9oYW5kbGUg
YXJlIHN0cmFuZ2UuICBBZnRlciBpdCBpcyB1c2VkLCBoYW5kbGUKcmVtYWlucyBTb21lIGJ1dCBp
cyBicm9rZW4uCgpJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIGNsb3NlX2hhbmRs
ZSBzZXQgaGFuZGxlIHRvIE5vbmUsCmFuZCB3cml0ZSBpbiB0aGUgZG9jcyB0aGF0IGl0IGlzIGZv
cmJpZGRlbiB0byBjYWxsIGNsb3NlX2hhbmRsZSB3aXRoaW4Kd2l0aF9pbnRmLiAgKFdvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIGRldGVjdCBzdWNoIGEgbWlzdGFrZT8pCgpGb3IgdGhhdCBtYXR0ZXIs
IHdoeSBpcyBjbG9zZV9oYW5kbGUgbmVlZGVkIGF0IGFsbCA/CgpSZWdhcmRzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
