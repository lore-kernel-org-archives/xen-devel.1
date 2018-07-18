From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/4] xen: move pv irq related functions
 under CONFIG_XEN_PV umbrella
Date: Wed, 18 Jul 2018 06:57:11 +0200
Message-ID: <f9b5fb9a-0092-bcab-93c2-20e36d53c3f2__4238.03168018839$1531889787$gmane$org@suse.com>
References: <20180717120113.12756-1-jgross@suse.com>
 <20180717120113.12756-2-jgross@suse.com>
 <f2907905-fddd-8397-e460-09e9070fdd16@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wq/s=kc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ffeWZ-0004lk-S5
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 04:57:15 +0000
In-Reply-To: <f2907905-fddd-8397-e460-09e9070fdd16@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDcvMTggMjE6MTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwNy8xNy8yMDE4
IDA4OjAxIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
eGVuL01ha2VmaWxlIGIvYXJjaC94ODYveGVuL01ha2VmaWxlCj4+IGluZGV4IGQ4M2NiNTQ3OGY1
NC4uZjcyM2I1YWE4Zjc0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni94ZW4vTWFrZWZpbGUKPj4g
KysrIGIvYXJjaC94ODYveGVuL01ha2VmaWxlCj4+IEBAIC0xMiwyNSArMTIsNDYgQEAgZW5kaWYK
PiAKPiAKPj4gIAo+PiAgb2JqLSQoQ09ORklHX1NNUCkJCSs9IHNtcC5vCj4+ICBvYmotJChDT05G
SUdfWEVOX1BWX1NNUCkgIAkrPSBzbXBfcHYubwo+PiAgb2JqLSQoQ09ORklHX1hFTl9QVkhWTV9T
TVApICAJKz0gc21wX2h2bS5vCj4gCj4gCj4gSXMgdGhlcmUgYSByZWFzb24geW91IGRpZCBub3Qg
YWRkIHNwYWNlIGhlcmUgYnV0IGRpZCBhZGQgdGhlbSBiZWxvdz8KCkkgZmVsdCBsaWtlIHRoZSBT
TVAgcmVsYXRlZCBzdHVmZiBzaG91bGQgYmUgaW4gb25lIGdyb3VwLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
