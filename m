From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: AMD / SVM vm_event support
Date: Thu, 18 Jan 2018 15:19:42 +0200
Message-ID: <141ad3b5-711f-952c-aa0f-df60d491f364@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpXZSdyZSBsb29raW5nIGF0IHBvdGVudGlhbGx5IHdvcmtpbmcgd2l0aCB2bV9ldmVu
dCBvbiBTVk0gaG9zdHMuIFRvIHRoYXQKZW5kLCB3ZSd2ZSByZW1vdmVkIGEgZmV3IGNwdV9oYXNf
dm14IHRlc3RzIGFuZCBzYXcgdGhhdCBzb21lIHRoaW5ncyBqdXN0CndvcmsuCgpUaGF0IGlzLCB1
bmZvcnR1bmF0ZWx5LCBub3QgdGhlIGNhc2UgZm9yIEVQVCBldmVudHMuCgpUaGVyZSdzIHRoaXMg
b2xkIHRocmVhZCBhYm91dCBOUFQgc3VwcG9ydDoKCmh0dHBzOi8vbGlzdHMuZ3QubmV0L3hlbi9k
ZXZlbC8zMzk1NzEKCmJ1dCBpdCBsb29rcyBsaWtlIG5vdGhpbmcgY2FtZSBvZiBpdC4KCkhhcyB0
aGVyZSBiZWVuIG1vcmUgWGVuIGRldmVsb3BtZW50IHdvcmssIG9yIGF0IGxlYXN0IGRpc2N1c3Np
b24gb24gdGhpcwp0b3BpYyB0aGF0IHdlIGFyZSBub3QgYXdhcmUgb2Y/CgpBcyBmb3IgdGhlIHRo
aW5ncyB0aGF0IGRvIHdvcmssIGFueSBvYmplY3Rpb25zIHRvIHN1Ym1pdHRpbmcgcGF0Y2hlcwp0
aGF0IGFsbG93cyBhbiBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uIHRvIHN1YnNjcmliZSB0byB3
aGF0J3MKYXZhaWxhYmxlIG9uIFNWTSBhcyB3ZWxsLCB3aXRoIHRoZSBwcm9wZXIgY2FwYWJpbGl0
aWVzIHNldCBpbgphcmNoX21vbml0b3JfZ2V0X2NhcGFiaWxpdGllcygpPwoKClRoYW5rcywKUmF6
dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
