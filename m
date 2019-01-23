From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH 1/3] treewide: Lift switch variables out of
 switches
Date: Wed, 23 Jan 2019 06:21:44 -0700
Message-ID: <536BB69D-6E93-4E32-8303-16D92E07D8AA__46308.4221164294$1548249788$gmane$org@oracle.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com>
 <CAG48ez2vfXkr9dozJiGmze8k49VOXfs=K7M8bv0aQsDDpzrEFQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IlMb=P7=oracle.com=william.kucharski@srs-us1.protection.inumbo.net>)
 id 1gmITw-0003Mk-KO
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:22:16 +0000
In-Reply-To: <CAG48ez2vfXkr9dozJiGmze8k49VOXfs=K7M8bv0aQsDDpzrEFQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jann Horn <jannh@google.com>
Cc: dev@openvswitch.org, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Linux-MM <linux-mm@kvack.org>, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, intel-wired-lan <intel-wired-lan@lists.osuosl.org>, Network Development <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEphbiAyMywgMjAxOSwgYXQgNTowOSBBTSwgSmFubiBIb3JuIDxqYW5uaEBnb29nbGUu
Y29tPiB3cm90ZToKPiAKPiBBRkFJQ1MgdGhpcyBvbmx5IGFwcGxpZXMgdG8gc3dpdGNoIHN0YXRl
bWVudHMgKGJlY2F1c2UgdGhleSBqdW1wIHRvIGEKPiBjYXNlIGFuZCBkb24ndCBleGVjdXRlIHN0
dWZmIGF0IHRoZSBzdGFydCBvZiB0aGUgYmxvY2spLCBub3QgYmxvY2tzCj4gYWZ0ZXIgaWYvd2hp
bGUvLi4uIC4KCkl0IGJvdGhlcnMgbWUgdGhhdCB3ZSBhcmUgZ29pbmcgb3V0IG9mIG91ciB3YXkg
dG8gZGVwcmVjYXRlIHZhbGlkIEMgY29uc3RydWN0cwppbiBmYXZvciBvZiBwbGFjaW5nIHRoZSBk
ZWNsYXJhdGlvbnMgZWxzZXdoZXJlLgoKQXMgY3VycmVudCBjb21waWxlciB3YXJuaW5ncyB3b3Vs
ZCBjYXRjaCBhbnkgcmVmZXJlbmNlIGJlZm9yZSBpbml0aWFsaXphdGlvbgp1c2FnZSBhbnl3YXks
IGl0IHNlZW1zIGxpa2Ugd2UgYXJlIGxldHRpbmcgYSBjb21waWxlciB3YXJuaW5nIHJhdGhlciB0
aGFuIHRoZQpsYW5ndWFnZSBzdGFuZGFyZCBkaWN0YXRlIHN5bnRheC4KCkNlcnRhaW5seSBpZiB3
ZSB3YW50IHRvIG1ha2UgaXQgYSBiZXN0IHByYWN0aWNlIGNvZGluZyBzdHlsZSBpc3N1ZSB3ZSBj
YW4sIGFuZAp0aGVuIGFuIGFwcHJvcHJpYXRlIG5vdGUgZXhwbGFpbmluZyB3aHkgc2hvdWxkIGJl
IGFkZGVkIHRvCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
