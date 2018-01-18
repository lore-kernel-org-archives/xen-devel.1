From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] ocaml: fix arm build
Date: Thu, 18 Jan 2018 11:10:16 +0000
Message-ID: <20180118111016.kl5m6uh7gbbqz4z6@citrix.com>
References: <20180117164354.9964-1-wei.liu2@citrix.com>
 <20180118104458.vpyxkrupmy37nayv@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ec85P-0007c6-5n
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:10:23 +0000
Content-Disposition: inline
In-Reply-To: <20180118104458.vpyxkrupmy37nayv@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMTA6NDQ6NThBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEphbiAxNywgMjAxOCBhdCAwNDo0Mzo1NFBNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gQVJNIGRvZXNuJ3QgaGF2ZSBlbXVsYXRpb25fZmxhZ3MgaW4gdGhlIGFyY2hfZG9tYWlu
Y29uZmlnLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+ID4gLS0tCj4gPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gLS0tCj4gPiAgdG9v
bHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgfCA2ICsrKysrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0
dWJzLmMKPiA+IGluZGV4IDBiNWEyMzYxYzAuLmZkMTI4Nzc4YjMgMTAwNjQ0Cj4gPiAtLS0gYS90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYwo+ID4gKysrIGIvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKPiA+IEBAIC0xNzUsMTEgKzE3NSwxNSBAQCBDQU1McHJp
bSB2YWx1ZSBzdHViX3hjX2RvbWFpbl9jcmVhdGUodmFsdWUgeGNoLCB2YWx1ZSBzc2lkcmVmLAo+
ID4gIAkJY2FtbF9mYWlsd2l0aCgiVW5oYW5kbGVkOiBBUk0iKTsKPiA+ICAJCWJyZWFrOwo+ID4g
IAo+ID4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCj4gPiAg
CWNhc2UgMTogLyogWDg2IC0gZW11bGF0aW9uIGZsYWdzIGluIHRoZSBibG9jayAqLwo+IAo+IFRo
ZSBsYWJlbCB3aWxsIGJlIG1vdmVkIG91dHNpZGUgb2YgdGhlICNpZmRlZi4KCkluIHRoZSBpbnRl
cmVzdCBvZiB1bmJsb2NraW5nIHRoaW5ncyBJIGhhdmUgcHVzaGVkIGEgdmVyc2lvbiBvZiB0aGlz
CnBhdGNoIHRvIHN0YWdpbmcuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
