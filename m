From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/5] xen/vm-event: Cleanup
Date: Mon, 3 Jun 2019 13:25:23 +0100
Message-ID: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXm3y-0002ml-9n
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:27:42 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjYW1lIGFib3V0IGZyb20gcmV2aWV3aW5nIFBldHJlJ3MgIlBlciB2Y3B1IHZtX2V2ZW50
IGNoYW5uZWxzIiB3aGlsZSBzYXQKaW4gYW4gYWlycG9ydCB3aXRoIHBsZW50eSBvZiB0aW1lIHRv
IGtpbGwuICBUaGlzIHN0YXJ0ZWQgd2l0aCBwYXRjaCA0IHRyeWluZwp0byBnZXQgcmlkIG9mIHRo
ZSAiayA9IGkgJSBkLT5tYXhfdmNwdXM7IiBleHByZXNzaW9uLCBidXQgc2VlIHBhdGNoIDQgZm9y
CmZ1cnRoZXIgZGV0YWlscyBvZiB3aHkgaXQgaGFzIHN0YXllZC4KCkV2ZXJ5dGhpbmcgZWxzZSB3
YXMgZWl0aGVyIGFuY2lsbGFyeSBjbGVhbnVwIEkgbm90aWNlZCB3aGlsZSByZXZpZXdpbmcsIG9y
Cmlzc3VlcyB3aGVyZSB3ZXJlIGNvcGllZC9tb3ZlZC9leHRlbmRlZCBkdXJpbmcgdGhlIHNlcmll
cy4KClRoaXMgc2VyaWVzIGNhbiBiZSBvYnRhaW5lZCBpbiBnaXQgZm9ybSBmcm9tOgoKICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvYW5kcmV3Y29vcC94ZW4uZ2l0O2E9
c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3ZtZXZlbnQtY2xlYW51cC12MQoKVGhlcmUgYXJlIG5vIGxh
cmdlIGZ1bmN0aW9uYWwgY2hhbmdlcywgYnV0IGl0IHNob3VsZCBiZSBhIGJldHRlciBiYXNlIHRv
CnJlZmFjdG9yIHRoZSBpbnRlcmZhY2UgZnJvbS4KCkFuZHJldyBDb29wZXIgKDUpOgogIHhlbi92
bS1ldmVudDogRHJvcCB1bnVzZWQgdV9kb21jdGwgcGFyYW1ldGVyIGZyb20gdm1fZXZlbnRfZG9t
Y3RsKCkKICB4ZW4vdm0tZXZlbnQ6IEV4cGFuZCB2bV9ldmVudF8qIHNwaW5sb2NrIG1hY3JvcyBh
bmQgcmVuYW1lIHRoZSBsb2NrCiAgeGVuL3ZtLWV2ZW50OiBSZW1vdmUgdW5uZWNlc3Nhcnkgdm1f
ZXZlbnRfZG9tYWluIGluZGlyZWN0aW9uCiAgeGVuL3ZtLWV2ZW50OiBGaXggaW50ZXJhY3Rpb25z
IHdpdGggdGhlIHZjcHUgbGlzdAogIHhlbi92bS1ldmVudDogTWlzYyBmaXh1cHMKCiB4ZW4vY29t
bW9uL2RvbWN0bC5jICAgICAgICB8ICAgNiArLQogeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAg
fCAxOTkgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCAgICB8ICAgMyArLQogeGVuL2luY2x1ZGUveGVuL3ZtX2V2ZW50
LmggfCAgIDMgKy0KIDQgZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgMTE1IGRlbGV0
aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
