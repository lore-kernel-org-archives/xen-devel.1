From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: improve a few state load checks
Date: Mon, 16 Jul 2018 15:07:41 +0100
Message-ID: <80d53b0d-e736-8d5e-f89d-9cbcd20fe9f4@citrix.com>
References: <5B4CA48002000078001D470D@prv1-mh.provo.novell.com>
 <25ec81ac057b4143859e1479bfa32d49@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff4Ae-00038n-TD
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:08:12 +0000
In-Reply-To: <25ec81ac057b4143859e1479bfa32d49@AMSPEX02CL02.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTU6MDUsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9odm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+IEBAIC05NzYs
MTQgKzk3NiwxMyBAQCB1bnNpZ25lZCBsb25nIGh2bV9jcjRfZ3Vlc3RfdmFsaWRfYml0cyhjCj4+
Cj4+ICBzdGF0aWMgaW50IGh2bV9sb2FkX2NwdV9jdHh0KHN0cnVjdCBkb21haW4gKmQsIGh2bV9k
b21haW5fY29udGV4dF90ICpoKQo+PiAgewo+PiAtICAgIGludCB2Y3B1aWQ7Cj4+ICsgICAgdW5z
aWduZWQgaW50IHZjcHVpZCA9IGh2bV9sb2FkX2luc3RhbmNlKGgpOwo+PiAgICAgIHN0cnVjdCB2
Y3B1ICp2Owo+PiAgICAgIHN0cnVjdCBodm1faHdfY3B1IGN0eHQ7Cj4+ICAgICAgc3RydWN0IHNl
Z21lbnRfcmVnaXN0ZXIgc2VnOwo+PiAgICAgIGNvbnN0IGNoYXIgKmVycnN0cjsKPj4KPj4gICAg
ICAvKiBXaGljaCB2Y3B1IGlzIHRoaXM/ICovCj4+IC0gICAgdmNwdWlkID0gaHZtX2xvYWRfaW5z
dGFuY2UoaCk7Cj4+ICAgICAgaWYgKCB2Y3B1aWQgPj0gZC0+bWF4X3ZjcHVzIHx8ICh2ID0gZC0+
dmNwdVt2Y3B1aWRdKSA9PSBOVUxMICkKPiBUaGlzIG9wZW4gY29kZWQgcGF0dGVybjoKPgo+IHZj
cHVpZCA9IGh2bV9sb2FkX2luc3RhbmNlKGgpOwo+IGlmICggdmNwdWlkID49IGQtPm1heF92Y3B1
cyB8fCAodiA9IGQtPnZjcHVbdmNwdWlkXSkgPT0gTlVMTCApCj4geyAuLi4KPgo+IHNlZW1zIHRv
IGJlIHJlcGVhdGVkIGFuIGF3ZnVsIGxvdC4gSXMgaXQgdGltZSwgcGVyaGFwcywgdG8gaW50cm9k
dWNlIGEgaGVscGVyIGZ1bmN0aW9uIHRoYXQgaW5jb3Jwb3JhdGVzIHRoZSBjaGVjaz8KCkluIHNv
bWUgY29waW91cyBmcmVlIHRpbWUgd2hlbiBJIGNhbiBwb3N0IHYyIG9mIG15ICJmaXggbWF4X3Zj
cHVzIgpzZXJpZXMsIGFsbCBvZiB0aGlzIGxvZ2ljIChhbmQgbXVjaCBtb3JlKSB3aWxsIGJlY29t
ZSByZWR1bmRhbnQgYW5kIGdldApjdWxsZWQuCgpJIHJlYWxseSB3b3VsZG4ndCB3YXN0ZSB0aW1l
IHJlLWZhY3RvcmluZyBpdCBhdCB0aGlzIHBvaW50LgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
