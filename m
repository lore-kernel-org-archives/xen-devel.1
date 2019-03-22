From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Input: xen-kbdfront - signal the backend
 that we disconnect
Date: Fri, 22 Mar 2019 12:03:02 +0100
Message-ID: <32add426-ae36-ecc9-aa3e-6169fe04f231__8679.70374399505$1553252654$gmane$org@suse.com>
References: <20190315092348.32613-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h7Hx4-0003hp-2t
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 11:03:06 +0000
In-Reply-To: <20190315092348.32613-1-andr2000@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, boris.ostrovsky@oracle.com
Cc: Volodymyr_Babchuk@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDoyMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+IAo+IFdoaWxlIGRpc2Nvbm5lY3RpbmcgZnJvbSB0aGUgYmFja2VuZCB3ZSBjbGVhbiB1
cCBzaGFyZWQgcmVzb3VyY2VzCj4gKGV2ZW50IGNoYW5uZWwsIHJpbmcgYnVmZmVyKSwgYnV0IG5l
dmVyIGxldCB0aGUgYmFja2VuZCBrbm93IGFib3V0Cj4gdGhhdC4gVGhpcyBtYXkgbGVhZCB0byBp
bmNvbnNpc3RlbnQgYmFja2VuZCBzdGF0ZSBhbmQvb3Igc2hhcmVkCj4gcmVzb3VyY2VzIHVzZS4K
PiBGaXggdGhpcyBieSBleHBsaWNpdGx5IGxldHRpbmcgdGhlIGJhY2tlbmQga25vdyB0aGF0IGZy
b250ZW5kIGhhcwo+IGRlc3Ryb3llZCBzaGFyZWQgcmVzb3VyY2VzIGJ5IGNoYW5naW5nIGl0cyBY
ZW4gYnVzIHN0YXRlIGFjY29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbWlzYy94
ZW4ta2JkZnJvbnQuYyBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJvbnQuYwo+IGluZGV4
IDI0YmM1YzVkODc2Zi4uZWNiNmU3MTllMGUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW5wdXQv
bWlzYy94ZW4ta2JkZnJvbnQuYwo+ICsrKyBiL2RyaXZlcnMvaW5wdXQvbWlzYy94ZW4ta2JkZnJv
bnQuYwo+IEBAIC00ODgsNiArNDg4LDggQEAgc3RhdGljIGludCB4ZW5rYmRfY29ubmVjdF9iYWNr
ZW5kKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCj4gIAo+ICBzdGF0aWMgdm9pZCB4ZW5rYmRf
ZGlzY29ubmVjdF9iYWNrZW5kKHN0cnVjdCB4ZW5rYmRfaW5mbyAqaW5mbykKPiAgewo+ICsJeGVu
YnVzX3N3aXRjaF9zdGF0ZShpbmZvLT54YmRldiwgWGVuYnVzU3RhdGVDbG9zaW5nKTsKPiArCj4g
IAlpZiAoaW5mby0+aXJxID49IDApCj4gIAkJdW5iaW5kX2Zyb21faXJxaGFuZGxlcihpbmZvLT5p
cnEsIGluZm8pOwo+ICAJaW5mby0+aXJxID0gLTE7Cj4gCgpBcyBhbHJlYWR5IHN0YXRlZCBmb3Ig
dGhlIHJlbGF0ZWQgbmV0ZnJvbnQgcGF0Y2g6IEknbSBub3Qgc3VyZSB0aGlzCmlzIHJlYWxseSB3
aGF0IHdlIHdhbnQuIEhhdmUgeW91IHRlc3RlZCB4bCBzYXZlL3Jlc3RvcmUgb3IgbWlncmF0aW9u
Cm9mIHRoZSBndWVzdCB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZD8KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
