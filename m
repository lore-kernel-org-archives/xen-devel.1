From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] xen: avoid crash in disable_hotplug_cpu
Date: Fri, 7 Sep 2018 07:15:22 +0200
Message-ID: <a1248fa4-793e-5aef-bd5d-4691d289a114__16277.4472883486$1536297268$gmane$org@suse.com>
References: <20180906063712.28639-1-olaf@aepfle.de>
 <b7306d7f-e827-6556-e1bb-4b934a162e46@oracle.com>
 <20180906223145.37f7009b.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cynw=lv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fy978-0003Jt-H3
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 05:15:26 +0000
In-Reply-To: <20180906223145.37f7009b.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDkvMTggMjI6MzEsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IEFtIFRodSwgNiBTZXAgMjAx
OCAxNDo0NTo1NyAtMDQwMAo+IHNjaHJpZWIgQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT46Cj4gCj4+IE9uIDA5LzA2LzIwMTggMDI6MzcgQU0sIE9sYWYgSGVyaW5n
IHdyb3RlOgo+Pj4gVGhlIGNvbW1hbmQgJ3hsIHZjcHUtc2V0IDAgMCcsIGlzc3VlZCBpbiBkb20w
LCB3aWxsIGNyYXNoIGRvbTA6Cj4gCj4+PiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBoYW5kbGVfdmNw
dV9ob3RwbHVnX2V2ZW50IGlzIGNhbGxlZCB0d2ljZS4gSW4gdGhlCj4+PiBmaXJzdCBpdGVyYXRp
b24gY3B1X3ByZXNlbnQgaXMgc3RpbGwgdHJ1ZSwgaW4gdGhlIHNlY29uZCBpdGVyYXRpb24KPj4+
IGNwdV9wcmVzZW50IGlzIGZhbHNlIHdoaWNoIGNhdXNlcyBnZXRfY3B1X2RldmljZSB0byByZXR1
cm4gTlVMTC4KPj4+IEluIGNhc2Ugb2YgY3B1IzAsIGNwdV9vbmxpbmUgaXMgYXBwYXJlbnRseSBh
bHdheXMgdHJ1ZS4KPiAKPj4gSSB0aGluayB3ZSBzaG91bGQgY2hlY2sgYm90aCB0aGlzIGFuZCBu
dW1fb25saW5lX2NwdXMoKSAhPSAwLgo+IAo+IFRoaXMgY2FuIG5vdCBwb3NzaWJseSBoZWxwLiBj
cHUjMCBpcyB0aGUgZmlyc3Qgb25lIHRoYXQgZ29lcyBvZmZsaW5lLgo+IElGIGNwdTBfaG90cGx1
Z2dhYmxlIGlzIGJyb2tlbiwgdGhlbiBvbmx5ICJpZiAoIWNwdSkgcmV0dXJuOyIgY2FuIGhlbHAu
CgpXZSBzaG91bGQgYWRkIHRoZSBYZW4gUFYgZ3Vlc3QgdGVzdCB0byBhcmNoX3JlZ2lzdGVyX2Nw
dSgpIGFuZCBzd2l0Y2gKY3B1MF9ob3RwbHVnZ2FibGUgb2ZmLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
