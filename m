From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] xen: make tracebuffer configurable
Date: Mon, 3 Jun 2019 14:08:22 +0000
Message-ID: <6852F5F0-0DC1-4FAE-9D80-5AF9C1187DB4@citrix.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
 <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
 <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Nnt=UC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hXndW-0005u0-AY
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:08:30 +0000
In-Reply-To: <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <CB09F98F1FF78C40AB7988A431834C11@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Baodong Chen <chenbaodong@mxnavi.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gSnVuIDMsIDIwMTksIGF0IDExOjU0IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMDMuMDYuMTkgYXQgMTI6NDEsIDxjaGVuYmFv
ZG9uZ0BteG5hdmkuY29tPiB3cm90ZToNCj4gDQo+PiBPbiA2LzMvMTkgMTY6MzEsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDAzLjA2LjE5IGF0IDA1OjA3LCA8Y2hlbmJhb2RvbmdAbXhu
YXZpLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDUvMzEvMTkgMTk6MTAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+Pj4gT24gMzAuMDUuMTkgYXQgMTI6MTcsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29t
PiB3cm90ZToNCj4+Pj4+PiBEZWZhdWx0OiBlbmFibGVkLg0KPj4+Pj4+IENhbiBiZSBkaXNhYmxl
ZCBmb3Igc21hbGxlciBjb2RlIGZvb3RwcmludC4NCj4+Pj4+IEJ1dCB5b3UncmUgYXdhcmUgdGhh
dCB3ZSdyZSwgZm9yIG5vdyBhdCBsZWFzdCwgdHJ5aW5nIHRvIGxpbWl0IHRoZQ0KPj4+Pj4gbnVt
YmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJsZSBjb25maWcgb3B0aW9ucz8gT25lcyBkZXBl
bmRpbmcNCj4+Pj4+IG9uIEVYUEVSVCBhcmUgc29ydCBvZiBhbiBleGNlcHRpb24gaW4gY2VydGFp
biBjYXNlcy4NCj4+Pj4gTGltaXQgdGhlIG51bWJlciBvZiBpbmRlcGVuZGVudGx5IHNlbGVjdGFi
bGUgY29uZmlnIHNvdW5kcyBnb29kIHRvIG1lLg0KPj4+PiANCj4+Pj4gRG9lcyB0aGUgZm9sbG93
aW5nIGxvb2tzIGdvb2Q/DQo+Pj4+IA0KPj4+PiArY29uZmlnIEhBU19UUkFDRUJVRkZFUg0KPj4+
PiArICAgICAgIGJvb2wgIkVuYWJsZS9EaXNhYmxlIHRyYWNlYnVmZmVyIiAgaWYgRVhQRVJUID0g
InkiDQo+Pj4+ICsgICAgICAgLS0taGVscC0tLQ0KPj4+PiArICAgICAgICAgRW5hYmxlIG9yIGRp
c2FibGUgdHJhY2VidWZmZXIgZnVuY3Rpb24uDQo+Pj4+ICsgICAgICAgICBYZW4gaW50ZXJuYWwg
cnVubmluZyBzdGF0dXModHJhY2UgZXZlbnQpIHdpbGwgYmUgc2F2ZWQgdG8NCj4+Pj4gdHJhY2Ug
bWVtb3J5DQo+Pj4+ICsgICAgICAgICB3aGVuIGVuYWJsZWQuDQo+Pj4+ICsNCj4+PiBUaGUgRVhQ
RVJUIGFkZGl0aW9uIG1ha2UgaW50cm9kdWNpbmcgdGhpcyBmaW5lIGJ5IG1lLiBCdXQgaXRzIG5h
bWUNCj4+PiBpcyBzdGlsbCB3cm9uZywgYW5kIHRoZSBoZWxwIHRleHQgYWxzbyBuZWVkcyBmdXJ0
aGVyIGltcHJvdmVtZW50IGltby4NCj4+IA0KPj4gSGkgSmFuLCB0aGFua3MgZm9yIHlvdXIga2lu
ZGx5IHJldmlldyBhbmQgZmVlZGJhY2suDQo+PiANCj4+IEZvciB0aGlzLCB3b3VsZCB5b3UgcGxl
YXNlIGdpdmUgeW91ciBzdWdnZXN0aW9ucyBhYm91dCB0aGUgbmFtZSBhbmQgaGVscCANCj4+IHRl
eHQ/DQo+IA0KPiBBcyBmYXIgYXMgdGhlIG5hbWUgaXMgY29uY2VybmVkLCB0aGUgSEFTXyBzaG91
bGQgYmUgZHJvcHBlZC4NCj4gSSdtIGFmcmFpZCBJIGRvbid0IGhhdmUgYSBwYXJ0aWN1bGFyIHN1
Z2dlc3Rpb24gZm9yIHRoZSBoZWxwIHRleHQuDQoNCllvdSBjb3VsZCBhdCBsZWFzdCBnaXZlIGFu
IGlkZWEgd2hhdCB5b3UgdGhpbmsgdGhlIGhlbHAgdGV4dCBzaG91bGQgaW5jbHVkZSwgb3Igc29t
ZSBraW5kIG9mIGd1aWRhbmNlIGFzIHRvIHdoYXQgd291bGQgc2F0aXNmeSB5b3UuICBPYnZpb3Vz
bHkgeW91IHNob3VsZG7igJl0IGJlIHJlcXVpcmVkIHRvIHdyaXRlIGV2ZXJ5Ym9keeKAmXMgaGVs
cCB0ZXh0IGZvciB0aGVtOyBidXQgYnkgdGhlIHNhbWUgdG9rZW4sIGV2ZXJ5Ym9keSBzaG91bGRu
4oCZdCBiZSByZXF1aXJlZCB0byByZWFkIHlvdXIgbWluZC4NCg0KSXMsIOKAnEEgZGVzY3JpcHRp
b24gb2YgdGhlIGZlYXR1cmUsIGFsb25nIHdpdGggdGhlIGNvc3RzIG9mIGVuYWJsaW5nIGl04oCd
IHRoZSBzb3J0IG9mIHRoaW5nIHlvdSBoYWQgaW4gbWluZD8NCg0KIC1HZW9yZ2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
