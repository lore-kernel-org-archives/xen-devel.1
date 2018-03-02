From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] x86/xpti: don't map stack guard pages
Date: Fri, 2 Mar 2018 17:41:34 +0100
Message-ID: <1923068a-6adb-6860-9cd1-e541b09bedd9@suse.com>
References: <5A996DF202000078001ADD10@prv-mh.provo.novell.com>
 <5A996F3302000078001ADD40@suse.com>
 <4a2caefc-4ad7-7e23-37aa-a500f118f879@suse.com>
 <5A99858002000078001ADF38@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ernke-0000VV-4T
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:41:44 +0000
In-Reply-To: <5A99858002000078001ADF38@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTc6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAzLjE4IGF0
IDE2OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMDIvMDMvMTggMTU6MzUsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4+PiBAQCAtNTU3Niw2ICs1NTc2LDE0IEBAIHZvaWQgbWVtZ3VhcmRf
dW5ndWFyZF9zdGFjayh2b2lkICpwKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNU
QUNLX1NJWkUgLSBQUklNQVJZX1NUQUNLX1NJWkUgLSBJU1RfTUFYICogUEFHRV9TSVpFKTsKPj4+
ICB9Cj4+PiAgCj4+PiArYm9vbCBtZW1ndWFyZF9pc19zdGFja19ndWFyZF9wYWdlKHVuc2lnbmVk
IGxvbmcgYWRkcikKPj4+ICt7Cj4+PiArICAgIGFkZHIgJj0gU1RBQ0tfU0laRSAtIDE7Cj4+PiAr
Cj4+PiArICAgIHJldHVybiBhZGRyID49IElTVF9NQVggKiBQQUdFX1NJWkUgJiYKPj4+ICsgICAg
ICAgICAgIGFkZHIgPCBTVEFDS19TSVpFIC0gUFJJTUFSWV9TVEFDS19TSVpFOwo+Pj4gK30KPj4+
ICsKPj4KPj4gV2hhdCBhYm91dCBtYWtpbmcgdXNlIG9mIG1lbWd1YXJkX2lzX3N0YWNrX2d1YXJk
X3BhZ2UoKSBpbgo+PiBtZW1ndWFyZF9bdW5dZ3VhcmRfc3RhY2soKSA/Cj4gCj4gSSB3YXMgY29u
c2lkZXJpbmcgdGhpcyBhcyBhIGZvbGxvdy11cCBzdGVwLgo+IAo+PiBUaGlzIHdvdWxkIGF0IG9u
Y2UgZW5zdXJlIHRoZSBvdGhlciB1bnVzZWQKPj4gcGFnZXMgd29uJ3QgYmUgYWNjZXNzZWQgYWNj
aWRlbnRhbGx5IHNvbWV3aGVyZS4KPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBwYXJ0LCB0
aG91Z2guCgpUb2RheSBtZW1ndWFyZF9ndWFyZF9zdGFjaygpIHRvdWNoZXMgb25seSBvbmUgb2Yg
dGhlIHVudXNlZCBwYWdlcywgbm90CmFsbCBvZiB0aGVtLgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
