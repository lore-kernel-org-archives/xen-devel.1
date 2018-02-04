From: Denis Obrezkov <denisobrezkov@gmail.com>
Subject: [GSOC] Xen on ARM: create multiple guests from device
	tree
Date: Sun, 4 Feb 2018 09:53:15 +0300
Message-ID: <CAGPpAzWPXbCkAeDr=ktzq6B8CgQs8ftP8hqq=wuk8vxAwCu3Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=1epz=e6=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1eiEAw-00066l-G6
 for xen-devel@lists.xenproject.org; Sun, 04 Feb 2018 06:53:18 +0000
Received: by mail-vk0-x236.google.com with SMTP id g83so15909011vki.4
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2018 22:53:16 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gYWxsLAoKSSB3b3VsZCBsaWtlIHRvIHBhcnRpY2lwYXRlIGluIEdTb0MgMjAxOCB3aXRo
IHRoZSBwcm9qZWN0IFhlbiBvbiBBUk0KcmVsYXRlZCBwcm9qZWN0LiBJIGhhdmUgc29tZSBwcmV2
aW91cyBleHBlcmllbmNlIHdpdGggR1NvQzoKaHR0cHM6Ly9zdW1tZXJvZmNvZGUud2l0aGdvb2ds
ZS5jb20vYXJjaGl2ZS8yMDE3L3Byb2plY3RzLzQ3ODA2MjQ3NDk1MjcwNDAvCgpDb3VsZCB5b3Ug
Z2l2ZSBtZSBtb3JlIGRldGFpbHMgb24gdGhlIHByb2plY3Q/CgpJIGhhdmUgUlBpMyBhbmQgQkJC
IGJvYXJkcywgb3Igc2hvdWxkIHRoaXMgd29yayBiZSBkb25lIGluIGVtdWxhdG9yPwoKLS0gClJl
Z2FyZHMsIERlbmlzIE9icmV6a292CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
