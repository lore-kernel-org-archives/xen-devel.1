From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 8 Nov 2018 11:52:57 +0000
Message-ID: <f5ec8912-90e5-d1ee-727f-fb2b108749c7@arm.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <4b3046ea-03a9-ff8d-842f-2315b92c7678@arm.com>
 <20181108114457.4l4owo5ceyp45a3a@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qw9j=nt=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gKiru-0003IL-8B
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 11:53:02 +0000
In-Reply-To: <20181108114457.4l4owo5ceyp45a3a@mac.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpPbiAxMS84LzE4IDExOjQ0IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
IE9uIFRodSwgTm92IDA4LCAyMDE4IGF0IDExOjQyOjM1QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4gSGksCj4+Cj4+IFNvcnJ5IHRvIGp1bXAgaW4gdGhlIGNvbnZlcnNhdGlvbiBsYXRl
Lgo+Pgo+PiBPbiAxMS84LzE4IDExOjI5IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+
IFdoeSB3b3VsZCB0aGF0IGJlPyBUaGUgZG9fc29mdGlycSgpIGludm9jYXRpb24gc2l0cyBvbiB0
aGUgZXhpdC0KPj4+PiB0by1ndWVzdCBwYXRoLCBleHBsaWNpdGx5IGF2b2lkaW5nIGFueSBzdWNo
IG5lc3RpbmcgdW5sZXNzIHRoZXJlCj4+Pj4gd2FzIGEgZG9fc29mdGlycSgpIGludm9jYXRpb24g
c29tZXdoZXJlIGluIGEgc29mdGlycSBoYW5kbGVyLgo+Pj4KPj4+IEl0IHNpdHMgb24gYW4gZXhp
dC10by1ndWVzdCBwYXRoLCBidXQgdGhlIGZvbGxvd2luZyBjaHVuazoKPj4+Cj4+PiByYWlzZV9z
b2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpOwo+Pj4gZG9fc29mdGlycSgpOwo+Pj4KPj4+IFdvdWxk
IHByZXZlbnQgdGhlIHBhdGggZnJvbSBldmVyIHJlYWNoaW5nIHRoZSBleGl0LXRvLWd1ZXN0IGFu
ZAo+Pj4gbmVzdGluZyBvbiBpdHNlbGYsIHVubGVzcyB0aGUgdkNQVSBpcyBtYXJrZWQgYXMgYmxv
Y2tlZCwgd2hpY2gKPj4+IHByZXZlbnRzIGl0IGZyb20gYmVpbmcgc2NoZWR1bGVkIHRodXMgYXZv
aWRpbmcgdGhpcyByZWN1cnNpb24uCj4+Cj4+IEkgY2FuJ3Qgc2VlIGhvdyB0aGUgcmVjdXJzaW9u
IGNvdWxkIGhhcHBlbiBvbiBBcm0uIFNvIGlzIGl0IGFuIHg4NiBpc3N1ZT8KPiAKPiBUaGlzIGlz
IG5vdCBhbiBpc3N1ZSB3aXRoIHRoZSBjdXJyZW50IGNvZGUsIEkgd2FzIGp1c3QgZGlzY3Vzc2lu
ZyB3aXRoCj4gSmFuIGhvdyB0byBwcm9wZXJseSBpbXBsZW1lbnQgdlBDSSBsb25nIHJ1bm5pbmcg
b3BlcmF0aW9ucyB0aGF0IG5lZWQKPiB0byBiZSBwcmVlbXB0ZWQuCgpUbyBnaXZlIG1vcmUgY29u
dGV4dCBvbiBteSBxdWVzdGlvbiwgd2UgYXJlIGxvb2tpbmcgYXQgaGFuZGxpbmcgCnByZWVtcHRp
b24gb24gQXJtIGluIHNvbWUgbG9uZyBydW5uaW5nIG9wZXJhdGlvbnMgKGUuZyBjYWNoZSBmbHVz
aCkgCndpdGhvdXQgaGF2aW5nIHRvIHdvcnJ5IGFib3V0IHJldHVybmluZyB0byBndWVzdC4KCkkg
YW0gdGhpbmtpbmcgc29tZXRoaW5nIGFsb25nIHRoZSBmb2xsb3dpbmcgb24gQXJtIGluIGEgbG9v
cC4KCmZvciAoIC4uLi4gKQp7CiAgICBkb19hY3Rpb24KICAgIGlmICggdHJ5X3Jlc2NoZWR1bGUg
KQogICAgewoJcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsKCWRvX3NvZnRpcnEoKTsK
ICAgIH0KfQoKVGhpcyB3b3VsZCByZXF1aXJlIHRvIGhhdmUgbm8gbG9jayB0YWtlbiBidXQgSSB0
aGluayBpdCB3b3VsZCB3b3JrIG9uIApBcm0gZm9yIGFueSBsb25nIG9wZXJhdGlvbnMuIFNvIEkg
YW0gcXVpdGUgaW50ZXJlc3RlZCBvbiB0aGUgcmVzdWx0IG9uIAp0aGUgZGlzY3Vzc2lvbnMgaGVy
ZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
