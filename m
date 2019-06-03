From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 4/5] xen/vm-event: Fix interactions with the
 vcpu list
Date: Mon, 3 Jun 2019 17:56:54 +0300
Message-ID: <b9456f0c-af8c-a4de-73e0-db4a69240c3a@bitdefender.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXoOT-0002l7-Qa
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:57:01 +0000
In-Reply-To: <1559564728-17167-5-git-send-email-andrew.cooper3@citrix.com>
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

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gdm1fZXZlbnRfcmVzdW1l
KCkgc2hvdWxkIHVzZSBkb21haW5fdmNwdSgpLCByYXRoZXIgdGhhbiBvcGVuY29kaW5nIGl0Cj4g
d2l0aG91dCBpdHMgU3BlY3RyZSB2MSBzYWZldHkuCj4gCj4gdm1fZXZlbnRfd2FrZV9ibG9ja2Vk
KCkgY2FuJ3QgZXZlciBiZSBpbnZva2VkIGluIGEgY2FzZSB3aGVyZSBkLT52Y3B1IGlzCj4gTlVM
TCwgc28gZHJvcCB0aGUgb3V0ZXIgaWYoKSBhbmQgcmVpbmRlbnQsIGZpeGluZyB1cCBzdHlsZSBp
c3N1ZXMuCj4gCj4gVGhlIGNvbW1lbnQsIHdoaWNoIGlzIGxlZnQgYWxvbmUsIGlzIGZhbHNlLiAg
VGhpcyBhbGdvcml0aG0gc3RpbGwgaGFzCj4gc3RhcnZhdGlvbiBpc3N1ZXMgd2hlbiB0aGVyZSBp
cyBhbiBhc3ltZXRyaWMgcmF0ZSBvZiBnZW5lcmF0ZWQgZXZlbnRzLgo+IAo+IEhvd2V2ZXIsIHRo
ZSBleGlzdGluZyBsb2dpYyBpcyBzdWZmaWNpZW50bHkgY29tcGxpY2F0ZWQgYW5kIGZyYWdpbGUg
dGhhdAo+IEkgZG9uJ3QgdGhpbmsgSSd2ZSBmb2xsb3dlZCBpdCBmdWxseSwgYW5kIGJlY2F1c2Ug
d2UncmUgdHJ5aW5nIHRvCj4gb2Jzb2xldGUgdGhpcyBpbnRlcmZhY2UsIHRoZSBzYWZlc3QgY291
cnNlIG9mIGFjdGlvbiBpcyB0byBsZWF2ZSBpdAo+IGFsb25lLCByYXRoZXIgdGhhbiB0byBlbmQg
dXAgbWFraW5nIHRoaW5ncyBzdWJ0bHkgZGlmZmVyZW50Lgo+IAo+IFRoZXJlZm9yZSwgbm8gcHJh
Y3RpY2FsIGNoYW5nZSB0aGF0IGNhbGxlcnMgd291bGQgbm90aWNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXI8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
