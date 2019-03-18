From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/e820: fix build with gcc9
Date: Mon, 18 Mar 2019 04:00:57 -0600
Message-ID: <5C8F6C59020000780021FC14@prv1-mh.provo.novell.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F30F020000780021C623@prv1-mh.provo.novell.com>
 <3130469f-2e88-ce93-198d-3a5214c89e40@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5p4t-0005Rz-7Y
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 10:01:07 +0000
In-Reply-To: <3130469f-2e88-ce93-198d-3a5214c89e40@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Charles Arnold <CARNOLD@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE5IGF0IDE3OjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDMvMjAxOSAxMDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IGU4MjAuYzog
SW4gZnVuY3Rpb24g4oCYY2xpcF90b19saW1pdOKAmToKPj4gLi4uL3hlbi9pbmNsdWRlL2FzbS9z
dHJpbmcuaDoxMDoyNjogZXJyb3I6IOKAmF9fYnVpbHRpbl9tZW1tb3Zl4oCZIG9mZnNldCBbLTE2
LCAKPiAtMzZdIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAyMDQ4NF0gb2YKPj4gb2JqZWN0IOKA
mGU4MjDigJkgd2l0aCB0eXBlIOKAmHN0cnVjdCBlODIwbWFw4oCZIFstV2Vycm9yPWFycmF5LWJv
dW5kc10KPj4gICAgMTAgfCAjZGVmaW5lIG1lbW1vdmUoZCwgcywgbikgX19idWlsdGluX21lbW1v
dmUoZCwgcywgbikKPj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPj4gZTgyMC5jOjQwNDoxMzogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmG1lbW1vdmXigJkKPj4gICA0MDQgfCAgICAgICAgICAgICBtZW1tb3ZlKCZlODIw
Lm1hcFtpXSwgJmU4MjAubWFwW2krMV0sCj4+ICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fgo+
PiBlODIwLmM6MzY6MTY6IG5vdGU6IOKAmGU4MjDigJkgZGVjbGFyZWQgaGVyZQo+PiAgICAzNiB8
IHN0cnVjdCBlODIwbWFwIGU4MjA7Cj4+ICAgICAgIHwgICAgICAgICAgICAgICAgXn5+fgo+Pgo+
PiBXaGlsZSBJIGNhbid0IHNlZSB3aGVyZSB0aGUgbmVnYXRpdmUgb2Zmc2V0cyB3b3VsZCBjb21l
IGZyb20sIGNvbnZlcnRpbmcKPj4gdGhlIGxvb3AgaW5kZXggdG8gdW5zaWduZWQgdHlwZSBoZWxw
cy4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28KPj4gY29udmVydCBzZXZlcmFsIG90aGVy
IGxvY2FsIHZhcmlhYmxlcyBhbmQgY29weV9lODIwX21hcCgpJ3Mgc2Vjb25kCj4+IHBhcmFtZXRl
ciB0byB1bnNpZ25lZCBpbnQgKGFuZCBib29sIGluIG9uZSBjYXNlKS4KPj4KPj4gUmVwb3J0ZWQt
Ynk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCB3aXRoIG9uZSByZXF1ZXN0LgoKVGhhbmtz
LgoKPj4gLS0tIGEveGVuL2FyY2gveDg2L2U4MjAuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvZTgy
MC5jCj4+IEBAIC0zMDQsNyArMzAwLDcgQEAgaW50IF9faW5pdCBzYW5pdGl6ZV9lODIwX21hcChz
dHJ1Y3QgZTgyMAo+PiAgICogdGhpbmtwYWQgNTYweCwgZm9yIGV4YW1wbGUsIGRvZXMgbm90IGNv
b3BlcmF0ZSB3aXRoIHRoZSBtZW1vcnkKPj4gICAqIGRldGVjdGlvbiBjb2RlLikKPj4gICAqLwo+
PiAtc3RhdGljIGludCBfX2luaXQgY29weV9lODIwX21hcChzdHJ1Y3QgZTgyMGVudHJ5ICogYmlv
c21hcCwgaW50IG5yX21hcCkKPj4gK3N0YXRpYyBpbnQgX19pbml0IGNvcHlfZTgyMF9tYXAoc3Ry
dWN0IGU4MjBlbnRyeSAqIGJpb3NtYXAsIHVuc2lnbmVkIGludCBucl9tYXApCj4+ICB7Cj4+ICAg
ICAgLyogT25seSBvbmUgbWVtb3J5IHJlZ2lvbiAob3IgbmVnYXRpdmUpPyBJZ25vcmUgaXQgKi8K
PiAKPiBUaGlzIGNvbW1lbnQgaXMgbm93IHN0YWxlLiAgSSdkIGp1c3QgZHJvcCB0aGUgYml0IGlu
IGJyYWNrZXRzLgoKU3VyZSwgd2lsbCBkby4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
