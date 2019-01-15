From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] doc: correct default scheduler in
 xen-command-line.pandoc
Date: Tue, 15 Jan 2019 11:41:54 +0000
Message-ID: <0bebf5d6-a1ab-b9bb-d12f-be0e92eefe5c@citrix.com>
References: <20190115113510.27121-1-jgross@suse.com>
 <9702a712-278d-583a-976a-9255caac6214@citrix.com>
 <16cd9a9e-e879-7869-d494-f439c6499d13@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3OYV=PX=citrix.com=prvs=91139fb13=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gjN7T-0002Cm-Gt
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:42:59 +0000
In-Reply-To: <16cd9a9e-e879-7869-d494-f439c6499d13@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMTo0MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNS8wMS8yMDE5
IDEyOjM4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8wMS8yMDE5IDExOjM1LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gV2UgaGF2ZSBzd2l0Y2hlZCB0byBjcmVkaXQyLiBMZXQgdGhl
IGRvY3VtZW50YXRpb24gcmVmbGVjdCB0aGF0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+IC0tLQo+Pj4gIGRvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYyB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21t
YW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4+PiBp
bmRleCBkMzliY2VlOTI4Li5lMjRlM2E0NWU0IDEwMDY0NAo+Pj4gLS0tIGEvZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUucGFuZG9jCj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MKPj4+IEBAIC0xNzA1LDcgKzE3MDUsNyBAQCB3aXRoIHJlYWQgYW5kIHdyaXRlIHBl
cm1pc3Npb25zLgo+Pj4gICMjIyBzY2hlZAo+Pj4gID4gYD0gY3JlZGl0IHwgY3JlZGl0MiB8IGFy
aW5jNjUzIHwgcnRkcyB8IG51bGxgCj4+PiAgCj4+PiAtPiBEZWZhdWx0OiBgc2NoZWQ9Y3JlZGl0
YAo+Pj4gKz4gRGVmYXVsdDogYHNjaGVkPWNyZWRpdDJgCj4+PiAgCj4+PiAgQ2hvb3NlIHRoZSBk
ZWZhdWx0IHNjaGVkdWxlci4KPj4+ICAKPj4gTGlrZSBYU00sIHRoaXMgaXMgS2NvbmZpZyBjb250
cm9sbGVkLCBub3QgYSBzdGF0aWMgZGVmYXVsdCwgYW5kIGFsc28KPj4gZGVwZW5kcyBvbiB0aGUg
Y29tcGlsZWQgc2NoZWR1bGVycy7CoCBUaGlzIHNob3VsZCByZWFkIHNvbWV0aGluZyBsaWtlOgo+
Pgo+Pj4gRGVmYXVsdDogc2VsZWN0YWJsZSB2aWEgS2NvbmZpZy7CoCBEZXBlbmRzIG9uIGVuYWJs
ZWQgc2NoZWR1bGVycy4KPiBUaGUgS2NvbmZpZyBkZWZhdWx0IGlzIGNyZWRpdDIuCgpPbmx5IHdo
ZW4gY3JlZGl0MiBpcyBjb21waWxlZCBpbiwgd2hpY2ggaXNuJ3QgZXZlbiB0aGUgdGhlIGNhc2Ug
Zm9yIGFsbApLY29uZmlnIGZyYWdtZW50cyB3ZSBoYXZlIGluIHRyZWUuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
