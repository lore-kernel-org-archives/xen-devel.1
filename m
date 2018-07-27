From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v7 08/12] arm: add ALL, QEMU,
 Rcar3 and MPSoC configs
Date: Fri, 27 Jul 2018 12:20:06 +0100
Message-ID: <cf85e9b8-1585-07ae-f2fe-2baa7566ba51@arm.com>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
 <1530918843-14318-8-git-send-email-sstabellini@kernel.org>
 <9070dccb-e699-7189-d6b3-38cb5f0773f3@epam.com>
 <alpine.DEB.2.10.1807261543150.20701@sstabellini-ThinkPad-X260>
 <5b253972-a880-0ded-dc51-db2f9f8abbdc@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5b253972-a880-0ded-dc51-db2f9f8abbdc@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, andrew.cooper3@citrix.com, George.Dunlap@citrix.com, xen-devel@lists.xen.org, dfaggioli@suse.com, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNy8wNy8xOCAxMTozMCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBPbiAyNy4wNy4x
OCAwMTo0NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gMDcuMDcuMTggMDI6MTMs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IFNob3VsZG4ndCBNUFNPQ19QTEFURk9STSBi
ZSBkZXBlbmRlbnQgb24gQVJNNjQ/Cj4+IFllcywgYW5kIGl0IGlzLCBzZWUgImNvbmZpZyBNUFNP
QyIgZmV3IGxpbmVzIGFib3ZlLgo+IEZldyBsaW5lcyBhYm92ZSwgb25seSAiY29uZmlnIE1QU09D
IiBpcyBkZXBlbmRlbnQgb24gQVJNNjQuIEJ1dCAKPiBNUFNPQ19QTEFURk9STSBpcyBzZWxlY3Rl
ZCBieSAiY29uZmlnIEFMTCIgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgCj4gcGF0Y2guIEFuZCBp
dCB3aWxsIGJlIHNlbGVjdGVkIGZvciBBUk0zMiBhcyB3ZWxsLgoKWW91IGRvbid0IHJlYWxseSBu
ZWVkIHRvIHNlbGVjdCB0aGUgcGxhdGZvcm0gaW4gQUxMLiBJbnN0ZWFkIHlvdSBjb3VsZCAKZG8g
c29tZXRoaW5nIGxpa2U6Cgpjb25maWcgQUxMXzY0CglkZWZhdWx0IChBTEwgJiYgQVJNXzY0KQoK
Y29uZmlnIEFMTF8zMgoJZGVmYXVsdCAoQUxMICYmIEFSTV8zMikKCmNvbmZpZyBNUFNPQ19QTEFU
Rk9STQogICAgCWJvb2wKCWRlZmF1bHQgKEFMTF82NCB8fCBNUFNPQykKCj4gCj4+Pj4gK8KgwqDC
oCBib29sCj4+Pj4gKwo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01h
a2VmaWxlCj4+Pj4gYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL01ha2VmaWxlCj4+Pj4gaW5kZXgg
ODBlNTU1Yy4uYTc5YmRiOSAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L01ha2VmaWxlCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZQo+Pj4+
IEBAIC04LDQgKzgsNCBAQCBvYmotJChDT05GSUdfQVJNXzY0KSArPSBzZWF0dGxlLm8KPj4+PiDC
oMKgIG9iai15ICs9IHN1bnhpLm8KPj4+PiDCoMKgIG9iai0kKENPTkZJR19BUk1fNjQpICs9IHRo
dW5kZXJ4Lm8KPj4+PiDCoMKgIG9iai0kKENPTkZJR19BUk1fNjQpICs9IHhnZW5lLXN0b3JtLm8K
Pj4+PiAtb2JqLSQoQ09ORklHX0FSTV82NCkgKz0geGlsaW54LXp5bnFtcC5vCj4+Pj4gK29iai0k
KENPTkZJR19NUFNPQ19QTEFURk9STSnCoCArPSB4aWxpbngtenlucW1wLm8KPiAKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
