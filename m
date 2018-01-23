From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 2/8] xen/bitops: Rename LOG_2 to ilog2
Date: Tue, 23 Jan 2018 12:17:21 +0000
Message-ID: <c1391f54-d621-0383-2ef5-1c048c70a460@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-3-sameer.goel@linaro.org>
 <20180123113952.dh6khwrkwg5zcupe@MacBook-Pro-de-Roger.local>
 <7038aee6-5ccf-c026-3e4e-c5af67679907@linaro.org>
 <20180123121052.pnfoypksdbjds3hf@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jwx3=es=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1edxX4-0007mZ-7I
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 12:18:30 +0000
Received: by mail-wm0-f68.google.com with SMTP id 143so1399206wma.5
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2018 04:18:24 -0800 (PST)
In-Reply-To: <20180123121052.pnfoypksdbjds3hf@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: sstabellini@kernel.org, mjaggi@caviumnetworks.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, julien.grall@arm.com, jbeulich@suse.com, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpPbiAyMy8wMS8xOCAxMjoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBP
biBUdWUsIEphbiAyMywgMjAxOCBhdCAxMTo0NDozMEFNICswMDAwLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4+IEhpIFJvZ2VyLAo+Pgo+PiBPbiAyMy8wMS8xOCAxMTozOSwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4+IE9uIE1vbiwgRGVjIDE4LCAyMDE3IGF0IDA4OjE2OjU3UE0gLTA3MDAsIFNh
bWVlciBHb2VsIHdyb3RlOgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vYml0b3Bz
LmggYi94ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgKPj4+PiBpbmRleCBlMjAxOWIwMmEzLi5hMTAz
ZTQ5MDg5IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaAo+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaAo+Pj4+IEBAIC0yMjMsNyArMjIzLDcgQEAgc3Rh
dGljIGlubGluZSBfX3UzMiByb3IzMihfX3UzMiB3b3JkLCB1bnNpZ25lZCBpbnQgc2hpZnQpCj4+
Pj4gICAgI2RlZmluZSBfX0w0KF94KSAgKCgoX3gpICYgMHgwMDAwMDAwYykgPyAoIDIgKyBfX0wy
KCAoX3gpPj4gMikpIDogX19MMiggX3gpKQo+Pj4+ICAgICNkZWZpbmUgX19MOChfeCkgICgoKF94
KSAmIDB4MDAwMDAwZjApID8gKCA0ICsgX19MNCggKF94KT4+IDQpKSA6IF9fTDQoIF94KSkKPj4+
PiAgICAjZGVmaW5lIF9fTDE2KF94KSAoKChfeCkgJiAweDAwMDBmZjAwKSA/ICggOCArIF9fTDgo
IChfeCk+PiA4KSkgOiBfX0w4KCBfeCkpCj4+Pj4gLSNkZWZpbmUgTE9HXzIoX3gpICgoKF94KSAm
IDB4ZmZmZjAwMDApID8gKDE2ICsgX19MMTYoKF94KT4+MTYpKSA6IF9fTDE2KF94KSkKPj4+PiAr
I2RlZmluZSBpbG9nMihfeCkgKCgoX3gpICYgMHhmZmZmMDAwMCkgPyAoMTYgKyBfX0wxNigoX3gp
Pj4xNikpIDogX19MMTYoX3gpKQo+Pj4KPj4+IEVyLCB3aHkgbm90IGFkZCBhOgo+Pj4KPj4+ICNk
ZWZpbmUgaWxvZzIgTE9HXzIKPj4+Cj4+PiBPbiB0aGUgY29kZSB0aGF0IHlvdSBoYXZlIHRvIGlt
cG9ydD8KPj4KPj4gVGhlcmUgaXMgZXhhY3RseSBvbiBjYWxsZXIgb2YgTE9HXzIuIFNvIHdoYXQg
aXMgdGhlIGJlbmVmaXRzIHRvIHByb3ZpZGUgMgo+PiBuYW1lcz8gTW9yZSB0aGF0IEkgd291bGQg
ZXhwZWN0IGlsb2cyIHRvIGJlIHVzZWQgaW4gYW55IGNvZGUgY29taW5nIGZyb20KPj4gTGludXgu
Cj4gCj4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgYmUgcmVuYW1pbmcgbWFjcm9zIGp1c3QgYmVj
YXVzZSB3ZSB3YW50IHRvCj4gaW1wb3J0IHZlcmJhdGltIGNvZGUgZnJvbSBMaW51eCBvciBhbnl3
aGVyZSBlbHNlLCBJIHdvdWxkIHJhdGhlciBhZGQgYQo+IGxpbnV4a3BpLmggb3Igc2ltaWxhciBp
biBvcmRlciB0byBkbyB0aGUgdHJhbnNsYXRpb24sIGJ1dCB0aGF0J3MganVzdAo+IG15IG9waW5p
b24uCgpJIHdvdWxkIGhhdmUgYWdyZWVkIGlmIHRoZXJlIHdhcyAxMC0zMCBjYWxsc2l0ZSBpbiBY
ZW4gY29kZS4gRm9yIDEgCmNhbGxzaXRlIGl0IHNvdW5kcyBsaWtlIGEgYml0IG92ZXJraWxsIHRv
IHJlcXVlc3QgdG8gaGF2ZSAyIGRpZmZlcmVudCAKbmFtZS4gWW91IGNhbiBzZWUgdGhpcyBhcyBy
ZW5hbWluZyB2ZXJ5IHNpbWlsYXIgdG8gc2VyaWVzIHRoYXQgcmVuYW1lIGZpZWxkLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
