From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH v2 1/2] xen/arm: Add MVEBU UART driver for
 Marvell Armada 3700 SoC
Date: Wed, 4 Apr 2018 23:54:19 +0100
Message-ID: <ca46d0d2-793d-aba5-b59b-6566b7e21d39@arm.com>
References: <1522763375-13177-1-git-send-email-amittomer25@gmail.com>
 <1522763375-13177-2-git-send-email-amittomer25@gmail.com>
 <4a16edf6-5c9f-ec2d-7954-10259e1b53fd@arm.com>
 <CABHD4K8-0PUm5kKq8pA8aFGKeyGVD7zjEX+e5Uaq2VU8=MBP2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dcal=gz=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1f3rIR-00038l-9D
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 22:54:27 +0000
In-Reply-To: <CABHD4K8-0PUm5kKq8pA8aFGKeyGVD7zjEX+e5Uaq2VU8=MBP2g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, tim@xen.org, ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDQvMTggMjM6MjUsIEFtaXQgVG9tZXIgd3JvdGU6Cj4gSGksCj4gCj4+IEp1c3QgYSBu
aXQsIGJ1dCBpdCBtaWdodCBiZSBzbWFydGVyIHRvIGZpcnN0IGNoZWNrIGZvciB0aGUgcmVjZWl2
ZSBJUlEsCj4+IGJlY2F1c2Ugbm90IGhhbmRsaW5nIHRoaXMgbWlnaHQgbG9vc2UgaW5mb3JtYXRp
b24uIFRYIGlzIGxlc3MgY3JpdGljYWwuCj4gCj4gT2ssIGFjdHVhbGx5IHRyaWVkIGl0IGVhbGll
ciB3aGVuICBJIHdhcyBkZWJ1Z2dpbmcgdGhlIFJ4IHBhdGggaXNzdWUgYW5kCj4gdGhhdCB0aW1l
IGl0IGRpZG4ndCB3b3JrLiBNYXkgYmUgSSBzaG91bGQgdHJ5IGl0IGFnYWluLgo+IAo+IAo+PiBT
aW1pbGFyIHRvIHRoZSBlYXJseXByaW50ayBiZWhhdmlvdXIgd2UgYXJlIGEgYml0IHBlc3NpbWlz
dGljIGhlcmUuIEkKPj4gZG9uJ3Qga25vdyBpZiB0aGVyZSBpcyBhIHdheSB0byBkZXRlcm1pbmUg
dGhlIG51bWJlciBvZiBmcmVlIGNoYXJhY3RlcnMKPj4gaW4gdGhlIEZJRk8sIGJ1dCB3ZSBjb3Vs
ZCBhdCBsZWFzdCByZXR1cm4gMSBpZiB0aGUgRklGTyBpcyBub3QgZnVsbDoKPj4KPj4gICAgICAg
ICBpZiAoZmlmb19lbXB0eSkKPj4gICAgICAgICAgICAgICAgIHJldHVybiBGSUZPX1NJWkU7Cj4+
ICAgICAgICAgaWYgKCFmaWZvX2Z1bGwpCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gMTsKPj4g
ICAgICAgICByZXR1cm4gMDsKPiAKPiBZZWFoLCBJIHRob3VnaHQgb2YgaXQgaW5pdGlhbGx5IGxp
a2Ugc2hvdWxkIHdlIGFsc28gcmV0dXJuIGhhbGYgdGhlCj4gc2l6ZSBvZiBGSUZPKDE2KSB3aGVu
IFNUQVRfVFhfRklGT19IRkwgYml0IGlzIHNldCA/CgpBaCB5ZXMsIGlmIHRoYXQgd29ya3MsIHdl
IHNob3VsZC4gVGhhdCBiaXQgaXMgZnJvbSB0aGUgTGludXggQlNQLCBpc24ndCBpdD8KCkNoZWVy
cywKQW5kcmUuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
