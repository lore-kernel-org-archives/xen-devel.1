From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: refuse to set number of vcpus to
 0 via xl vcpu-set
Date: Mon, 3 Sep 2018 14:44:00 +0200
Message-ID: <e5911da7-a4bc-7908-9941-302f5f81de5d@suse.com>
References: <20180903115950.28486-1-jgross@suse.com>
 <5B8D286602000078001E490C@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9gce=lr=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fwoD6-0003oR-AD
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 12:44:04 +0000
In-Reply-To: <5B8D286602000078001E490C@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDkvMTggMTQ6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAzLjA5LjE4IGF0
IDEzOjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEvdG9vbHMveGwveGxfdmNw
dS5jCj4+ICsrKyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwo+PiBAQCAtMzQxLDYgKzM0MSwxMCBAQCBz
dGF0aWMgaW50IHZjcHVzZXQodWludDMyX3QgZG9taWQsIGNvbnN0IGNoYXIqIG5yX3ZjcHVzLCBp
bnQgY2hlY2tfaG9zdCkKPj4gICAgICAgICAgZnByaW50ZihzdGRlcnIsICJFcnJvcjogSW52YWxp
ZCBhcmd1bWVudC5cbiIpOwo+PiAgICAgICAgICByZXR1cm4gMTsKPj4gICAgICB9Cj4+ICsgICAg
aWYgKG5yX3ZjcHVzID09IDApIHsKPj4gKyAgICAgICAgZnByaW50ZihzdGRlcnIsICJFcnJvcjog
U2V0dGluZyBudW1iZXIgb2YgdmNwdXMgdG8gMCBpc24ndCBhbGxvd2VkLlxuIik7Cj4+ICsgICAg
ICAgIHJldHVybiAxOwo+PiArICAgIH0KPiAKPiBUaGlzIG1lc3NhZ2UgaXMgbGlhYmxlIHRvIGJl
IGNvbmZ1c2luZyB3aGVuIHRoZSBzdHJpbmcgcGFzc2VkIGluCj4gcmVwcmVzZW50cyBhIG5vbi16
ZXJvIG51bWJlciB3aGljaCwgd2hlbiBjb252ZXJ0ZWQgdG8KPiB1bnNpZ25lZCBpbnQsIHlpZWxk
cyB6ZXJvLiBJIHRoaW5rIG1vcmUgdGhvcm91Z2ggaW5wdXQgY2hlY2tpbmcgaXMKPiBuZWVkZWQg
aGVyZS4gbWFpbl92Y3B1cGluKCksIGZvciBleGFtcGxlLCBkZWxpYmVyYXRlbHkgdXNlcyBhCj4g
dHlwZSB3aWRlciB0aGFuIHNlZW1pbmdseSBuZWNlc3NhcnksIHRvIGF2b2lkIHN1Y2ggYW4gaXNz
dWUuCj4gCj4gSSBhbHNvIHdvbmRlciB3aGV0aGVyIHJlamVjdGluZyB6ZXJvIGhlcmUgaXMgcmVh
bGx5IHRoZSBqb2Igb2YgdGhlCj4gZnJvbnRlbmQsIHJhdGhlciB0aGFuIGxpYnhsLgoKWWVzLCB0
aGlzIHdvdWxkIGJlIGJldHRlci4KCkFzIHRoZSBudW1iZXIgb3YgdmNwdXMgaXMgZGV0ZXJtaW5l
ZCBieSBjb3VudGluZyB0aGUgYml0cyBpbiB0aGUKY3B1bWFwLCBhbmQgdGhpcyB2YWx1ZSBpcyBh
biBpbnQsIEkgZ3Vlc3Mgd2Ugc2hvdWxkIGxpbWl0IHRoZSB1cHBlcgpib3VuZCB0byBJTlRfTUFY
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
