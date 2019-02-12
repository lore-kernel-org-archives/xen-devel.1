From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v9 2/5] xen: introduce SYMBOLS_SUBTRACT and
 SYMBOLS_COMPARE
Date: Tue, 12 Feb 2019 15:58:48 +0000
Message-ID: <23650.60728.191439.501924@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1902111631220.347@sstabellini-ThinkPad-X260>
 <1549934011-17624-2-git-send-email-sstabellini@kernel.org>
 <23650.46508.347522.877442@mariner.uk.xensource.com>
 <5C62BE310200007800215E17@prv1-mh.provo.novell.com>
 <23650.56453.934521.552736@mariner.uk.xensource.com>
 <5C62E7C00200007800216022@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xrV+=QT=citrix.com=prvs=939669ee0=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gtaSy-0005mM-4R
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 15:59:24 +0000
In-Reply-To: <5C62E7C00200007800216022@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2OSAyLzVdIHhlbjog
aW50cm9kdWNlIFNZTUJPTFNfU1VCVFJBQ1QgYW5kIFNZTUJPTFNfQ09NUEFSRSIpOgo+IE9uIDEy
LjAyLjE5IGF0IDE1OjQ3LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBJIGRp
ZG4ndCBzZWUgeW91ciBwcm9wb3NlZCBpbmxpbmUgZnVuY3Rpb24sIGJ1dCBkb24ndCB0aGluayBp
dCBjYW4KPiA+IHdvcmsgY29ycmVjdGx5IGJlY2F1c2UgaXQgd29uJ3QgYmUgdHlwZS1nZW5lcmlj
LiAgSWUsIHRoZSByZXF1aXJlbWVudAo+ID4gaXMgdG8gdXNlIHRoZSBzYW1lIGBTWU1CT0xTX0RJ
RkZFUkVOQ0UocCwgX2Zvb19lbmQpJyBmb3IgdmFyaW91cwo+ID4gZGlmZmVyZW50IGBzdHJ1Y3Qg
Zm9vICpwJy4gIHAgaXMgcGVyaGFwcyBvZiBkaWZmZXJlbnQgdHlwZXMgaW4gdGhlCj4gPiBkaWZm
ZXJlbnQgaW52b2NhdGlvbnMgYW5kIHRoZSByZXR1cm4gdmFsdWUgbmVlZHMgdG8gaGF2ZSBiZWVu
IGRpdmlkZWQKPiA+IGJ5IHNpemVvZigqcCkuCj4gCj4gV2VsbCwgaXQgd2Fzbid0IGEgc2luZ2xl
IGlubGluZSBmdW5jdGlvbiwgYnV0IGEgbWFjcm8gZGVmaW5pbmcgYW4KPiBpbmxpbmUgZnVuY3Rp
b24gc3VpdGFibGUgZm9yIGEgY2VydGFpbiAoc3RhcnQsZW5kKSB0dXBsZSwgYXQgdGhlCj4gc2Ft
ZSB0aW1lIGdpdmluZyBib3RoIHN0YXJ0IGFuZCBlbmQgc3VpdGFibGUgdHlwZXMgd2hpY2ggdGhl
bgo+IGFsc28gY2FuJ3QgYmUgdXNlZCBpbiB0aGUgd3JvbmcgY29udGV4dDoKPiBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDIvbXNnMDA0
NDAuaHRtbAoKQWguICBSaWdodC4gIFllcywgdGhhdCBtYWNybyBsb29rcyBPSyB0byBtZS4KCkFs
dGhvdWdoIEkgcmVhbGx5IHRoaW5rIGl0IHNob3VsZCB1c2UgdWludHByX3QsIG5vdCBgdW5zaWdu
ZWQgbG9uZycuCklJUkMgdGhlcmUgYXJlIHNwZWNpYWwgQyBsYW5ndWFnZSBzcGVjIHJ1bGVzIGZv
ciBjb252ZXJzaW9uIG9mCnBvaW50ZXJzIHRvIGFuZCBmcm9tIHVpbnRwdHJfdCdzLiAgKFRoZXkg
YXJlIHByb2JhYmx5IGFwcGxpZWQgYW55d2F5CmZvciBhbGwgcG9pbnRlci10by1zdWZmaWNpZW50
bHktbGFyZ2UtaW50ZWdlciBjb252ZXJzaW9ucyBidXQgSSB3b3VsZApwcmVmZXIgbm90IHRvIGJl
dCBvbiB0aGF0LikKCj4gPiAgI2RlZmluZSBBTFRFUl9QUk9WRU5BTkNFKHZhbHVlLHByb3ZlbmFu
Y2UpICh7Ci4uLgo+IEknbSBoYXZpbmcgdHJvdWJsZSBzZWVpbmcgaG93IHRoaXMgd291bGQgaGVs
cCB3aXRoIHRoZSBpc3N1ZXMKPiBhdCBoYW5kLiBXb3VsZCB5b3UgbWluZCBnaXZpbmcgYW4gZXhh
bXBsZSBvZiBob3cgeW91J2Qgc2VlCj4gdGhpcyB1c2VkPwoKSXQgbWF5IGJlIGEgcmVkIGhlcnJp
bmcuICBCdXQgeW91IGNvdWxkLCBwZXJoYXBzLCBoYXZlIHlvdXIgV0hBVEVWRVIKbWFjcm8gZG8g
c29tZXRoaW5nIGxpa2UgdGhpczoKCiAgZXh0ZXJuIGNvbnN0IHR5cGUgcGZ4IyNfZW5kX193cm9u
Z19wcm92ZW5hbmNlW107CiAgc3RhdGljIGNvbnN0IHR5cGUgKmNvbnN0IHBmeCMjX2VuZCA9CiAg
ICAgQUxURVJfUFJPVkVOQU5DRShwZngjI19lbmRfX3dyb25nX3Byb3ZlbmFuY2UsIHBmeCMjX3N0
YXJ0KTsKCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
