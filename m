From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] xen/xsm: Cleanup in preparation for XSM
 SILO mode
Date: Thu, 16 Aug 2018 14:18:49 +0100
Message-ID: <eb8dd3b0-8a99-bc1a-b947-9232f1215864@citrix.com>
References: <1530011348-4852-1-git-send-email-andrew.cooper3@citrix.com>
 <ea69e94b-ae3e-552e-9dbb-50085bc0f67c@citrix.com>
 <5B75748602000078001DEE81@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B75748602000078001DEE81@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>, Tim Deegan <tim@xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDgvMTggMTM6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA4LjE4IGF0
IDE0OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI2LzA2LzE4
IDEyOjA5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gRnV0dXJlIGNoYW5nZXMgd2lsbCBpbnRy
b2R1Y2UgYSBuZXcgU0lMTyBtb2RlLCB3aGljaCBpcyBpbnRlbmRlZCB0byBiZSB1c2VmdWwKPj4+
IGZvciBjbG91ZCBhbmQgZW50ZXJwcmlzZSBzZXR1cHMgd2hlcmUgYWxsIGRvbVVzIGFyZSB1bnBy
aXZpbGVnZWQgYW5kIGhhdmUgbm8KPj4+IGJ1aXNuZXNzIGNvbW11bmljYXRpbmcgZGlyZWN0bHku
Cj4+Pgo+Pj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGF0IFhlblN1bW1pdCwgYnV0IEknbGwgbGVhdmUg
ZnVydGhlciBkZXRhaWxzIHRvIHRoZSBzZXJpZXMKPj4+IHdoaWNoIGludHJvZHVjZXMgaXQuICBI
b3dldmVyLCB0byBiZWdpbiB3aXRoLCBjbGVhbiB1cCB0aGUgWFNNIG5hbWVzcGFjaW5nIHRvCj4+
PiBiZXR0ZXIgc2VwYXJhdGUgWFNNIGFuZCBGTEFTSy4KPj4+Cj4+PiBObyBmdW5jdGlvbmFsIGNo
YW5nZS4KPj4+Cj4+PiBBbmRyZXcgQ29vcGVyICgyKToKPj4+ICAgeGVuL3hzbTogUmVuYW1lIENP
TkZJR19GTEFTS18qIHRvIENPTkZJR19YU01fRkxBU0tfKgo+Pj4gICB4ZW4veHNtOiBSZW5hbWUg
Q09OSUZJR19YU01fUE9MSUNZIHRvIENPTkZJR19YU01fRkxBU0tfUE9MSUNZCj4+IFBpbmcgIlRo
ZSBSZXN0IiBpbiBsaWV1IG9mIERhbmllbC4gIFRoaXMgc2VyaWVzIGlzIGJsb2NraW5nIHRoZQo+
PiBmdW5jdGlvbmFsIFhTTSBTSUxPIHdvcmsuCj4gSWlyYyBJIGhhZCBnaXZlbiBzb21lIGNvbW1l
bnRzLCByZWdhcmRpbmcgdGhlICh0b28gbG9uZykgbmFtZXMuCj4gVGhlIGNoYW5nZXMgYXJlIG1l
Y2hhbmljYWwgZW5vdWdoIHRoYXQgSSBkb24ndCB0aGluayB0aGVyZSdzCj4gbXVjaCBlbHNlIHRv
IHNheS4KCkFuZCBJIGp1c3RpZmllZCB3aHkgdGhlIGN1cnJlbnQgbmFtaW5nIGlzIElNTyB3cm9u
ZyBhbmQgd2h5IGl0IHdhbnRzIHRvCmJlIHN1aXRhYmx5IG5hbWVzcGFjZWQuCgpIZW5jZSB0aGUg
cGluZyB0byB1bmJsb2NrIHRoaXMgc2VyaWVzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
