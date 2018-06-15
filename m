From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [Qemu-devel] [PATCH] compiler: add a sizeof_field()
 macro
Date: Fri, 15 Jun 2018 08:59:34 +0100
Message-ID: <CAJSP0QU2BLvBVgtwSmNzip-7Kf=LzsrvbBjv87D9FLiswH=o0g@mail.gmail.com>
References: <20180614164431.29305-1-stefanha@redhat.com>
 <5768e8f3-eae5-30ef-888a-5e62692c238d@redhat.com>
 <c5c1f362-d51d-df1e-c1dd-f57b64c3f1a1@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rpwp=jb=gmail.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1fTjdx-0000oD-DK
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 07:59:37 +0000
Received: by mail-wm0-x244.google.com with SMTP id r15-v6so2056591wmc.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jun 2018 00:59:36 -0700 (PDT)
In-Reply-To: <c5c1f362-d51d-df1e-c1dd-f57b64c3f1a1@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x@nongnu.org, "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMTQsIDIwMTggYXQgOTozMyBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PGY0YnVnQGFtc2F0Lm9yZz4gd3JvdGU6Cj4gT24gMDYvMTQvMjAxOCAwNDoxNyBQTSwgSm9obiBT
bm93IHdyb3RlOgo+PiBPbiAwNi8xNC8yMDE4IDEyOjQ0IFBNLCBTdGVmYW4gSGFqbm9jemkgd3Jv
dGU6Cj4+PiBEZXRlcm1pbmluZyB0aGUgc2l6ZSBvZiBhIGZpZWxkIGlzIHVzZWZ1bCB3aGVuIHlv
dSBkb24ndCBoYXZlIGEgc3RydWN0Cj4+PiB2YXJpYWJsZSBoYW5keS4gIE9wZW4tY29kaW5nIHRo
aXMgaXMgdWdseS4KPj4+Cj4+PiBUaGlzIHBhdGNoIGFkZHMgdGhlIHNpemVvZl9maWVsZCgpIG1h
Y3JvLCB3aGljaCBpcyBzaW1pbGFyIHRvCj4+PiB0eXBlb2ZfZmllbGQoKS4gIEV4aXN0aW5nIGlu
c3RhbmNlcyBhcmUgdXBkYXRlZCB0byB1c2UgdGhlIG1hY3JvLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KPj4KPj4gSG93J2QgeW91
IGZpbmQgYWxsIHRoZSBleGlzdGluZyBpbnN0YW5jZXM/Cj4KPiBUaGlzIHdvcmtzOgo+Cj4gJCBn
aXQgZ3JlcCAtRSAnc2l6ZW9mLiopMCktPicKClllcywgSSB1c2VkIGEgc2ltaWxhciBncmVwIGNv
bW1hbmQtbGluZS4KCkkgYWxzbyBjaGVja2VkIGZvciAic2l6ZW9mLiopTlVMTCIgYnV0IG5vdGhp
bmcgdXNlcyB0aGF0IHN5bnRheC4KClN0ZWZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
