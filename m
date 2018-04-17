From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 2/7] xen/pvh: Move PVH entry code out of
 Xen specific tree
Date: Tue, 17 Apr 2018 08:24:19 +0200
Message-ID: <4a68354e-6c97-9c10-e433-22a0f31cb879__25391.753196209$1523946201$gmane$org@suse.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
 <1523920310-27620-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8K2U-0005ET-DS
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 06:24:26 +0000
In-Reply-To: <1523920310-27620-1-git-send-email-maran.wilson@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, pbonzini@redhat.com
Cc: rkrcmar@redhat.com, boris.ostrovsky@oracle.com, gregkh@linuxfoundation.org, linus.walleij@linaro.org, rdunlap@infradead.org, mingo@redhat.com, hpa@zytor.com, tglx@linutronix.de, mchehab@kernel.org, davem@davemloft.net, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMDE6MTEsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBPbmNlIGh5cGVydmlzb3Jz
IG90aGVyIHRoYW4gWGVuIHN0YXJ0IHVzaW5nIHRoZSBQVkggZW50cnkgcG9pbnQgZm9yCj4gc3Rh
cnRpbmcgVk1zLCB3ZSB3b3VsZCBsaWtlIHRoZSBvcHRpb24gb2YgYmVpbmcgYWJsZSB0byBjb21w
aWxlIFBWSCBlbnRyeQo+IGNhcGFibGUga2VybmVscyB3aXRob3V0IGVuYWJsaW5nIENPTkZJR19Y
RU4gYW5kIGFsbCB0aGUgY29kZSB0aGF0IGNvbWVzCj4gYWxvbmcgd2l0aCB0aGF0LiBUbyBhbGxv
dyB0aGF0LCB3ZSBhcmUgbW92aW5nIHRoZSBQVkggY29kZSBvdXQgb2YgWGVuIGFuZAo+IGludG8g
ZmlsZXMgc2l0dGluZyBhdCBhIGhpZ2hlciBsZXZlbCBpbiB0aGUgdHJlZS4KPiAKPiBUaGlzIHBh
dGNoIGlzIG5vdCBpbnRyb2R1Y2luZyBhbnkgY29kZSBvciBmdW5jdGlvbmFsIGNoYW5nZXMsIGp1
c3QgbW92aW5nCj4gZmlsZXMgZnJvbSBvbmUgbG9jYXRpb24gdG8gYW5vdGhlci4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJhbiBXaWxzb24gPG1hcmFuLndpbHNvbkBvcmFjbGUuY29tPgo+IFJldmll
d2VkLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CgpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
