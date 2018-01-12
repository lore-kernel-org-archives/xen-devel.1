From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 0/4] x86/xen/efi: Initialize UEFI secure
 boot state during dom0 boot
Date: Fri, 12 Jan 2018 12:24:50 +0100
Message-ID: <20180112112450.GD21705__17103.9724060849$1515756249$gmane$org@olila.local.net-space.pl>
References: <1515507745-17391-1-git-send-email-daniel.kiper@oracle.com>
 <CAKv+Gu-_SHXCkfX5d3R08nW6rc4giR1d4VhDjF8J5miaTfSDow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oszx=eh=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1eZxSW-00078M-8v
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 11:25:16 +0000
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-_SHXCkfX5d3R08nW6rc4giR1d4VhDjF8J5miaTfSDow@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, linux-efi@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

SGkgQXJkLAoKT24gVGh1LCBKYW4gMTEsIDIwMTggYXQgMTI6NTE6MDdQTSArMDAwMCwgQXJkIEJp
ZXNoZXV2ZWwgd3JvdGU6Cj4gT24gOSBKYW51YXJ5IDIwMTggYXQgMTQ6MjIsIERhbmllbCBLaXBl
ciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gSW5pdGlh
bGl6ZSBVRUZJIHNlY3VyZSBib290IHN0YXRlIGR1cmluZyBkb20wIGJvb3QuIE90aGVyd2lzZSB0
aGUga2VybmVsCj4gPiBtYXkgbm90IGV2ZW4ga25vdyB0aGF0IGl0IHJ1bnMgb24gc2VjdXJlIGJv
b3QgZW5hYmxlZCBwbGF0Zm9ybS4KPgo+IEhpIERhbmllbCwKPgo+IEkgbXVzdCBzYXksIEkgYW0g
bm90IHRvbyB0aHJpbGxlZCB3aXRoIHRoZSBhcHByb2FjaCB5b3UgaGF2ZSBjaG9zZW4KPiBoZXJl
LiAjaW5jbHVkaW5nIC5jIGZpbGVzIGluIG90aGVyIC5jIGZpbGVzLCBhbmQgdXNpbmcgI2RlZmlu
ZXMgdG8KPiBvdmVycmlkZSBDIGZ1bmN0aW9ucyBvciBvdGhlciBzdHViIGZ1bmN0aW9uYWxpdHkg
aXMgcmF0aGVyIGZyYWdpbGUuIEluCgpUQkggSSBkbyBub3QgbGlrZSBpdCB0b28uIFNhZGx5IEkg
aGF2ZSBub3QgZmluZCBhIGJldHRlciBzb2x1dGlvbiBmb3IKdGhhdC4gSSB3aXNoIHRvIGF2b2lk
IGNvZGUgZHVwbGljYXRpb24gYXMgbXVjaCBhcyBwb3NzaWJsZSBiZWNhdXNlCm90aGVyd2lzZSBp
dCB3aWxsIGZhbGwgb3V0IG9mIHN5bmMgc29vbmVyIG9yIGxhdGVyICh1c3VhbGx5IHNvb25lciku
ClNpbWlsYXIgdGhpbmcgaGFwcGVuZWQgaW4gZGlmZmVyZW50IHBhcnQgb2YgWGVuIEVGSSBjb2Rl
IGEgZmV3IG1vbnRocyBhZ28uCgo+IHBhcnRpY3VsYXIsIGl0IG1lYW5zIHdlIGhhdmUgdG8gc3Rh
cnQgY2FyaW5nIGFib3V0IG5vdCBicmVha2luZwo+IFhlbi94ODYgY29kZSB3aGVuIG1ha2luZyBt
b2RpZmljYXRpb25zIHRvIHRoZSBFRkkgc3R1YiwgYW5kIHRoYXQgY29kZQo+IGlzIGFscmVhZHkg
ZGlmZmljdWx0IGVub3VnaCB0byBtYWludGFpbiwgZ2l2ZW4gdGhhdCBpdCBpcyBzaGFyZWQKPiBi
ZXR3ZWVuIEFSTSwgYXJtNjQgYW5kIHg4NiwgYW5kIHJ1bnMgZWl0aGVyIGZyb20gdGhlIGRlY29t
cHJlc3NvciBvcgo+IHRoZSBrZXJuZWwgcHJvcGVyIChhcm02NCkgYnV0IGluIHRoZSBjb250ZXh0
IG9mIHRoZSBVRUZJIGZpcm13YXJlLgoKSSB1bmRlcnN0YW5kIHRoYXQuCgo+IE5vbmUgb2YgdGhl
IHN0dWIgY29kZSBjdXJyZW50bHkgcnVucyBpbiBvcmRpbmFyeSBrZXJuZWwgY29udGV4dC4KClll
cC4KCj4gU28gcGxlYXNlLCBjb3VsZCB5b3UgdHJ5IHRvIGZpbmQgYW5vdGhlciB3YXkgdG8gZG8g
dGhpcz8KCkkgYW0gaGFwcHkgdG8gaW1wcm92ZSB0aGUgc2l0dWF0aW9uLCBob3dldmVyLCBJIGFt
IGFmcmFpZCB0aGF0IGl0IGlzCmRpZmZpY3VsdCBoZXJlLiBTdHViIGFuZCBrZXJuZWwgcHJvcGVy
IGFyZSBzZXBhcmF0ZSBlbnRpdGllcyBhbmQgc2ltcGxlCmxpbmtpbmcgZG9lcyBub3Qgd29yay4g
U28sIEl0IHNlZW1zIHRvIG1lIHRoYXQgb25seSBwbGF5IHdpdGggaW5jbHVkZXMKd2lsbCBhbGxv
dyB1cyB0byBub3QgZHVwbGljYXRlIHRoZSBjb2RlLiBIb3dldmVyLCBpZiB5b3UgaGF2ZSBhIGJl
dHRlcgppZGVhIEkgYW0gaGFwcHkgdG8gaW1wbGVtZW50IGl0LgoKRGFuaWVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
