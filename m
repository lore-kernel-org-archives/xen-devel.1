From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Mon, 29 Apr 2019 12:03:39 +0100
Message-ID: <e6438cbc-fb39-56d3-8aa0-7762eaad8642@arm.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
 <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
 <CABHD4K_XCtRbVX17L3v2JbV5NcGwLZd7Medc-qdg=23Z=rtLdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL44W-00068U-4b
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:03:44 +0000
In-Reply-To: <CABHD4K_XCtRbVX17L3v2JbV5NcGwLZd7Medc-qdg=23Z=rtLdw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDQvMjAxOSAxMTo1MiwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKCkhpLAoKPj4K
Pj4gVGhlIHByb3BlciB3YXkgaXMgdG8gZGV0ZWN0IFBQSSBiZWZvcmUgaGFuZCBhbmQgY29tcGxl
dGVseSBza2lwIHRoZSBub2RlIGlmIGFueS4KPiAKPiBJIHRyaWVkIHRoZSBmb2xsb3dpbmcgY2hh
bmdlOgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCBkOTgzNjc3Li5hOWVjZmVkIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+IEBAIC0xMzUzLDcgKzEzNTMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBo
YW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLAo+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
Cj4gICAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPiAgICAgICB9Owo+ICAgICAgIHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqY2hpbGQ7Cj4gLSAgICBpbnQgcmVzOwo+ICsgICAgaW50IHJlcywg
aXJxX2lkOwo+ICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4gICAgICAgY29uc3QgY2hhciAqcGF0
aDsKPiAKPiBAQCAtMTM5OSw2ICsxMzk5LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9u
b2RlKHN0cnVjdCBkb21haW4gKmQsCj4gc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gICAgICAgfQo+IAo+ICsgICAgLypTa2lwIHRoZSBub2RlLCB1c2lu
ZyBQUEkgc291cmNlICovCj4gKyAgICBpcnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5vZGUsIDAp
OwoKVGhhdCdzIG9ubHkgY292ZXIgdGhlIGZpcnN0IGludGVycnVwdCBvZiBhIGRldmljZS4gV2hh
dCBpZiB0aGUgZmlyc3QgaW50ZXJydXB0IAppcyBhbiBTUEkgYnV0IGFsbCB0aGUgb3RoZXIgYXJl
IGFjdHVhbGx5IFBQSXM/CgpJbiBvcmRlciB0byBibGFjayBhbGwgZGV2aWNlcyB1c2luZyBQUEks
IHdlIG5lZWQgdG8gZ28gdGhyb3VnaCAqYWxsKiB0aGUgCmludGVycnVwdHMgb2YgdGhlIGRldmlj
ZS4gT3RoZXJ3aXNlIHlvdSB3aWxsIG1pc3Mgc29tZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
